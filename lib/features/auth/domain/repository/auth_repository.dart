import 'package:blog_app/core/failure/failure.dart';
import 'package:fpdart/fpdart.dart';

abstract interface class AuthRepository {
  Future<Either<Failure, String>> signUpWithEmailAndPassword({
    required String name,
    required String email,
    required String password,
  });
  Future<Either<Failure, String>> logInUpWithEmailAndPassword({
    required String email,
    required String password,
  });
}
