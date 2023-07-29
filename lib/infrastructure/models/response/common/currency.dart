class Currency {
  String? code;
  String? symbol;
  String? rate;
  String? description;
  double? rateFloat;

  Currency(
      {this.code, this.symbol, this.rate, this.description, this.rateFloat});

  Currency.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    symbol = json['symbol'];
    rate = json['rate'];
    description = json['description'];
    rateFloat = json['rate_float'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['code'] = code;
    data['symbol'] = symbol;
    data['rate'] = rate;
    data['description'] = description;
    data['rate_float'] = rateFloat;
    return data;
  }
}