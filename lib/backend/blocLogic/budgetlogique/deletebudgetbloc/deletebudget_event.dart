part of 'deletebudget_bloc.dart';

sealed class DeletebudgetEvent extends Equatable {
  const DeletebudgetEvent();

  @override
  List<Object> get props => [];
}

class DeletingbudgetEvent extends DeletebudgetEvent{
  final int id;

  const DeletingbudgetEvent(this.id);

  @override
  List<Object> get props => [id];

}
