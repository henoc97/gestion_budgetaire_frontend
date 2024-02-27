
class Users{

  int id;
  String fristName;
  String lastName;
  String mailAddress;
  String pwd;
  String favoriteCurrency;

  Users(this.id, 
  this.fristName, 
  this.lastName, 
  this.mailAddress, 
  this.pwd, 
  this.favoriteCurrency);

  factory Users.fromJson(Map<String, dynamic> json) {
    return Users(
      json["id"],
      json["fstName"].toString(),
      json["lastName"].toString(),
      json["mailAddress"].toString() ,
      "0000",
      json["favoriteCurrency"].toString(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "firstName": fristName,
      "lastName": lastName,
      "mailAddress": mailAddress,
      "pwd": pwd,
      "favoriteCurrency": favoriteCurrency,
    };
  }

  

}