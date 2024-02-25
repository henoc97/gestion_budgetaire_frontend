import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gestion_budgetaire_app/backend/model/users.dart';
import 'package:gestion_budgetaire_app/screens/log_widgets/log_page.dart';

import '../../app_engine/app_engine.dart';
import '../../app_engine/app_localizations.dart';
import '../../app_engine/app_transition.dart';
import '../../app_engine/vargloabal.dart';
import '../../backend/blocLogic/userbloc/user_bloc.dart';
import '../log_widgets/widgets/input_container.dart';
import '../log_widgets/widgets/register_button.dart';
import '../main_page_wjdgets/widgets/exchange_currency_widget/widget/currencycard.dart';
import 'widgets/choosecurrency.dart';

class SignPage extends StatefulWidget {
  const SignPage({super.key});

  @override
  State<SignPage> createState() => _SignPageState();
}

class _SignPageState extends State<SignPage> {
  List<TextEditingController> fieldCtrs = [
    for (int i = 0; i < 7; i++) TextEditingController()
  ];
  var keysBoard = [TextInputType.text, TextInputType.text, 
    TextInputType.emailAddress, TextInputType.text, TextInputType.text, 
    TextInputType.number];

  final _formkey = GlobalKey<FormState>();

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

  @override
  Widget build(BuildContext context) {
    AppLocalizations? lang = AppLocalizations(); //.of(context);
    AppEngine appEngine = AppEngine();
    List<String> myHintText = [
      lang.fristName,
      lang.lastName,
      lang.email,
      lang.passwrd,
      lang.confirmpasswrd,
      lang.soldinit,
      lang.favoriteCurrency
    ];
    final userBloc = BlocProvider.of<UserBloc>(context);
    return Scaffold(
      body: Wrap(
        children: [
          Form(
            key: _formkey,
            child: SafeArea(
                child: Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  children: [
                                    Center(
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: SizedBox(
                                          height: 100.h,
                                          width: 100.w,
                                          child: SvgPicture.asset(
                                            "assets/svg/account_circle.svg",
                                            colorFilter: ColorFilter.mode(
                                                appEngine.myColors["myGreen1"]!,
                                                BlendMode.srcIn),
                                              )),
                                            ),
                                          ),
                                          Text(
                                            lang.signin,
                                            style: TextStyle(
                                            fontFamily: appEngine.myFontfamilies["st"],
                                            fontSize: appEngine.myFontSize["textInButton"],
                                            fontWeight: FontWeight.bold,
                                            color: appEngine.myColors["myBlack"]),
                                          )
                                        ],
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(top: 25.sp),
                                        child: Column(
                                          children: [
                                            SizedBox(
                                              height: 390.h,
                                              child: Column(
                                                children: [
                                                  SizedBox(
                                                    height: 350.h,
                                                    child: ListView.builder(
                                                      itemCount: 6,
                                                      itemBuilder:
                                                          (BuildContext context, int index) {
                                                        return GestureDetector(
                                                            onTap: () {
                                                              isClicked = index;
                                                            },
                                                            child: InputContainer(
                                                              keyboardType : keysBoard[index],
                                                              isClicked: isClicked == index
                                                                  ? true
                                                                  : false,
                                                              hintText: myHintText[index],
                                                              controller: fieldCtrs[index],
                                                            ));
                                                      },
                                                      ),
                                                    ),
                                                    Row(
                                                      children: [
                                                        Padding(
                                                          padding: const EdgeInsets.all(8.0),
                                                          child: GestureDetector(
                                                            onTap:  (){
                                                              currcard = !currcard;
                                                            },
                                                            child: Text(
                                                              "${myHintText[6]} : ${VarGloabal.currency}",
                                                              style: TextStyle(
                                                                  fontFamily: appEngine
                                                                      .myFontfamilies["st"],
                                                                  fontSize: appEngine
                                                                      .myFontSize["hintText"],
                                                                  color: appEngine
                                                                      .myColors["myBlack"]),
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        BlocListener<UserBloc, UserState>(
                                          listener: (context, state) {
                                            print(state);
                                                  if (state is UserCreatedState) {
                                                    AppTransition.standardGoTo(
                                                        context, const LogPage());
                                                  }
                                                },
                                                child: ResgisterButton(
                                                  buttonText: lang.register,
                                                  action: () {
                                                    if (_formkey.currentState!.validate()) {
                                                      if (fieldCtrs[3].text.trim() ==
                                                    fieldCtrs[4].text.trim()) {
                                                  userBloc.add(UserEventCreating(
                                                      Users(
                                                          0,
                                                          fieldCtrs[0].text.trim(),
                                                          fieldCtrs[1].text.trim(),
                                                          fieldCtrs[2].text.trim(),
                                                          fieldCtrs[3].text.trim(),
                                                          VarGloabal.currency),
                                                      double.parse(fieldCtrs[5].text.trim().replaceAll(',', '.'))));
                                                                              } else {
                                                      print('mot de passe non cohérent');
                                                    }
                                                  }
                                
                                            },
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  currcard
                                  ? CurrencyCardforChoice(
                                      onPressed: () {
                                        currcard = false;
                                  },
                                )
                                : Container()
                              ],
            )),
          ),
        ],
      ),
    );
  }
}
