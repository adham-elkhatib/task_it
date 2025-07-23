//t2 Core Packages Imports
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:task_it/features/task/domain/entities/task_entity.dart';

import '../../../../core/widgets/section_placeholder.dart';
import '../../../../core/widgets/section_title.dart';
import '../../../project/domain/entities/status_enum.dart';

//t2 Dependencies Imports
//t3 Services
//t3 Models
//t1 Exports
class InboxScreen extends StatefulWidget {
  const InboxScreen({Key? key}) : super(key: key);

  @override
  State<InboxScreen> createState() => _InboxScreenState();
}

class _InboxScreenState extends State<InboxScreen> {
  //
  //SECTION - State Variables
  //t2 --Controllers
  List<TaskEntity?>? allTasks = [];
  List<TaskEntity?>? doneTasks = [];
  List<TaskEntity?>? overdueTasks = [];
  bool isLoaded = false;
  Future<List<TaskEntity?>?>? _taskFuture;

  //t2 --Controllers
  //
  //t2 --State
  //t2 --State
  //
  //t2 --Constants
  //t2 --Constants
  //!SECTION

  @override
  void initState() {
    super.initState();
    //
    //SECTION - State Variables initializations & Listeners
    //t2 --Controllers & Listeners
    doneTasks?.clear();
    overdueTasks?.clear();
    allTasks?.clear();
    _taskFuture = fetchTasks();

    //t2 --Controllers & Listeners
    //
    //t2 --State
    //t2 --State
    //
    //t2 --Late & Async Initializers
    //t2 --Late & Async Initializers
    //!SECTION
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    //
    //SECTION - State Variables initializations & Listeners
    //t2 --State
    //t2 --State
    //!SECTION
  }

  //SECTION - Stateless functions
  //!SECTION

  //SECTION - Action Callbacks
  //!SECTION
  Future<List<TaskEntity?>?> fetchTasks() async {
    doneTasks?.clear();
    overdueTasks?.clear();
    allTasks?.clear();

    // if (widget.teamId != null) {
    //   await TeamRepo().readSingle(widget.teamId!).then((team) async {
    //     if (team != null) {
    //       Set<String?> uniqueProjectIds = Set<String?>.from(
    //         team.projectsIds ?? [],
    //       );
    //
    //       for (String? projectId in uniqueProjectIds) {
    //         if (projectId != null) {
    //           List<task?>? newTasks = await TaskRepo().readAllWhere([
    //             QueryCondition.equals(field: "projectId", value: projectId),
    //           ]);
    //           if (newTasks != null) {
    //             for (task? task in newTasks) {
    //               allTasks?.add(task);
    //             }
    //           }
    //         }
    //       }
    //     }
    //   });
    // }
    return allTasks;
  }

  @override
  Widget build(BuildContext context) {
    //SECTION - Build Setup
    //t2 -Values
    //double w = MediaQuery.of(context).size.width;
    //double h = MediaQuery.of(context).size.height;
    //t2 -Values
    //
    //t2 -Widgets
    //t2 -Widgets
    //!SECTION

    //SECTION - Build Return
    return Scaffold(
      appBar: AppBar(
        leading: null,
        title: const Text("Inbox"),
        centerTitle: true,
      ),
      body: FutureBuilder(
        future: _taskFuture,
        builder: (context, allTaskSnapshot) {
          if (allTaskSnapshot.connectionState == ConnectionState.done) {
            if (allTaskSnapshot.data != null) {
              DateTime now = DateTime.now();

              doneTasks?.addAll(
                allTaskSnapshot.data!.where(
                  (task) => task?.status == TaskStatus.done,
                ),
              );

              overdueTasks?.addAll(
                allTaskSnapshot.data!.where((task) {
                  if (task?.deadline != null) {
                    DateTime taskDeadline = DateFormat(
                      'yyyy-MM-dd',
                    ).parse(task!.deadline!);
                    return taskDeadline.isBefore(now);
                  }
                  return false;
                }),
              );
            }
            return Padding(
              padding: const EdgeInsets.all(24.0),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    ((doneTasks!.isEmpty) && (overdueTasks!.isEmpty))
                        ? const SectionPlaceholder(
                            title: "You are up to speed. Whoorayyy!",
                          )
                        : Column(
                            children: [
                              Column(
                                children: [
                                  const SectionTitle(title: "Overdue"),
                                  const SizedBox(height: 16),
                                  (overdueTasks == null ||
                                          overdueTasks!.isEmpty)
                                      ? const SectionPlaceholder(
                                          title: "No results",
                                        )
                                      : Column(
                                          children: List.generate(
                                            overdueTasks!.length,
                                            (index) => const Placeholder(),
                                            // todo fix this
                                            //  TaskCard(
                                            //   task: overdueTasks![index]!,
                                            // ),
                                          ),
                                        ),
                                ],
                              ),
                              const SizedBox(height: 40),
                              Column(
                                children: [
                                  const SectionTitle(title: "Done"),
                                  const SizedBox(height: 16),
                                  (doneTasks == null || doneTasks!.isEmpty)
                                      ? const SectionPlaceholder(
                                          title: "No results",
                                        )
                                      : Column(
                                          children: List.generate(
                                            doneTasks!.length,
                                            (index) => const Padding(
                                              padding: EdgeInsets.all(8.0),
                                              child: Placeholder(),
                                              // todo fix this
                                              // TaskCard(
                                              //   task: doneTasks![index]!,
                                              // ),
                                            ),
                                          ),
                                        ),
                                ],
                              ),
                            ],
                          ),
                  ],
                ),
              ),
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
    //!SECTION
  }

  @override
  void dispose() {
    //SECTION - Disposable variables
    //!SECTION
    doneTasks?.clear();
    overdueTasks?.clear();
    allTasks?.clear();
    super.dispose();
  }
}
