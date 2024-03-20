part of 'bottom_navigation_bar_bloc.dart';

abstract class BottomNavigationEvent {}

class TabChanged extends BottomNavigationEvent {
  final int tabIndex;

  TabChanged({required this.tabIndex});
}
