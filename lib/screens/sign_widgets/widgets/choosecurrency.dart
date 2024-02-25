
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../../app_engine/app_engine.dart';
import '../../../../../app_engine/app_localizations.dart';
import '../../../../../app_engine/vargloabal.dart';


class CurrencyCardforChoice extends StatefulWidget {
  const CurrencyCardforChoice({
    super.key,
    this.onPressed
  });
  final Function()? onPressed;


  @override
  State<CurrencyCardforChoice> createState() => _CurrencyCardforChoiceState();
}

class _CurrencyCardforChoiceState extends State<CurrencyCardforChoice> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    AppEngine appEngine = AppEngine();
    return SingleChildScrollView(
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Card(
            color: appEngine.myColors["myWhite"],
            elevation: 30,
            child: SizedBox(
              height: size.height*.7, 
              width: size.width*.85,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    IconButton(onPressed: widget.onPressed, 
                    
                    icon: const FaIcon(FontAwesomeIcons.xmark)),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        for ( var key in currenciesMapContinent.keys)
                        SizedBox(
                          height: size.height*.1,
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Text(key,
                                  style: 
                                      TextStyle(
                                        color: appEngine.myColors['myGreen1'],
                                        fontWeight: FontWeight.bold,
                                        fontSize: appEngine.myFontSize["subtitle"],
                                        fontFamily: appEngine.myFontfamilies["st"]
                                      ),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                   for(var i = 0; i<6; i++)
                                  GestureDetector(child : Text(currenciesMapContinent[key]![i],
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontFamily: appEngine.myFontfamilies["st"],
                                    color: VarGloabal.currency == currenciesMapContinent[key]![i]?
                                       appEngine.myColors['myGreen1'] :
                                    appEngine.myColors['myBlack']),), 
                                  onTap: (){
                                    setState(() {
                                      VarGloabal.currency = currenciesMapContinent[key]![i];
                                    });
                                  },),
                                ],
                              ),
                              const Spacer(),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                 for(var i = 6; i<currenciesMapContinent[key]!.length; i++)
                                  GestureDetector(child : Text(currenciesMapContinent[key]![i],
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontFamily: appEngine.myFontfamilies["st"],
                                    color: VarGloabal.currency == currenciesMapContinent[key]![i]?
                                       appEngine.myColors['myGreen1'] :
                                    appEngine.myColors['myBlack']),), 
                                  onTap: (){
                                    setState(() {
                                      VarGloabal.currency = currenciesMapContinent[key]![i];
                                    });
                                  },),
                              ],)
                            ],
                          ),
                        )
                        
                      ],
                    ),
                  ],
                ),
              ),
              
              ),
          ),
        ),
      ),
    );
  }
}