import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gestion_budgetaire_app/backend/blocLogic/savinglogique/usersavingsbloc/usersavings_bloc.dart';

import '../../../../../app_engine/app_engine.dart';
import '../../../../../app_engine/app_localizations.dart';
import '../../../../backend/blocLogic/budgetlogique/budgetspendsbloc/budgetspends_bloc.dart';
import '../../../../app_engine/vargloabal.dart';
import '../../../../backend/blocLogic/savinglogique/savingsbankbloc/usersavingsbank_bloc.dart';
import '../../../../backend/blocLogic/savinglogique/updatesavingsbloc/updatesaving_bloc.dart';
import '../../../../backend/model/savings.dart';
import '../../../log_widgets/widgets/input_container.dart';
import '../../../log_widgets/widgets/register_button.dart';
import 'objectifpercentindicator.dart';

class GlimpseSaving extends StatefulWidget {
  const GlimpseSaving({super.key, required this.savings});
  final Savings savings;

  @override
  State<GlimpseSaving> createState() => _GlimpseSavingState();
}

class _GlimpseSavingState extends State<GlimpseSaving> {
  TextEditingController controller = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  
  
  bool _toggleAddRemoveAmount = true;
  bool get toggleAddRemoveAmount => _toggleAddRemoveAmount;
  set toggleAddRemoveAmount(bool value){
    setState(() {
      _toggleAddRemoveAmount = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    AppLocalizations? lang = AppLocalizations(); //.of(context);
    AppEngine appEngine = AppEngine();
    final updateallsavingsbloc = BlocProvider.of<UpdatesavingBloc>(context);
    final usersavings = BlocProvider.of<UsersavingsBloc>(context);
    final savingbankbloc = BlocProvider.of<UsersavingsbankBloc>(context);
    return BlocBuilder<UpdatesavingBloc, UpdatesavingState>(
      builder: (context, updatesavingstate) {
        return Column(
          children: [
            ObjectifPercentIndicator(
              savings: widget.savings,
            ),
            Container(
              height: 10,
            ),
            Expanded(
                child: Form(
              key: _formKey,
              child: Wrap(
                children: [
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
                          keyboardType: TextInputType.number,
                          //isClicked: isClicked == index? true : false,
                          hintText: lang.addamounttoallsavings,
                          controller: controller,
                        ),
                        BlocListener<UpdatesavingBloc, UpdatesavingState>(
                                listener: (context, state) {
                                  if (state is UpdatedsavingState) {
                                    usersavings.add(UsersavingsgettingEvent());
                                    savingbankbloc.add(UsersavingsbankGettingEvent());
                                  }
                                  controller.clear();
                                },
                                child: updatesavingstate is! UpdatingsavingState
                              ? ResgisterButton(
                                  buttonText: toggleAddRemoveAmount? lang.addAmount : lang.removeAmounut,
                                  action: () {
                                    if (_formKey.currentState!.validate()) {
                                      updateallsavingsbloc.add(UpdatingsavingEvent(
                                          widget.savings.id,
                                          toggleAddRemoveAmount? double.parse(controller.text
                                              .replaceAll(',', '.')) : 
                                              - double.parse(controller.text
                                              .replaceAll(',', '.'))
                                              ));
                                      toggleAddRemoveAmount? VarGloabal.allsavings += double.parse(
                                          controller.text.replaceAll(',', '.')) : 
                                          VarGloabal.allsavings -= double.parse(
                                          controller.text.replaceAll(',', '.'));
                                    }
                                  },
                                ): CircularProgressIndicator(
                                color: appEngine.myColors["myGreen1"],
                              ),
                              )
                            
                      ],
                    ),
                  ),
                ],
              ),
            ))
          ],
        );
      },
    );
  }
}
