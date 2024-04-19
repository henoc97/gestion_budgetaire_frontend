part of 'usersavingsbank_bloc.dart';

sealed class UsersavingsbankEvent extends Equatable {
  const UsersavingsbankEvent();

  @override
  List<Object> get props => [];
}

class UsersavingsbankGettingEvent extends UsersavingsbankEvent{
  
}