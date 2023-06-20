part of 'new_home_bloc.dart';

abstract class NewHomeEvent extends Equatable {
  const NewHomeEvent();
}

class InitEvent extends NewHomeEvent {
  const InitEvent();

  @override
  List<Object?> get props => [];
}

class ChangeFilterEvent extends NewHomeEvent {
  const ChangeFilterEvent({required this.filterName});

  final String filterName;

  @override
  List<Object?> get props => [];
}
