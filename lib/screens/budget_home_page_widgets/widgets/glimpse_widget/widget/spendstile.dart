

import 'package:flutter/material.dart';
import 'package:gestion_budgetaire_app/backend/model/transacs.dart';

import '../../../../../app_engine/app_engine.dart';
import '../../../../../app_engine/vargloabal.dart';



class SpendsTile extends StatelessWidget {
  const SpendsTile({
    super.key,
    required this.spend
  });
  final Transacs spend;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    AppEngine appEngine = AppEngine();
    return Container(
      margin: const EdgeInsets.fromLTRB(8, 0, 8, 8),
      height: size.height * .07,
      decoration: BoxDecoration(
          borderRadius: appEngine.myRaduis["10"],
          color: appEngine.myColors["myContainer"]),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              SizedBox(
                  width: size.width * .55,
                  child: Text(
                    "${spend.amount} ${VarGloabal.favoritecurrencySymbol}",
                    style: TextStyle(
                        fontFamily:
                            appEngine.myFontfamilies["st"],
                        fontSize:
                            appEngine.myFontSize["hintText"],
                        fontWeight: FontWeight.bold,
                        color: appEngine.myColors["myBlack"]),
                  )),
              SizedBox(
                width: size.width * .55,
                child: Text(spend.descriptions,
                  style: TextStyle(
                      fontFamily: appEngine.myFontfamilies["st"],
                      fontSize: appEngine.myFontSize["hintText"],
                      fontWeight: FontWeight.bold,
                      color: appEngine.myColors["mygrey"]),
                ),
              ),
            ],
          ),
          Text(
            "  ${spend.registereddate.toIso8601String().split('T')[0]}",
            style: TextStyle(
                fontFamily: appEngine.myFontfamilies["st"],
                fontSize: appEngine.myFontSize["less"],
                color: appEngine.myColors["myBlack"]),
          ),
        ],
      ),
    );
  }
}
