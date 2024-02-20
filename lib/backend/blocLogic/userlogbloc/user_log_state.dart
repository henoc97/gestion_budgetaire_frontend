part of 'user_log_bloc.dart';

sealed class UserLogState extends Equatable{
  const UserLogState();

  @override
  List<Object> get props => [];
}

final class UserLogInitial extends UserLogState {}

final class UserLoggingState extends UserLogState {}

final class UserLoggedState extends UserLogState {
  final Users user;
  const UserLoggedState({required this.user});
  @override
  List<Object> get props => [user];
}

final class UserLogError extends UserLogState {
  final String message;
  const UserLogError(this.message);
}
