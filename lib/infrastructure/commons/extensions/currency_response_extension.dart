import 'package:bitcoin_demo/infrastructure/models/response/common/currency.dart';
import 'package:bitcoin_demo/infrastructure/models/response/get_currency_response_modal.dart';

extension CurrencyResponseExtension on GetCurrencyResponseModal {
  List<Currency?> getCurrencies() {
    List<Currency?> data = [bpi?.gBP, bpi?.eUR, bpi?.uSD];
    data.removeWhere((element) => element == null);
    return data;
  }
}
