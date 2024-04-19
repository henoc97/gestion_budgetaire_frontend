import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gestion_budgetaire_app/backend/model/savings.dart';

import '../../app_engine/app_engine.dart';
import '../../app_engine/app_localizations.dart';
import '../../app_engine/vargloabal.dart';
import '../../backend/blocLogic/savinglogique/updatesavingsbloc/updatesaving_bloc.dart';
import 'widget/glimpseobjectif/glimpse_objectif.dart';

class SavingHomePage extends StatefulWidget {
  const SavingHomePage({super.key, required this.savings});
  final Savings savings;

  @override
  State<SavingHomePage> createState() => _SavingHomePageState();
}

class _SavingHomePageState extends State<SavingHomePage> {
  bool _toggleGlimpseAddSpend = true;
  bool get toggleGlimpseAddSpend => _toggleGlimpseAddSpend;
  set toggleGlimpseAddSpend(bool value) {
    setState(() {
      _toggleGlimpseAddSpend = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    AppLocalizations? lang = AppLocalizations(); //.of(context);
    AppEngine appEngine = AppEngine();
    List<String> myHintText = [lang.amount, lang.description];
    VarGloabal.allsavings = widget.savings.allsavings;
    return BlocBuilder<UpdatesavingBloc, UpdatesavingState>(
      builder: (context, state) {
        return Scaffold(
          body: Column(
            children: [
              Stack(
                children: [
                  Container(
                    height: size.height * .33,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            bottomRight: appEngine.myRaduis["10raduis"],
                            bottomLeft: appEngine.myRaduis["10raduis"]),
                        image: const DecorationImage(
                            image: AssetImage("assets/img/savings.jpg"),
                            fit: BoxFit.cover)),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                                margin: EdgeInsets.only(top: 35.sp),
                                decoration: BoxDecoration(
                                    color: Colors.white.withOpacity(0.6),
                                    borderRadius: BorderRadius.all(
                                        appEngine.myRaduis["10raduis"])),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    " ${(widget.savings.goal)} ",
                                    style: TextStyle(
                                        fontFamily:
                                            appEngine.myFontfamilies["st"],
                                        fontSize:
                                            appEngine.myFontSize["hintText"],
                                        fontWeight: FontWeight.bold,
                                        color: appEngine.myColors["myGreen1"]),
                                  ),
                                )),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Container(
                              margin: EdgeInsets.only(top: 10.sp),
                              height: size.height * .1,
                              //width: size.width * .45,
                              decoration: BoxDecoration(
                                  color: Colors.white.withOpacity(0.6),
                                  borderRadius: BorderRadius.all(
                                      appEngine.myRaduis["10raduis"])),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Text(
                                          "${VarGloabal.favoritecurrencySymbol} ${(widget.savings.targetamount).toStringAsFixed(2)}    ",
                                          style: TextStyle(
                                              fontFamily: appEngine
                                                  .myFontfamilies["st"],
                                              fontSize: appEngine
                                                  .myFontSize["hintText"],
                                              fontWeight: FontWeight.bold,
                                              color: appEngine
                                                  .myColors["myGreen1"]),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          "${VarGloabal.favoritecurrencySymbol} ${VarGloabal.allsavings.toStringAsFixed(2)}",
                                          style: TextStyle(
                                              fontFamily: appEngine
                                                  .myFontfamilies["st"],
                                              fontSize: appEngine
                                                  .myFontSize["hintText"],
                                              fontWeight: FontWeight.bold,
                                              color:
                                                  appEngine.myColors["myRed"]),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
              Expanded(
                  child: GlimpseSaving(
                savings: widget.savings,
              ))
            ],
          ),
        );
      },
    );
  }
}
