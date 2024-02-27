part of 'useraccount_bloc.dart';

sealed class UseraccountState extends Equatable {
  const UseraccountState();
  
  @override
  List<Object> get props => [];
}

final class UseraccountInitial extends UseraccountState {}

final class UseraccountGettingState extends UseraccountState {}

final class UseraccountGottenState extends UseraccountState {
  const UseraccountGottenState(this.account);
  final Account account;
}

final class UseraccountGettingErrorState extends UseraccountState {}
