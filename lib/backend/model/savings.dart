
class Savings{
  int id;
  String goal;
  num targetamount;
  String currency;
  num allsavings;
  DateTime reachgoaldate;

  Savings(this.id, this.goal, this.targetamount, 
    this.currency, this.allsavings, this.reachgoaldate);

  factory Savings.fromJson(Map<String, dynamic> json) {
    return Savings(
      json["id"],
      json["goal"].toString(),
      json["targetamount"],
      json["currency"].toString(),
      json["allsavings"],
      DateTime.parse(json["reachgoaldate"])
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "goal": goal,
      "targetamount": targetamount,
      "currency": currency,
      "allsavings": allsavings,
      "reachgoaldate": reachgoaldate
    };
  }

}