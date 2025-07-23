// 🔹 Core External Packages
import 'package:data_connection_checker_tv/data_connection_checker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:task_it/data/repositories/user_repo.dart';

// 🔹 Core Providers & Services
import 'core/Providers/FB Firestore/fbfirestore.provider.dart';
import 'core/Providers/FB Firestore/fbfirestore_repo.dart';
import 'core/Services/Auth/auth.service.dart';
import 'core/Services/Auth/src/Providers/firebase/firebase_auth_provider.dart';
import 'core/connection/network_info.dart';
// 🔹 Auth Feature
import 'features/authentication/data/datasources/auth_local_data_source.dart';
import 'features/authentication/data/datasources/auth_remote_data_source.dart';
import 'features/authentication/data/repositories/auth_repository_impl.dart';
import 'features/authentication/domain/repositories/auth_repository.dart';
import 'features/authentication/domain/usecases/check_auth_status.dart';
import 'features/authentication/domain/usecases/login_user.dart';
import 'features/authentication/domain/usecases/logout_user.dart';
import 'features/authentication/domain/usecases/register_user.dart';
import 'features/authentication/domain/usecases/reset_password.dart';
import 'features/authentication/presentation/providers/auth_bloc.dart';
// 🔹 Home Feature
import 'features/home/presentation/providers/home_bloc.dart';
// 🔹 Profile Feature
import 'features/profile/data/datasources/profile_local_data_source.dart';
import 'features/profile/data/datasources/profile_remote_data_source.dart';
import 'features/profile/data/models/user_model.dart';
import 'features/profile/data/repositories/profile_repository_impl.dart';
import 'features/profile/domain/repositories/profile_repository.dart';
import 'features/profile/domain/usecases/create_profile.dart';
import 'features/profile/domain/usecases/get_profile.dart';
import 'features/profile/domain/usecases/update_profile.dart';
import 'features/profile/presentation/bloc/profile_bloc.dart';

final GetIt sl = GetIt.instance;

Future<void> init() async {
  //! ========== Bloc ==========
  sl.registerFactory(
    () => AuthBloc(
      loginUseCase: sl(),
      registerUseCase: sl(),
      authService: sl(),
      resetPasswordUseCase: sl(),
      createProfileUseCase: sl(),
    ),
  );

  sl.registerFactory(() => HomeBloc());

  sl.registerFactory(
    () => ProfileBloc(
      createProfileUseCase: sl(),
      getProfileUseCase: sl(),
      updateProfileUseCase: sl(),
      logoutUserUseCase: sl(),
    ),
  );

  //! ========== UseCases ==========
  sl.registerLazySingleton(() => LoginUser(authRepository: sl()));
  sl.registerLazySingleton(() => RegisterUser(authRepository: sl()));
  sl.registerLazySingleton(() => ResetPassword(authRepository: sl()));
  sl.registerLazySingleton(() => CheckAuthStatus(authRepository: sl()));
  sl.registerLazySingleton(() => LogoutUser(authRepository: sl()));
  //
  sl.registerLazySingleton(() => CreateProfile(profileRepository: sl()));
  sl.registerLazySingleton(() => GetProfile(profileRepository: sl()));
  sl.registerLazySingleton(() => UpdateProfile(profileRepository: sl()));

  //! ========== Repositories ==========
  sl.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImpl(
      remoteDataSource: sl(),
      localDataSource: sl(),
      networkInfo: sl(),
    ),
  );

  sl.registerLazySingleton<ProfileRepository>(
    () => ProfileRepositoryImpl(
      localDataSource: sl(),
      remoteDataSource: sl(),
      networkInfo: sl(),
    ),
  );
  //! ========== DataSources ==========
  sl.registerLazySingleton<AuthRemoteDataSource>(
    () => AuthRemoteDataSourceImpl(authService: sl()),
  );
  sl.registerLazySingleton<AuthLocalDataSource>(
    () => AuthLocalDataSourceImpl(sharedPreferences: sl()),
  );

  sl.registerLazySingleton<ProfileRemoteDataSource>(
    () => ProfileRemoteDataSourceImpl(firestoreRepo: sl()),
  );
  sl.registerLazySingleton<ProfileLocalDataSource>(
    () => ProfileLocalDataSourceImpl(sharedPreferences: sl()),
  );

  //! ========== Core ==========
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));
  sl.registerLazySingleton(
    () => AuthService(
      authProvider: FirebaseAuthProvider(firebaseAuth: FirebaseAuth.instance),
    ),
  );
  sl.registerLazySingleton(() => DataConnectionChecker());

  //! ========== External ==========
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);
  sl.registerLazySingleton(() => FirestoreProvider());
  sl.registerLazySingleton<FirestoreRepo<UserModel>>(() => UserRepo());
}
