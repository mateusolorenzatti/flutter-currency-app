import 'package:flutter/material.dart';
import 'package:fluttercurrencyapp/models/currency_set.dart';

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
                    ListTile(
                      title: Text("${currency?.uSDBRL?.code} / ${currency?.uSDBRL?.codein} : ${currency?.uSDBRL?.bid}", style: TextStyle(fontWeight: FontWeight.bold)),
                      subtitle: Text("${currency?.uSDBRL?.createDate}"),
                    ),
                    ListTile(
                      title: Text("${currency?.eURBRL?.code} / ${currency?.eURBRL?.codein} : ${currency?.eURBRL?.bid}",  style: TextStyle(fontWeight: FontWeight.bold)),
                      subtitle: Text("${currency?.eURBRL?.createDate}"),
                    ),
                    ListTile(
                      title: Text("${currency?.bTCBRL?.code} / ${currency?.bTCBRL?.codein} : ${currency?.bTCBRL?.bid}", style: TextStyle(fontWeight: FontWeight.bold)),
                      subtitle: Text("${currency?.bTCBRL?.createDate}"),
                    ),
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
          return Center(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Icon(Icons.warning_amber_rounded, size: 60.0),
              Text('Erro ao buscar os Dados', textScaleFactor: 2),
            ],
          ));
        },
      ),
    );
  }
}

