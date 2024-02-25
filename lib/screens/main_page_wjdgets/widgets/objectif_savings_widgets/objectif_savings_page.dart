import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../app_engine/app_engine.dart';
import '../../../../app_engine/app_transition.dart';
import '../../../../backend/blocLogic/usersavingsbloc/usersavings_bloc.dart';
import '../../../make_saving_goal_widgets/make_saving_goal.dart';
import 'widgets/savingtile.dart';



class ObjectifSavings extends StatefulWidget {
  const ObjectifSavings({super.key});

  @override
  State<ObjectifSavings> createState() => _ObjectifSavingsState();
}

class _ObjectifSavingsState extends State<ObjectifSavings> {
  @override
  void initState() {
    super.initState();
    final usersavingsbloc = BlocProvider.of<UsersavingsBloc>(context);
    usersavingsbloc.add(UsersavingsgettingEvent());
  }

  @override
  Widget build(BuildContext context) {
    AppEngine appEngine = AppEngine();
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
