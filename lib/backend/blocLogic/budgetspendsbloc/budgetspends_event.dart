part of 'budgetspends_bloc.dart';

@immutable
sealed class BudgetspendsEvent {}


class BudgetspendsGettingEvent extends BudgetspendsEvent{
  final int budgetid;
  BudgetspendsGettingEvent(this.budgetid);
}