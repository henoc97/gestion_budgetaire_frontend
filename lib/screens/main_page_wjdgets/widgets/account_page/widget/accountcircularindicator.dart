import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gestion_budgetaire_app/backend/blocLogic/userbudgetsbloc/userbudgets_bloc.dart';
import 'package:percent_indicator/percent_indicator.dart';

import '../../../../../app_engine/app_engine.dart';
import '../../../../../app_engine/app_localizations.dart';
import '../../../../../app_engine/vargloabal.dart';
import '../../../../../backend/blocLogic/useraccount/useraccount_bloc.dart';

class MyAccountCircularPercentIndicator extends StatelessWidget {
  const MyAccountCircularPercentIndicator({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    AppLocalizations? lang = AppLocalizations(); //.of(context);
    AppEngine appEngine = AppEngine();
    var percent = 0.16;
    return BlocBuilder<UseraccountBloc, UseraccountState>(
      builder: (context, accountstate) {
        return BlocBuilder<UserbudegetsBloc, UserbudgetsState>(
          builder: (context, budgetstate) {
            
                double budgetpercent = 0;
                double budgetsum = 0;
                if((budgetstate is UserbudgetsgottenState) && (accountstate is UseraccountGottenState)){
                  
                  for (var element in budgetstate.budgetList) {
                    budgetsum += element.budgetamountfix;
                  }
                  budgetpercent = budgetsum/accountstate.account.sold;
                }
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        height: size.height * .15,
                        child: CircularPercentIndicator(
                          radius: 55,
                          lineWidth: 12.sp,
                          animation: true,
                          animationDuration: 2000,
                          percent: budgetpercent > 1 ? 1 : budgetpercent,
                          center: Center(
                            child: Text("${(budgetpercent * 100).toStringAsFixed(1)} %",
                                style: TextStyle(
                                    fontFamily: appEngine.myFontfamilies["st"],
                                    fontSize: appEngine.myFontSize["hintText"],
                                    fontWeight: FontWeight.bold,
                                    color: appEngine.myColors["myBlack"])),
                          ),
                          circularStrokeCap: CircularStrokeCap.round,
                          linearGradient: budgetpercent > 1
                              ? LinearGradient(
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                  colors: [
                                    appEngine.myColors['myRed']!,
                                    appEngine.myColors['myRed']!,
                                    appEngine.myColors['myRed']!,
                                  ],
                                )
                              : LinearGradient(
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                  colors: [
                                    appEngine.myColors['myGreen1']!,
                                    appEngine.myColors['myGreen2']!,
                                    appEngine.myColors['myGreen3']!,
                                  ],
                                ),
                        ),
                      ),
                     Container(
                      margin: const EdgeInsets.only(top: 15),
                      height: size.height*.15, width: size.width*.62,
                       child: Column(children: [
                        Text("${lang.budgettotal} $budgetsum ${VarGloabal.favoritecurrencySymbol}" ,
                              style: TextStyle(
                                  color: appEngine.myColors['myGreen1'],
                                  fontFamily: appEngine.myFontfamilies["st"],
                                  fontSize: appEngine.myFontSize['less'],
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                                "L'épargne n'est pas simplement une contrainte, c'est un investissement dans votre avenir. ",
                                style: TextStyle(fontFamily: appEngine.myFontfamilies["st"], fontSize: appEngine.myFontSize["less"],  color: appEngine.myColors["myBlack"])
                            ),
                       ],),
                     )
                    ],
                  ),
                );
              },
            );
          },
        );
  }
}
