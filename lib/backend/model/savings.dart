
class Savings{
  int id;
  String goal;
  num targetamount;
  num allsavings;
  DateTime reachgoaldate;

  Savings(this.id, this.goal, this.targetamount, 
     this.allsavings, this.reachgoaldate);

  factory Savings.fromJson(Map<String, dynamic> json) {
    return Savings(
      json["id"],
      json["goal"].toString(),
      json["targetamount"],
      json["allsaving"],
      DateTime.parse(json["reachgoaldate"])
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "goal": goal,
      "targetamount": targetamount,
      "allsaving": allsavings,
      "reachgoaldate": reachgoaldate.toIso8601String()
    };
  }

}