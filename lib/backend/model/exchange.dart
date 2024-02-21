class Exchange {
  final num amount;

  const Exchange(this.amount);

  factory Exchange.fromJson(Map<String, dynamic> json) {
  return Exchange(
    json["amount"]
  );
}

}