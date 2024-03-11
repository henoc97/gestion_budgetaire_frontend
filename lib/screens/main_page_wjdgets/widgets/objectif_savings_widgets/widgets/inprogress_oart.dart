import 'package:flutter/material.dart';

import '../../../../../app_engine/app_localizations.dart';
import '../../../../../app_engine/app_transition.dart';
import '../../../../../backend/model/savings.dart';
import '../../../../objectifsavings_home/saving_home.dart';
import 'savingtile.dart';




class InProgressPart extends StatelessWidget {
  const InProgressPart({
    super.key, required this.savingsList,
  });
  final List<Savings> savingsList;


  @override
  Widget build(BuildContext context) {
    AppLocalizations? lang = AppLocalizations();
    Size size = MediaQuery.of(context).size;
    return savingsList.isEmpty? Container() :
    SizedBox(
      height: size.height*.2,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: savingsList.length,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () {
              AppTransition.standardGoTo(context, SavingHomePage(savings: savingsList[index],));
            },
            child: (savingsList[index].allsavings!=0 
              && savingsList[index].allsavings 
              != savingsList[index].targetamount)?
            SavingTile(
              savings: savingsList[index],
            ):Container(),
          );
        },
      ),
    );
  }
}
