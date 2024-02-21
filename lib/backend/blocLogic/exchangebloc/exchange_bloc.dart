import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:gestion_budgetaire_app/backend/model/exchange.dart';
import 'package:http/http.dart'as http;

import '../../../app_engine/app_share_preference.dart';
import '../../url.dart';

part 'exchange_event.dart';
part 'exchange_state.dart';

class ExchangeBloc extends Bloc<ExchangeEvent, ExchangeState> {
  ExchangeBloc() : super(ExchangeInitial()) {
    on<ExchangeEvent>((event, emit) {
      // TODO: implement event handler
    });
    on<ExchangingEvent>((event, emit) async {
      await performexchange(event, emit);
    });
  }
  
  performexchange(ExchangingEvent event, Emitter emit)async {
    emit(ExchangingState());

    Map <String, dynamic> datatopost =  {
      'amounttoconvert' : event.amountToExchange, 
      "currencytoconvert" : event.currencies[0], 
      "currencyconvert"  : event.currencies[1],
    };
    var token = await getString("tokens");
    print(datatopost);
    print(token);
      try {
        final response = await http.post(
         Uri.parse(UrlAPI.convertamount),
        headers : <String, String> {
          'Content-Type': 'application/json',
          "Authorization": "Bearer $token"
        },
        body: jsonEncode(datatopost),
      );
      if (response.statusCode == 200) {
        print("response.body : ${response.body}");
        var data = json.decode(response.body);
        emit(ExchangedState(Exchange.fromJson(data)));
      } else {
         print("response.body : ${json.decode(response.body)}");
        print("response.statusCode : ${response.statusCode}");
      }
      } catch (e) {
        print("e : $e");
      }
  }
}
