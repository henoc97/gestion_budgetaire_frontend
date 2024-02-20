

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

import '../../app_engine/app_engine.dart';
import '../../app_engine/app_localizations.dart';
import '../log_widgets/log_page.dart';
import '../sign_widgets/sign_page.dart';
import 'widgets/log_sign_button.dart';



class LogSignPage extends StatefulWidget {
  const LogSignPage({super.key});

  @override
  State<LogSignPage> createState() => _LogSignPageState();
}

class _LogSignPageState extends State<LogSignPage> {
  
  @override
  Widget build(BuildContext context) {
    AppLocalizations? lang = AppLocalizations(); //.of(context);
    AppEngine appEngine = AppEngine();
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Center(child: Column(
              children: [
                Text(lang.greeting, style: TextStyle(fontFamily: appEngine.myFontfamilies["st"], fontSize: appEngine.myFontSize["more"], fontWeight: FontWeight.bold, color: appEngine.myColors["myBlack"]),),
                SizedBox(width: 320.w,
                  child: Text(lang.motivtop, style: TextStyle(fontFamily: appEngine.myFontfamilies["st"], fontSize: appEngine.myFontSize["less"],  color: appEngine.myColors["mygrey"]),)),
              ],
            )), 
             SizedBox(width: 300.w,
             height: 300.h,
               child: Lottie.asset("assets/lottie/Animation _frist_page.json"),
                ),

             Column(
              children: [
                SignLogButton( text: lang.log, myNextPage: const LogPage(),),
                SignLogButton( text: lang.sign, myNextPage: const SignPage(),),
              ],
            ),
            SizedBox(width: 320.w,
            child: Text(lang.motivbottom, style: TextStyle(fontFamily: appEngine.myFontfamilies["st"], fontSize: appEngine.myFontSize["less"],  color: appEngine.myColors["mygrey"]),))
          ],
        ),
      ),
    );
  }
}

