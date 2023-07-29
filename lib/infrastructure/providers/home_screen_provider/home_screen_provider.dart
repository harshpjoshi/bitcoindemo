import 'package:bitcoin_demo/infrastructure/commons/extensions/currency_response_extension.dart';
import 'package:bitcoin_demo/infrastructure/data_access_layer/networks/api_response.dart';
import 'package:bitcoin_demo/infrastructure/data_access_layer/networks/repositories/bit_coin_repository.dart';
import 'package:bitcoin_demo/infrastructure/models/response/common/currency.dart';
import 'package:bitcoin_demo/infrastructure/models/response/get_currency_response_modal.dart';
import 'package:flutter/widgets.dart';

class HomeScreenProvider with ChangeNotifier {
  final BitCoinRepository _bitCoinRepository = BitCoinRepository();

  GetCurrencyResponseModal? _getCurrencyResponseModal;

  GetCurrencyResponseModal? get getCurrencyResponseModal =>
      _getCurrencyResponseModal;

  bool _isLoading = true;

  bool get isLoading => _isLoading;

  List<Currency?> currencies = [];

  Currency? _selectedCurrency;

  Currency? get selectedCurrency => _selectedCurrency;

  bool hasError = false;
  String errorMessage = "";

  void setCurrentCurrency(int index) {
    if (currencies.isNotEmpty && index != -1) {
      _selectedCurrency = currencies[index];
      notifyListeners();
    }
  }

  void setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  Future<void> getCurrency() async {
    setLoading(true);
    APIHttpResult result = await _bitCoinRepository.getCurrency();

    switch (result.status) {
      case APIStatus.success:
        hasError = false;
        if (result.data != null && result.data is GetCurrencyResponseModal) {
          _getCurrencyResponseModal = result.data;
          currencies = _getCurrencyResponseModal?.getCurrencies() ?? [];
          setCurrentCurrency(1);
        }
        break;
      case APIStatus.error:
        if (result.data is Map<String, dynamic>) {
          hasError = true;
          errorMessage = result.data["message"] ?? "";
        }
        break;
    }
    setLoading(false);
  }
}
