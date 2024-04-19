import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../app_engine/app_engine.dart';
import '../../app_engine/app_localizations.dart';
import '../../app_engine/date_formatter.dart';
import '../../backend/blocLogic/budgetlogique/makebudgetbloc/makebudget_bloc.dart';
import '../../backend/blocLogic/budgetlogique/userbudgetsbloc/userbudgets_bloc.dart';
import '../../backend/model/budget.dart';
import '../log_widgets/widgets/input_container.dart';
import '../log_widgets/widgets/register_button.dart';
import 'widgets/choose_begin_date_period.dart';

class MakeBudgetPage extends StatefulWidget {
  const MakeBudgetPage({super.key});

  @override
  State<MakeBudgetPage> createState() => _MakeBudgetPageState();
}

class _MakeBudgetPageState extends State<MakeBudgetPage> {
  int _isClicked = -1;
  int get isClicked => _isClicked;
  set isClicked(int value) {
    setState(() {
      _isClicked = value;
    });
  }
  
  bool _isRegistring = false;
  bool get isRegistring => _isRegistring;
  set isRegistring(bool value) {
    setState(() {
      _isRegistring = value;
    });
  }

  List<TextEditingController> fieldCtrs = [
    for (int i = 0; i < 2; i++) TextEditingController()
  ];
  var keysBoard = [TextInputType.text, TextInputType.number];
  final _formkey = GlobalKey<FormState>();

  bool _showBeginDateAndPeriod = false;
  bool get showBeginDateAndPeriod => _showBeginDateAndPeriod;
  set showBeginDateAndPeriod(bool value) {
    setState(() {
      _showBeginDateAndPeriod = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    final makebudgetBloc = BlocProvider.of<MakebudgetBloc>(context);
    final userbudgetsbloc = BlocProvider.of<UserbudegetsBloc>(context);
    AppLocalizations? lang = AppLocalizations();
    AppEngine appEngine = AppEngine();
    Size size = MediaQuery.of(context).size;
    List<String> hintText = [lang.budgetName, lang.budgetCost];
    return Scaffold(
      body: Form(
        key: _formkey,
        child: SafeArea(
            child: Stack(
          children: [
            GestureDetector(
              onTap: () {
                showBeginDateAndPeriod = !showBeginDateAndPeriod;
              },
              child: Container(
                height: size.height * .9,
                color: Colors.white,
                child: Wrap(
                  children: [
                    Center(
                      child: SizedBox(
                        height: 300.h,
                        width: 300.w,
                        child: SvgPicture.asset(
                          "assets/svg/make_budget.svg",
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 125.h,
                      child: ListView.builder(
                        itemCount: 2,
                        itemBuilder: (BuildContext context, int index) {
                          return GestureDetector(
                              onTap: () {
                                isClicked = index;
                              },
                              child: InputContainer(
                                keyboardType: keysBoard[index],
                                isClicked:
                                    isClicked == index ? true : false,
                                hintText: hintText[index],
                                controller: fieldCtrs[index],
                              ));
                        },
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        showBeginDateAndPeriod = true;
                      },
                      child: Row(
                        children: [
                          const Icon(Icons.calendar_month_outlined),
                          Text(
                            "  ${lang.period}",
                            style: TextStyle(
                                fontFamily: appEngine.myFontfamilies["st"],
                                fontSize: appEngine.myFontSize["less"],
                                fontWeight: FontWeight.bold,
                                color: appEngine.myColors["myGreen1"]),
                          ),
                        ],
                      ),
                    ),
                    Center(
                        child: BlocListener<MakebudgetBloc, MakebudgetState>(
                      listener: (context, state) {
                        if (state is MakedbudgetState) {
                          userbudgetsbloc.add(UserbudgetsgettingEvent());
                        }
                        if (state is MakingbudgetState) {
                          isRegistring = true;
                        } else {
                          isRegistring = false;
                        }
                      },
                      child:isRegistring? CircularProgressIndicator(
                        color: appEngine.myColors["myGreen1"]
                      ) : ResgisterButton(
                        buttonText: lang.registerBudget,
                        action: () {
                          if (_formkey.currentState!.validate() &&
                              DateList00.dateList00.length == 2) {
                            makebudgetBloc.add(MakingbudgetEvent(Budget(
                                0,
                                fieldCtrs[0].text.trim(),
                                double.parse(fieldCtrs[1]
                                    .text
                                    .trim()
                                    .replaceAll(',', '.')),
                                periods(DateList00.dateList00),
                                DateList00.dateList00[0]!,
                                0)));
                            
                          }
                        },
                      ),
                    ))
                  ],
                ),
              ),
            ),
            showBeginDateAndPeriod
                ? const BeginDateAndPeriod()
                : Container(),
          ],
        )),
      ),
    );
  }
}
