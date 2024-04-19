import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:http/http.dart'as http;


import '../../../../app_engine/app_localizations.dart';
import '../../../../app_engine/app_share_preference.dart';
import '../../../model/transacs.dart';
import '../../../url.dart';

part 'transacs_event.dart';
part 'transacs_state.dart';

class TransacsBloc extends Bloc<TransacsEvent, TransacsState> {
  TransacsBloc() : super(TransacsInitial()) {
    on<TransacsEvent>((event, emit) {
      // TODO: implement event handler
    });

    on<TransacsdoingEvent>((event, emit) async {
      await doingtransacs(event, emit);
    });
  }
  
  doingtransacs(TransacsdoingEvent event, Emitter emit) async{
    emit(TransacsdoingState());
    AppLocalizations? lang = AppLocalizations();
    var datatopost = event.transacs.toJson();
    var token = await getString("tokens");
    print(datatopost);
    print(token);
      try {
        final response = await http.post(
         Uri.parse(UrlAPI.createtransac),
        headers : <String, String> {
          'Content-Type': 'application/json',
          "Authorization": "Bearer $token"
        },
        body: jsonEncode(datatopost),
      );
      if (response.statusCode == 200) {
        print("response.body : ${response.body}");
        
        emit(TransacsdoneState());

      } else {
         print("response.body : ${json.decode(response.body)}");
        print("response.statusCode : ${response.statusCode}");
        emit(TransacsErrorState(lang.errorMessage));
      }
      } catch (e) {
        print("e : $e");
      }
  }
}
