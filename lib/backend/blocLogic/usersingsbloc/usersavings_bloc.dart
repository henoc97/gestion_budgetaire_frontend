import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:gestion_budgetaire_app/backend/model/savings.dart';
import 'package:http/http.dart'as http;



import '../../../app_engine/app_share_preference.dart';
import '../../url.dart';

part 'usersavings_event.dart';
part 'usersavings_state.dart';

class UsersavingsBloc extends Bloc<UsersavingsEvent, UsersavingsState> {
  UsersavingsBloc() : super(UsersavingsInitial()) {
    on<UsersavingsEvent>((event, emit) {
      // TODO: implement event handler
    });
    on<UsersavingsgettingEvent>((event, emit) async{
      await getusersavings(event, emit);
    });
  }
  
  getusersavings(UsersavingsgettingEvent event , Emitter emit) async{
    emit(UsersavingsgettingState());
      
      try {
        var token = await getString("tokens");
        final response = await http.get(
         Uri.parse(UrlAPI.userGoals),
        headers : <String, String> {
          'Content-Type': 'application/json',
          "Authorization": "Bearer $token"
        },
      );
      if (response.statusCode == 200) {
        
        print("response.body : ${response.body}");
        var data = json.decode(response.body);
        List<Savings> dataList = [];
        for (var element in data["message"]) {
          dataList.add(Savings.fromJson(element));
        }
        emit(UsersavingsGottenState(dataList));
        print("dataList : $dataList");
      } else {
        print("response.body : ${response.body}");
        print("response.statusCode : ${response.statusCode}");
      }
      } catch (e) {
        print("e : $e");
      }
      
    }
  
}
