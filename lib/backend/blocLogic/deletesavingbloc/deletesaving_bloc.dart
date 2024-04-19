import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:http/http.dart'as http;

import '../../../app_engine/app_localizations.dart';
import '../../../app_engine/app_share_preference.dart';
import '../../url.dart';

part 'deletesaving_event.dart';
part 'deletesaving_state.dart';

class DeletesavingBloc extends Bloc<DeletesavingEvent, DeletesavingState> {
  DeletesavingBloc() : super(DeletesavingInitial()) {
    on<DeletesavingEvent>((event, emit) {
      // TODO: implement event handler
    });

    on<DeletingsavingEvent>((event, emit) async{
      await deleteSaving(event, emit);
    });
  }
  
  deleteSaving(DeletingsavingEvent event, Emitter emit) async{
    emit(DeletingsavingState());
    AppLocalizations? lang = AppLocalizations();
    var datatopost = {
      "idsaving" : event.id,
    };
    var token = await getString("tokens");
    print(datatopost);
    print(token);
    try {
      final response = await http.post(
        Uri.parse(UrlAPI.deletesaving),
      headers : <String, String> {
        'Content-Type': 'application/json',
        "Authori,za,tion": "Bearer $token"
      },
      body: jsonEncode(datatopost),
    );
    if (response.statusCode == 200) {
      print("response.body : ${response.body}");
      
      emit(DeletedsavingState());

    } else {
      print("response.body : ${json.decode(response.body)}");
      print("response.statusCode : ${response.statusCode}");
      emit(DeletingErrorsavingState(lang.errorMessage));
    }
    } catch (e) {
      print("e : $e");
    }
  }

}
