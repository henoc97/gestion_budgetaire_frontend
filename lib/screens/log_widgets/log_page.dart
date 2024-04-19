import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../app_engine/app_engine.dart';
import '../../app_engine/app_localizations.dart';
import '../../app_engine/app_transition.dart';
import '../../backend/blocLogic/userlogique/userlogbloc/user_log_bloc.dart';
import '../main_page_wjdgets/main_page.dart';
import 'widgets/input_container.dart';
import 'widgets/register_button.dart';

class LogPage extends StatefulWidget {
  const LogPage({super.key});

  @override
  State<LogPage> createState() => _LogPageState();
}

class _LogPageState extends State<LogPage> {
  int _isClicked = -1;
  int get isClicked => _isClicked;
  set isClicked(int value) {
    setState(() {
      _isClicked = value;
    });
  }

  bool _isLogging = false;
  bool get isLogging => _isLogging;
  set isLogging(bool value) {
    setState(() {
      _isLogging = value;
    });
  }

  final _formkey = GlobalKey<FormState>();

  List<TextEditingController> fieldCtrs = [
    for (int i = 0; i < 2; i++) TextEditingController()
  ];
  var keysBoard = [TextInputType.emailAddress, TextInputType.text];

  @override
  Widget build(BuildContext context) {
    final userLogBloc = BlocProvider.of<UserLogBloc>(context);

    AppLocalizations? lang = AppLocalizations(); //.of(context);
    AppEngine appEngine = AppEngine();
    List<String> myHintText = [lang.email, lang.passwrd];
    return Scaffold(
      body: Wrap(
        children: [
          Form(
            key: _formkey,
            child: SafeArea(
                child: Padding(
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
                        lang.login,
                        style: TextStyle(
                            fontFamily: appEngine.myFontfamilies["st"],
                            fontSize: appEngine.myFontSize["textInButton"],
                            fontWeight: FontWeight.bold,
                            color: appEngine.myColors["myBlack"]),
                      )
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 75.sp),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 170.h,
                          child: ListView.builder(
                            itemCount: 2,
                            itemBuilder: (BuildContext context, int index) {
                              return GestureDetector(
                                  onTap: () {
                                    isClicked = index;
                                  },
                                  child: InputContainer(
                                    keyboardType : keysBoard[index],
                                    isClicked:
                                        isClicked == index ? true : false,
                                    hintText: myHintText[index],
                                    controller: fieldCtrs[index],
                                  ));
                            },
                          ),
                        ),
                        BlocListener<UserLogBloc, UserLogState>(
                          listener: (context, state) {
                            if (state is UserLoggedState) {
                              // Effectuer des actions lorsque l'utilisateur est connecté
                              AppTransition.standardGoTo(context, const MainPage());
                            }
                            if (state is UserLoggingState) {
                              isLogging = true;
                            } else {
                              isLogging = false;
                            }
                            print(state);
                          },
                          child:isLogging? CircularProgressIndicator(
                            color: appEngine.myColors["myGreen1"],
                          ) : ResgisterButton(
                            buttonText: lang.connect,
                            action: () {
                              
                              if (_formkey.currentState!.validate()) {
                                userLogBloc.add(
                                  UserLoggingEvent(fieldCtrs[0].text.trim(), fieldCtrs[1].text.trim()),
                                );
                              }
                            },
                          ),
                        ),
    
                      ],
                    ),
                  ),
                ],
              ),
            )),
          ),
        ],
      ),
    );
  }
}
