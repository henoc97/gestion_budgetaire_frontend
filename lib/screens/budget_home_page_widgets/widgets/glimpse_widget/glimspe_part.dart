import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gestion_budgetaire_app/app_engine/vargloabal.dart';

import '../../../../app_engine/app_engine.dart';
import '../../../../app_engine/app_localizations.dart';
import '../../../../backend/blocLogic/budgetspendsbloc/budgetspends_bloc.dart';
import '../../../../backend/model/budget.dart';
import 'widget/circular_percent_indicator.dart';
import 'widget/spendstile.dart';

class Glimpse extends StatefulWidget {
  const Glimpse({super.key, required this.budget});
  final Budget budget;

  @override
  State<Glimpse> createState() => _GlimpseState();
}

class _GlimpseState extends State<Glimpse> {
  @override
  void initState() {
    super.initState();
    print("ca devrait marcher ");
    final budgetspendsbloc = BlocProvider.of<BudgetspendsBloc>(context);
    budgetspendsbloc.add(BudgetspendsGettingEvent(widget.budget.id));
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    AppLocalizations? lang = AppLocalizations(); //.of(context);
    AppEngine appEngine = AppEngine();
    return BlocBuilder<BudgetspendsBloc, BudgetspendsState>(
      builder: (context, state) {
        return Column(
          children: [
            MyCircularPercentIndicator(
              budget: widget.budget,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Text(
                    lang.mySpends,
                    style: TextStyle(
                        fontFamily: appEngine.myFontfamilies["st"],
                        fontSize: appEngine.myFontSize["hintText"],
                        fontWeight: FontWeight.bold,
                        color: appEngine.myColors["myBlack"]),
                  ),
                ],
              ),
            ),
            state is BudgetspendsGottenState?
            Expanded(
              child: ListView.builder(
                itemCount: state.spendsList.length,
                itemBuilder: (BuildContext context, int index) {
                  return  SpendsTile(spend: state.spendsList[index],);
                },
              ),
            ) : const CircularProgressIndicator()
          ],
        );
      },
    );
  }
}
