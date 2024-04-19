import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:http/http.dart'as http;

import '../../../../app_engine/app_localizations.dart';
import '../../../../app_engine/app_share_preference.dart';
import '../../../model/account.dart';
import '../../../url.dart';

part 'usersavingsbank_event.dart';
part 'usersavingsbank_state.dart';

class UsersavingsbankBloc extends Bloc<UsersavingsbankEvent, UsersavingsbankState> {
  UsersavingsbankBloc() : super(UsersavingsbankInitial()) {
    on<UsersavingsbankEvent>((event, emit) {
      // TODO: implement event handler
    });

    on<UsersavingsbankGettingEvent>((event, emit) async {
      await getUserSavingBank(event, emit);
    });
  }
  
  getUserSavingBank(UsersavingsbankGettingEvent event, Emitter emit) async{
      emit(UsersavingsbankGettingState());
      AppLocalizations? lang = AppLocalizations();
        try {
          var token = await getString("tokens");
          final response = await http.get(
          Uri.parse(UrlAPI.usersavingbank),
          headers : <String, String> {
            'Content-Type': 'application/json',
            "Authorization": "Bearer $token"
          },
        );
        if (response.statusCode == 200) {
          
          print("response.body : ${response.body}");
          var data = json.decode(response.body);
          var usersavingbank = SavingsBank.fromJson(data);
          
          emit(UsersavingsbankGottenState(usersavingbank));
          print("useraccount : $usersavingbank");
        } else {
          print("response.body : ${response.body}");
          print("response.statusCode : ${response.statusCode}");
          emit(UsersavingsbankGettingErrorState(lang.errorMessage));
        }
        } catch (e) {
          print("e : $e");
        }
      }
}
