import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'new_home_event.dart';

part 'new_home_state.dart';

class NewHomeBloc extends Bloc<NewHomeEvent, NewHomeState> {
  NewHomeBloc() : super(NewHomeInitial(initialFilter: 'All')) {
    on<NewHomeEvent>((event, emit) {});
    on<ChangeFilterEvent>(_onChangeFilterEvent);
  }

  Future<void> _onChangeFilterEvent(
      ChangeFilterEvent event, Emitter<NewHomeState> emit) async {
    emit(
      NewFilterNameState(
        updatedName: event.filterName,
      ),
    );
  }
}
