import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../app_engine/app_engine.dart';
import '../../app_engine/app_localizations.dart';
import '../../app_engine/vargloabal.dart';
import '../../backend/model/budget.dart';
import 'widgets/add_spends_widgets/add_spends_part.dart';
import 'widgets/glimpse_widget/glimspe_part.dart';

class BudgetHomePage extends StatefulWidget {
  const BudgetHomePage({super.key, required this.budget});
  final Budget budget;

  @override
  State<BudgetHomePage> createState() => _BudgetHomePageState();
}

class _BudgetHomePageState extends State<BudgetHomePage> {
  

  bool _toggleGlimpseAddSpend = true;
  bool get toggleGlimpseAddSpend => _toggleGlimpseAddSpend;
  set toggleGlimpseAddSpend(bool value){
    setState(() {
      _toggleGlimpseAddSpend = value;
    });
  }

  @override
  void initState() {
    super.initState();
    print("ca devrait marcher ");
    setState(() {
       VarGloabal.budamountrest = widget.budget.budgetamount;
     });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    AppLocalizations? lang = AppLocalizations(); //.of(context);
    AppEngine appEngine = AppEngine();
    List <String> myHintText = [lang.amount, lang.description];
    
    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: [
                  Container(
                                height: size.height*.33,
                                decoration:  BoxDecoration(
                  borderRadius: BorderRadius.only(bottomRight:appEngine.myRaduis["10raduis"], bottomLeft: appEngine.myRaduis["10raduis"]),
                  image: const DecorationImage(image: AssetImage("assets/img/budget_home.jpg"), fit: BoxFit.cover)),
                                
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(margin: EdgeInsets.only(top: 35.sp),
                          height: size.height*.1,
                          width: size.width*.5,
                          decoration: BoxDecoration( color: Colors.white.withOpacity(0.6),
                            borderRadius: BorderRadius.all(appEngine.myRaduis["10raduis"])),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                  Text(widget.budget.categoryname, style: TextStyle(fontFamily: appEngine.myFontfamilies["st"], fontSize: appEngine.myFontSize["hintText"],  fontWeight: FontWeight.bold, color: appEngine.myColors["myBlack"]),),
                                  Text("${widget.budget.periods} jrs", style: TextStyle(fontFamily: appEngine.myFontfamilies["st"], fontSize: appEngine.myFontSize["hintText"],  fontWeight: FontWeight.bold, color: appEngine.myColors["myBlack"]),),
                                ],),
                                Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                  Text("\$ ${(widget.budget.budgetamountfix)}", style: TextStyle(fontFamily: appEngine.myFontfamilies["st"], fontSize: appEngine.myFontSize["hintText"],  fontWeight: FontWeight.bold, color: appEngine.myColors["myGreen1"]),),
                                  Text("\$ ${(widget.budget.budgetamountfix - VarGloabal.budamountrest).toStringAsFixed(2)}", style: TextStyle(fontFamily: appEngine.myFontfamilies["st"], fontSize: appEngine.myFontSize["hintText"],  fontWeight: FontWeight.bold, color: appEngine.myColors["myRed"]),),
                                ],)
                              ]),
                            ),
                        ),
                      ],
                    ),
                  )
                ],
          ),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                GestureDetector(
                  onTap: (){
                    toggleGlimpseAddSpend = true;
                  },
                  child: Card(
                    elevation: toggleGlimpseAddSpend? 35 : 5,
                    shadowColor: appEngine.myColors["myGreen1"],
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(lang.glimpse, style: TextStyle(fontFamily: appEngine.myFontfamilies["st"], fontSize: appEngine.myFontSize["hintText"],  fontWeight: FontWeight.bold, color: appEngine.myColors["myGreen1"]),),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: (){
                    toggleGlimpseAddSpend = false;
                  },
                  child: Card(
                    elevation: !toggleGlimpseAddSpend? 35 : 5,
                    shadowColor: appEngine.myColors["myGreen1"],
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(lang.addSpend, style: TextStyle(fontFamily: appEngine.myFontfamilies["st"], fontSize: appEngine.myFontSize["hintText"],  fontWeight: FontWeight.bold, color: appEngine.myColors["myGreen1"]),),
                    ),
                  ),
                )
              ],),
            ),

             Expanded(
               child: toggleGlimpseAddSpend?  Glimpse(budget: widget.budget,) :  Wrap(children: [ AddSpends(budgetid : widget.budget.id)]),
             )

        ],
      ),
    );
  }
}
