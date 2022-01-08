import 'package:flutter/material.dart';
import 'package:fluttercurrencyapp/models/currency.dart';

class CurrencyDetail extends StatelessWidget {
  // In the constructor, require a Todo.
  const CurrencyDetail({Key? key, required this.currency}) : super(key: key);

  // Declare a field that holds the Todo.
  final Currency? currency;

  @override
  Widget build(BuildContext context) {
    // Use the Todo to create the UI.
    return Scaffold(
      appBar: AppBar(
        title: Text("${currency?.code} / ${currency?.codein}"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            ListTile(title: Text("Descrição: ${currency?.name}")),
            ListTile(title: Text("Cotação: ${currency?.bid}")),
            ListTile(title: Text("Data/Hora: ${currency?.createDate}")),
            ListTile(title: Text("Porcentagem de Variação: ${currency?.pctChange}")),
          ],
        ),
      ),
    );
  }
}
