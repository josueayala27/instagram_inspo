part of 'new_home_bloc.dart';

abstract class NewHomeState extends Equatable {
  const NewHomeState();
}

class NewHomeInitial extends NewHomeState {
  const NewHomeInitial({required this.initialFilter});

  final String initialFilter;

  @override
  List<Object> get props => [];
}

class NewFilterNameState extends NewHomeState {
  const NewFilterNameState({required this.updatedName});

  final String updatedName;

  @override
  List<Object> get props => [updatedName];
}
