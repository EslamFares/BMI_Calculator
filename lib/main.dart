import 'package:bmi/features/home/presention/views/home_view.dart';
import 'package:bmi/features/login/cubit/login_cubit.dart';
import 'package:bmi/features/login/prsentation/views/login_view.dart';
import 'package:bmi/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/functions/mybloc_observer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  Bloc.observer = MyBlocObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'BMI Calculator',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
            useMaterial3: true),
        home: const HomeView()
        // BlocProvider(
        //   create: (context) => LoginCubit(),
        //   child: const LoginView(),
        // ),
        );
  }
}
