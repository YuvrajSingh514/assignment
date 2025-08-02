import 'package:assignment/announcements/widget/announcements_list.dart';
import 'package:assignment/shared/main_app_bar.dart';
import 'package:flutter/material.dart';

class AnnouncementsScreen extends StatelessWidget {
  const AnnouncementsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(title: "Announcements"),
      body: AnnouncementsList(),
    );
  }
}