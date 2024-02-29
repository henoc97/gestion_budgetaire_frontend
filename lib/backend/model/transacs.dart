

class Transacs{

  int id;
  num amount;
  String descriptions;
  int budgetid;
  DateTime registereddate;

  Transacs(this.id, this.amount, this.descriptions, this.budgetid, this.registereddate);

  factory Transacs.fromJson(Map<String, dynamic> json) {
    return Transacs(
      json["id"],
      json["amount"],
      json["descriptions"].toString(),
      json["budgetid"],
      DateTime.parse(json["registerdate"])
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "amount": amount,
      "descriptions": descriptions,
      "budgetid": budgetid,
    };
  }
}

class Transfer{
  
  int id;
  num amount;
  String descriptions;
  DateTime registereddate;

  Transfer(this.id, this.amount, this.descriptions, this.registereddate);

  factory Transfer.fromJson(Map<String, dynamic> json) {
    return Transfer(
      json["id"],
      json["amount"],
      json["descriptions"].toString(),
      DateTime.parse(json["registerdate"])
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "amount": amount,
      "descriptions": descriptions,
    };
  }
}