import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gestion_budgetaire_app/app_engine/vargloabal.dart';

import '../../../../app_engine/app_engine.dart';
import '../../../../app_engine/app_localizations.dart';
import '../../../log_widgets/widgets/input_container.dart';
import '../../../log_widgets/widgets/register_button.dart';
import 'widget/currencycard.dart';

class ExchangeCurrencyPage extends StatefulWidget {
  const ExchangeCurrencyPage({super.key});

  @override
  State<ExchangeCurrencyPage> createState() => _ExchangeCurrencyPageState();
}

class _ExchangeCurrencyPageState extends State<ExchangeCurrencyPage> {
  int _isClicked = -1;
  int get isClicked => _isClicked;
  set isClicked(int value){
    setState(() {
      _isClicked = value;
    });
  }

  bool _currcard = false;
  bool get currcard => _currcard;
  set currcard(bool value){
    setState(() {
      _currcard = value;
    });
  }

  final _formkey = GlobalKey<FormState>();
  TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    AppLocalizations? lang = AppLocalizations(); //.of(context);
    AppEngine appEngine = AppEngine();
    List <String> myHintText = [lang.amountAfterExchange, lang.currencyToExchange, lang.amountToExchange, lang.currencyExchangeInto];
    return Form(
      key: _formkey,
      child: Wrap(
        children: [
          Stack(
            children: [
              Column(         
                children: [
                  Container(height: size.height*.03,),
                    SizedBox(height: 150.h,width: 150.w,
                  child:Image.asset("assets/img/exc_currency.png", color: appEngine.myColors['myGreen1'],)
                ),
                Container(height: size.height*.03,),
                    Text('00.00  ${VarGloabal.currenciesList[1]}', style: 
                    TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: appEngine.myFontSize["textInButton"],
                      fontFamily: appEngine.myFontfamilies["st"]
                    ),),
                  Container(height: size.height*.03,),
                  Row(
                    children: [
                      Flexible(
                        flex: 3,
                        child: InputContainer( hintText: myHintText[2], 
                        keyboardType: TextInputType.number,
                        controller: controller,
                        )),
                      Flexible(
                        flex: 1,
                        child: GestureDetector(
                          onTap: () {
                            currcard = !currcard;
                          },
                          child: Text("  ${VarGloabal.currenciesList[0]} ",
                          style: 
                            TextStyle(
                              color: appEngine.myColors['myGreen1'],
                              fontWeight: FontWeight.bold,
                              fontSize: appEngine.myFontSize["textInButton"],
                              fontFamily: appEngine.myFontfamilies["st"]
                            ),),
                        ),),
                    ],
                  ),
                  Container(height: size.height*.03,),
                  ResgisterButton(buttonText: lang.exchange,
                  action: () {
                    if (_formkey.currentState!.validate() && VarGloabal.currenciesList.length == 2) {
                      
                    }
                  },
                  )
                ],
              ),
      
              currcard? CurrencyCard(
                onPressed: (){
                  currcard = false;
                },
                ) : Container()
            ],
          ),
        ],
      ),
    );
  }
}
