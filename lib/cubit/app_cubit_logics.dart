import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tp/accueil.dart';
import 'package:tp/cubit/app_cubit.dart';
import 'package:tp/cubit/app_cubit_states.dart';
import 'package:tp/splash_screen.dart';

class AppCubitLogics extends StatefulWidget {
  const AppCubitLogics({super.key});

  @override
  State<AppCubitLogics> createState() => _AppCubitLogicsState();
}

class _AppCubitLogicsState extends State<AppCubitLogics> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<AppCubit, CubitStates>(builder: ((context, state) {
        if (state is WelcomeState) {
          return MyAccueil();
        } else if (state is loadedState) {
          return MyAccueil();
        } else {
          return Container();
        }
      })),
    );
  }
}
