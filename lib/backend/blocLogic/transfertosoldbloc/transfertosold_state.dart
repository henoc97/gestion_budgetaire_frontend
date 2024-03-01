part of 'transfertosold_bloc.dart';

sealed class TransfertosoldState extends Equatable {
  const TransfertosoldState();
  
  @override
  List<Object> get props => [];
}

final class TransfertosoldInitial extends TransfertosoldState {}

final class TransfertosoldDoingState extends TransfertosoldState {}

final class TransfertosoldDoneState extends TransfertosoldState {}

final class TransfertosoldDoingErrorState extends TransfertosoldState {}
