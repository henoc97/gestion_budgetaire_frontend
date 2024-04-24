import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gestion_budgetaire_app/backend/blocLogic/savinglogique/deletesavingbloc/deletesaving_bloc.dart';

import '../../../../../app_engine/app_engine.dart';
import '../../../../../app_engine/date_formatter.dart';
import '../../../../../app_engine/vargloabal.dart';
import '../../../../../backend/model/savings.dart';


class SavingTile extends StatefulWidget {
  const SavingTile({
    super.key, 
    required this.savings,
    required this.savingsList, 
   // required this.selfWidth,
  });

  final Savings savings;
  final List<Savings> savingsList;
  //final double selfWidth;

  @override
  State<SavingTile> createState() => _SavingTileState();
}

class _SavingTileState extends State<SavingTile> {
  bool _trashView = false;
  bool get trashView => _trashView;
  set trashView(bool value){
    setState(() {
      _trashView = value;
    });
  }
  
  // double _selfWidth = size.width*.7;
  // double get selfWidth => _selfWidth;
  // set selfWidth(double value){
  //   setState(() {
  //     _selfWidth = value;
  //   });
  // }
  @override
  Widget build(BuildContext context) {
    final deletesavingsbloc = BlocProvider.of<DeletesavingBloc>(context);
    AppEngine appEngine = AppEngine();
    Size size = MediaQuery.of(context).size;
    double selfWidth = size.width*.7;

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        elevation: 6,
        child: Container(
        height: size.height*.11,
        width: selfWidth,
        decoration: BoxDecoration(borderRadius: appEngine.myRaduis["10"], 
        color: appEngine.myColors["myContainer"]),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
            Column(
              children: [
                Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                        width: size.width*.43,
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Text("${widget.savings.goal} ", 
                        style: TextStyle(fontFamily: appEngine.myFontfamilies["st"], 
                        fontSize: appEngine.myFontSize["hintText"],  
                        fontWeight: FontWeight.bold, color: appEngine.myColors["myBlack"]),),
                      ),
                    ),

                    Row(
                      children: [
                        trashView?GestureDetector(
                          onTap: (){
                            print("go go go");
                            deletesavingsbloc.add(DeletingsavingEvent(widget.savings.id));
                            print("good good good");
                             setState(() {
                               selfWidth = 0;
                             });
                            
                          },
                          child:  Icon(FontAwesomeIcons.trashCan, 
                          color: appEngine.myColors["myRed"],)
                          ) : Container(),
                          Container(width: 12,),
                        GestureDetector(
                          onTap: (){
                            trashView = !trashView;
                          },
                          child: const Icon(Icons.more_horiz_rounded)
                          ),
                      ],
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("${widget.savings.targetamount} ${VarGloabal.favoritecurrencySymbol}", 
                  style: TextStyle(fontFamily: appEngine.myFontfamilies["st"], 
                  fontSize: appEngine.myFontSize["hintText"],  fontWeight: FontWeight.bold, 
                  color: appEngine.myColors["myGreen1"]),),
                  widget.savings.allsavings == widget.savings.targetamount?
                  Icon(Icons.done, color: appEngine.myColors["myGreen1"]):
                  const Text(""),
                ],
              ),
              ],
            ),
            
            
            SizedBox(
              width: size.width*.6,
              height: 7.0, 
              child: ClipRRect(
              borderRadius: BorderRadius.circular(10.0),
              child: LinearProgressIndicator(
                backgroundColor: appEngine.myColors["mygrey"], 
                valueColor: AlwaysStoppedAnimation<Color>(appEngine.myColors["myGreen1"]!), 
                value: widget.savings.allsavings / widget.savings.targetamount, 
              ),
          ),),
          
            Row(
              children: [
                SizedBox(
                  width: size.width*.5,
                  child: Text(literalyDate(widget.savings.reachgoaldate.toIso8601String().split("T")[0]) , 
                  style: TextStyle(fontFamily: appEngine.myFontfamilies["st"], 
                  fontSize: appEngine.myFontSize["less"],  fontWeight: FontWeight.bold, 
                  color: (periods([DateTime.now(), widget.savings.reachgoaldate])< 0)&&(widget.savings.allsavings != widget.savings.targetamount)?
                   appEngine.myColors["myRed"] : appEngine.myColors["mygrey"]),)),

                Text("${((widget.savings.allsavings / widget.savings.targetamount)*100).round()}%" , style: TextStyle(fontFamily: appEngine.myFontfamilies["st"], 
                fontSize: appEngine.myFontSize["less"],  fontWeight: FontWeight.bold, 
                color: appEngine.myColors["myBlack"]),)
              
              ],
            ),
            
            ],
          ),
        ),
        ),
      ),
    );
  }
}