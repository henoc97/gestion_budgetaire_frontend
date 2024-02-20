import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../app_engine/app_engine.dart';
import '../../../app_engine/app_transition.dart';



class SignLogButton extends StatelessWidget {
  const SignLogButton({super.key, required this.text, required this.myNextPage});
  final String text;
  final Widget myNextPage;

  @override
  Widget build(BuildContext context) {
    AppEngine appEngine = AppEngine();
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: () {
          AppTransition.standardGoTo(context, myNextPage);
        },
        child: Card( elevation: 30,
          child: Container(
                        width: 200.w,
                        decoration: BoxDecoration(borderRadius: appEngine.myRaduis["10"],
                      color: appEngine.myColors["myGreen1"]
                      ),
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Text(text, 
                          style: TextStyle(fontFamily: appEngine.myFontfamilies["st"], 
                          fontSize: appEngine.myFontSize["textInButton"], 
                          fontWeight: FontWeight.bold, 
                          color: appEngine.myColors["myWhite"]),
                          ),
                        ),
                      ),
          ),
        ),
      ),
    );
  }
}