part of 'usersavings_bloc.dart';

sealed class UsersavingsEvent extends Equatable {
  const UsersavingsEvent();

  @override
  List<Object> get props => [];
}

class UsersavingsgettingEvent extends UsersavingsEvent{}