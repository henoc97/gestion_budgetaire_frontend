import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../app_engine/app_localizations.dart';
import '../../../../../app_engine/app_transition.dart';
import '../../../../../backend/blocLogic/savinglogique/deletesavingbloc/deletesaving_bloc.dart';
import '../../../../../backend/model/savings.dart';
import '../../../../objectifsavings_home/saving_home.dart';
import 'savingtile.dart';

class InProgressPart extends StatefulWidget {
  const InProgressPart({
    super.key,
    required this.savingsList,
  });
  final List<Savings> savingsList;

  @override
  State<InProgressPart> createState() => _InProgressPartState();
}

class _InProgressPartState extends State<InProgressPart> {
  @override
  Widget build(BuildContext context) {
    AppLocalizations? lang = AppLocalizations();
    Size size = MediaQuery.of(context).size;
    return widget.savingsList.isEmpty
        ? Container()
        : SizedBox(
            height: size.height * .2,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: widget.savingsList.length,
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  onTap: () {
                    AppTransition.standardGoTo(
                        context,
                        SavingHomePage(
                          savings: widget.savingsList[index],
                        ));
                  },
                  child: (widget.savingsList[index].allsavings != 0 &&
                          widget.savingsList[index].allsavings !=
                              widget.savingsList[index].targetamount)
                      ? BlocListener<DeletesavingBloc, DeletesavingState>(
                          listener: (context, deletestate) {
                            if(deletestate is DeletedsavingState){
                              print("done");
                            //   setState(() {
                            //     widget.savingsList.removeWhere(
                            //     (item) => item.id == 
                            //     widget.savingsList[index].id
                            //   );
                            // });
                            }
                            
                          },
                          child: SavingTile(
                            //selfWidth: 0,
                            savings: widget.savingsList[index],
                            savingsList: widget.savingsList,
                          ),
                        )
                      : Container(),
                );
              },
            ),
          );
  }
}
