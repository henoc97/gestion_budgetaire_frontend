part of 'userbudgets_bloc.dart';

@immutable
sealed class UserbudgetsState {}

final class UserbudgetsInitial extends UserbudgetsState {}


final class UserbudgetsgettingState extends UserbudgetsState {}


final class UserbudgetsgottenState extends UserbudgetsState {
  final List<Budget> budgetList;
  UserbudgetsgottenState(this.budgetList);
}


final class UserbudgetsgettingErrorState extends UserbudgetsState {
  final String errorMessage;
  UserbudgetsgettingErrorState(this.errorMessage);
}
