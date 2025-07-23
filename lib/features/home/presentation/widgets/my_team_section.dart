import 'package:flutter/material.dart';

import '../../../../core/widgets/section_placeholder.dart';
import '../../../../core/widgets/section_title.dart';
import '../../../profile/domain/entities/user_entity.dart';

class MyTeamSection extends StatelessWidget {
  final List<UserEntity> teamMembers;

  const MyTeamSection({super.key, required this.teamMembers});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SectionTitle(
          title: "My team",
          onPressed: () async {
            Navigator.push(
              context,
              MaterialPageRoute<bool>(
                builder: (BuildContext context) => const Placeholder(),
                // todo fix later
                //     InviteTeamMemberScreen(
                //       member: widget.user,
                //       team: state.team,
                //     ),
              ),
            );
          },
        ),
        const SizedBox(height: 16),
        (teamMembers.isNotEmpty)
            ? Wrap(
                alignment: WrapAlignment.start,
                crossAxisAlignment: WrapCrossAlignment.center,
                spacing: 8.0,
                runSpacing: 8.0,
                children: List.generate(
                  teamMembers.length,
                  (index) => GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute<bool>(
                          builder: (BuildContext context) =>
                              const Placeholder(),
                          // todo fix later
                          //     AssignedTasksScreen(
                          //       member: teamMembers[index]!,
                          //       projectIds: state.team?.projectsIds,
                          //     ),
                        ),
                      );
                    },
                    child: Chip(
                      color: WidgetStateProperty.all(const Color(0xffF1EBFF)),
                      labelStyle: const TextStyle(
                        fontSize: 14,
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.w500,
                        letterSpacing: 0.10,
                      ),
                      label: Text(teamMembers[index].fullName),
                      avatar: CircleAvatar(
                        backgroundColor: const Color(0xFFF1EAFE),
                        radius: 16,
                        child: (teamMembers[index].pictureURL == null)
                            ? const Icon(
                                size: 12,
                                Icons.person_outlined,
                                color: Color(0xff824AFD),
                              )
                            : ClipOval(
                                child: Image.network(
                                  teamMembers[index].pictureURL!,
                                  fit: BoxFit.cover,
                                  width: 72,
                                  height: 72,
                                ),
                              ),
                      ),
                    ),
                  ),
                ),
              )
            : const SectionPlaceholder(
                title: 'Click the “+” icon to create your first team member.',
              ),
      ],
    );
  }
}
