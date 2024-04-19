part of 'user_bloc.dart';

sealed class UserState extends Equatable{
  const UserState();

  @override
  List<Object> get props => [];
}

final class UserInitial extends UserState {}

final class UserCreatingState extends UserState {

}

final class UserCreatedState extends UserState {}

final class UserCreatingErrorState extends UserState {
 final String message;
 const UserCreatingErrorState(this.message);
 @override
  List<Object> get props => [message];
}