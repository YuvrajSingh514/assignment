part of 'announcements_bloc.dart';

@immutable
sealed class AnnouncementsState {}

final class AnnouncementsInitial extends AnnouncementsState {}

final class AnnouncementsLoadingState extends AnnouncementsState {}

final class AnnouncementsLoadedState extends AnnouncementsState {
  final List<AnnouncementsModel> announcements;

  AnnouncementsLoadedState({required this.announcements});

}

final class AnnouncementsErrorState extends AnnouncementsState {
  final String error;

  AnnouncementsErrorState({required this.error});
}
