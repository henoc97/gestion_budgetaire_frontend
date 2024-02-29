part of 'updatesaving_bloc.dart';

sealed class UpdatesavingState extends Equatable {
  const UpdatesavingState();
  
  @override
  List<Object> get props => [];
}

final class UpdatesavingInitial extends UpdatesavingState {}

final class UpdatingsavingState extends UpdatesavingState {}

final class UpdatedsavingState extends UpdatesavingState {}

final class UpdatingsavingErrorState extends UpdatesavingState {}