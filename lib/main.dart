import 'package:assignment/announcements/bloc/announcements_bloc.dart';
import 'package:assignment/announcements/network/announcements_service.dart';
import 'package:assignment/dashboard/bloc/dashboard_bloc.dart';
import 'package:assignment/leaderboard/bloc/leaderboard_bloc.dart';
import 'package:assignment/network/user_service.dart';
import 'package:assignment/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<DashboardBloc>(create: (context)=> DashboardBloc(UserService())),
        BlocProvider<LeaderboardBloc>(create: (context)=> LeaderboardBloc(UserService())),
        BlocProvider<AnnouncementsBloc>(create: (context)=> AnnouncementsBloc(AnnouncementsService())),
        
        ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          useMaterial3: true,
          colorSchemeSeed: Colors.deepPurple,
        ),
        home: LoginScreen(),
      ),
    );
  }
}
