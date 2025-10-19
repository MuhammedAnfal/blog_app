import 'package:blog_app/core/failure/failure.dart';
import 'package:blog_app/core/usecase/use_case.dart';
import 'package:blog_app/features/auth/domain/repository/auth_repository.dart';
import 'package:fpdart/fpdart.dart';

class UserSignup implements UseCase<String, UserSignupParams> {
  final AuthRepository authRepository;
  UserSignup(this.authRepository);
  @override
  Future<Either<Failure, String>> call(UserSignupParams params) async {
    return await authRepository.signUpWithEmailAndPassword(
      name: params.name,
      email: params.email,
      password: params.password,
    );
  }
}

class UserSignupParams {
  final String name;
  final String email;
  final String password;
  UserSignupParams({required this.email, required this.name, required this.password});
}
