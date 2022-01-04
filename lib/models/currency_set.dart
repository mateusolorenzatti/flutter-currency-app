import 'package:fluttercurrencyapp/models/currency.dart';

class CurrencySet {
  Currency? uSDBRL;
  Currency? eURBRL;
  Currency? bTCBRL;

  CurrencySet({this.uSDBRL, this.eURBRL, this.bTCBRL});

  CurrencySet.fromJson(Map<String, dynamic> json) {
    uSDBRL = Currency.fromJson(json['USDBRL']);
    eURBRL = Currency.fromJson(json['EURBRL']);
    bTCBRL = Currency.fromJson(json['BTCBRL']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['USDBRL'] = this.uSDBRL?.toJson();
    data['EURBRL'] = this.eURBRL?.toJson();
    data['BTCBRL'] = this.bTCBRL?.toJson();
    return data;
  }
}