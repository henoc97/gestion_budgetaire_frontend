part of 'account_communication_bloc.dart';

sealed class AccountCommunicationState extends Equatable {
  const AccountCommunicationState();
  
  @override
  List<Object> get props => [];
}

final class AccountCommunicationInitial extends AccountCommunicationState {}

final class AccountCommunicatingState extends AccountCommunicationState {}

final class AccountCommunicatedState extends AccountCommunicationState {}

final class AccountCommunicatingErrorState extends AccountCommunicationState {
  final String message;

  const AccountCommunicatingErrorState(this.message);
}
