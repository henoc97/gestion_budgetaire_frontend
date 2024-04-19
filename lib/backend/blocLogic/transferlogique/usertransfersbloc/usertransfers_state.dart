part of 'usertransfers_bloc.dart';

sealed class UsertransfersState extends Equatable {
  const UsertransfersState();
  
  @override
  List<Object> get props => [];
}

final class UsertransfersInitial extends UsertransfersState {}

final class UsertransfersGettingState extends UsertransfersState {}

final class UsertransfersGottenState extends UsertransfersState {
  const UsertransfersGottenState(this.transfers);
  final List<Transfer> transfers;
}

final class UsertransfersGettingErrorState extends UsertransfersState {
  final String message; 
  const UsertransfersGettingErrorState(this.message);
}

