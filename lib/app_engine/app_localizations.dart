

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';


class LocaleNotifier with ChangeNotifier {
  Locale _cuurentLocale = Locale('en', 'US');

  Locale get currentLocale => _cuurentLocale;

  void changeLocale(Locale newLocale) {
    if (_cuurentLocale.languageCode != newLocale.languageCode) {
      _cuurentLocale = newLocale;
      notifyListeners();
    }
  }
}

class AppLocalizations{

  /*static AppLocalizations? of(BuildContext context) {
    //return Localizations.of(context, AppLocalizations)!;

    AppLocalizations? applications = Localizations.of(context, AppLocalizations);
    if (applications != null) {
      return applications;
    } else {
      throw Exception('AppLocalizations is null');
      
    }

  }*/


  // frist screen
  String get greeting => Intl.message("Bienvenu!", name : "greeting");
  String get motivtop => Intl.message("Dominez vos finances et libérez-vous du stress et atteignez vos objectifs financiers en toute simplicité!", name : "motiv");
  String get motivbottom => Intl.message("Prenez le contrôle total et optimisez vos finances", name : "motivbottom");

  String get log => Intl.message("Se connecter", name : "log");
  String get sign => Intl.message("S'inscrire", name : "sign");

  //Log Page
  String get login => Intl.message("Allez y, connectez-vous", name : "login");
  String get email => Intl.message("Entrez votre adresse e-mail", name : "email");
  String get passwrd => Intl.message("Entrez votre mot de passe", name : "passwrd");
  String get confirmpasswrd => Intl.message("Confirmez le mot de passe", name : "confirmpasswrd");
  String get connect => Intl.message("Connecter", name : "connect");

  //Sign Page
  String get signin => Intl.message("Allez y, inscrivez-vous", name : "signin");
  String get fristName => Intl.message("Entrez votre Nom", name : "fristName");
  String get lastName => Intl.message("Entrez votre prénom", name : "lastName");
  String get soldinit => Intl.message("Initialisez votre compte", name : "soldinit");
  String get favoriteCurrency => Intl.message("Choisissez votre devise favorie", name : "favoriteCurrency");
  String get register => Intl.message("Inscrire", name : "register");

  // Main Page
  String get mainPageTitle0 => Intl.message("Mon compte", name : "mainPageTitle0");
  String get mainPageTitle1 => Intl.message("Objectifs économiques", name : "mainPageTitle1");
  String get mainPageTitle2 => Intl.message("Gestion budgétaire", name : "mainPageTitle2");
  String get mainPageTitle3 => Intl.message("Convertion des devises", name : "mainPageTitle3");

  String get mainPagesubTitle => Intl.message("Budgets récents", name : "mainPagesubTitle");

  //top calendar
  String get monday => Intl.message("Lundi", name : "monday");
  String get tuesday => Intl.message("Mardi", name : "tuesday");
  String get wednesday => Intl.message("Mercredi", name : "wednesday");
  String get thursday => Intl.message("Jeudi", name : "thursday");
  String get friday => Intl.message("Vendredi", name : "friday");
  String get saturday => Intl.message("Samedi", name : "Saturday");
  String get sunday => Intl.message("Dimanche", name : "Sunday");
  
  //make budget page
  String get makebudgetText => Intl.message("Allez y, inscrivez-vous", name : "makebudgetText");
  String get budgetName => Intl.message("Entrez le nom du budget", name : "budgetName");
  String get budgetCost => Intl.message("Entrez le coût du budget", name : "budgetCost");
  String get period => Intl.message("Choisissez la date de début et de fin ", name : "period");
  String get registerBudget => Intl.message("Enrégister", name : "registerBudget");
  

  // Budget home Page
  String get glimpse => Intl.message("aperçue", name : "glimpse");
  String get addSpend => Intl.message("Ajouter dépense", name : "addSpend");
  String get mySpends => Intl.message("Mes dépenses", name : "mySpends");
  String get spendsWarning => Intl.message('''Vous ne pouvez pas enrégister 
      une dépense car le budget commence : ''', name : "spendsWarning");


  // add spend
  String get amount => Intl.message("Le coût de la dépense", name : "amount");
  String get description => Intl.message("description", name : "description");
  //  String get registerBudget => Intl.message("Enrégister", name : "registerBudget");

  // make savings goal page
  String get goal => Intl.message("L'objectif de cette économie", name : "goal");
  String get targetAmount => Intl.message("Montant cîblé", name : "targetAmount");
  String get reachGoalDate => Intl.message("La date pour atteindre l'objectif", name : "reachGoalDate");
  // home savings
  String get addamounttoallsavings => Intl.message("La somme", name : "addamounttoallsavings");
  String get addtoallsavings => Intl.message("Ajouter", name : "addtoallsavings");
  String get jj => Intl.message("Jour", name : "jj");
  String get inprogress => Intl.message("En cours", name : "inprogress");
  String get notbegin => Intl.message("Pas commencé", name : "notbegin");
  String get termined => Intl.message("Terminé", name : "termined");



  // Account page
  String get bankname => Intl.message("Compte de : ", name : "bankname");
  String get savingbankname => Intl.message("Compte d'épargne : ", name : "savingbankname");
  String get sold => Intl.message("sold :", name : "sold");
  String get email1 => Intl.message("email :", name : "email1");
  String get budgettotal => Intl.message("Budget total :", name : "budgettotal");
  String get transfer => Intl.message("Virement", name : "transfer");
  String get transferamount => Intl.message("Montant du transfert", name : "transferamount");
  String get mytranfers => Intl.message("Mes transferts", name : "mytranfers");



  // Exchange Currency Page
  String get amountToExchange => Intl.message("Le montant à convertir 1", name : "amountToExchange");
  String get currencyToExchange => Intl.message("€", name : "currencyToExchange");
  String get amountAfterExchange => Intl.message("Montant obtenu 1,24", name : "amountAfterExchange");
  String get currencyExchangeInto => Intl.message("\$", name : "currencyExchangeInto");
  String get exchange => Intl.message("Echanger", name : "exchange");

  String get afrique => Intl.message("afrique", name : "afrique");
  String get ameriqueNord => Intl.message("amérique du nord", name : "ameriqueNord");
  String get ameriqueSud => Intl.message("amérique du sud", name : "ameriqueSud");
  String get asie => Intl.message("asie", name : "asie");
  String get europe => Intl.message("europe", name : "europe");
  String get oceanie => Intl.message("océanie", name : "oceanie");

  // budget tile
    String get dateExpired => Intl.message("Date expirée", name : "dateExpired");


}

Map<String, List<String>> currenciesMapContinent = {
  AppLocalizations().afrique : ["XOF", "XAF", "ZAR", "NGN", "EGP", "KES", "GHS", "DZD", "MAD", "SDG", "UGX", "ETB"],
  AppLocalizations().ameriqueNord : ["USD", "CAD", "MXN", "HTG", "ANG", "BZD", "CUP", "JMD", "BSD", "KYD"],
  AppLocalizations().ameriqueSud : ["BRL", "ARS", "COP", "CLP", "PEN", "VES", "BOB", "UYU", "PYG", "GYD"],
  AppLocalizations().asie : ["JPY", "CNY", "HKD", "KRW", "INR", "TWD", "SGD", "THB", "MYR", "IDR"],
  AppLocalizations().europe: ["EUR", "GBP", "CHF", "SEK", "NOK", "DKK", "PLN", "RUB", "TRY", "HUF"],
  AppLocalizations().oceanie : ["AUD", "NZD", "PGK", "FJD", "WST", "SBD", "TOP", "VUV", "KID", "TVI"]
};