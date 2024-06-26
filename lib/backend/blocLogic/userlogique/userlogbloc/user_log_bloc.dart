import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:gestion_budgetaire_app/app_engine/vargloabal.dart';
import 'package:meta/meta.dart';
import 'package:http/http.dart'as http;
import 'package:equatable/equatable.dart';


import '../../../../app_engine/app_localizations.dart';
import '../../../../app_engine/app_share_preference.dart';
import '../../../model/users.dart';
import '../../../url.dart';

part 'user_log_event.dart';
part 'user_log_state.dart';

class UserLogBloc extends Bloc<UserLogEvent, UserLogState> {
  UserLogBloc() : super(UserLogInitial()) {
    on<UserLogEvent>((event, emit) {
      // TODO: implement event handler
    });

    on<UserLoggingEvent>((event, emit) async{
      await authUserLogging(event, emit);
    });
  }
  
  authUserLogging(UserLoggingEvent event, Emitter<UserLogState> emit) async{
      emit(UserLoggingState());
      AppLocalizations? lang = AppLocalizations();
      //await Future.delayed(Duration.zero);
      var datatopost = {
        "mailAddress" : event.email,
        "pwd" : event.password
      };
      try {
        final response = await http.post(
         Uri.parse(UrlAPI.userauth),
        headers : <String, String> {
          'Content-Type': 'application/json',
        },
        body: jsonEncode(datatopost),
      );
      if (response.statusCode == 200) {
        print("response.body : ${response.body}");
        
        var data = json.decode(response.body);
        await saveString("tokens", data['token']);
        // print(" token___ : ${await getString('tokens')}");
        var user = Users.fromJson(data['user']);
        VarGloabal.currency = user.favoriteCurrency;
        print("VarGloabal.currency : ${VarGloabal.currency}");

        emit(UserLoggedState(
          user: user
        ));
        //await Future.delayed(Duration.zero);

      } else {
         print("response.body : ${json.decode(response.body)}");
        print("response.statusCode : ${response.statusCode}");
        emit(UserLogError(lang.errorMessage));
      }
      } catch (e) {
        print("e : $e");
      }
  }   

}
