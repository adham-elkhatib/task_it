import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../profile/domain/entities/user_entity.dart';
import '../../../profile/presentation/pages/profile_screen.dart';
import '../providers/home_bloc.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final state = context.watch<HomeBloc>().state;

    if (state is! HomeLoaded) return const SizedBox.shrink();

    final UserEntity user = state.currentUser;

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.only(top: 16, left: 24.0, right: 24),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Hey ${user.fullName} 👋',
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 16,
                fontFamily: 'SF Pro Text',
                fontWeight: FontWeight.w400,
                letterSpacing: -0.43,
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute<void>(
                    builder: (BuildContext context) =>
                        ProfileScreen(user: user),
                  ),
                );
              },
              child: CircleAvatar(
                backgroundColor: const Color(0xFFF1EAFE),
                radius: 16,
                child: (user.pictureURL == null)
                    ? const Icon(
                        Icons.person_outlined,
                        color: Color(0xff824AFD),
                      )
                    : ClipOval(
                        child: Image.network(
                          user.pictureURL!,
                          fit: BoxFit.cover,
                          width: 72,
                          height: 72,
                        ),
                      ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
