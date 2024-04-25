import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:http/http.dart'as http;

import '../../../../app_engine/app_localizations.dart';
import '../../../../app_engine/app_share_preference.dart';
import '../../../url.dart';

part 'account_communication_event.dart';
part 'account_communication_state.dart';

class AccountCommunicationBloc extends Bloc<AccountCommunicationEvent, AccountCommunicationState> {
  AccountCommunicationBloc() : super(AccountCommunicationInitial()) {
    on<AccountCommunicationEvent>((event, emit) {
      // TODO: implement event handler
    });

    on<AccountCommunicatingEvent>((event, emit) async {
      await communicate(event, emit);
    });
  }  

  communicate(AccountCommunicatingEvent event, Emitter emit)async {
    emit(AccountCommunicatingState());
    AppLocalizations? lang = AppLocalizations();
    Map <String, dynamic> datatopost =  {
      'amount' : event.amount, 
      
    };
    var token = await getString("tokens");
    print(datatopost);
    print(token);
      try {
        final response = await http.post(
         Uri.parse(UrlAPI.accountsavingsbank),
        headers : <String, String> {
          'Content-Type': 'application/json',
          "Authorization": "Bearer $token"
        },
        body: jsonEncode(datatopost),
      );
      if (response.statusCode == 200) {
        print("response.body : ${response.body}");
        var data = json.decode(response.body);
        emit(AccountCommunicatedState());
      } else {
         print("response.body : ${json.decode(response.body)}");
        print("response.statusCode : ${response.statusCode}");
        emit(AccountCommunicatingErrorState(lang.errorMessage));
      }
      } catch (e) {
        print("e : $e");
      }
  }
}
