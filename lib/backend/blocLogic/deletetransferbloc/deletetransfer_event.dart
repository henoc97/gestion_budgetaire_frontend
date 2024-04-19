part of 'deletetransfer_bloc.dart';

sealed class DeletetransferEvent extends Equatable {
  const DeletetransferEvent();

  @override
  List<Object> get props => [];
}

class DeletingtransferEvent extends DeletetransferEvent {
  final int id;

  const DeletingtransferEvent(this.id);

  @override
  List<Object> get props => [id];
}