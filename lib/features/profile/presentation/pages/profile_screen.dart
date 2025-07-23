// lib/features/profile/presentation/pages/profile_screen.dart

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/entities/user_entity.dart';
import '../bloc/profile_bloc.dart';
import '../widgets/profile_app_bar.dart';
import '../widgets/profile_body.dart';

class ProfileScreen extends StatelessWidget {
  final UserEntity user;

  const ProfileScreen({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const ProfileAppBar(),
      body: ProfileBody(user: user),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(bottom: 40.0, left: 80, right: 80),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xffFF244D),
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
              side: const BorderSide(color: Color(0xFFFF234D)),
            ),
          ),
          onPressed: () async {
            context.read<ProfileBloc>().add(const LogoutEvent());
          },
          child: const Text('Sign out', style: TextStyle(color: Colors.white)),
        ),
      ),
    );
  }
}
