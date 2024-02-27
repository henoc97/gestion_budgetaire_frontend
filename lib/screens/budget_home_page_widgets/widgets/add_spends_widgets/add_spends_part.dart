import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gestion_budgetaire_app/app_engine/app_engine.dart';

import '../../../../app_engine/app_localizations.dart';
import '../../../../app_engine/vargloabal.dart';
import '../../../../backend/blocLogic/budgetspendsbloc/budgetspends_bloc.dart';
import '../../../../backend/blocLogic/transacsbloc/transacs_bloc.dart';
import '../../../../backend/blocLogic/userbudgetsbloc/userbudgets_bloc.dart';
import '../../../../backend/model/transacs.dart';
import '../../../log_widgets/widgets/input_container.dart';
import '../../../log_widgets/widgets/register_button.dart';

class AddSpends extends StatefulWidget {
  const AddSpends({super.key, required this.budgetid});

  final int budgetid;

  @override
  State<AddSpends> createState() => _AddSpendsState();
}

class _AddSpendsState extends State<AddSpends> {
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
    final budgetspendsbloc = BlocProvider.of<BudgetspendsBloc>(context);
    final userbudgetsbloc = BlocProvider.of<UserbudegetsBloc>(context);
    Size size = MediaQuery.of(context).size;
    final transacsbloc = BlocProvider.of<TransacsBloc>(context);
    AppLocalizations? lang = AppLocalizations(); 
    AppEngine appEngine = AppEngine();
    List<String> myHintText = [lang.amount, lang.description];
    return Form(
      key: _formkey,
      child: Column(
        children: [
          SizedBox(
            height: size.height * .3,
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
          BlocListener<TransacsBloc, TransacsState>(
            listener: (context, state) {
              if (state is TransacsdoneState) {
                userbudgetsbloc.add(UserbudgetsgettingEvent());
                budgetspendsbloc.add(BudgetspendsGettingEvent(widget.budgetid));
                
                 setState(() {
                   VarGloabal.budamountrest = VarGloabal.budamountrest - 
                     double.parse(fieldCtrs[0].text.trim().replaceAll(',', '.'));
                 });
                 print(VarGloabal.budamountrest);
              }
              if (state is TransacsdoingState) {
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
                  transacsbloc.add(TransacsdoingEvent(Transacs(
                      0,
                      double.parse(
                          fieldCtrs[0].text.trim().replaceAll(',', '.')),
                      fieldCtrs[1].text.trim(),
                      widget.budgetid,
                      DateTime.now())));
                }
              },
            ),
          )
        ],
      ),
    );
  }
}
