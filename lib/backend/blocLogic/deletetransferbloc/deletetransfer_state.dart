part of 'deletetransfer_bloc.dart';

sealed class DeletetransferState extends Equatable {
  const DeletetransferState();
  
  @override
  List<Object> get props => [];
}

final class DeletetransferInitial extends DeletetransferState {}

final class DeletingtransferState extends DeletetransferState {}

final class DeletedtransferState extends DeletetransferState {}

final class DeletingErrortransferState extends DeletetransferState {
  final String message;

  const DeletingErrortransferState(this.message);

  @override
  List<Object> get props => [message];
}
