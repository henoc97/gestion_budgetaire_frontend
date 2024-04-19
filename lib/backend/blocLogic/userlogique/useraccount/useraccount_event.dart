part of 'useraccount_bloc.dart';

sealed class UseraccountEvent extends Equatable {
  const UseraccountEvent();

  @override
  List<Object> get props => [];
}

class UseraccountGettingEvent extends UseraccountEvent{
  
}
