import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:task_it/features/home/presentation/pages/home.screen.dart';

import '../../../../core/Services/Error Handling/app_error.extension.dart';
import '../../../../core/localization/locale_keys.g.dart';
import '../../../../core/utils/SnackBar/snackbar.helper.dart';
import '../../../../core/widgets/custom_text_form_field.dart';
import '../providers/auth_bloc.dart';

class SignUpForm extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  final TextEditingController fullNameController;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final TextEditingController phoneNumberController;

  const SignUpForm({
    super.key,
    required this.formKey,
    required this.fullNameController,
    required this.emailController,
    required this.passwordController,
    required this.phoneNumberController,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is AuthAuthenticated) {
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (_) => const HomeScreen()),
            (route) => false,
          );
        } else if (state is AuthFailure) {
          final error = state.error;

          if (error.shouldShow) {
            SnackbarHelper.showError(context, title: error.msg);
          } else {
            SnackbarHelper.showError(
              context,
              title: "Something went wrong. Please try again.",
            );
          }
        }
      },
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.all(24.0),
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                const Spacer(),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 56.0),
                    child: SvgPicture.asset(
                      'assets/images/logo.svg',
                      width: double.infinity,
                      height: 138.84,
                    ),
                  ),
                ),
                const Text(
                  'Sign Up',
                  style: TextStyle(
                    fontSize: 32,
                    fontFamily: 'AvantGarde Bk BT',
                    fontWeight: FontWeight.w700,
                    letterSpacing: -0.64,
                  ),
                ),
                const SizedBox(height: 40),
                Center(
                  child: Column(
                    children: [
                      // GestureDetector(
                      //   onTap: () async {
                      //     // profileImage =
                      //     //     await ImagingService.captureSingleImages();
                      //     // setState(() {});
                      //   },
                      //   child: CircleAvatar(
                      //     backgroundColor: const Color(0xFFF1EAFE),
                      //     radius: 36,
                      //     child: profileImage == null
                      //         ? const Icon(
                      //       Icons.person_outlined,
                      //       size: 48,
                      //       color: Color(0xff824AFD),
                      //     )
                      //         : ClipOval(
                      //       child: Image.file(
                      //         File(profileImage!.path),
                      //         fit: BoxFit.cover,
                      //         width: 72,
                      //         height: 72,
                      //       ),
                      //     ),
                      //   ),
                      // ),
                      const SizedBox(height: 4),
                      Text(
                        'Upload avatar',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 16,
                          color: Theme.of(context).primaryColor,
                          fontFamily: 'SF Pro Text',
                          fontWeight: FontWeight.w500,
                          letterSpacing: 0.16,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 24),
                CustomTextFormField(
                  controller: fullNameController,
                  hintText: LocaleKeys.auth_sign_up_first_name.tr(),
                  labelText: LocaleKeys.auth_sign_up_first_name.tr(),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return LocaleKeys.auth_sign_up_errors_empty_first_name
                          .tr();
                    } else if (value.length < 3) {
                      return LocaleKeys.auth_sign_up_errors_short_first_name
                          .tr();
                    }
                    return null;
                  },
                  keyboardType: TextInputType.name,
                ),
                const SizedBox(height: 16),
                CustomTextFormField(
                  controller: emailController,
                  labelText: LocaleKeys.auth_sign_up_email.tr(),
                  hintText: LocaleKeys.auth_sign_up_email_hint.tr(),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return LocaleKeys.auth_sign_up_errors_empty_email.tr();
                    }
                    final emailRegex = RegExp(r'^[^@]+@[^@]+\.[^@]+');
                    if (!emailRegex.hasMatch(value)) {
                      return LocaleKeys.auth_sign_up_errors_invalid_email.tr();
                    }
                    return null;
                  },
                  keyboardType: TextInputType.emailAddress,
                ),
                const SizedBox(height: 16),
                CustomTextFormField(
                  controller: passwordController,
                  hintText: LocaleKeys.auth_sign_up_password.tr(),
                  labelText: LocaleKeys.auth_sign_up_password.tr(),
                  isObscure: true,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your password';
                    }
                    if (value.length < 6) {
                      return 'Password must be at least 6 characters long';
                    }
                    return null;
                  },
                ),
                const Spacer(),
              ],
            ),
          ),
        );
      },
    );
  }
}
