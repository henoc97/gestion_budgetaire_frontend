import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gestion_budgetaire_app/app_engine/vargloabal.dart';
import 'package:gestion_budgetaire_app/backend/blocLogic/exchangebloc/exchange_bloc.dart';

import '../../../../app_engine/app_engine.dart';
import '../../../../app_engine/app_localizations.dart';
import '../../../../app_engine/currencies_hall.dart';
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
  set isClicked(int value) {
    setState(() {
      _isClicked = value;
    });
  }

  bool _currcard = false;
  bool get currcard => _currcard;
  set currcard(bool value) {
    setState(() {
      _currcard = value;
    });
  }

  final _formkey = GlobalKey<FormState>();
  TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    AppLocalizations? lang = AppLocalizations();
    final exchangeBloc = BlocProvider.of<ExchangeBloc>(context);
    AppEngine appEngine = AppEngine();
    List<String> myHintText = [
      lang.amountAfterExchange,
      lang.currencyToExchange,
      lang.amountToExchange,
      lang.currencyExchangeInto
    ];
    var currencySymbols = CurrencySymbols.currencySymbols;
    return BlocBuilder<ExchangeBloc, ExchangeState>(
      builder: (context, state) {
        return Form(
          key: _formkey,
          child: Wrap(
            children: [
              Column(
                children: [
                  Container(height: 0,),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                    width: size.width,
                    child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                       Stack(
                         children: [
                            SizedBox(
                            height: 320.h,
                            width: 320.w,
                            child: Image.asset(
                              "assets/img/exc_currency.png",
                              color: appEngine.myColors['myGreen1']!.withOpacity(0.2),
                            )),

                            SizedBox(
                              height: 300.h,
                              child: Column(mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  Row(
                                    children: [
                                      Text(" ${currencySymbols[VarGloabal.currenciesList[1]]} ",
                                      style: TextStyle(
                                        color: appEngine.myColors["myBlack"],
                                        fontWeight: FontWeight.bold,
                                        fontSize: appEngine.myFontSize["textInButton"],
                                        fontFamily: appEngine.myFontfamilies["st"]),
                                      ),
                              
                                      Container(
                                        decoration: BoxDecoration(color:  appEngine.myColors["myWhite"],
                                        borderRadius: BorderRadius.circular(10)),
                                        
                                        width: size.width *.6,
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Center(
                                            child: Text( state is ExchangedState?
                                            '${state.exchange.amount} ' :
                                            '00.00',
                                            style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: appEngine.myFontSize["textInButton"],
                                            fontFamily: appEngine.myFontfamilies["st"]),
                                                                                        ),
                                          ),
                                        )
                                      ),
                              
                                      Text("  ${VarGloabal.currenciesList[1]} ",
                                            style: TextStyle(
                                              color: appEngine.myColors["myGreen1"],
                                              fontWeight: FontWeight.bold,
                                              fontSize: appEngine.myFontSize["subtitle"],
                                              fontFamily: appEngine.myFontfamilies["st"]),
                                            ),
                                    ],
                                  ),
                                  
                                  
                                  Column( mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Row(mainAxisAlignment: MainAxisAlignment.end,
                                        children: [
                                          Center(
                                            child: Container(
                                              decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                color: appEngine.myColors["myWhite"]!.withOpacity(0.5)
                                              ),
                                              child: Text(" ${currencySymbols[VarGloabal.currenciesList[0]]} ",
                                              style: TextStyle(
                                                color: appEngine.myColors["myBlack"],
                                                fontWeight: FontWeight.bold,
                                                fontSize: appEngine.myFontSize["textInButton"],
                                                fontFamily: appEngine.myFontfamilies["st"]),
                                              ),
                                            ),
                                          ),
                                  
                                          Container(
                                            decoration: BoxDecoration(color:  appEngine.myColors["myWhite"],
                                            borderRadius: BorderRadius.circular(10)),
                                            
                                            width: size.width *.6,
                                            child: InputContainer(
                                              hintText: myHintText[2],
                                              keyboardType: TextInputType.number,
                                              controller: controller,
                                            ),
                                          ),
                                  
                                          GestureDetector(
                                            onTap: () {
                                              currcard = !currcard;
                                            },
                                            child: Text(
                                              "  ${VarGloabal.currenciesList[0]} ",
                                              style: TextStyle(
                                                  color: appEngine.myColors['myGreen1'],
                                                  fontWeight: FontWeight.bold,
                                                  fontSize:
                                                      appEngine.myFontSize["subtitle"],
                                                  fontFamily: appEngine.myFontfamilies["st"]),
                                            ),
                                          ),
                                        ],
                                      ),
                                      
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            currcard
                  ? CurrencyCard(
                      onPressed: () {
                        currcard = false;
                      },
                    )
                  : Container(),
                          ],
                       ),
                      
                      
                    ],
                    ),
                  ),
                 ),
                ],
              ),
              
              
               
              
              Container(
                height: size.height * .03,
              ),
              Center(
                child: ResgisterButton(
                  buttonText: lang.exchange,
                  action: () {
                    if (_formkey.currentState!.validate() &&
                        VarGloabal.currenciesList.length == 2) {
                      exchangeBloc.add(ExchangingEvent(
                          double.parse(controller.text
                              .trim()
                              .replaceAll(',', '.')),
                          VarGloabal.currenciesList));
                    }
                  },
                ),
              ),
              
            ],
          ),
        );
      },
    );
  }
}
