import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:http/http.dart'as http;


import '../../../../app_engine/app_localizations.dart';
import '../../../../app_engine/app_share_preference.dart';
import '../../../url.dart';

part 'deletetransfer_event.dart';
part 'deletetransfer_state.dart';

class DeletetransferBloc extends Bloc<DeletetransferEvent, DeletetransferState> {
  DeletetransferBloc() : super(DeletetransferInitial()) {
    on<DeletetransferEvent>((event, emit) {
      // TODO: implement event handler
    });

    on<DeletingtransferEvent>((event, emit) async {
      await deleteTranser(event, emit);
    });
  }
  
  deleteTranser(DeletingtransferEvent event, Emitter emit)async{

    emit(DeletingtransferState());
    AppLocalizations? lang = AppLocalizations();
    var datatopost = {
      "transferid" : event.id,
    };
    var token = await getString("tokens");
    print(datatopost);
    print(token);
    try {
      final response = await http.post(
        Uri.parse(UrlAPI.deletetransfer),
      headers : <String, String> {
        'Content-Type': 'application/json',
        "Authorization": "Bearer $token"
      },
      body: jsonEncode(datatopost),
    );
    if (response.statusCode == 200) {
      print("response.body : ${response.body}");
      
      emit(DeletedtransferState());

    } else {
      print("response.body : ${json.decode(response.body)}");
      print("response.statusCode : ${response.statusCode}");
      emit(DeletingErrortransferState(lang.errorMessage));
    }
    } catch (e) {
      print("e : $e");
    }
  }
}
