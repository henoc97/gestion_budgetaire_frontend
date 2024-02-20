part of 'usersavings_bloc.dart';

sealed class UsersavingsState extends Equatable {
  const UsersavingsState();
  
  @override
  List<Object> get props => [];
}

final class UsersavingsInitial extends UsersavingsState {}

final class UsersavingsgettingState extends UsersavingsState {}

final class UsersavingsGottenState extends UsersavingsState {
  final List<Savings> savingsList;
  const UsersavingsGottenState(this.savingsList);
}

final class UsersavingsgettingErrorState extends UsersavingsState {}
