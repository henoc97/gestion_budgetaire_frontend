

class Account{
  int id;
  num sold;

  Account(this.id, this.sold);

  factory Account.fromJson(Map<String, dynamic> json) {
    return Account(
      json["id"],
      json["amount"],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "sold": sold,
    };
  }
}