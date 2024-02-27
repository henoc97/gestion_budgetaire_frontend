import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../app_engine/app_engine.dart';
import '../../../../../app_engine/app_localizations.dart';
import '../../../../../app_engine/currencies_hall.dart';
import '../../../../../backend/blocLogic/userlogbloc/user_log_bloc.dart';

class AccountCard extends StatefulWidget {
  const AccountCard({super.key});

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
                      Text(userlogstate is UserLoggedState?
                        "${lang.bankname} ${userlogstate.user.fristName}": "",
                        style: TextStyle(
                            color: appEngine.myColors['myWhite'],
                            fontSize: appEngine.myFontSize['subtitle'],
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  Container(height: 15,),
                  Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                  ],), 
                  Container(height: 15,),
                  Row(
                    children: [
                      Text(userlogstate is UserLoggedState?
                            "${lang.sold} ": "",
                            style: TextStyle(
                                color: appEngine.myColors['myWhite'],
                                fontSize: appEngine.myFontSize['subtitle'],
                                fontWeight: FontWeight.bold),
                          ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
