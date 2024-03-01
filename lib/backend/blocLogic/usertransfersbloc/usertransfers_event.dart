part of 'usertransfers_bloc.dart';

sealed class UsertransfersEvent extends Equatable {
  const UsertransfersEvent();

  @override
  List<Object> get props => [];
}


class UsertransfersDoingEvent extends UsertransfersEvent{
  
}