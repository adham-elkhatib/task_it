import 'package:flutter/material.dart';

import '../../../../core/widgets/section_placeholder.dart';
import '../../../../core/widgets/section_title.dart';
import '../../../../data/model/project/project.model.dart';

class MyProjectsSection extends StatelessWidget {
  final List<Project> projects;

  const MyProjectsSection({super.key, required this.projects});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SectionTitle(
          title: "My projects",
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute<bool>(
                builder: (BuildContext context) => const Placeholder(),
                // todo fix later
                //     CreateProjectScreen(
                //       user: widget.user,
                //       team: state.team,
                //       teamMembers: teamMembers,
                //     ),
              ),
            );
          },
        ),
        const SizedBox(height: 12),
        (projects.isNotEmpty)
            ? Column(
                children: List.generate(
                  projects.length,
                  (index) => const Placeholder(),
                  // todo fix later

                  //     ProjectCard(
                  //   project: projects[index]!,
                  //   teamMembers: teamMembers,
                  // ),
                ),
              )
            : const SectionPlaceholder(
                title: 'Click the “+” icon to create your first project',
              ),
      ],
    );
  }
}
