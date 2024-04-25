import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../app_engine/app_engine.dart';
import '../../../../../app_engine/app_localizations.dart';
import '../../../../../backend/blocLogic/savinglogique/savingsbankbloc/usersavingsbank_bloc.dart';
import '../../../../../backend/blocLogic/userlogique/accountcommunicationbloc/account_communication_bloc.dart';
import '../../../../../backend/blocLogic/userlogique/useraccount/useraccount_bloc.dart';
import '../../../../log_widgets/widgets/input_container.dart';
import '../../../../log_widgets/widgets/register_button.dart';


class AccountCommunication extends StatefulWidget {
  const AccountCommunication({super.key});

  @override
  State<AccountCommunication> createState() => _AccountCommunicationState();
}

class _AccountCommunicationState extends State<AccountCommunication> {
 int _isClicked = -1;
  int get isClicked => _isClicked;
  set isClicked(int value) {
    setState(() {
      _isClicked = value;
    });
  }

  
  bool _isRegistring = false;
  bool get isRegistring => _isRegistring;
  set isRegistring(bool value) {
    setState(() {
      _isRegistring = value;
    });
  }

  bool _toggleAddRemoveAmount = true;
  bool get toggleAddRemoveAmount => _toggleAddRemoveAmount;
  set toggleAddRemoveAmount(bool value){
    setState(() {
      _toggleAddRemoveAmount = value;
    });
  }

  final _formkey = GlobalKey<FormState>();
  TextEditingController controller = TextEditingController();
  
  var keysBoard = TextInputType.number;

  @override
  Widget build(BuildContext context) {
    final transferbloc = BlocProvider.of<AccountCommunicationBloc>(context);
    final usersoldbloc = BlocProvider.of<UseraccountBloc>(context);
    final savingbankbloc = BlocProvider.of<UsersavingsbankBloc>(context);
    Size size = MediaQuery.of(context).size;
    AppLocalizations? lang = AppLocalizations(); 
    AppEngine appEngine = AppEngine();
    String myHintText = lang.transferamount;
    return Scaffold(
      body: Wrap(
        children: [
          SafeArea(
            child: Form(
              key: _formkey,
              child: Column(
                children: [
                  Center(
                          child: SizedBox(
                            height: 300.h,
                            width: 300.w,
                            child: SvgPicture.asset(
                              "assets/svg/transfer.svg",
                            ),
                          ),
                        ),
                        Container(height: 10,),
                        Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  children: [

                                    Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                            GestureDetector(
                              onTap: (){
                                toggleAddRemoveAmount = true;
                              },
                              child: Card(
                                elevation: toggleAddRemoveAmount? 35 : 5,
                                shadowColor: appEngine.myColors["myGreen1"],
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(lang.addAmount, style: TextStyle(fontFamily: appEngine.myFontfamilies["st"], fontSize: appEngine.myFontSize["hintText"],  fontWeight: FontWeight.bold, color: appEngine.myColors["myGreen1"]),),
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: (){
                                toggleAddRemoveAmount = false;
                              },
                              child: Card(
                                elevation: !toggleAddRemoveAmount? 35 : 5,
                                shadowColor: appEngine.myColors["myGreen1"],
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(lang.removeAmounut, style: TextStyle(fontFamily: appEngine.myFontfamilies["st"], fontSize: appEngine.myFontSize["hintText"],  fontWeight: FontWeight.bold, color: appEngine.myColors["myGreen1"]),),
                                ),
                              ),
                            )
                          ],),
                        ),
                        Container(height: 30,),
                  InputContainer(
                        keyboardType: keysBoard,
                        hintText: myHintText,
                        controller: controller,
                      ),
                  
                  BlocListener<AccountCommunicationBloc, AccountCommunicationState>(
                    listener: (context, state) {
                      if (state is AccountCommunicatedState) {
                        usersoldbloc.add(UseraccountGettingEvent());
                        savingbankbloc.add(UsersavingsbankGettingEvent());
                        //budgetspendsbloc.add(BudgetspendsGettingEvent(widget.budgetid));
                        
                         
                      }
                      if (state is AccountCommunicatingState) {
                        isRegistring = true;
                      } else {
                        isRegistring = false;
                      }
                    },
                    child:isRegistring? CircularProgressIndicator(
                      color: appEngine.myColors["myGreen1"],
                    ) :  ResgisterButton(
                      buttonText: toggleAddRemoveAmount? lang.addAmount : lang.removeAmounut,
                      action: () {
                        if (_formkey.currentState!.validate()) {
                          transferbloc.add(AccountCommunicatingEvent(
                            toggleAddRemoveAmount? double.parse(
                                  controller.text.trim().replaceAll(',', '.')) : 
                                  - double.parse(
                                  controller.text.trim().replaceAll(',', '.')),));
                              controller.clear();
                        }
                      },
                    ),
                  )
                ],
              ),
            ),
          
        ],
      ),)
    )]));
  }
}
