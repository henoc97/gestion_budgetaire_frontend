part of 'transfertosold_bloc.dart';

sealed class TransfertosoldEvent extends Equatable {
  const TransfertosoldEvent();

  @override
  List<Object> get props => [];
}

class TransfertosoldDoingEvent extends TransfertosoldEvent{
  const TransfertosoldDoingEvent(this.transfer);
  final Transfer transfer;
}