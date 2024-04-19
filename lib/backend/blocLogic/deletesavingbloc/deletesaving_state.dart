part of 'deletesaving_bloc.dart';

sealed class DeletesavingState extends Equatable {
  const DeletesavingState();
  
  @override
  List<Object> get props => [];
}

final class DeletesavingInitial extends DeletesavingState {}

final class DeletingsavingState extends DeletesavingState {}

final class DeletedsavingState extends DeletesavingState {}

final class DeletingErrorsavingState extends DeletesavingState {
  final String message;

  const DeletingErrorsavingState(this.message);

  @override
  List<Object> get props => [message];
}

