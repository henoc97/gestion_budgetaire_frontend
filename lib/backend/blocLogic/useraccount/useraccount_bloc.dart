import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:gestion_budgetaire_app/backend/model/account.dart';
import 'package:http/http.dart'as http;


import '../../../app_engine/app_share_preference.dart';
import '../../url.dart';

part 'useraccount_event.dart';
part 'useraccount_state.dart';

class UseraccountBloc extends Bloc<UseraccountEvent, UseraccountState> {
  UseraccountBloc() : super(UseraccountInitial()) {
    on<UseraccountEvent>((event, emit) {
      // TODO: implement event handler
    });

    on<UseraccountGettingEvent>((event, emit) async {
      await getuseraccount(event, emit);
    });


    }
      getuseraccount(UseraccountGettingEvent event, Emitter<UseraccountState> emit)async{
        emit(UseraccountGettingState());
      
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
        var useraccount = Account.fromJson(data[0]);
        
        emit(UseraccountGottenState(useraccount));
        print("useraccount : $useraccount");
      } else {
        print("response.body : ${response.body}");
        print("response.statusCode : ${response.statusCode}");
      }
      } catch (e) {
        print("e : $e");
      }
      }

}

