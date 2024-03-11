import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../../app_engine/app_engine.dart';
import '../../../../../app_engine/date_formatter.dart';
import '../../../../../app_engine/vargloabal.dart';
import '../../../../../backend/model/savings.dart';


class SavingTile extends StatelessWidget {
  const SavingTile({
    super.key, 
    required this.savings,
  });

  final Savings savings;

  @override
  Widget build(BuildContext context) {
    AppEngine appEngine = AppEngine();
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        elevation: 6,
        child: Container(
        height: size.height*.11,
        width: size.width*.7,
        decoration: BoxDecoration(borderRadius: appEngine.myRaduis["10"], 
        color: appEngine.myColors["myContainer"]),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
            Column(
              children: [
                Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("${savings.goal} ", 
                    style: TextStyle(fontFamily: appEngine.myFontfamilies["st"], 
                    fontSize: appEngine.myFontSize["hintText"],  
                    fontWeight: FontWeight.bold, color: appEngine.myColors["myBlack"]),),
                    const Icon(Icons.more_horiz_rounded)
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("${savings.targetamount} ${VarGloabal.favoritecurrencySymbol}", 
                  style: TextStyle(fontFamily: appEngine.myFontfamilies["st"], 
                  fontSize: appEngine.myFontSize["hintText"],  fontWeight: FontWeight.bold, 
                  color: appEngine.myColors["myGreen1"]),),
                  savings.allsavings == savings.targetamount?
                  Icon(Icons.done, color: appEngine.myColors["myGreen1"]):
                  const Text(""),
                ],
              ),
              ],
            ),
            
            
            SizedBox(
              width: size.width*.6,
              height: 7.0, 
              child: ClipRRect(
              borderRadius: BorderRadius.circular(10.0),
              child: LinearProgressIndicator(
                backgroundColor: appEngine.myColors["mygrey"], 
                valueColor: AlwaysStoppedAnimation<Color>(appEngine.myColors["myGreen1"]!), 
                value: savings.allsavings / savings.targetamount, 
              ),
          ),),
          
            Row(
              children: [
                SizedBox(
                  width: size.width*.5,
                  child: Text(literalyDate(savings.reachgoaldate.toIso8601String().split("T")[0]) , 
                  style: TextStyle(fontFamily: appEngine.myFontfamilies["st"], 
                  fontSize: appEngine.myFontSize["less"],  fontWeight: FontWeight.bold, 
                  color: (periods([DateTime.now(), savings.reachgoaldate])< 0)&&(savings.allsavings != savings.targetamount)?
                   appEngine.myColors["myRed"] : appEngine.myColors["mygrey"]),)),

                Text("${((savings.allsavings / savings.targetamount)*100).round()}%" , style: TextStyle(fontFamily: appEngine.myFontfamilies["st"], 
                fontSize: appEngine.myFontSize["less"],  fontWeight: FontWeight.bold, 
                color: appEngine.myColors["myBlack"]),)
              
              ],
            ),
            
            ],
          ),
        ),
        ),
      ),
    );
  }
}