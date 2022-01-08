import 'package:fluttercurrencyapp/models/currency.dart';

class CurrencySet {
  Currency? uSDBRL;
  Currency? eURBRL;
  Currency? gBPBRL;
  Currency? bTCBRL;
  Currency? eTHBRL;

  CurrencySet({this.uSDBRL, this.eURBRL, this.gBPBRL, this.bTCBRL, this.eTHBRL});

  CurrencySet.fromJson(Map<String, dynamic> json) {
    uSDBRL = Currency.fromJson(json['USDBRL']);
    eURBRL = Currency.fromJson(json['EURBRL']);
    gBPBRL = Currency.fromJson(json['GBPBRL']);
    bTCBRL = Currency.fromJson(json['BTCBRL']);
    eTHBRL = Currency.fromJson(json['ETHBRL']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['USDBRL'] = this.uSDBRL?.toJson();
    data['EURBRL'] = this.eURBRL?.toJson();
    data['GBPBRL'] = this.gBPBRL?.toJson();
    data['BTCBRL'] = this.bTCBRL?.toJson();
    data['ETHBRL'] = this.eTHBRL?.toJson();
    return data;
  }
}