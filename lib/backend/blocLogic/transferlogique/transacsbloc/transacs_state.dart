part of 'transacs_bloc.dart';

@immutable
sealed class TransacsState {}

final class TransacsInitial extends TransacsState {}

final class TransacsdoingState extends TransacsState {}

final class TransacsdoneState extends TransacsState {}

final class TransacsErrorState extends TransacsState {
  final String message;
  TransacsErrorState(this.message);
}
