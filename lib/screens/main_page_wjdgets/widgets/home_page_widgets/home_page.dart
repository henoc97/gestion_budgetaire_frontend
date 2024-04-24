import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import '../../../../app_engine/app_engine.dart';
import '../../../../app_engine/app_localizations.dart';
import '../../../../app_engine/app_transition.dart';
import '../../../../backend/blocLogic/budgetlogique/deletebudgetbloc/deletebudget_bloc.dart';
import '../../../../backend/blocLogic/budgetlogique/userbudgetsbloc/userbudgets_bloc.dart';
import '../../../budget_home_page_widgets/budget_home_page.dart';
import '../../../make_budgets_widgets/make_budgets_page.dart';
import 'widgets/budget_list_tile.dart';
import 'widgets/line_chart.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    print("ca devrait marcher ");
    final userbudgetsbloc = BlocProvider.of<UserbudegetsBloc>(context);
    userbudgetsbloc.add(UserbudgetsgettingEvent());
  }

  @override
  Widget build(BuildContext context) {
    final deletebudgetBloc = BlocProvider.of<DeletebudgetBloc>(context);
    AppLocalizations? lang = AppLocalizations(); //.of(context);
    AppEngine appEngine = AppEngine();
    return BlocBuilder<UserbudegetsBloc, UserbudgetsState>(
      builder: (context, state) {
        return SafeArea(
            child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              // c est ici
              Stack(children: [
                //ChartSupport(),
                Card(
                    elevation: 10,
                    shadowColor: appEngine.myColors['myGreen1']!,
                    child: const SpendsMonthlyLineChart())
              ]),
              // SpendsMonthlyLineChart(),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    lang.mainPagesubTitle,
                    style: TextStyle(
                        fontFamily: appEngine.myFontfamilies["st"],
                        fontSize: appEngine.myFontSize["subtitle"],
                        color: appEngine.myColors["myBlack"]),
                  ),
                  IconButton(
                    onPressed: () {
                      AppTransition.standardGoTo(
                          context, const MakeBudgetPage());
                    },
                    icon: FaIcon(
                      FontAwesomeIcons.plus,
                      color: appEngine.myColors['myGreen1'],
                    ),
                  )
                ],
              ),

              if (state is UserbudgetsgottenState) Expanded(
                child: ListView.builder(
                  itemCount: state.budgetList.length,
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                        onTap: () {
                          AppTransition.standardGoTo(
                              context, BudgetHomePage(budget : state.budgetList[index]));
                          //AppTransition.zoomedGoTO(context, const BudgetHomePage());
                        },
                        child:  Slidable(                         
                          startActionPane: ActionPane(
                            motion: const ScrollMotion(),
                            children:  [
                              SlidableAction(
                                onPressed: (BuildContext context){
                                  print('go go go');
                                  
                                  deletebudgetBloc.add(
                                    DeletingbudgetEvent(
                                      state.budgetList[index].id
                                      ));
                                      setState(() {
                                        state.budgetList.removeWhere(
                                        (item) => item.id == 
                                        state.budgetList[index].id
                                        );
                                      });
                                      
                                      print('good good good');
                                },
                                backgroundColor : appEngine.myColors["myWhite"]!,
                                foregroundColor: appEngine.myColors["myRed"]!,
                                icon: FontAwesomeIcons.trashCan,
                                label: lang.delete,
                              ),                           
                            ],
                          ),

                            child: BudgetListTile(budget:state.budgetList[index])));
                  },
                ),
              ) else CircularProgressIndicator(color: appEngine.myColors["myGreen1"],),
            ],
          ),
        ));
      },
    );
  }
}
