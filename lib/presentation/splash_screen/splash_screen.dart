import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_cubit_bloc/application/auth/cubit/auth_cubit.dart';
import 'package:flutter_cubit_bloc/presentation/home_page/home_page.dart';
import 'package:flutter_cubit_bloc/presentation/sign_in_page.dart/sign_in_page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthCubit()..LoadUserFromLocal(),
      child: BlocListener<AuthCubit, AuthState>(
        listener: (context, state) {
          if (state is AuthLoginSuccess) {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => HomePage()));
          } else if (state is AuthError) {
          Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => SignInPage()));
          }
        },
        child: Scaffold(
          body: Center(
            child: CircularProgressIndicator(),
          ),
        ),
      ),
    );
  }
}
