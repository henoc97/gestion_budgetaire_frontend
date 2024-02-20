part of 'makebudget_bloc.dart';

@immutable
sealed class MakebudgetEvent {}

class MakingbudgetEvent extends MakebudgetEvent {
  final Budget budget;
  MakingbudgetEvent(this.budget);
}