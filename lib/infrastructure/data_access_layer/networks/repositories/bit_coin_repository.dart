import 'package:bitcoin_demo/infrastructure/commons/constants/api_constants.dart';
import 'package:bitcoin_demo/infrastructure/data_access_layer/networks/api_response.dart';
import 'package:bitcoin_demo/infrastructure/data_access_layer/networks/api_response_provider.dart';
import 'package:bitcoin_demo/infrastructure/models/response/get_currency_response_modal.dart';
import 'package:flutter/foundation.dart';

class BitCoinRepository {
  final ApiResponseProvider _apiResponseProvider = ApiResponseProvider();

  Future<APIHttpResult> getCurrency() async {
    final uri = Uri.https(APIConstants.host, APIConstants.getCurrentPrice);

    APIResponse result = await _apiResponseProvider.get(uri);

    switch (result.status) {
      case APIStatus.success:
        final data = await compute(GetCurrencyResponseModal.parseResponse,
            result.response as Map<String, dynamic>);
        return APIHttpResult.success(data);
      case APIStatus.error:
        return APIHttpResult.error(result.response);
    }
  }
}
