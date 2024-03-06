import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:http/http.dart'as http;

import '../../../app_engine/app_share_preference.dart';
import '../../url.dart';

part 'updatesaving_event.dart';
part 'updatesaving_state.dart';

class UpdatesavingBloc extends Bloc<UpdatesavingEvent, UpdatesavingState> {
  UpdatesavingBloc() : super(UpdatesavingInitial()) {
    on<UpdatesavingEvent>((event, emit) {
      // TODO: implement event handler
    });

    on<UpdatingsavingEvent>((event, emit) async {
      await updatesaving(event, emit);
    });

  }
  
  updatesaving(UpdatingsavingEvent event, Emitter emit) async {
    emit(UpdatingsavingState());

    var datatopost = {
      "idsaving" : event.idsaving,
      "amount" : event.amount
    };
    var token = await getString("tokens");
    print(datatopost);
    print(token);
      try {
        final response = await http.post(
         Uri.parse(UrlAPI.updateallsavings),
        headers : <String, String> {
          'Content-Type': 'application/json',
          "Authorization": "Bearer $token"
        },
        body: jsonEncode(datatopost),
      );
      if (response.statusCode == 200) {
        print("response.body : ${response.body}");
        
        emit(UpdatedsavingState());

      } else {
         print("response.body : ${json.decode(response.body)}");
        print("response.statusCode : ${response.statusCode}");
      }
      } catch (e) {
        print("e : $e");
      }
  
  }
  }

