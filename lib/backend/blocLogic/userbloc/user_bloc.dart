import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:gestion_budgetaire_app/backend/model/users.dart';
import 'package:gestion_budgetaire_app/backend/url.dart';
import 'package:http/http.dart'as http;
import 'package:equatable/equatable.dart';


part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc() : super(UserInitial()) {
    on<UserEvent>((event, emit) {
      // TODO: implement event handler
    });

    on<UserEventCreating>((event, emit) async{
      await createUser(event, emit);
    });
    

  }
  createUser(UserEventCreating event, Emitter<UserState> emit)async{
      emit(UserCreatingState());
      var datatopost = event.users.toJson();
      datatopost["sold"] = event.sold;
      try {
        final response = await http.post(
         Uri.parse(UrlAPI.createUser),
        headers : <String, String> {
          'Content-Type': 'application/json',
        },
        body: jsonEncode(datatopost),
      );//.timeout(const Duration(seconds: 3));
      if (response.statusCode == 200) {
        emit(UserCreatedState());
        print("response.body : ${response.body}");

      } else {
         print("response.body : ${response.body}");
        print("response.statusCode : ${response.statusCode}");
      }
      } catch (e) {
        print("e : $e");
      } finally {

      }
      
    }
  
}
