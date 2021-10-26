import 'package:test_app/model/currency.dart';

class Currencies {
  final allData = <Currency>[];

  void addCurrency(String symbol, String name, int price) {
    allData.add(Currency(symbol: symbol, name: name, price: price));
  }
}
