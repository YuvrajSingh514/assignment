import 'package:assignment/leaderboard/widget/leaderboard_list.dart';
import 'package:assignment/shared/main_app_bar.dart';
import 'package:flutter/material.dart';

class LeaderboardScreen extends StatelessWidget {
  const LeaderboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(title: "Leader Board"),
      body: LeaderboardList(),
    );
  
  }
}