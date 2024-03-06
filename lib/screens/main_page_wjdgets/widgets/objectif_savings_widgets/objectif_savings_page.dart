import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../app_engine/app_engine.dart';
import '../../../../app_engine/app_localizations.dart';
import '../../../../app_engine/app_transition.dart';
import '../../../../backend/blocLogic/savingsbankbloc/usersavingsbank_bloc.dart';
import '../../../../backend/blocLogic/usersavingsbloc/usersavings_bloc.dart';
import '../../../make_saving_goal_widgets/make_saving_goal.dart';
import '../../../objectifsavings_home/saving_home.dart';
import '../account_page/widget/account_card.dart';
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
    final savingbankbloc = BlocProvider.of<UsersavingsbankBloc>(context);
    savingbankbloc.add(UsersavingsbankGettingEvent());
  }

  @override
  Widget build(BuildContext context) {
    AppLocalizations? lang = AppLocalizations();
    AppEngine appEngine = AppEngine();
    return BlocBuilder<UsersavingsbankBloc, UsersavingsbankState>(
      builder: (context, savingbankstate) {
        return BlocBuilder<UsersavingsBloc, UsersavingsState>(
          builder: (context, usersavingdstate) {
            return Column(
              children: [
                savingbankstate is UsersavingsbankGottenState?
                AccountCard(account: savingbankstate.usersavingbank, accountname: lang.savingbankname, nextPage: Container(),)
                :Container(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    IconButton(
                      icon: FaIcon(
                        FontAwesomeIcons.plus,
                        color: appEngine.myColors['myGreen1'],
                      ),
                      onPressed: () {
                        AppTransition.standardGoTo(
                            context, const MakeSavingGoal());
                      },
                    ),
                  ],
                ),
                usersavingdstate is UsersavingsGottenState
                    ? Expanded(
                        child: ListView.builder(
                          itemCount: usersavingdstate.savingsList.length,
                          itemBuilder: (BuildContext context, int index) {
                            return GestureDetector(
                              onTap: () {
                                AppTransition.standardGoTo(context, SavingHomePage(savings: usersavingdstate.savingsList[index],));
                              },
                              child: SavingTile(
                                savings: usersavingdstate.savingsList[index],
                              ),
                            );
                          },
                        ),
                      )
                    : CircularProgressIndicator(
                        color: appEngine.myColors["myGreen1"],
                      )
              ],
            );
          },
        );
      },
    );
  }
}
