import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../core/Services/Imaging/imaging.service.dart';
import '../../../../core/widgets/custom_text_form_field.dart';
import '../../domain/entities/user_entity.dart';
import '../bloc/profile_bloc.dart';

class ProfileBody extends StatefulWidget {
  final UserEntity user;

  const ProfileBody({super.key, required this.user});

  @override
  State<ProfileBody> createState() => _ProfileBodyState();
}

class _ProfileBodyState extends State<ProfileBody> {
  XFile? profileImage;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Personal details',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              CircleAvatar(
                backgroundColor: const Color(0xFFF1EAFE),
                radius: 36,
                child: (widget.user.pictureURL == null)
                    ? const Icon(
                        Icons.person_outlined,
                        color: Color(0xff824AFD),
                        size: 36,
                      )
                    : ClipOval(
                        child: Image.network(
                          widget.user.pictureURL!,
                          fit: BoxFit.cover,
                          width: 72,
                          height: 72,
                        ),
                      ),
              ),
              TextButton(
                onPressed: () async {
                  profileImage = await ImagingService.captureSingleImages();
                  if (profileImage != null) {
                    context.read<ProfileBloc>().add(
                      UpdateProfilePictureEvent(file: File(profileImage!.path)),
                    );
                  }
                },
                child: Text(
                  'Upload avatar',
                  style: TextStyle(color: Theme.of(context).primaryColor),
                ),
              ),
              TextButton(
                onPressed: () {
                  context.read<ProfileBloc>().add(
                    const RemoveProfilePictureEvent(),
                  );
                },
                child: const Text(
                  'Remove avatar',
                  style: TextStyle(color: Color(0xFFFF234D)),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          CustomTextFormField(
            isEnabled: false,
            hintText: widget.user.fullName,
            labelText: widget.user.fullName,
          ),
          const SizedBox(height: 16),
          CustomTextFormField(
            isEnabled: false,
            hintText: widget.user.email,
            labelText: widget.user.email,
          ),
        ],
      ),
    );
  }
}
