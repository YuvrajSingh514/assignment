import 'package:assignment/dashboard/widgets/dashboard_card.dart';
import 'package:assignment/shared/main_app_bar.dart';
import 'package:flutter/material.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: MainAppBar(title: "DashBoard"),
      body: DashboardCard(),
      
    );
  }
}