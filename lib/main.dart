import 'package:flutter/material.dart';
import 'package:flutter_application_1/counter/bloc/counter_bloc.dart';
import 'package:flutter_application_1/counter/bloc/my_bloc_observer.dart';
import 'package:flutter_application_1/screens/screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  Bloc.observer = MyBlocObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CounterBloc(),
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomeScreen(),
      ),
    );
  }
}
