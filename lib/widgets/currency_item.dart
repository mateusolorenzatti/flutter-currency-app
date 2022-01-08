import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fluttercurrencyapp/models/currency.dart';
import 'package:fluttercurrencyapp/pages/currency_detail.dart';

class CurrencyItem extends StatelessWidget {
  final Currency? currency;

  const CurrencyItem({Key? key, required this.currency})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
          "${currency?.code} / ${currency?.codein} : ${currency?.bid}",
          style: TextStyle(fontWeight: FontWeight.bold)),
      subtitle: Text("${currency?.name}"),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => CurrencyDetail(currency: this.currency),
          ),
        );
      },
    );
  }
}
