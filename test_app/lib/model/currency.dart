class Currency {
  final String symbol;
  final String name;
  final int price;

  const Currency({
    required this.symbol,
    required this.name,
    required this.price,
  });

  Currency copy({
    String? symbol,
    String? name,
    int? price,
  }) =>
      Currency(
        symbol: symbol ?? this.symbol,
        name: name ?? this.name,
        price: price ?? this.price,
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Currency &&
          runtimeType == other.runtimeType &&
          symbol == other.symbol &&
          name == other.name &&
          price == other.price;

  @override
  int get hashCode => symbol.hashCode ^ name.hashCode ^ price.hashCode;
}
