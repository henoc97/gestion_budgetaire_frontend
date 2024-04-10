import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:http/http.dart'as http;

import '../../../app_engine/app_localizations.dart';
import '../../../app_engine/app_share_preference.dart';
import '../../model/budget.dart';
import '../../url.dart';

part 'makebudget_event.dart';
part 'makebudget_state.dart';

class MakebudgetBloc extends Bloc<MakebudgetEvent, MakebudgetState> {
  MakebudgetBloc() : super(MakebudgetInitial()) {
    on<MakebudgetEvent>((event, emit) {
      // TODO: implement event handler
    });

     on<MakingbudgetEvent>((event, emit) async {
      await createbudget(event, emit);
    });
  }
  
  createbudget(MakingbudgetEvent event, Emitter emit) async {
    emit(MakingbudgetState());
    AppLocalizations? lang = AppLocalizations();
    var datatopost = event.budget.toJson();
    var token = await getString("tokens");
    print(datatopost);
    print(token);
      try {
        final response = await http.post(
         Uri.parse(UrlAPI.createBudgets),
        headers : <String, String> {
          'Content-Type': 'application/json',
          "Authorization": "Bearer $token"
        },
        body: jsonEncode(datatopost),
      );
      if (response.statusCode == 200) {
        print("response.body : ${response.body}");
        
        emit(MakedbudgetState());

      } else {
         print("response.body : ${json.decode(response.body)}");
        print("response.statusCode : ${response.statusCode}");
        emit(MakingbudgetErrorState(lang.errorMessage));
      }
      } catch (e) {
        print("e : $e");
      }
  }
}
