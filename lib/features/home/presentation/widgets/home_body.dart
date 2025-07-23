import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_it/features/task/domain/entities/task_entity.dart';

import '../../../../data/model/project/project.model.dart';
import '../../../profile/domain/entities/user_entity.dart';
import '../providers/home_bloc.dart';
import 'my_projects_section.dart';
import 'my_tasks_section.dart';
import 'my_team_section.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
      bloc: context.read<HomeBloc>(),
      builder: (context, state) {
        if (state is HomeLoaded) {
          final List<Project> projects = state.myProjects;
          // final List<Task> tasks = state.projectTasks;
          final List<UserEntity> teamMembers = state.teamMembers;
          final List<TaskEntity> myTasks = state.myTasks;

          return Padding(
            padding: const EdgeInsets.all(24.0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  MyProjectsSection(projects: projects),
                  const SizedBox(height: 40),
                  MyTasksSection(myTasks: myTasks),
                  const SizedBox(height: 40),
                  MyTeamSection(teamMembers: teamMembers),
                ],
              ),
            ),
          );
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
