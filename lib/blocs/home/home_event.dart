part of 'home_bloc.dart';

@immutable
abstract class HomeEvent {}

class ChangeFilter extends HomeEvent {
  final String filter;

  ChangeFilter(this.filter);
}
