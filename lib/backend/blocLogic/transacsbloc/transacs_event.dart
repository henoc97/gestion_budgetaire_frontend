part of 'transacs_bloc.dart';

@immutable
sealed class TransacsEvent {}

class TransacsdoingEvent extends TransacsEvent{
  final Transacs transacs;

  TransacsdoingEvent(this.transacs);
}