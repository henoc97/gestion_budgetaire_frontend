import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:glass_kit/glass_kit.dart';

import '../../../app_engine/app_engine.dart';


class InputContainer extends StatefulWidget {
  

  const InputContainer({super.key,  this.isClicked, required this.hintText, this.containerHeight,  this.controller, this.keyboardType });
  final bool? isClicked;
  final String hintText;
  final double? containerHeight;
  final TextEditingController? controller;
  final TextInputType? keyboardType;


  @override
  State<InputContainer> createState() => _InputContainerState();
}

class _InputContainerState extends State<InputContainer> {

  
  
  @override
  Widget build(BuildContext context) {
    
    AppEngine appEngine = AppEngine();
    
    return GlassContainer(
      height: widget.containerHeight!=null ? widget.containerHeight! : 43.h,
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
    
      blur: 15.0,
      borderWidth: 1.5,
      elevation: myElevation(),
      //isFrostedGlass: true,
      shadowColor: appEngine.myColors["myGreen1"]!.withOpacity(0.20),
      alignment: Alignment.center,
      frostedOpacity: 0.05,
      margin: const EdgeInsets.all(8.0),
      padding: const EdgeInsets.all(8.0),

      child: TextFormField(
        keyboardType : widget.keyboardType,
        decoration: InputDecoration.collapsed(hintText: widget.hintText, 
        hintStyle:TextStyle(fontFamily: appEngine.myFontfamilies["st"], fontSize: appEngine.myFontSize["hintText"], color: appEngine.myColors["myBlack"]), 
      ),
      controller:widget.controller==null?TextEditingController() : widget.controller!,
      style : TextStyle(fontFamily: appEngine.myFontfamilies["st"], fontSize: appEngine.myFontSize["hintText"], color: appEngine.myColors["myBlack"]),  
      validator: (value) {
          if (value == null || value.isEmpty) {
            return "Ce champ n'a pas été rempli";
          }
          return null;
        },
      ),
    );
  }

  double myElevation(){
    if (widget.isClicked != null || widget.isClicked ==true ) {
      return 50.0;
    } else {
      return 4.0;
    }
  }
}