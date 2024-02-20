

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


  // add spend
  String get amount => Intl.message("Le coût de la dépense", name : "amount");
  String get description => Intl.message("description", name : "description");
  //  String get registerBudget => Intl.message("Enrégister", name : "registerBudget");

  // make savings goal page
  String get goal => Intl.message("L'objectif de cette économie", name : "goal");
  String get targetAmount => Intl.message("Montant cîblé", name : "targetAmount");
  String get reachGoalDate => Intl.message("La date pour atteindre l'objectif", name : "reachGoalDate");
 
 
  // Exchange Currency Page
  String get amountToExchange => Intl.message("Le montant à convertir 1", name : "amountToExchange");
  String get currencyToExchange => Intl.message("€", name : "currencyToExchange");
  String get amountAfterExchange => Intl.message("Montant obtenu 1,24", name : "amountAfterExchange");
  String get currencyExchangeInto => Intl.message("\$", name : "currencyExchangeInto");
  String get exchange => Intl.message("Echanger", name : "exchange");
}