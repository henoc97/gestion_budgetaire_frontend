part of 'makesavings_bloc.dart';

sealed class MakesavingsEvent extends Equatable {
  const MakesavingsEvent();

  @override
  List<Object> get props => [];
}


class MakingsavingsEvent extends MakesavingsEvent{
  final Savings savings;
  const MakingsavingsEvent(this.savings);
}