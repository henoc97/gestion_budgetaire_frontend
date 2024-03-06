import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gestion_budgetaire_app/backend/blocLogic/usersavingsbloc/usersavings_bloc.dart';

import '../../../../../app_engine/app_engine.dart';
import '../../../../../app_engine/app_localizations.dart';
import '../../../../../backend/blocLogic/budgetspendsbloc/budgetspends_bloc.dart';
import '../../../../app_engine/vargloabal.dart';
import '../../../../backend/blocLogic/savingsbankbloc/usersavingsbank_bloc.dart';
import '../../../../backend/blocLogic/updatesavingsbloc/updatesaving_bloc.dart';
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

  @override
  void initState() {
    super.initState();
    print("ca devrait marcher ");
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
              height: 40,
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
                                },
                                child: updatesavingstate is! UpdatingsavingState
                              ? ResgisterButton(
                                  buttonText: lang.addtoallsavings,
                                  action: () {
                                    if (_formKey.currentState!.validate()) {
                                      updateallsavingsbloc.add(UpdatingsavingEvent(
                                          widget.savings.id,
                                          double.parse(controller.text
                                              .replaceAll(',', '.'))));
                                      VarGloabal.allsavings += double.parse(
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
