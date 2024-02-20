import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:glass_kit/glass_kit.dart';

import '../../../../../app_engine/app_engine.dart';
import '../../../../../app_engine/app_localizations.dart';



class ChartSupport extends StatefulWidget {
  const ChartSupport({super.key});

  @override
  State<ChartSupport> createState() => _ChartSupportState();
}

class _ChartSupportState extends State<ChartSupport> {
  @override
  Widget build(BuildContext context) {
     AppLocalizations? lang = AppLocalizations(); //.of(context);
    AppEngine appEngine = AppEngine();
    return GlassContainer(
      height: 200.h,
      width: 400.w,
      gradient: LinearGradient(
        colors: [appEngine.myColors["myGreen3"]!.withOpacity(0.20), appEngine.myColors["myGreen3"]!.withOpacity(0.10)],
        begin: Alignment.bottomRight,
        end:  Alignment.topLeft,
      ),

      borderRadius : BorderRadius.circular(10),
    
      borderGradient: LinearGradient(
        colors: [Colors.white.withOpacity(0.60), Colors.white.withOpacity(0.10), Colors.lightBlueAccent.withOpacity(0.05), Colors.lightBlueAccent.withOpacity(0.6)],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        stops: const [0.0, 0.39, 0.40, 1.0],
      ),
    
      blur: 20.0,
      borderWidth: 1.5,
      elevation: 4.0,
      //isFrostedGlass: true,
      //shadowColor: appEngine.myColors["myGreen1"]!.withOpacity(0.20),
      alignment: Alignment.center,
      //frostedOpacity: 0.12,
      margin: const EdgeInsets.all(8.0),
      padding: const EdgeInsets.all(8.0),

      
    );
  }
}