import 'package:blog_app/core/failure/server_exception.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract interface class AuthRemoteDataSource {
  Future<String> loginWithEmailAndPassword({
    required String name,
    required String email,
    required String password,
  });
  Future<String> signUpWithEmailAndPassword({
    required String name,
    required String email,
    required String password,
  });
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final SupabaseClient supabaseClient;
  AuthRemoteDataSourceImpl({required this.supabaseClient});

  @override
  Future<String> loginWithEmailAndPassword({
    required String name,
    required String email,
    required String password,
  }) {
    // TODO: implement loginWithEmailAndPassword
    throw UnimplementedError();
  }

  @override
  Future<String> signUpWithEmailAndPassword({
    required String name,
    required String email,
    required String password,
  }) async {
    try {
      final response = await supabaseClient.auth.signUp(
        password: password,
        email: email,
        data: {'name': name},
      );
      if (response.user == null) {
        throw ServerException(message: 'User is Null!');
      }
      return response.user!.id;
    } catch (e) {
      throw ServerException(message: e.toString());
    }
  }
}
