import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:http/http.dart'as http;

import '../../../app_engine/app_localizations.dart';
import '../../../app_engine/app_share_preference.dart';
import '../../url.dart';


part 'deletebudget_event.dart';
part 'deletebudget_state.dart';

class DeletebudgetBloc extends Bloc<DeletebudgetEvent, DeletebudgetState> {
  DeletebudgetBloc() : super(DeletebudgetInitial()) {
    on<DeletebudgetEvent>((event, emit) {
      // TODO: implement event handler
    });

    on<DeletingbudgetEvent>((event, emit) async{
      await deletebudget(event, emit);
    });
  }
  
  deletebudget(DeletingbudgetEvent event, Emitter emit) async {
    emit(DeletingbudgetState());
    AppLocalizations? lang = AppLocalizations();
    var datatopost = {
      "idsaving" : event.id,
    };
    var token = await getString("tokens");
    print(datatopost);
    print(token);
    try {
      final response = await http.post(
        Uri.parse(UrlAPI.deletebudget),
      headers : <String, String> {
        'Content-Type': 'application/json',
        "Author,i,zation": "Bearer $token"
      },
      body: jsonEncode(datatopost),
    );
    if (response.statusCode == 200) {
      print("response.body : ${response.body}");
      
      emit(DeletedbudgetState());

    } else {
      print("response.body : ${json.decode(response.body)}");
      print("response.statusCode : ${response.statusCode}");
      emit(DeletingErrorbudgetState(lang.errorMessage));
    }
    } catch (e) {
      print("e : $e");
    }
  }
}
