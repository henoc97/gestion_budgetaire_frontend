part of 'usersavingsbank_bloc.dart';

sealed class UsersavingsbankState extends Equatable {
  const UsersavingsbankState();
  
  @override
  List<Object> get props => [];
}

final class UsersavingsbankInitial extends UsersavingsbankState {}

final class UsersavingsbankGettingState extends UsersavingsbankState {}

final class UsersavingsbankGottenState extends UsersavingsbankState {
  const UsersavingsbankGottenState(this.usersavingbank);
  final SavingsBank usersavingbank;
}

final class UsersavingsbankGettingErrorState extends UsersavingsbankState {
  final String message;
  const UsersavingsbankGettingErrorState(this.message);
}
