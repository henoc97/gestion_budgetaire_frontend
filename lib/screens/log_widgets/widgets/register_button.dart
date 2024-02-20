import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../app_engine/app_engine.dart';
import '../../../app_engine/app_transition.dart';


class ResgisterButton extends StatefulWidget {
  const ResgisterButton({super.key, required this.buttonText,  this.myNextPage, this.action});
  final String buttonText;
  final Widget? myNextPage;
  final void Function()? action;

  @override
  State<ResgisterButton> createState() => _ResgisterButtonState();
}

class _ResgisterButtonState extends State<ResgisterButton> {
  @override
  Widget build(BuildContext context) {
    //AppLocalizations? lang = AppLocalizations(); //.of(context);
    AppEngine appEngine = AppEngine();
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: () {
         widget.action!();
          if (widget.myNextPage != null) {
            AppTransition.standardGoTo(context, widget.myNextPage!);
          }
         
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
                          child: Text(widget.buttonText, 
                          style: TextStyle(fontFamily: appEngine.myFontfamilies["st"], fontSize: appEngine.myFontSize["textInButton"], fontWeight: FontWeight.bold, color: appEngine.myColors["myWhite"]),
                          ),
                        ),
                      ),
          ),
        ),
      ),
    );
  }
}
