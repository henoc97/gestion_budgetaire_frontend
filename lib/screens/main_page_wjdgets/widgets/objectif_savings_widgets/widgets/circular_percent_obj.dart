import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:percent_indicator/percent_indicator.dart';

import '../../../../../app_engine/app_engine.dart';
import '../../../../../app_engine/app_localizations.dart';


class CircularPercentObjectif extends StatefulWidget {
  const CircularPercentObjectif({super.key});

  @override
  State<CircularPercentObjectif> createState() => _CircularPercentObjectifState();
}

class _CircularPercentObjectifState extends State<CircularPercentObjectif> {
  @override
  Widget build(BuildContext context) {
    AppLocalizations? lang = AppLocalizations(); //.of(context);
    AppEngine appEngine = AppEngine();
    Size size = MediaQuery.of(context).size;
    return Container(
            height: size.height*.1,
            child: CircularPercentIndicator(
                radius: 35,
                lineWidth: 7.sp,
                animation: true,
                animationDuration:2000,
                percent: 0.6,
                center:  Center(
                  child: 
                    Text(
                      "60 %",
                      
                           style: TextStyle(fontFamily: appEngine.myFontfamilies["st"], fontSize: appEngine.myFontSize["hintText"],  fontWeight: FontWeight.bold, color: appEngine.myColors["myBlack"])
                    ),
                    
                  
                ),
                
                circularStrokeCap: CircularStrokeCap.round,
                linearGradient :  LinearGradient(begin: Alignment.topCenter, 
            end: Alignment.bottomCenter, 
            colors: [appEngine.myColors['myGreen1']!, appEngine.myColors['myGreen2']!, appEngine.myColors['myGreen3']!,],),
              ),
          );
  }
}