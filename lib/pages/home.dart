import 'package:flutter/material.dart';
import 'package:fluttercurrencyapp/messages/error_message.dart';
import 'package:fluttercurrencyapp/models/currency_set.dart';
import 'package:fluttercurrencyapp/widgets/currency_item.dart';

import '../repository/currency_http_repository.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late Future<CurrencySet> _futureCurrency;

  @override
  void initState() {
    super.initState();
    _futureCurrency = CurrencyHttpRepository.fetchCurrency();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Currency App"),
      ),
      body: FutureBuilder<CurrencySet>(
        future: _futureCurrency,
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
              return const Center(child: CircularProgressIndicator());
            case ConnectionState.done:
              if (snapshot.hasData) {
                CurrencySet? currency = snapshot.data;
                return ListView(
                  children: [
                    CurrencyItem(currency: currency?.uSDBRL,),
                    CurrencyItem(currency: currency?.eURBRL,),
                    CurrencyItem(currency: currency?.gBPBRL,),
                    CurrencyItem(currency: currency?.bTCBRL,),
                    CurrencyItem(currency: currency?.eTHBRL,),
                  ],
                );
              }
              break;
            case ConnectionState.none:
              // TODO: Handle this case.
              break;
            case ConnectionState.active:
              // TODO: Handle this case.
              break;
          }
          return const ErrorMessage(message: "Ocorreu um erro ao buscar os dados!", icon: Icons.error_outline);
        },
      ),
    );
  }
}

