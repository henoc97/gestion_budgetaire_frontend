import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gestion_budgetaire_app/app_engine/vargloabal.dart';

import '../../../../../app_engine/app_engine.dart';
import '../../../../../app_engine/app_localizations.dart';
import '../../../../../backend/model/budget.dart';


class BudgetListTile extends StatefulWidget {
  const BudgetListTile({super.key, required this.budget});
  final Budget budget;
  @override
  State<BudgetListTile> createState() => _BudgetListTileState();
}

class _BudgetListTileState extends State<BudgetListTile> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    AppLocalizations? lang = AppLocalizations(); //.of(context);
    AppEngine appEngine = AppEngine();
    return Container(margin: const EdgeInsets.only(bottom: 8),
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
                          "assets/svg/make_budget.svg",
                        ),
                      ),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(widget.budget.categoryname, style: TextStyle(fontFamily: appEngine.myFontfamilies["st"], fontSize: appEngine.myFontSize["hintText"],  fontWeight: FontWeight.bold,),),
                          DateTime.now().isAfter(widget.budget.begindate.add(Duration(days: widget.budget.periods)))? 
                           Text('(${lang.dateExpired})', 
                          style: TextStyle(
                            fontFamily: appEngine.myFontfamilies["st"],
                            fontWeight: FontWeight.bold,
                            color: appEngine.myColors['myRed']!
                          ),
                          ):Container()
                        ],
                      ),

                    ],
                  ),

                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text("${widget.budget.budgetamountfix.toStringAsFixed(2)} ${VarGloabal.favoritecurrencySymbol}", style: TextStyle(fontFamily: appEngine.myFontfamilies["st"], fontSize: appEngine.myFontSize["hintText"],  fontWeight: FontWeight.bold, color: appEngine.myColors["myGreen1"]),),
                        Text("${(widget.budget.budgetamountfix - widget.budget.budgetamount).toStringAsFixed(2)} ${VarGloabal.favoritecurrencySymbol}", style: TextStyle(fontFamily: appEngine.myFontfamilies["st"], fontSize: appEngine.myFontSize["hintText"],  fontWeight: FontWeight.bold, color: appEngine.myColors["myRed"]),),
                      ],
                    ),
                  ),
                ],),
              );
  }
}