import 'dart:io';

import 'package:flutter/material.dart';
import 'package:timewebservercontroll/network/model/finance/finance_response.dart';
import 'package:timewebservercontroll/network/model/server/server_response.dart';
import 'package:timewebservercontroll/network/model/server_action.dart';
import 'package:timewebservercontroll/network/network_engine.dart';
import 'package:timewebservercontroll/network/network_exception.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final int _serverId = 1973783;
  final NetworkEngine _networkEngine = NetworkEngine.impl();

  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey =
      GlobalKey<RefreshIndicatorState>();

  late double _screenHeight;
  bool _loading = true;
  bool _error = false;
  bool _networkError = false;
  int _statusCode = -1;
  bool _powerActionLoading = false;
  bool _hardRebootActionLoading = false;

  ServerResponse? _serverResponse;
  FinanceResponse? _financeResponse;

  Future<void> _loadData() async {
    if (_serverResponse == null || _financeResponse == null) {
      _loading = true;
    }
    setState(() {
      _error = false;
      _statusCode = -1;
      _networkError = false;
    });
    try {
      _serverResponse = await _networkEngine.getServerInfo(_serverId);
      _financeResponse = await _networkEngine.getFinance();
      setState(() {
        _loading = false;
      });
    } catch (e) {
      if (e is NetworkException) {
        setState(() {
          _loading = false;
          _error = true;
          _statusCode = e.statusCode;
        });
      }
      if (e is SocketException) {
        setState(() {
          _loading = false;
          _networkError = true;
        });
      }
      _showSnackBar('Пизда');
    }
  }

  @override
  void initState() {
    _loadData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: const Text('TimeWeb server control'),
        ),
        body: LayoutBuilder(builder: (context, constraints) {
          _screenHeight = constraints.maxHeight;
          return RefreshIndicator(
            key: _refreshIndicatorKey,
            onRefresh: _loadData,
            child: Scrollbar(
              child: SingleChildScrollView(
                  physics: const AlwaysScrollableScrollPhysics(),
                  child: _body()),
            ),
          );
        }));
  }

  Widget _body() {
    if (_loading) {
      return SizedBox(
        height: _screenHeight,
        child: const Center(
          child: CircularProgressIndicator(),
        ),
      );
    }
    if (_error) {
      return SizedBox(
        height: _screenHeight,
        child: Center(
          child: Text(
              'Кажется, что-то сломалось, пора писать Димасу. Код ошибки: $_statusCode',
              textAlign: TextAlign.center,
              style:
                  const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        ),
      );
    }
    if (_networkError) {
      return SizedBox(
        height: _screenHeight,
        child: const Center(
          child: Text(
              'Кажется, интернет-соединение полное дерьмо, пробуй позже',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        ),
      );
    }
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SizedBox(
        height: _screenHeight,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _header('Информация:'),
            Text('Имя сервака: ${_serverResponse!.server.name}'),
            const SizedBox(
              height: 4,
            ),
            Text('Статус сервака: ${_serverResponse!.server.status}'),
            const SizedBox(
              height: 4,
            ),
            Text('Золота осталось: ${_financeResponse!.finances.balance} руб.'),
            _financeResponse!.finances.hoursLeft != null
                ? Column(
                    children: [
                      const SizedBox(
                        height: 4,
                      ),
                      Text(
                          'Хватит на: ${_financeResponse!.finances.hoursLeft} час.'),
                    ],
                  )
                : Container(),
            const SizedBox(
              height: 16,
            ),
            _header('Действия:'),
            Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(child: _serverPowerButton()),
                const SizedBox(
                  width: 16,
                ),
                Expanded(child: _serverHardResetButton())
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget _serverHardResetButton() {
    return ElevatedButton(
        onPressed: () async {
          setState(() {
            _powerActionLoading = true;
          });
          try {
            await _networkEngine.serverAction(
                _serverResponse!.server.status == 'on'
                    ? ServerAction.shutdown
                    : ServerAction.start,
                _serverId);
            if (!mounted) {
              return;
            }
            _showSnackBar('Готово');
            _refreshIndicatorKey.currentState?.show();
          } catch (e) {
            if (!mounted) {
              return;
            }
            _showSnackBar('Что то пошло не по плану');
          }
          setState(() {
            _powerActionLoading = false;
          });
        },
        child: _powerActionLoading
            ? const Padding(
                padding: EdgeInsets.all(4.0),
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              )
            : const Text('Жесткий ребут'));
  }

  Widget _serverPowerButton() {
    return ElevatedButton(
        onPressed: () async {
          setState(() {
            _powerActionLoading = true;
          });
          try {
            await _networkEngine.serverAction(
                _serverResponse!.server.status == 'on'
                    ? ServerAction.shutdown
                    : ServerAction.start,
                _serverId);
            if (!mounted) {
              return;
            }
            _showSnackBar('Готово');
            _refreshIndicatorKey.currentState?.show();
          } catch (e) {
            if (!mounted) {
              return;
            }
            _showSnackBar('Что то пошло не по плану');
          }
          setState(() {
            _powerActionLoading = false;
          });
        },
        child: _powerActionLoading
            ? const Padding(
                padding: EdgeInsets.all(4.0),
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              )
            : Text(_serverResponse!.server.status == 'on'
                ? 'Выключить'
                : 'Включить'));
  }

  Widget _header(String text) {
    return Column(
      children: [
        Text(
          text,
          style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
        const SizedBox(
          height: 8,
        )
      ],
    );
  }

  void _showSnackBar(String text) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Center(
      child: Text(text),
    )));
  }
}
