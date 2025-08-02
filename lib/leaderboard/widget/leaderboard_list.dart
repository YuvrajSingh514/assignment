// ignore_for_file: non_constant_identifier_names
import 'package:assignment/leaderboard/bloc/leaderboard_bloc.dart';
import 'package:assignment/network/user_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LeaderboardList extends StatelessWidget {
  const LeaderboardList({super.key});

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<LeaderboardBloc>(context).add(GetLeaderboardUsers());
    return BlocBuilder(
      bloc: BlocProvider.of<LeaderboardBloc>(context),
      builder: (context, state) {
        if (state is LeaderboardLoadingState) {
          return Center(child: CircularProgressIndicator());
        } else if (state is LeaderboardLoadedState) {
           final List<UserModel> sortedUsers = List.from(state.users);
           sortedUsers.sort((a, b) => b.donation.compareTo(a.donation)); 
          return Padding(
            padding: const EdgeInsets.only(top: 30),
            child: ListView.builder(
              itemCount: sortedUsers.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: CircleAvatar(child: Text('${index + 1}')),
                  title: Text(sortedUsers[index].name, style: TextStyle(fontSize: 18)),
                  trailing: Text(
                    "₹${sortedUsers[index].donation}",
                    style: TextStyle(fontSize: 16),
                  ),
                );
              },
            ),
          );
        } else if (state is LeaderBoardErrorState) {
          return Center(child: Text('data not found'));
        }
        return Container();
      },
    );
  }
}
