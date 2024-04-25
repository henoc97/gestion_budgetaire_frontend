import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gestion_budgetaire_app/app_engine/date_formatter.dart';
import 'package:percent_indicator/percent_indicator.dart';

import '../../../../../app_engine/app_engine.dart';
import '../../../../app_engine/app_localizations.dart';
import '../../../../app_engine/vargloabal.dart';
import '../../../../backend/model/savings.dart';


class ObjectifPercentIndicator extends StatelessWidget {
  const ObjectifPercentIndicator({
    super.key,
    required this.savings,
  });
  final Savings savings;
  

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    AppEngine appEngine = AppEngine();
    AppLocalizations? lang = AppLocalizations();
    var percent = (VarGloabal.allsavings / savings.targetamount);
    var jjdate = periods([DateTime.now(), savings.reachgoaldate]) - 1;
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

          Container(margin: const EdgeInsets.only(top: 20),
             width: size.width*.65,
            child: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                 Row( mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    jjdate>0? Text(" ${lang.jj.substring(0, 1)}${lang.jj.substring(0, 1)} -  ", 
                    style: TextStyle(fontFamily: appEngine.myFontfamilies["st"], 
                    fontSize: appEngine.myFontSize["hintText"],  
                    fontWeight: FontWeight.bold, color: appEngine.myColors["myGreen1"]),) : 

                    Text(" ${lang.jj.substring(0, 1)}${lang.jj.substring(0, 1)} +  ", 
                    style: TextStyle(fontFamily: appEngine.myFontfamilies["st"], 
                    fontSize: appEngine.myFontSize["hintText"],  
                    fontWeight: FontWeight.bold, color: appEngine.myColors["myRed"]),),
                    for ( var varName =  0; varName  < jjdate.toString().length - 1; varName++ )
                    Jjdatecard(numdate: jjdate.toString()[varName + 1],),
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

class Jjdatecard extends StatelessWidget {
  const Jjdatecard({
    super.key,
    required this.numdate
  });
  final String numdate;

  @override
  Widget build(BuildContext context) {
    AppEngine appEngine = AppEngine();
    return Padding(
      padding: const EdgeInsets.all(3.0),
      child: Container(
        width: 41.h,
        height: 65.w,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 1,
              blurRadius: 5,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Center(
          child: Text( numdate,
              style: TextStyle(fontFamily: appEngine.myFontfamilies["st"], 
                    fontSize: appEngine.myFontSize["hintText"],  
                    fontWeight: FontWeight.bold, color: appEngine.myColors["myGreen1"]),),
            ),
        )
    );
  }
}