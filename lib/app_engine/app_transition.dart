


import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class AppTransition {


static standardGoTo (BuildContext context, Widget page){
  return  Navigator.push(context,
                PageRouteBuilder(
                    pageBuilder: (_, __, ___) =>  page));
}


// static zoomedGoTO(BuildContext context, Widget page){
//   return Get.to(() => page, transition: Transition.zoom);
// }

}