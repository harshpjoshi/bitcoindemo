import 'package:bitcoin_demo/infrastructure/models/response/common/currency.dart';

class Bpi {
  Currency? uSD;
  Currency? gBP;
  Currency? eUR;

  Bpi({this.uSD, this.eUR, this.gBP});

  Bpi.fromJson(Map<String, dynamic> json) {
    uSD = json['USD'] != null ? Currency.fromJson(json['USD']) : null;
    gBP = json['GBP'] != null ? Currency.fromJson(json['GBP']) : null;
    eUR = json['EUR'] != null ? Currency.fromJson(json['EUR']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (uSD != null) {
      data['USD'] = uSD!.toJson();
    }
    if (gBP != null) {
      data['GBP'] = gBP!.toJson();
    }
    if (eUR != null) {
      data['EUR'] = eUR!.toJson();
    }
    return data;
  }
}