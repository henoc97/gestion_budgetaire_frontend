import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gestion_budgetaire_app/app_engine/date_formatter.dart';
import 'package:percent_indicator/percent_indicator.dart';

import '../../../../../app_engine/app_engine.dart';
import '../../../../../app_engine/app_localizations.dart';
import '../../../../../app_engine/vargloabal.dart';
import '../../../../../backend/model/budget.dart';


class MyCircularPercentIndicator extends StatelessWidget {
  const MyCircularPercentIndicator({
    super.key,
    required this.budget
  });
  final Budget budget;
  

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    AppLocalizations? lang = AppLocalizations(); //.of(context);
    AppEngine appEngine = AppEngine();
    var percent = (1 - VarGloabal.budamountrest / budget.budgetamountfix);
    var percentdate = (periods([budget.begindate, DateTime.now()]) / budget.periods);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            height: size.height*.15,
            child: CircularPercentIndicator(
                radius: 55,
                lineWidth: 12.sp,
                animation: true,
                animationDuration:2000,
                percent: percent>1?1: percent,
                center:  Center(
                  child: 
                    Text(
                      "${(percent * 100).toStringAsFixed(1)} %",
                      
                           style: TextStyle(fontFamily: appEngine.myFontfamilies["st"], fontSize: appEngine.myFontSize["hintText"],  fontWeight: FontWeight.bold, color: appEngine.myColors["myBlack"])
                    ),
                    
                  
                ),
                
                circularStrokeCap: CircularStrokeCap.round,
                linearGradient :percent>1?
                  LinearGradient(begin: Alignment.topCenter, 
            end: Alignment.bottomCenter, 
            colors: [appEngine.myColors['myRed']!, appEngine.myColors['myRed']!, appEngine.myColors['myRed']!,],) :
                   LinearGradient(begin: Alignment.topCenter, 
            end: Alignment.bottomCenter, 
            colors: [appEngine.myColors['myGreen1']!, appEngine.myColors['myGreen2']!, appEngine.myColors['myGreen3']!,],),
              ),
          ),

          Container(margin: const EdgeInsets.only(top: 15),
            height: size.height*.15, width: size.width*.65,
            child: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  children: [
                    Text("${periods([budget.begindate, DateTime.now()])} jrs", style:TextStyle(fontFamily: appEngine.myFontfamilies["st"], fontSize: appEngine.myFontSize["moreless"],  fontWeight: FontWeight.bold, color: appEngine.myColors["myBlack"])),
                    LinearPercentIndicator(
                    width: MediaQuery.of(context).size.width*.45,
                    animation: true,
                    lineHeight: 16.sp,
                    animationDuration: 2000,
                    percent: percentdate<0?0: percentdate<1?percentdate : 1,
                    linearGradient :  LinearGradient(begin: Alignment.topLeft, 
                                end: Alignment.topRight, 
                                colors: [appEngine.myColors['myGreen1']! , appEngine.myColors['myGreen2']!, appEngine.myColors['myGreen3']! ],),
                    center: Text((percentdate>=0 &&  percentdate<=100)?
                    "${(percentdate * 100).toStringAsFixed(1)} %" : "0.0%", style:TextStyle(fontFamily: appEngine.myFontfamilies["st"], fontSize: appEngine.myFontSize["moreless"],  fontWeight: FontWeight.bold, color: appEngine.myColors["myBlack"])),
                    barRadius: appEngine.myRaduis["10raduis"]
                    
                    
                    ),

                    Text("${budget.periods} jrs", style:TextStyle(fontFamily: appEngine.myFontfamilies["st"], fontSize: appEngine.myFontSize["moreless"],  fontWeight: FontWeight.bold, color: appEngine.myColors["myBlack"])),
                  ],
                ),

                Text(
                  "L'épargne n'est pas simplement une contrainte, c'est un investissement dans votre avenir. ",
                  style: TextStyle(fontFamily: appEngine.myFontfamilies["st"], fontSize: appEngine.myFontSize["less"],  color: appEngine.myColors["myBlack"])
                          ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}