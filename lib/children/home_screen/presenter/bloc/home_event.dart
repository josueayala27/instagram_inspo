part of 'home_bloc.dart';

@immutable
abstract class HomeEvent {}

class ChangeFilterEvent extends HomeEvent {
  final String filter;

  ChangeFilterEvent(this.filter);
}
