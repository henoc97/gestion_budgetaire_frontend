import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../app_engine/app_engine.dart';
import '../../../../app_engine/app_localizations.dart';
import '../../../log_widgets/widgets/input_container.dart';
import '../../../log_widgets/widgets/register_button.dart';

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
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    AppLocalizations? lang = AppLocalizations(); //.of(context);
    AppEngine appEngine = AppEngine();
    List <String> myHintText = [lang.amountAfterExchange, lang.currencyToExchange, lang.amountToExchange, lang.currencyExchangeInto];
    return Wrap(
      children: [
        Column(         
          children: [
            Container(height: size.height*.03,),
              SizedBox(height: 150.h,width: 150.w,
            child:Image.asset("assets/img/exc_currency.png", color: appEngine.myColors['myGreen1'],)
          ),
          Container(height: size.height*.03,),
              Row(
              children: [
                Flexible(
                  flex: 4,
                  child: InputContainer( hintText: myHintText[0])),
                Flexible(
                  flex: 1,
                  child: InputContainer( hintText: myHintText[1])),
              ],
            ),
            Container(height: size.height*.03,),
            Row(
              children: [
                Flexible(
                  flex: 3,
                  child: InputContainer( hintText: myHintText[2])),
                Flexible(
                  flex: 1,
                  child: InputContainer( hintText: myHintText[3])),
              ],
            ),
            Container(height: size.height*.03,),
            ResgisterButton(buttonText: lang.exchange,)
          ],
        ),
      ],
    );
  }
}