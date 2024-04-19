part of 'user_log_bloc.dart';

@immutable
sealed class UserLogEvent {}

class UserLoggingEvent extends UserLogEvent{
  final String email;
  final String password;
  
  UserLoggingEvent(this.email, this.password);
}