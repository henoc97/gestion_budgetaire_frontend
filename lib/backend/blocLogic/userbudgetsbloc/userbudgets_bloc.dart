import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:gestion_budgetaire_app/backend/model/budget.dart';
import 'package:meta/meta.dart';
import 'package:http/http.dart'as http;

import '../../../app_engine/app_share_preference.dart';
import '../../url.dart';



part 'userbudgets_event.dart';
part 'userbudgets_state.dart';

class UserbudegetsBloc extends Bloc<UserbudgetsEvent, UserbudgetsState> {
  UserbudegetsBloc() : super(UserbudgetsInitial()) {
    on<UserbudgetsEvent>((event, emit) {
      // TODO: implement event handler
    });
    on<UserbudgetsgettingEvent>((event, emit) async {
      await getuserbudgets(event, emit);
    });
  }
  
  getuserbudgets(UserbudgetsgettingEvent event, Emitter emit ) async {
    emit(UserbudgetsgettingState());
      
      try {
        var token = await getString("tokens");
        final response = await http.get(
         Uri.parse(UrlAPI.userBudgets),
        headers : <String, String> {
          'Content-Type': 'application/json',
          "Authorization": "Bearer $token"
        },
      );
      if (response.statusCode == 200) {
        
        print("response.body : ${response.body}");
        var data = json.decode(response.body);
        List<Budget> dataList = [];
        for (var element in data["message"]) {
          dataList.add(Budget.fromJson(element));
        }
        emit(UserbudgetsgottenState(dataList));
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
