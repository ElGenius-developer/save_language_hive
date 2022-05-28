// ignore: file_names
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:save_language_hive/app/screens/home/home_screen.dart';

import 'logic/cubit/language/language_cubit.dart';

class MyApp extends StatefulWidget {
   const MyApp({
    Key? key,
   }) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void dispose() {
    context.read<LanguageCubit>().close();
    super.dispose();
  }

@override
void initState() {
   context.read<LanguageCubit>().languageInitialization();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        home: HomeScreen(),
      );
  }
}
