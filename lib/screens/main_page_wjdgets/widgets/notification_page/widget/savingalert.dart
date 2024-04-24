import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../../app_engine/app_engine.dart';
import '../../../../../app_engine/app_localizations.dart';
import 'notificationtile.dart';


class SavingAlert extends StatelessWidget {
  const SavingAlert({super.key});

 
  @override
  Widget build(BuildContext context) {
    AppEngine appEngine = AppEngine();
    AppLocalizations? lang = AppLocalizations();
    return ListView.builder(
      itemCount: 5,
      itemBuilder: (BuildContext context, int index) {
        return Slidable(                         
                startActionPane: ActionPane(
                  motion: const ScrollMotion(),
                  children:  [
                    SlidableAction(
                      onPressed: (BuildContext context){
                        print('go go go');
                        
                        
                        print('good good good');
                      },
                      backgroundColor : appEngine.myColors["myWhite"]!,
                      foregroundColor: appEngine.myColors["myRed"]!,
                      icon: FontAwesomeIcons.trashCan,
                      label: lang.delete,
                    ),                           
                  ],
                ),
    
                  child: const NotificationTile(img: "Financial_data.svg",));
      },
    );
  }
}