import 'package:blog_app/core/secrets/superbase_secrets.dart';
import 'package:blog_app/features/auth/data/datasource/auth_remote_data_source.dart';
import 'package:blog_app/features/auth/data/repository/auth_repository_impl.dart';
import 'package:blog_app/features/auth/domain/repository/auth_repository.dart';
import 'package:blog_app/features/auth/domain/usecases/user_signup.dart';
import 'package:blog_app/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

final serviceLocator = GetIt.instance;

Future<void> initDependencies() async {
  _initAuth();

  final superbase = await Supabase.initialize(
    url: SuperbaseSecrets.url,
    anonKey: SuperbaseSecrets.anonKey,
  );
  serviceLocator.registerLazySingleton(() => superbase.client);
}

void _initAuth() {
  serviceLocator.registerFactory<AuthRemoteDataSource>(
    () => AuthRemoteDataSourceImpl(supabaseClient: serviceLocator()),
  );

  serviceLocator.registerFactory<AuthRepository>(
    () => AuthRepositoryImpl(authRemoteDataSource: serviceLocator()),
  );

  serviceLocator.registerCachedFactory(() => UserSignup(serviceLocator()));

  serviceLocator.registerLazySingleton(() => AuthBloc(userSignUp: serviceLocator()));
}
