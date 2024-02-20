part of 'makebudget_bloc.dart';

@immutable
sealed class MakebudgetState {}

final class MakebudgetInitial extends MakebudgetState {}


final class MakingbudgetState extends MakebudgetState {}

final class MakedbudgetState extends MakebudgetState {}

final class MakingbudgetErrorState extends MakebudgetState {
  final String message;
  MakingbudgetErrorState(this.message);
}
