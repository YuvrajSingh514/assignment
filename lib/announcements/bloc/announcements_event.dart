part of 'announcements_bloc.dart';

@immutable
sealed class AnnouncementsEvent {}

class GetAnnouncmentsList extends AnnouncementsEvent{}