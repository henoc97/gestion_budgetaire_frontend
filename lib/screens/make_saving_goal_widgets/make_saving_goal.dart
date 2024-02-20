import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../app_engine/app_engine.dart';
import '../../app_engine/app_localizations.dart';
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


  bool _showBeginDateAndPeriod = false;
  bool get showBeginDateAndPeriod => _showBeginDateAndPeriod;
  set showBeginDateAndPeriod(bool value){
    setState(() {
      _showBeginDateAndPeriod = value;
    });
  }
  @override
  Widget build(BuildContext context) {
    AppLocalizations? lang = AppLocalizations();
     AppEngine appEngine = AppEngine();
      Size size = MediaQuery.of(context).size;
     List<String> hintText = [lang.goal, lang.targetAmount];
    
    return Scaffold(
      body: SafeArea(
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
                      
                  Center(child: ResgisterButton(buttonText: lang.registerBudget, action: () {
                    for (var element in fieldCtrs) {
                      print(element.text);
                    }
                  },))
                ],),
              ),
            ),
            showBeginDateAndPeriod? const BeginDateAndPeriod() : Container(),
          ],
        )
        ),
    );}}