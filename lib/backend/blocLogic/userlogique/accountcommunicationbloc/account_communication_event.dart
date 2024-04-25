part of 'account_communication_bloc.dart';

sealed class AccountCommunicationEvent extends Equatable {
  const AccountCommunicationEvent();

  @override
  List<Object> get props => [];
}

class AccountCommunicatingEvent extends AccountCommunicationEvent {
  final double amount;

  const AccountCommunicatingEvent(this.amount);
}