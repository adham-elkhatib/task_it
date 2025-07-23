import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/Services/Error Handling/app_error.extension.dart';
import '../../../../core/localization/locale_keys.g.dart';
import '../../../../core/utils/SnackBar/snackbar.helper.dart';
import '../../../../core/widgets/custom_text_form_field.dart';
import '../../../home/presentation/pages/home.screen.dart';
import '../pages/reset_password_screen.dart';
import '../providers/auth_bloc.dart';

class SignInForm extends StatelessWidget {
  final GlobalKey<FormState> formKey;

  final TextEditingController emailController;
  final TextEditingController passwordController;

  const SignInForm({
    super.key,
    required this.formKey,
    required this.emailController,
    required this.passwordController,
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
            SnackbarHelper.showError(context, title: tr(error.msg));
          } else {
            SnackbarHelper.showError(
              context,
              title: LocaleKeys.common_generic_error.tr(),
            );
          }
        }
      },
      // Padding(
      //   padding: const EdgeInsets.all(24.0),
      //   child: SingleChildScrollView(
      //     child: Form(
      //       key: _formKey,
      //       child: Column(

      //         children: [

      //           CustomTextFormField(
      //             controller: _formController.controller("email"),
      //             hintText: "Email",
      //             validator: (value) {
      //               if (value == null || value.isEmpty) {
      //                 return 'Please enter your email';
      //               }
      //               if (!RegExp(
      //                 r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
      //               ).hasMatch(value)) {
      //                 return 'Please enter a valid email address';
      //               }
      //               return null;
      //             },
      //           ),
      //           const SizedBox(height: 16),
      //           CustomTextFormField(
      //             isObscure: true,
      //             controller: _formController.controller("password"),
      //             hintText: "Password",
      //             validator: (value) {
      //               if (value == null || value.isEmpty) {
      //                 return 'Please enter your password';
      //               }
      //               if (value.length < 6) {
      //                 return 'Password must be at least 6 characters long';
      //               }
      //               return null;
      //             },
      //           ),
      //           const SizedBox(height: 112),
      //         ],
      //       ),
      //     ),
      //   ),
      // ),
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.all(24.0),

          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
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
                  'Sign in & Get started 🚀',
                  style: TextStyle(
                    fontSize: 32,
                    fontFamily: 'AvantGarde Bk BT',
                    fontWeight: FontWeight.w700,
                    letterSpacing: -0.64,
                  ),
                ),
                const SizedBox(height: 8),
                const Text(
                  'Start managing your project and get to the finish line!',
                  style: TextStyle(
                    fontSize: 16,
                    fontFamily: 'SF Pro Text',
                    fontWeight: FontWeight.w400,
                    letterSpacing: -0.43,
                  ),
                ),
                const SizedBox(height: 40),
                CustomTextFormField(
                  controller: emailController,
                  hintText: LocaleKeys.auth_sign_in_email_hint.tr(),
                  labelText: LocaleKeys.auth_sign_in_email.tr(),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return LocaleKeys.auth_sign_in_errors_empty_email.tr();
                    }
                    String pattern =
                        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9]+\.[a-zA-Z]+";
                    RegExp regex = RegExp(pattern);
                    if (!regex.hasMatch(value)) {
                      return LocaleKeys.auth_sign_in_errors_invalid_email.tr();
                    }
                    return null;
                  },
                  keyboardType: TextInputType.emailAddress,
                ),

                const SizedBox(height: 16),
                CustomTextFormField(
                  controller: passwordController,
                  isObscure: true,
                  hintText: LocaleKeys.auth_sign_up_password.tr(),
                  labelText: LocaleKeys.auth_sign_up_password.tr(),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return LocaleKeys.auth_sign_in_errors_empty_password.tr();
                    }
                    return null;
                  },
                  keyboardType: TextInputType.text,
                ),
                const SizedBox(height: 16),
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute<void>(
                          builder: (_) => const ResetPasswordScreen(),
                        ),
                      );
                    },
                    child: Text(LocaleKeys.auth_sign_in_forgot_password.tr()),
                  ),
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
