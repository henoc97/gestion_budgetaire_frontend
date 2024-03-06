import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:percent_indicator/percent_indicator.dart';

import '../../../../../app_engine/app_engine.dart';
import '../../../../../app_engine/app_localizations.dart';
import '../../../../../backend/model/savings.dart';


class CircularPercentObjectif extends StatefulWidget {
  const CircularPercentObjectif({super.key,
    required this.savings,
  });

  final Savings savings;

  @override
  State<CircularPercentObjectif> createState() => _CircularPercentObjectifState();
}

class _CircularPercentObjectifState extends State<CircularPercentObjectif> {
  @override
  Widget build(BuildContext context) {
    AppLocalizations? lang = AppLocalizations(); //.of(context);
    AppEngine appEngine = AppEngine();
    Size size = MediaQuery.of(context).size;
    return SizedBox(
            height: size.height*.1,
            child: CircularPercentIndicator(
                radius: 35,
                lineWidth: 7.sp,
                animation: true,
                animationDuration:2000,
                percent: (widget.savings.allsavings/widget.savings.targetamount),
                
                
                circularStrokeCap: CircularStrokeCap.round,
                linearGradient :  LinearGradient(begin: Alignment.topCenter, 
            end: Alignment.bottomCenter, 
            colors: [appEngine.myColors['myGreen1']!, appEngine.myColors['myGreen2']!, appEngine.myColors['myGreen3']!,],),
              ),
          );
  }
}