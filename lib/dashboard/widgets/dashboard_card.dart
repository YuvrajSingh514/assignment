// ignore_for_file: non_constant_identifier_names

import 'package:assignment/dashboard/bloc/dashboard_bloc.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DashboardCard extends StatelessWidget {
  const DashboardCard({super.key});

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<DashboardBloc>(context).add(GetDashboardUserModel());
    return BlocBuilder(
      bloc: BlocProvider.of<DashboardBloc>(context),
      builder: (context, state) {
        if (state is DashboardLoadingState) {
          return Center(child: CircularProgressIndicator());
        } else if (state is DashboardLoadedState) {
          final UserModel = state.users.first;
          return Center(
            child: Container(
              height: 300,
              width: 300,
              child: Column(
                children: [
                  Text(
                    UserModel.name,
                    style: TextStyle(fontSize: 40, fontWeight: FontWeight.w400),
                  ),
                  SizedBox(height: 20),
                  Text('Referal Code: 0077', style: TextStyle(fontSize: 16)),
                  SizedBox(height: 20),
                  Text(
                    "Donation: ₹${UserModel.donation}",
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              ),
            ),
          );
        } else if (state is DashboardErrorState) {}
        return Container();
      },
    );
  }
}
