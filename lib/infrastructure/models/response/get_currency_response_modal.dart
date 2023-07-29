import 'dart:convert';

import 'package:bitcoin_demo/infrastructure/models/response/common/bpi.dart';
import 'package:bitcoin_demo/infrastructure/models/response/common/time.dart';

class GetCurrencyResponseModal {
  Time? time;
  String? disclaimer;
  String? chartName;
  Bpi? bpi;

  GetCurrencyResponseModal(
      {this.time, this.disclaimer, this.chartName, this.bpi});

  GetCurrencyResponseModal.fromJson(Map<String, dynamic> json) {
    time = json['time'] != null ? Time.fromJson(json['time']) : null;
    disclaimer = json['disclaimer'];
    chartName = json['chartName'];
    bpi = json['bpi'] != null ? Bpi.fromJson(json['bpi']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (time != null) {
      data['time'] = time!.toJson();
    }
    data['disclaimer'] = disclaimer;
    data['chartName'] = chartName;
    if (bpi != null) {
      data['bpi'] = bpi!.toJson();
    }
    return data;
  }

  static GetCurrencyResponseModal? parseResponse(Map<String, dynamic> json){
    try {
      return GetCurrencyResponseModal.fromJson(json);
    } catch (e) {
      print("GetCurrencyResponseModal parsing error $e");
    }
  }
}






