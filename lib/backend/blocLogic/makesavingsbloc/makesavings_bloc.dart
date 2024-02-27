import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:gestion_budgetaire_app/backend/model/savings.dart';
import 'package:http/http.dart'as http;

import '../../../app_engine/app_share_preference.dart';
import '../../url.dart';

part 'makesavings_event.dart';
part 'makesavings_state.dart';

class MakesavingsBloc extends Bloc<MakesavingsEvent, MakesavingsState> {
  MakesavingsBloc() : super(MakesavingsInitial()) {
    on<MakesavingsEvent>((event, emit) {
      // TODO: implement event handler
    });
    on<MakingsavingsEvent>((event, emit) async {
      await createSaving(event, emit);
    });
  }
  
  createSaving(MakingsavingsEvent event, Emitter emit) async {
    emit(MakingsavingState());

    var datatopost = event.savings.toJson();
    var token = await getString("tokens");
    print(datatopost);
    print(token);
      try {
        final response = await http.post(
         Uri.parse(UrlAPI.createsaving),
        headers : <String, String> {
          'Content-Type': 'application/json',
          "Authorization": "Bearer $token"
        },
        body: jsonEncode(datatopost),
      );
      if (response.statusCode == 200) {
        print("response.body : ${response.body}");
        
        emit(MakedsavingState());

      } else {
         print("response.body : ${json.decode(response.body)}");
        print("response.statusCode : ${response.statusCode}");
      }
      } catch (e) {
        print("e : $e");
      }
  
  }
}
