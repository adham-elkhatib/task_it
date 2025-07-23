part of 'home_bloc.dart';

sealed class HomeState extends Equatable {
  const HomeState();
}

final class HomeInitial extends HomeState {
  @override
  List<Object> get props => [];
}

class HomeLoading extends HomeState {
  @override
  List<Object?> get props => [];
}

class HomeLoaded extends HomeState {
  final List<Project> myProjects;
  final UserEntity currentUser;
  final List<UserEntity> teamMembers;
  final List<TaskEntity> projectTasks;
  final List<TaskEntity> myTasks;
  final Team? myTeam;

  const HomeLoaded({
    required this.myProjects,
    required this.teamMembers,
    required this.projectTasks,
    required this.myTeam,
    required this.currentUser,
    required this.myTasks,
  });

  @override
  List<Object?> get props => [myProjects, teamMembers, projectTasks, myTeam];
}

class HomeError extends HomeState {
  final String message;

  const HomeError(this.message);

  @override
  List<Object> get props => [message];
}
