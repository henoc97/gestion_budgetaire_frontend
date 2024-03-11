import 'package:flutter/material.dart';

import '../../../../../app_engine/app_engine.dart';
import '../../../../../app_engine/app_localizations.dart';
import '../../../../../app_engine/app_transition.dart';
import '../../../../../backend/model/savings.dart';
import '../../../../objectifsavings_home/saving_home.dart';
import 'savingtile.dart';

class TerminedPart extends StatelessWidget {
  const TerminedPart({
    super.key, required this.savingsList,
    });
    final List<Savings> savingsList;
  

  @override
  Widget build(BuildContext context) {
    AppLocalizations? lang = AppLocalizations();
    AppEngine appEngine = AppEngine();
    Size size = MediaQuery.of(context).size;
    return savingsList.isEmpty? Container() :
    Column(
      children: [
        Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(lang.termined, 
              style: TextStyle(fontFamily: appEngine.myFontfamilies["st"], 
              fontSize: appEngine.myFontSize["hintText"],  fontWeight: FontWeight.bold, 
              color: appEngine.myColors["myGreen1"]),),
            
          ],
        ),
      ),
    
      Container(
        height: size.height*.2,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: savingsList.length,
          itemBuilder: (BuildContext context, int index) {
            return savingsList[index].allsavings 
              == savingsList[index].targetamount?
               SavingTile(
              savings: savingsList[index],
            ): Container();
          },
        ),
      )
      ],
    );
  }
}
