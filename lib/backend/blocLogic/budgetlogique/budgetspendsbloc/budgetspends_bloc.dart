import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:http/http.dart'as http;


import '../../../../app_engine/app_localizations.dart';
import '../../../../app_engine/app_share_preference.dart';

import '../../../model/transacs.dart';
import '../../../url.dart';

part 'budgetspends_event.dart';
part 'budgetspends_state.dart';

class BudgetspendsBloc extends Bloc<BudgetspendsEvent, BudgetspendsState> {
  BudgetspendsBloc() : super(BudgetspendsInitial()) {
    on<BudgetspendsEvent>((event, emit) {
      // TODO: implement event handler
    });

    on<BudgetspendsGettingEvent>((event, emit) async{
      await getBudgetspends(event, emit);
    });
  }
  
  getBudgetspends(BudgetspendsGettingEvent event, Emitter emit ) async {
    emit(BudgetspendsGettingState());
      AppLocalizations? lang = AppLocalizations();
      try {
        var token = await getString("tokens");
        final response = await http.post(
         Uri.parse(UrlAPI.budgettransacs),
        headers : <String, String> {
          'Content-Type': 'application/json',
          "Authorization": "Bearer $token"
        },
        body: jsonEncode({"budgetid" : event.budgetid}),
      );
      if (response.statusCode == 200) {
        
        print("response.body : ${response.body}");
        var data = json.decode(response.body);
        List<Transacs> dataList = [];
        for (var element in data["message"]) {
          dataList.add(Transacs.fromJson(element));
        }
        emit(BudgetspendsGottenState(dataList));
        print("dataList : $dataList");
      } else {
        print("response.body : ${response.body}");
        print("response.statusCode : ${response.statusCode}");
        emit(BudgetspendsGettingErrorState(lang.errorMessage));
      }
      } catch (e) {
        print("e : $e");
      }
      
    }
  


}
