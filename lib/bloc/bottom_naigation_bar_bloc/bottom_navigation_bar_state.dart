part of 'bottom_navigation_bar_bloc.dart';

@immutable
abstract class BottomNavigationState {
  final int tabIndex;
  const BottomNavigationState({
    required this.tabIndex,
  });
}

class BottomNavigationInitial extends BottomNavigationState {
  const BottomNavigationInitial({required super.tabIndex});
}
