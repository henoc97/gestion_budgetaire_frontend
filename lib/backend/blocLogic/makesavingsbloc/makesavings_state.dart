part of 'makesavings_bloc.dart';

sealed class MakesavingsState extends Equatable {
  const MakesavingsState();
  
  @override
  List<Object> get props => [];
}

final class MakesavingsInitial extends MakesavingsState {}

final class MakeingsavingState extends MakesavingsState {}

final class MakedsavingState extends MakesavingsState {}

final class MakingsavingErrorState extends MakesavingsState {}
