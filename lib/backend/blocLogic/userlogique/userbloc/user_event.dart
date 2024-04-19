part of 'user_bloc.dart';

@immutable
sealed class UserEvent {}

class UserEventCreating extends UserEvent{
  final Users users;
  final double sold;
  UserEventCreating(this.users, this.sold);
}

class UserEventCreated extends UserEvent{}

