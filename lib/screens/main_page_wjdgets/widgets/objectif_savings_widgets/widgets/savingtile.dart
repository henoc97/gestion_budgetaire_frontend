import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../../app_engine/app_engine.dart';
import '../../../../../app_engine/vargloabal.dart';
import '../../../../../backend/model/savings.dart';
import 'circular_percent_obj.dart';


class SavingTile extends StatelessWidget {
  const SavingTile({
    super.key, 
    required this.savings,
  });

  final Savings savings;

  @override
  Widget build(BuildContext context) {
    AppEngine appEngine = AppEngine();
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: const EdgeInsets.fromLTRB(8, 0, 8, 8),
    height: size.height*.11,
    decoration: BoxDecoration(borderRadius: appEngine.myRaduis["10"], color: appEngine.myColors["myContainer"]),
    child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          height: size.height*.09,
          width: size.width*.17,
          child:  SvgPicture.asset("assets/svg/Financial_data.svg", ),),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
              SizedBox(
                width: size.width*.5,
                child: Text("${savings.targetamount} ${VarGloabal.favoritecurrencySymbol}", style: TextStyle(fontFamily: appEngine.myFontfamilies["st"], fontSize: appEngine.myFontSize["hintText"],  fontWeight: FontWeight.bold, color: appEngine.myColors["myGreen1"]),)),
              SizedBox(
                width: size.width*.5,
                child: Text("${savings.goal} ", style: TextStyle(fontFamily: appEngine.myFontfamilies["st"], fontSize: appEngine.myFontSize["hintText"],  fontWeight: FontWeight.bold, color: appEngine.myColors["mygrey"]),)),
              ],
            ),
            
          ],
        ),


        Padding(
          padding: const EdgeInsets.all(8.0),
          child: CircularPercentObjectif(savings: savings,),
        )
      ],
    ),
    );
  }
}