import 'package:assignment/announcements/bloc/announcements_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AnnouncementsList extends StatelessWidget {
  const AnnouncementsList({super.key});

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<AnnouncementsBloc>(context).add(GetAnnouncmentsList());
    return BlocBuilder(
      bloc: BlocProvider.of<AnnouncementsBloc>(context),
      builder: (context, state) {
        if (state is AnnouncementsLoadingState) {
          return Center(child: CircularProgressIndicator());
        } else if (state is AnnouncementsLoadedState) {
          return ListView.separated(
            itemCount: state.announcements.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListTile(
                  
                  title: Text(
                    state.announcements[index].title,
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(state.announcements[index].description),
                ),
              );
            },
            separatorBuilder: (context, index) => Divider(height: 2),
          );
        } else if (state is AnnouncementsErrorState) {}
        return Container();
      },
    );
  }
}
