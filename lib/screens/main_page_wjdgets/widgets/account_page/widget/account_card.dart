import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../app_engine/app_engine.dart';
import '../../../../../app_engine/app_localizations.dart';
import '../../../../../app_engine/app_transition.dart';
import '../../../../../app_engine/currencies_hall.dart';
import '../../../../../app_engine/vargloabal.dart';
import '../../../../../backend/blocLogic/userlogbloc/user_log_bloc.dart';
import '../../../../../backend/model/account.dart';
import 'maketransfer.dart';

class AccountCard extends StatefulWidget {
  const AccountCard({super.key, required this.account, required this.accountname, required this.nextPage});
  final  account;
  final String accountname;
  final Widget nextPage;
  @override
  State<AccountCard> createState() => _AccountCardState();
}

class _AccountCardState extends State<AccountCard> {
  

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    AppLocalizations? lang = AppLocalizations();
    AppEngine appEngine = AppEngine();
    var currencySymbols = CurrencySymbols.currencySymbols;
    return Card(
      elevation: 7,
      color: appEngine.myColors["myGreen2"],
      child: BlocBuilder<UserLogBloc, UserLogState>(
            builder: (context, userlogstate) {
              return Container(
                height: size.height * .23,
                width: size.width * .95,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: const DecorationImage(
                        opacity: 0.1,
                        image: AssetImage("assets/img/motif.jpg"),
                        fit: BoxFit.cover)),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Text(
                            userlogstate is UserLoggedState
                                ? "${widget.accountname} ${userlogstate.user.fristName}"
                                : "",
                            style: TextStyle(
                                color: appEngine.myColors['myWhite'],
                                fontSize: appEngine.myFontSize['subtitle'],
                                fontFamily : appEngine.myFontfamilies["st"],
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      Container(
                        height: 7,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            height: size.height * .06,
                            width: size.width * .17,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(7),
                                image: const DecorationImage(
                                    image: AssetImage("assets/img/puce.jpg"),
                                    fit: BoxFit.cover)),
                          ),
                          Container(
                            height: size.height * .06,
                            width: size.width * .17,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(7),
                                image: const DecorationImage(
                                    image: AssetImage("assets/img/world.jpg"),
                                    fit: BoxFit.cover)),
                          )
                        ],
                      ),
                      Container(
                        height: 8.0,
                      ),
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Text(
                                  (userlogstate is UserLoggedState)
                                      ? "${lang.sold} ${widget.account.sold.toStringAsFixed(2)} ${VarGloabal.favoritecurrencySymbol}" 
                                      : "",
                                  style: TextStyle(
                                      color: appEngine.myColors['myWhite'],
                                      fontFamily: appEngine.myFontfamilies["st"],
                                      fontSize: appEngine.myFontSize['subtitle'],
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),

                            Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                        onTap: (){
                          AppTransition.standardGoTo(context, widget.nextPage);
                        },
                        child: Card(
                          elevation: 5,
                          shadowColor: appEngine.myColors["myGreen1"],
                          child: Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Text(lang.transfer, style: TextStyle(fontFamily: appEngine.myFontfamilies["st"], fontSize: appEngine.myFontSize["less"],  
                          fontWeight: FontWeight.bold, color: appEngine.myColors["myGreen1"]),),
                                              ),
                                            ),
                                          ),
                          Text(
                            (userlogstate is UserLoggedState)
                                ? "${lang.email1} ${userlogstate.user.mailAddress}" 
                                : "",
                            style: TextStyle(
                                color: appEngine.myColors['mygrey'],
                                fontFamily: appEngine.myFontfamilies["st"],
                                fontSize: appEngine.myFontSize['moreless'],
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                          ],
                        ),
                      ),
                      
                    ],
                  ),
                ),
              );
            },
          ));
      
  }
}
