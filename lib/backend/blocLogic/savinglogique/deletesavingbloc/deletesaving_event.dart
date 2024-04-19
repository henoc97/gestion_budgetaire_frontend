part of 'deletesaving_bloc.dart';

sealed class DeletesavingEvent extends Equatable {
  const DeletesavingEvent();

  @override
  List<Object> get props => [];
}


class DeletingsavingEvent extends DeletesavingEvent {
  final int id;

  const DeletingsavingEvent(this.id);

  @override
  List<Object> get props => [id];
}