class Time {
  String? updated;
  String? updatedISO;
  String? updateduk;

  Time({this.updated, this.updatedISO, this.updateduk});

  Time.fromJson(Map<String, dynamic> json) {
    updated = json['updated'];
    updatedISO = json['updatedISO'];
    updateduk = json['updateduk'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['updated'] = updated;
    data['updatedISO'] = updatedISO;
    data['updateduk'] = updateduk;
    return data;
  }
}