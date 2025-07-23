import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:task_it/features/profile/domain/entities/user_entity.dart';

import '../../../../data/model/project/project.model.dart';
import '../../../../data/model/team/team.model.dart';
import '../../../task/domain/entities/task_entity.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  // final GetCatProfile getCatProfileUseCase;
  // final UpdateCatProfile updateCatProfileUseCase;
  // final GetFeeder getFeederUseCase;
  // final CreateMeal createMealUseCase;
  // final DeleteMeal deleteMealUseCase;
  // final UpdateMeal updateMealUseCase;
  // final GetMeals getMealsUseCase;
  // final SyncToFeeder syncToFeederUseCase;
  // final ConnectToFeeder connectFeederUseCase;
  // final DisconnectFeeder disconnectFeederUseCase;

  HomeBloc(
    // {
    // required this.getCatProfileUseCase,
    // required this.updateCatProfileUseCase,
    // required this.getFeederUseCase,
    // required this.deleteMealUseCase,
    // required this.createMealUseCase,
    // required this.updateMealUseCase,
    // required this.getMealsUseCase,
    // required this.syncToFeederUseCase,
    // required this.connectFeederUseCase,
    // required this.disconnectFeederUseCase,
    // }
  ) : super(HomeInitial()) {
    // on<LoadHomeDataEvent>(_onLoadHomeData);
    // on<UpdatePetProfileEvent>(_onUpdatePetProfile);
    // on<AddMealEvent>(_onAddMeal);
    // on<DeleteMealEvent>(_onDeleteMeal);
    // on<UpdateMealServingEvent>(_onUpdateMealServing);
    // on<ToggleMealEvent>(_onToggleMeal);
    // on<ConnectFeederEvent>(_onConnectFeeder);
    // on<DisconnectFeederEvent>(_onDisconnectFeeder);
  }

  // void _onLoadHome(LoadHome event, Emitter<HomeState> emit) async {
  //   emit(HomeLoading());
  //
  //   List<String?>? projectIds = [];
  //   List<String?>? teamMembersIds = [];
  //
  //   Team? team;
  //   String userId = AuthService().getCurrentUserId();
  //   Member? member = await MemberRepo().readSingle(userId);
  //
  //   if (member != null) {
  //     if (member.teamId != null) {
  //       team = await TeamRepo().readSingle(member.teamId!);
  //       if (team?.membersIds != null) {
  //         teamMembersIds.addAll(team!.membersIds!);
  //       }
  //       if (team?.projectsIds != null) {
  //         projectIds.addAll(team!.projectsIds!);
  //       }
  //     }
  //   }
  //
  //   List<Project?> projects = [];
  //   List<Member?>? members = [];
  //   List<Task?>? tasks = [];
  //   Set<String> addedTaskIds = <String>{};
  //
  //   try {
  //     if (projectIds.isNotEmpty) {
  //       for (String? projectId in projectIds) {
  //         if (projectId != null) {
  //           projects.add(await ProjectRepo().readSingle(projectId));
  //         }
  //       }
  //     }
  //
  //     if (teamMembersIds.isNotEmpty) {
  //       for (String? teamMembersId in teamMembersIds) {
  //         if (teamMembersId != null) {
  //           members.add(await MemberRepo().readSingle(teamMembersId));
  //         }
  //       }
  //     }
  //
  //     if (projects.isNotEmpty) {
  //       for (Project? project in projects) {
  //         if (project?.tasksId != null) {
  //           for (String? taskId in project!.tasksId!) {
  //             if (taskId != null) {
  //               Task? projectTask = await TaskRepo().readSingle(taskId);
  //               if (projectTask != null &&
  //                   !addedTaskIds.contains(projectTask.id)) {
  //                 tasks.add(projectTask);
  //                 addedTaskIds.add(projectTask.id);
  //               }
  //             }
  //           }
  //         }
  //       }
  //     }
  //
  //     List<Task?>? personalTasks = await TaskRepo().readAllWhere([
  //       QueryCondition.equals(
  //         field: "assigneeId",
  //         value: AuthService().getCurrentUserId(),
  //       ),
  //     ]);
  //
  //     if (personalTasks != null) {
  //       for (Task? personalTask in personalTasks) {
  //         if (personalTask != null && !addedTaskIds.contains(personalTask.id)) {
  //           tasks.add(personalTask);
  //           addedTaskIds.add(personalTask.id);
  //         }
  //       }
  //     }
  //
  //     emit(HomeLoaded(projects, members, tasks, team));
  //   } catch (e) {
  //     emit(HomeError(e.toString()));
  //   }
  // }
}
