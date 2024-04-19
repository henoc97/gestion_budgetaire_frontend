part of 'deletebudget_bloc.dart';

sealed class DeletebudgetState extends Equatable {
  const DeletebudgetState();
  
  @override
  List<Object> get props => [];
}

final class DeletebudgetInitial extends DeletebudgetState {}

final class DeletingbudgetState extends DeletebudgetState {}

final class DeletedbudgetState extends DeletebudgetState {}

final class DeletingErrorbudgetState extends DeletebudgetState {
  final String message;

  const DeletingErrorbudgetState(this.message);

  @override
  List<Object> get props => [message];
}
