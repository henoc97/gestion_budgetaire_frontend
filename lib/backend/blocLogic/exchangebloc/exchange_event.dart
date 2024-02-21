part of 'exchange_bloc.dart';

sealed class ExchangeEvent extends Equatable {
  const ExchangeEvent();

  @override
  List<Object> get props => [];
}

class ExchangingEvent extends ExchangeEvent{
  const ExchangingEvent(this.amountToExchange, this.currencies);
  final double amountToExchange;
  final List<String> currencies;
}