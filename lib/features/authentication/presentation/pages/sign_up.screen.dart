//t2 Core Packages Imports
import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:task_it/features/authentication/presentation/widgets/sign_up_form.dart';

import '../../../../core/localization/locale_keys.g.dart';
import '../widgets/sign_up_bottom_nav.dart';

//t2 Dependencies Imports
//t3 Services
//t3 Models
//t1 Exports
class SignUpScreen extends StatefulWidget {
  //SECTION - Widget Arguments
  //!SECTION
  //
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final formKey = GlobalKey<FormState>();
  final fullNameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final phoneNumberController = TextEditingController();

  File? profileImage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(LocaleKeys.auth_sign_up_title.tr())),
      body: SignUpForm(
        formKey: formKey,
        fullNameController: fullNameController,
        emailController: emailController,
        passwordController: passwordController,
        phoneNumberController: phoneNumberController,
      ),
      bottomNavigationBar: SignUpBottomNav(
        formKey: formKey,
        emailController: emailController,
        passwordController: passwordController,
        fNameController: fullNameController,
        phoneNumberController: phoneNumberController,
      ),
      resizeToAvoidBottomInset: true,
    );
    //!SECTION
  }

  @override
  void dispose() {
    fullNameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    phoneNumberController.dispose();
    super.dispose();
  }
}
