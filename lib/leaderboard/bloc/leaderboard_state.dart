part of 'leaderboard_bloc.dart';

sealed class LeaderboardState {}

final class LeaderboardInitial extends LeaderboardState {}

final class LeaderboardLoadingState extends LeaderboardState {}

final class LeaderboardLoadedState extends LeaderboardState {
  final List<UserModel> users;

  LeaderboardLoadedState({required this.users});

}

final class LeaderBoardErrorState extends LeaderboardState {
  final String error;

  LeaderBoardErrorState({required this.error});
}
