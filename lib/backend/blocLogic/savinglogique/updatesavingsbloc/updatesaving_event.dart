part of 'updatesaving_bloc.dart';

sealed class UpdatesavingEvent extends Equatable {
  const UpdatesavingEvent();

  @override
  List<Object> get props => [];
}

class UpdatingsavingEvent extends UpdatesavingEvent{
  const UpdatingsavingEvent(this.idsaving, this.amount);
  final int idsaving;
  final num amount;
}