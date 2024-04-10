import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:http/http.dart'as http;


import '../../../app_engine/app_localizations.dart';
import '../../../app_engine/app_share_preference.dart';
import '../../model/transacs.dart';
import '../../url.dart';

part 'transfertosold_event.dart';
part 'transfertosold_state.dart';

class TransfertosoldBloc extends Bloc<TransfertosoldEvent, TransfertosoldState> {
  TransfertosoldBloc() : super(TransfertosoldInitial()) {
    on<TransfertosoldEvent>((event, emit) {
      // TODO: implement event handler
    });
    on<TransfertosoldDoingEvent>((event, emit) async{
      await doingtransfer(event, emit);
    });

  }
  
  doingtransfer(TransfertosoldDoingEvent event, Emitter emit)async {
    emit(TransfertosoldDoingState());
    AppLocalizations? lang = AppLocalizations();
    var datatopost = event.transfer.toJson();
    var token = await getString("tokens");
    print(datatopost);
    print(token);
      try {
        final response = await http.post(
         Uri.parse(UrlAPI.transfertosold),
        headers : <String, String> {
          'Content-Type': 'application/json',
          "Authorization": "Bearer $token"
        },
        body: jsonEncode(datatopost),
      );
      if (response.statusCode == 200) {
        print("response.body : ${response.body}");
        
        emit(TransfertosoldDoneState());

      } else {
        print("response.body : ${json.decode(response.body)}");
        print("response.statusCode : ${response.statusCode}");
        emit(TransfertosoldDoingErrorState(lang.errorMessage));
      }
      } catch (e) {
        print("e : $e");
      }
  
  }
}
