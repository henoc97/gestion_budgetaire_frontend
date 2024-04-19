import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../app_engine/app_engine.dart';
import '../../../../app_engine/app_localizations.dart';
import '../../../../app_engine/app_transition.dart';
import '../../../../backend/blocLogic/savinglogique/savingsbankbloc/usersavingsbank_bloc.dart';
import '../../../../backend/blocLogic/savinglogique/usersavingsbloc/usersavings_bloc.dart';
import '../../../make_saving_goal_widgets/make_saving_goal.dart';
import '../account_page/widget/account_card.dart';
import 'widgets/inprogress_oart.dart';
import 'widgets/notbegin_part.dart';
import 'widgets/termined_part.dart';

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
            return SingleChildScrollView(
              child: Column(
                children: [
                  savingbankstate is UsersavingsbankGottenState?
                  AccountCard(account: savingbankstate.usersavingbank, accountname: lang.savingbankname, nextPage: Container(),)
                  :Container(),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(lang.inprogress, 
                          style: TextStyle(fontFamily: appEngine.myFontfamilies["st"], 
                          fontSize: appEngine.myFontSize["hintText"],  fontWeight: FontWeight.bold, 
                          color: appEngine.myColors["myGreen1"]),),
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
                  ),
                  usersavingdstate is UsersavingsGottenState? Column(
                    children: [
                      InProgressPart(savingsList: usersavingdstate.inprogressSavingsList,),
                      
                        
                      NotBeginPart(savingsList: usersavingdstate.notBeginSavingsList,),
                    
                          
                      TerminedPart(savingsList: usersavingdstate.terminedSavingsList,),
                  
                    ],
                  ) : CircularProgressIndicator(
                    color: appEngine.myColors["myGreen1"],
                  )
                    
                ],
              ),
            );
          },
        );
      },
    );
  }
}
