import 'package:flutter/material.dart';
import 'package:task_it/features/task/domain/entities/task_entity.dart';

import '../../../../core/widgets/section_placeholder.dart';
import '../../../../core/widgets/section_title.dart';

class MyTasksSection extends StatelessWidget {
  final List<TaskEntity> myTasks;

  const MyTasksSection({super.key, required this.myTasks});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SectionTitle(
          title: "My tasks",
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute<bool>(
                builder: (BuildContext context) => const Placeholder(),
                // todo fix later
                //     CreateTaskScreen(user: widget.user),
              ),
            );
          },
        ),
        const SizedBox(height: 12),
        (myTasks.isNotEmpty)
            ? Column(
                children: List.generate(
                  myTasks.length,
                  (index) => const Placeholder(),
                  // todo fix later
                  //     TaskCard(task: filteredTasks[index]!),
                ),
              )
            : const SectionPlaceholder(
                title: 'Click the “+” icon to create your first task',
              ),
      ],
    );
  }
}
