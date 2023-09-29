import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:timewebservercontroll/network/model/finance/finance_response.dart';
import 'package:timewebservercontroll/network/model/output_action_body.dart';
import 'package:timewebservercontroll/network/model/server/server_response.dart';
import 'package:timewebservercontroll/network/model/server_action.dart';
import 'package:timewebservercontroll/network/network_engine.dart';
import 'package:timewebservercontroll/network/network_exception.dart';

class NetworkEngineImpl implements NetworkEngine {
  Future<http.Response> _baseGet(String url, [Map<String, String>? headers]) {
    Uri uri = Uri.parse(NetworkEngine.apiUrl + url);
    headers ??= {};
    headers.addAll({'Authorization': 'Bearer ${NetworkEngine.jwtToken}'});
    return http.get(uri, headers: headers);
  }

  Future<http.Response> _basePost(String url, Map<String, dynamic>? body,
      [Map<String, String>? headers]) {
    Uri uri = Uri.parse(NetworkEngine.apiUrl + url);
    headers ??= {};
    headers.addAll({
      'Authorization': 'Bearer ${NetworkEngine.jwtToken}',
      'Content-Type': 'application/json'
    });
    return http.post(uri, headers: headers, body: jsonEncode(body));
  }

  @override
  Future<ServerResponse> getServerInfo(int serverId) async {
    String url = 'api/v1/servers/$serverId';
    http.Response response = await _baseGet(url);
    if (response.statusCode == 200) {
      return ServerResponse.fromJson(jsonDecode(response.body));
    }
    throw NetworkException(response.statusCode);
  }

  @override
  Future<FinanceResponse> getFinance() async {
    String url = 'api/v1/account/finances';
    http.Response response = await _baseGet(url);
    if (response.statusCode == 200) {
      return FinanceResponse.fromJson(jsonDecode(response.body));
    }
    throw NetworkException(response.statusCode);
  }

  @override
  Future<void> serverAction(ServerAction action, int serverId) async {
    String url = 'api/v1/servers/$serverId/action';
    OutputActionBody body = OutputActionBody(action);
    http.Response response = await _basePost(url, body.toJson());
    if (response.statusCode != 200 || response.statusCode != 204) {
      throw NetworkException(response.statusCode);
    }
  }
}
