import 'package:blog_app/features/auth/presentation/pages/login_screen.dart';
import 'package:blog_app/features/auth/presentation/pages/signup_screen.dart';
import 'package:go_router/go_router.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: '/login',
  routes: [
    GoRoute(path: '/login', builder: (context, state) => const LoginScreen()),
    GoRoute(path: '/signUp', builder: (context, state) => const SignUpScreen()),
    GoRoute(path: '/home', builder: (context, state) => const SignUpScreen()),
  ],
);
