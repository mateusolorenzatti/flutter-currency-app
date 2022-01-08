import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:fluttercurrencyapp/models/currency_set.dart';

class CurrencyHttpRepository {
  static String URL =
    "https://economia.awesomeapi.com.br/json/last/USD-BRL,EUR-BRL,GBP-BRL,BTC-BRL,ETH-BRL";
  
  static Future<CurrencySet> fetchCurrency() async {
    final response = await http.get(Uri.parse(URL));

    if (response.statusCode == 200) {
      return CurrencySet.fromJson(jsonDecode(response.body));
    } else {
      throw Exception("API Error!");
    }
  }
}
