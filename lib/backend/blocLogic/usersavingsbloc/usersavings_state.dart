part of 'usersavings_bloc.dart';

sealed class UsersavingsState extends Equatable {
  const UsersavingsState();
  
  @override
  List<Object> get props => [];
}

final class UsersavingsInitial extends UsersavingsState {}

final class UsersavingsgettingState extends UsersavingsState {}

final class UsersavingsGottenState extends UsersavingsState {
  final List<Savings> notBeginSavingsList;
  final List<Savings> inprogressSavingsList;
  final List<Savings> terminedSavingsList;
  const UsersavingsGottenState(
    this.notBeginSavingsList, 
    this.inprogressSavingsList, 
    this.terminedSavingsList);
}

final class UsersavingsgettingErrorState extends UsersavingsState {}
