import 'dart:convert';
import 'dart:io';

import 'package:bitcoin_demo/infrastructure/data_access_layer/networks/api_response.dart';
import 'package:http/http.dart' as http;

class ApiResponseProvider {
  Future<APIResponse> get(Uri url,
      {Map<String, String?> headers = const {}}) async {
    try {
      http.Response response = await http.get(url);
      Map<String, dynamic> data = jsonDecode(response.body);
      return APIResponse.success(data);
    } on SocketException {
      return APIResponse.error({"message": "No Internet found."});
    } catch (e) {
      return APIResponse.error({"message": e.toString()});
    }
  }
}
