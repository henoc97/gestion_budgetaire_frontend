import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../app_engine/app_engine.dart';
import '../../../../../app_engine/app_localizations.dart';


class NotificationTile extends StatefulWidget {
  const NotificationTile({super.key, required this.img});
  final String img;
  @override
  State<NotificationTile> createState() => _NotificationTileState();
}

class _NotificationTileState extends State<NotificationTile> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    AppLocalizations? lang = AppLocalizations(); //.of(context);
    AppEngine appEngine = AppEngine();
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(//margin: const EdgeInsets.only(bottom: 8),
        height: size.height*.09,
        decoration: BoxDecoration(borderRadius: appEngine.myRaduis["10"], color: appEngine.myColors["myContainer"]),
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(5.0),
                child:  SizedBox(
                width: size.width*.2,
                child: SvgPicture.asset(
                  "assets/svg/${widget.img}",
                ),
              ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(width: size.width*.7,
                    child: Text("Le budget 'Logement' a atteint 95 % de son montant total.", 
                    style: TextStyle(fontFamily: appEngine.myFontfamilies["st"], fontSize: appEngine.myFontSize["hintText"],  fontWeight: FontWeight.bold,),),
                  ),
                  
                ],
              ),
      
            ],
          ),
      
          
        ],),
      ),
    );
  }
}