import 'package:assignment/network/user_model.dart';
import 'package:assignment/network/user_service.dart';
import 'package:bloc/bloc.dart';

part 'dashboard_event.dart';
part 'dashboard_state.dart';

class DashboardBloc extends Bloc<DashboardEvent, DashboardState> {
  final UserService userService;
  DashboardBloc(this.userService) : super(DashboardInitial()) {
    on<GetDashboardUserModel>(onGetDashboardUserModel);
  }
  onGetDashboardUserModel(
    GetDashboardUserModel event,
    Emitter<DashboardState> state,
  ) async {
    emit(DashboardLoadingState());
    try {
      final users = await userService.fetchUsers();
      emit(DashboardLoadedState(users: users));
    } catch (e) {
      emit(DashboardErrorState(error: 'Failed to load users'));
    }
  }
}
