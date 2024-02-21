import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gestion_budgetaire_app/backend/blocLogic/makesavingsbloc/makesavings_bloc.dart';
import 'package:gestion_budgetaire_app/backend/model/savings.dart';

import '../../app_engine/app_engine.dart';
import '../../app_engine/app_localizations.dart';
import '../../app_engine/date_formatter.dart';
import '../../backend/blocLogic/usersavingsbloc/usersavings_bloc.dart';
import '../log_widgets/widgets/input_container.dart';
import '../log_widgets/widgets/register_button.dart';
import '../make_budgets_widgets/widgets/choose_begin_date_period.dart';



class MakeSavingGoal extends StatefulWidget {
  const MakeSavingGoal({super.key});

  @override
  State<MakeSavingGoal> createState() => _MakeSavingGoalState();
}

class _MakeSavingGoalState extends State<MakeSavingGoal> {
  int _isClicked = -1;
  int get isClicked => _isClicked;
  set isClicked(int value){
    setState(() {
      _isClicked = value;
    });
  }

    List<TextEditingController> fieldCtrs = [for(int i = 0; i<2; i++) TextEditingController()];
    final _formKey = GlobalKey<FormState>();

  bool _showBeginDateAndPeriod = false;
  bool get showBeginDateAndPeriod => _showBeginDateAndPeriod;
  set showBeginDateAndPeriod(bool value){
    setState(() {
      _showBeginDateAndPeriod = value;
    });
  }
  @override
  Widget build(BuildContext context) {
    final usersavingsbloc = BlocProvider.of<UsersavingsBloc>(context);
    AppLocalizations? lang = AppLocalizations();
     AppEngine appEngine = AppEngine();
      Size size = MediaQuery.of(context).size;
     List<String> hintText = [lang.goal, lang.targetAmount];
    final makesavingbloc = BlocProvider.of<MakesavingsBloc>(context);
    return Scaffold(
      body: Form(
        key: _formKey,
        child: SafeArea(
          child: Stack(
            children: [
              GestureDetector(
                 onTap: () {
            showBeginDateAndPeriod = !showBeginDateAndPeriod;
          },
                child: Container(
                  height: size.height*.9,
                  color: Colors.white,
                  child: Wrap(children: [
                    Center(
                      child: SizedBox(height: 300.h,width: 300.w,
                        child: SvgPicture.asset("assets/svg/Financial_data.svg",
                        ),
                      ),
                    ),
                    SizedBox(height: 125.h,
                      child: ListView.builder(
                        itemCount: 2,
                        itemBuilder: (BuildContext context, int index) {
                          return GestureDetector(
                            onTap: () {
                              isClicked = index;
                            },
                            child: InputContainer(isClicked: isClicked == index? true : false, hintText: hintText[index],controller: fieldCtrs[index],));
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
                         Text("  ${lang.reachGoalDate}", style: TextStyle(fontFamily: appEngine.myFontfamilies["st"], fontSize: appEngine.myFontSize["less"], fontWeight: FontWeight.bold,  color: appEngine.myColors["myGreen1"]),),
                       ],
                     ),
                     ),
                        
                    Center(child: BlocListener<MakesavingsBloc, MakesavingsState>(
                      listener: (context, state) {
                        
                        usersavingsbloc.add(UsersavingsgettingEvent());
                      },
                      child: ResgisterButton(buttonText: lang.registerBudget, action: () {
                                          if(_formKey.currentState!.validate() && DateList00.dateList00.length == 2){
                                            makesavingbloc.add(MakingsavingsEvent(
                                              Savings(0, fieldCtrs[0].text.trim(), 
                                              double.parse(fieldCtrs[1].text.trim().replaceAll(",", ".")),
                                              0,
                                              DateList00.dateList00[1]!
                                              )
                                            ));
                                          }
                                          for (var element in fieldCtrs) {
                                            print(element.text);
                                          }
                                        },),
                    ))
                  ],),
                ),
              ),
              showBeginDateAndPeriod? const BeginDateAndPeriod() : Container(),
            ],
          )
          ),
      ),
    );}}