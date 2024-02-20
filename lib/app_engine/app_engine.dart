

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppEngine{

  AppEngine();

  Map<String, Color> myColors = {
    "myWhite" : const Color.fromARGB(255, 255, 255, 255),
    "myGreen1" : const Color.fromARGB(255, 31, 124, 115),
    "myGreen2" : const Color.fromARGB(255, 107, 183, 178),
    "myGreen3" : const Color.fromARGB(255, 165, 225, 223),
    "myContainer" : const Color.fromARGB(255, 239, 249, 249),
    "mygrey" : const Color.fromARGB(255,180, 192, 191),
    "myBlack" : const Color.fromARGB(255, 14, 20, 21),
    "myRed" : const Color.fromARGB(255, 233, 41, 7),
  };

  Map<String, List<Color>> mygradColors = {
    "lineChartGrad" : [const Color.fromARGB(255, 31, 124, 115), const Color.fromARGB(255, 107, 183, 178), const Color.fromARGB(255, 165, 225, 223),]
  };


  Map<String, String?> myFontfamilies = {
    "st" : "Helvetica",
    "nd" : "EBGaramond"
  };

  Map<String, double> myFontSize = {
    "more" : 30.sp,
    'textInButton' : 26.sp,
    "less" : 14.sp,
    "moreless" : 12.sp,
    "hintText" : 17.sp,
    'subtitle' : 20.sp, 
    'iconSize' :  26.sp,
  };

  Map<String, dynamic> myRaduis = {
    "10" : BorderRadius.circular(10),
    "10raduis" : const Radius.circular(10)
   // "less" : 18.sp
  };

}
