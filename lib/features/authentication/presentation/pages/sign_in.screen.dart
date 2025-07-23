//t2 Core Packages Imports
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../../core/localization/locale_keys.g.dart';
import '../widgets/sign_in_bottom_nav.dart';
import '../widgets/sign_in_form.dart';

//t2 Dependancies Imports
//t3 Services
//t3 Models
//t1 Exports
class SignInScreen extends StatefulWidget {
  //SECTION - Widget Arguments
  //!SECTION
  //
  const SignInScreen({Key? key}) : super(key: key);

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final formKey = GlobalKey<FormState>();

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(LocaleKeys.auth_sign_in_title.tr())),
      body: SignInForm(
        emailController: emailController,
        passwordController: passwordController,
        formKey: formKey,
      ),

      bottomNavigationBar: SignInBottomNav(
        emailController: emailController,
        passwordController: passwordController,
        formKey: formKey,
      ),
    );
    //!SECTION
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();

    super.dispose();
  }
}
