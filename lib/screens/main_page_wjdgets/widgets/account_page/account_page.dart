import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gestion_budgetaire_app/backend/blocLogic/transferlogique/usertransfersbloc/usertransfers_bloc.dart';
import 'package:gestion_budgetaire_app/screens/main_page_wjdgets/widgets/account_page/widget/maketransfer.dart';

import '../../../../app_engine/app_engine.dart';
import '../../../../app_engine/app_localizations.dart';
import '../../../../app_engine/currencies_hall.dart';
import '../../../../backend/blocLogic/transferlogique/deletetransferbloc/deletetransfer_bloc.dart';
import '../../../../backend/blocLogic/userlogique/useraccount/useraccount_bloc.dart';
import 'widget/account_card.dart';
import 'widget/accountcircularindicator.dart';
import 'widget/transfertile.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({super.key});

  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  bool _toggleGlimpseAddSpend = true;
  bool get toggleGlimpseAddSpend => _toggleGlimpseAddSpend;
  set toggleGlimpseAddSpend(bool value) {
    setState(() {
      _toggleGlimpseAddSpend = value;
    });
  }

  @override
  void initState() {
    super.initState();
    print("ca devrait marcher ");
    final usertransfers = BlocProvider.of<UsertransfersBloc>(context);
    usertransfers.add(UsertransfersDoingEvent());
    final usersoldbloc = BlocProvider.of<UseraccountBloc>(context);
    usersoldbloc.add(UseraccountGettingEvent());
  }

  @override
  Widget build(BuildContext context) {
    final deletetransferbloc = BlocProvider.of<DeletetransferBloc>(context);
    var size = MediaQuery.of(context).size;
    AppLocalizations? lang = AppLocalizations();
    AppEngine appEngine = AppEngine();
    var currencySymbols = CurrencySymbols.currencySymbols;
    return BlocBuilder<UseraccountBloc, UseraccountState>(
      builder: (context, accountstate) {
        return BlocBuilder<UsertransfersBloc, UsertransfersState>(
          builder: (context, transferliststate) {
            return Column(
              children: [
                accountstate is UseraccountGottenState?
                 AccountCard( account: accountstate.account, accountname: lang.bankname, nextPage: const MakeTransfer(),)
                 :Container(),
                const MyAccountCircularPercentIndicator(),
                Padding(
                  padding: const EdgeInsets.fromLTRB(8.0, 2.0, 0.0, 5.0),
                  child: Row(
                    children: [
                      Text(
                        lang.mytranfers,
                        style: TextStyle(
                            fontFamily: appEngine.myFontfamilies["st"],
                            fontSize: appEngine.myFontSize["hintText"],
                            fontWeight: FontWeight.bold,
                            color: appEngine.myColors["myBlack"]),
                      ),
                    ],
                  ),
                ),
                transferliststate is UsertransfersGottenState
                    ? Expanded(
                        child: ListView.builder(
                          itemCount: transferliststate.transfers.length,
                          itemBuilder: (BuildContext context, int index) {
                            return 

                            Slidable(                         
                          startActionPane: ActionPane(
                            motion: const ScrollMotion(),
                            children:  [
                              SlidableAction(
                                onPressed: (BuildContext context){
                                  print('go go go');
                                  
                                  deletetransferbloc.add(
                                    DeletingtransferEvent(
                                      transferliststate.transfers.reversed.toList()[index].id
                                      ));
                                      setState(() {
                                        transferliststate.transfers.removeWhere(
                                        (item) => item.id == 
                                        transferliststate.transfers.reversed.toList()[index].id
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

                            child: TransferTile(
                              transfer: transferliststate.transfers.reversed.toList()[index],
                            ));
                            
                            
                          },
                        ),
                      )
                    : CircularProgressIndicator(
                        color: appEngine.myColors["myGreen1"],
                      ),
              ],
            );
          },
        );
      },
    );
  }
}
