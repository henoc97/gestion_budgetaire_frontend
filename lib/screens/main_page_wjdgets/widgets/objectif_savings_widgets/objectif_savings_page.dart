import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../app_engine/app_engine.dart';
import '../../../../app_engine/app_localizations.dart';
import '../../../../app_engine/app_transition.dart';
import '../../../../backend/blocLogic/usersavingsbloc/usersavings_bloc.dart';
import '../../../../backend/model/savings.dart';
import '../../../make_saving_goal_widgets/make_saving_goal.dart';
import 'widgets/circular_percent_obj.dart';



class ObjectifSavings extends StatefulWidget {
  const ObjectifSavings({super.key});

  @override
  State<ObjectifSavings> createState() => _ObjectifSavingsState();
}

class _ObjectifSavingsState extends State<ObjectifSavings> {
  @override
  void initState() {
    super.initState();
    print("ca devrait marcher ");
    final usersavingsbloc = BlocProvider.of<UsersavingsBloc>(context);
    usersavingsbloc.add(UsersavingsgettingEvent());
  }

  @override
  Widget build(BuildContext context) {
    AppLocalizations? lang = AppLocalizations(); //.of(context);
    AppEngine appEngine = AppEngine();
    Size size = MediaQuery.of(context).size;
    return BlocBuilder<UsersavingsBloc, UsersavingsState>(
      builder: (context, state) {
        return Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(icon:FaIcon(FontAwesomeIcons.plus, color: appEngine.myColors['myGreen1'],),
                onPressed: (){
                  AppTransition.standardGoTo(context, const MakeSavingGoal());
                },
                ),
              ],
            ),
           state is UsersavingsGottenState ?
            Expanded(child: ListView.builder(
          itemCount: state.savingsList.length,
          itemBuilder: (BuildContext context, int index) {
            return SavingTile(savings: state.savingsList[index],);
          },
        ),) : CircularProgressIndicator(color: appEngine.myColors["myGreen1"],)
          ],
        );
      },
    );
  }
}

class SavingTile extends StatelessWidget {
  const SavingTile({
    super.key, 
    required this.savings,
  });

  final Savings savings;

  @override
  Widget build(BuildContext context) {
    AppLocalizations? lang = AppLocalizations(); //.of(context);
    AppEngine appEngine = AppEngine();
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: const EdgeInsets.fromLTRB(8, 0, 8, 8),
    height: size.height*.12,
    decoration: BoxDecoration(borderRadius: appEngine.myRaduis["10"], color: appEngine.myColors["myContainer"]),
    child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          height: size.height*.1,
          width: size.width*.17,
          child:  SvgPicture.asset("assets/svg/Financial_data.svg", ),),
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
          SizedBox(
            width: size.width*.5,
            child: Text("${savings.targetamount} \$", style: TextStyle(fontFamily: appEngine.myFontfamilies["st"], fontSize: appEngine.myFontSize["hintText"],  fontWeight: FontWeight.bold, color: appEngine.myColors["myGreen1"]),)),
          SizedBox(
            width: size.width*.5,
            child: Text("${savings.goal} ", style: TextStyle(fontFamily: appEngine.myFontfamilies["st"], fontSize: appEngine.myFontSize["hintText"],  fontWeight: FontWeight.bold, color: appEngine.myColors["mygrey"]),)),
        
          ],
        ),
        const Padding(
          padding: EdgeInsets.all(8.0),
          child: CircularPercentObjectif(),
        )
      ],
    ),
    );
  }
}