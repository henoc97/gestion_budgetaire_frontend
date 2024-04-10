import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:http/http.dart'as http;


import '../../../app_engine/app_localizations.dart';
import '../../../app_engine/app_share_preference.dart';
import '../../model/transacs.dart';
import '../../url.dart';

part 'usertransfers_event.dart';
part 'usertransfers_state.dart';

class UsertransfersBloc extends Bloc<UsertransfersEvent, UsertransfersState> {
  UsertransfersBloc() : super(UsertransfersInitial()) {
    on<UsertransfersEvent>((event, emit) {
      // TODO: implement event handler
    });

    on<UsertransfersDoingEvent>((event, emit) async {
        await getusertransfers(event, emit);
    });
  }
  
  getusertransfers(UsertransfersDoingEvent event, Emitter emit)async{
    emit(UsertransfersGettingState());
    AppLocalizations? lang = AppLocalizations();
    
      try {
        var token = await getString("tokens");
        final response = await http.get(
         Uri.parse(UrlAPI.usertransfers),
        headers : <String, String> {
          'Content-Type': 'application/json',
          "Authorization": "Bearer $token"
        },
      );
      if (response.statusCode == 200) {
        
        print("response.body : ${response.body}");
        var data = json.decode(response.body);
        List<Transfer> dataList = [];
        for (var element in data) {
          dataList.add(Transfer.fromJson(element));
        }
        emit(UsertransfersGottenState(dataList));
        print("dataList : $dataList");
      } else {
        print("response.body : ${response.body}");
        print("response.statusCode : ${response.statusCode}");
        emit(UsertransfersGettingErrorState(lang.errorMessage));              
      }
      } catch (e) {
        print("e : $e");
      }
      
    }
  
}
