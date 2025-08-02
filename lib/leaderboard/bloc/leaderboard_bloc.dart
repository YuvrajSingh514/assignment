import 'package:assignment/network/user_model.dart';
import 'package:assignment/network/user_service.dart';
import 'package:bloc/bloc.dart';

part 'leaderboard_event.dart';
part 'leaderboard_state.dart';

class LeaderboardBloc extends Bloc<LeaderboardEvent, LeaderboardState> {
   final UserService userService;
  LeaderboardBloc(this.userService) : super(LeaderboardInitial()) {
     on<GetLeaderboardUsers>(onGetLeaderboardUsers);
  }
  onGetLeaderboardUsers(
    GetLeaderboardUsers event,
    Emitter<LeaderboardState> state,
  ) async {
    emit(LeaderboardLoadingState());
    try {
      final users = await userService.fetchUsers();
      emit(LeaderboardLoadedState(users: users));
    } catch (e) {
      emit(LeaderBoardErrorState(error: 'Failed to load users'));
    }
  }
}
