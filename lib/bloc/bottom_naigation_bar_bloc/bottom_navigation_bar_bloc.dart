import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'bottom_navigation_bar_event.dart';
part 'bottom_navigation_bar_state.dart';

class BottomNavigationBloc
    extends Bloc<BottomNavigationEvent, BottomNavigationState> {
  BottomNavigationBloc() : super(const BottomNavigationInitial(tabIndex: 0)) {
    on<BottomNavigationEvent>(
      (event, emit) {
        if (event is TabChanged) {
          emit(BottomNavigationInitial(tabIndex: event.tabIndex));
        }
      },
    );
  }
}
