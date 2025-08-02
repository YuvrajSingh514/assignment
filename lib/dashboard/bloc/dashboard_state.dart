part of 'dashboard_bloc.dart';

sealed class DashboardState {}

final class DashboardInitial extends DashboardState {}

final class DashboardLoadingState extends DashboardState {}

final class DashboardLoadedState extends DashboardState {
  final List<UserModel> users;

  DashboardLoadedState({required this.users});

}

final class DashboardErrorState extends DashboardState {
  final String error;

  DashboardErrorState({required this.error});
}
