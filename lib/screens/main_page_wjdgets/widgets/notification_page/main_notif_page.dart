import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gestion_budgetaire_app/screens/main_page_wjdgets/widgets/notification_page/widget/savingalert.dart';

import '../../../../app_engine/app_engine.dart';
import '../../../../app_engine/app_localizations.dart';
import 'widget/budgetalert.dart';
import 'widget/notificationtile.dart';



class MainNotificationPage extends StatefulWidget {
  const MainNotificationPage({super.key});

  @override
  State<MainNotificationPage> createState() => _MainNotificationPageState();
}

class _MainNotificationPageState extends State<MainNotificationPage> {

  
  bool _toggleBudgetSavingAlert = true;
  bool get toggleBudgetSavingAlert => _toggleBudgetSavingAlert;
  set toggleBudgetSavingAlert(bool value){
    setState(() {
      _toggleBudgetSavingAlert = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    AppEngine appEngine = AppEngine();
    AppLocalizations? lang = AppLocalizations();
    return Scaffold(
      body: SafeArea(
        child: Column(children: [

          Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                GestureDetector(
                  onTap: (){
                    toggleBudgetSavingAlert = true;
                  },
                  child: Card(
                    elevation: toggleBudgetSavingAlert? 35 : 5,
                    shadowColor: appEngine.myColors["myGreen1"],
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(lang.budgetNotif, style: TextStyle(fontFamily: appEngine.myFontfamilies["st"], fontSize: appEngine.myFontSize["hintText"],  fontWeight: FontWeight.bold, color: appEngine.myColors["myGreen1"]),),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: (){
                    toggleBudgetSavingAlert = false;
                  },
                  child: Card(
                    elevation: !toggleBudgetSavingAlert? 35 : 5,
                    shadowColor: appEngine.myColors["myGreen1"],
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(lang.savingNotif, style: TextStyle(fontFamily: appEngine.myFontfamilies["st"], fontSize: appEngine.myFontSize["hintText"],  fontWeight: FontWeight.bold, color: appEngine.myColors["myGreen1"]),),
                    ),
                  ),
                )
              ],),
            ),
            Container(height: 55,),
            Expanded(
              child: toggleBudgetSavingAlert? const BudgetAlert() : const SavingAlert(),
            )
        ],),
        ),
    );
  }
}
