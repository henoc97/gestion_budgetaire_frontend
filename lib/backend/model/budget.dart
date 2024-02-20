

class Budget{
  int id;
  String categoryname;
  num budgetamount;
  int periods;
  DateTime begindate;
  num budgetamountfix;


  Budget(this.id, this.categoryname, this.budgetamount, this.periods, this.begindate, this.budgetamountfix);

  factory Budget.fromJson(Map<String, dynamic> json) {
  return Budget(
    json["id"],
    json["categoryname"].toString(),
    json["budgetamount"],
    json["periods"],
    DateTime.parse(json["begindate"]),
    json["budgetamountfix"]
  );
}


  Map<String, dynamic> toJson() {
    return {
      "categoryname": categoryname,
      "budgetamount": budgetamount,
      "periods": periods,
      "begindate": begindate.toIso8601String(),
    };
  }

}