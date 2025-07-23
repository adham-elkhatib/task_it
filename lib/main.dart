import 'package:easy_localization/easy_localization.dart' as easy_localization;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_it/features/skeleton/skeleton_screen.dart';

import 'core/Services/App/app.service.dart';
import 'core/Services/Firebase/firebase.service.dart';
import 'features/authentication/presentation/pages/landing_screen.dart';
import 'features/authentication/presentation/providers/auth_bloc.dart';
import 'features/home/presentation/providers/home_bloc.dart';
import 'features/profile/presentation/bloc/profile_bloc.dart';
import 'locator.dart';
import 'theme.dart';
import 'util.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await App.initialize(AppEnvironment.dev);
  // await NotificationService.initialize();
  await FirebaseService.initialize();
  // await FCMNotification().initNotifications();
  await easy_localization.EasyLocalization.ensureInitialized();

  // Initialize service locators
  await init();

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => sl<AuthBloc>()..add(AuthCheckRequested())),
        BlocProvider(create: (_) => sl<HomeBloc>()),
        // BlocProvider(create: (_) => sl<FeederBloc>()),
        // BlocProvider(create: (_) => sl<MealsBloc>()),
        BlocProvider(create: (_) => sl<ProfileBloc>()),
      ],
      child: easy_localization.EasyLocalization(
        supportedLocales: const [Locale('en'), Locale('ar')],
        path: 'assets/translations',
        fallbackLocale: const Locale('ar'),
        child: const MyApp(),
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = createTextTheme(context, "Roboto", "Roboto");
    MaterialTheme theme = MaterialTheme(textTheme);

    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        Widget home;
        if (state is AuthInitial || state is AuthLoading) {
          home = const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        } else if (state is AuthAuthenticated) {
          home = const SkeletonScreen();
        } else {
          home = const LandingScreen();
        }
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            useMaterial3: true,
            colorScheme: theme.light().colorScheme,
            textTheme: textTheme,
          ),
          supportedLocales: const [Locale('en'), Locale('ar')],
          locale: context.locale,
          localizationsDelegates: context.localizationDelegates,
          localeResolutionCallback: (locale, supportedLocales) {
            for (var supportedLocale in supportedLocales) {
              if (supportedLocale.languageCode == locale?.languageCode) {
                return supportedLocale;
              }
            }
            return supportedLocales.first;
          },
          home: home,
        );
      },
    );
  }
}
