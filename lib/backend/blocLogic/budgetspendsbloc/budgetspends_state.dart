part of 'budgetspends_bloc.dart';

@immutable
sealed class BudgetspendsState {}

final class BudgetspendsInitial extends BudgetspendsState {}

final class BudgetspendsGettingState extends BudgetspendsState {}

final class BudgetspendsGottenState extends BudgetspendsState {
  final List<Transacs> spendsList;
  BudgetspendsGottenState(this.spendsList);
}

final class BudgetspendsGettingErrorState extends BudgetspendsState {}
