import 'package:assignment/announcements/network/announcements_model.dart';
import 'package:assignment/announcements/network/announcements_service.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'announcements_event.dart';
part 'announcements_state.dart';

class AnnouncementsBloc extends Bloc<AnnouncementsEvent, AnnouncementsState> {
  final AnnouncementsService announcementsService;
  AnnouncementsBloc(this.announcementsService) : super(AnnouncementsInitial()) {
    on<GetAnnouncmentsList>(onGetAnnouncmentsList);
  }
  onGetAnnouncmentsList(
    GetAnnouncmentsList event,
    Emitter<AnnouncementsState> state,
  ) async {
    emit(AnnouncementsLoadingState());
    try {
      final announcements = await announcementsService.fetchAnnouncements();
      emit(AnnouncementsLoadedState(announcements: announcements));
    } catch (e) {
      emit(AnnouncementsErrorState(error: 'Failed to load users'));
    }
  }
}
