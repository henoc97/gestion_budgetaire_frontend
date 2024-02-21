part of 'exchange_bloc.dart';

sealed class ExchangeState extends Equatable {
  const ExchangeState();
  
  @override
  List<Object> get props => [];
}

final class ExchangeInitial extends ExchangeState {}

final class ExchangingState extends ExchangeState {}

final class ExchangedState extends ExchangeState {
  const ExchangedState(this.exchange);
  final Exchange exchange;
}

final class ExchangingErrorState extends ExchangeState {}

