import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gestion_budgetaire_app/app_engine/app_engine.dart';
import 'package:gestion_budgetaire_app/backend/blocLogic/transacsbloc/transacs_bloc.dart';
import 'package:gestion_budgetaire_app/backend/blocLogic/transfertosoldbloc/transfertosold_bloc.dart';
import 'package:gestion_budgetaire_app/backend/blocLogic/useraccount/useraccount_bloc.dart';
import 'package:gestion_budgetaire_app/backend/model/transacs.dart';

import '../../../../../app_engine/app_localizations.dart';
import '../../../../../backend/blocLogic/usertransfersbloc/usertransfers_bloc.dart';
import '../../../../log_widgets/widgets/input_container.dart';
import '../../../../log_widgets/widgets/register_button.dart';


class MakeTransfer extends StatefulWidget {
  const MakeTransfer({super.key});


  @override
  State<MakeTransfer> createState() => _MakeTransferState();
}

class _MakeTransferState extends State<MakeTransfer> {
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


  final _formkey = GlobalKey<FormState>();
  List<TextEditingController> fieldCtrs = [
    for (int i = 0; i < 2; i++) TextEditingController()
  ];
  var keysBoard = [TextInputType.number, TextInputType.text];

  @override
  Widget build(BuildContext context) {
    final transferbloc = BlocProvider.of<TransfertosoldBloc>(context);
    final usersoldbloc = BlocProvider.of<UseraccountBloc>(context);
    final usertransfers = BlocProvider.of<UsertransfersBloc>(context);
    Size size = MediaQuery.of(context).size;
    AppLocalizations? lang = AppLocalizations(); 
    AppEngine appEngine = AppEngine();
    List<String> myHintText = [lang.transferamount, lang.description];
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
                  SizedBox(
                    height: size.height * .25,
                    child: ListView.builder(
                      itemCount: 2,
                      itemBuilder: (BuildContext context, int index) {
                        return InputContainer(
                          keyboardType: keysBoard[index],
                          isClicked: isClicked == index ? true : false,
                          hintText: myHintText[index],
                          containerHeight: index == 1 ? size.height * .08 : null,
                          controller: fieldCtrs[index],
                        );
                      },
                    ),
                  ),
                  BlocListener<TransfertosoldBloc, TransfertosoldState>(
                    listener: (context, state) {
                      if (state is TransfertosoldDoneState) {
                        usersoldbloc.add(UseraccountGettingEvent());
                        usertransfers.add(UsertransfersDoingEvent());
                        //budgetspendsbloc.add(BudgetspendsGettingEvent(widget.budgetid));
                        
                         
                      }
                      if (state is TransfertosoldDoingState) {
                        isRegistring = true;
                      } else {
                        isRegistring = false;
                      }
                    },
                    child:isRegistring? CircularProgressIndicator(
                      color: appEngine.myColors["myGreen1"],
                    ) :  ResgisterButton(
                      buttonText: lang.registerBudget,
                      action: () {
                        if (_formkey.currentState!.validate()) {
                          transferbloc.add(TransfertosoldDoingEvent(Transfer(
                              0,
                              double.parse(
                                  fieldCtrs[0].text.trim().replaceAll(',', '.')),
                              fieldCtrs[1].text.trim(),
                              DateTime.now())));
                        }
                      },
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
