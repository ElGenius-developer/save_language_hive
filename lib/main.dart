import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

import 'app/MyApp.dart';
import 'app/logic/cubit/language/language_cubit.dart';

Future<void> main() async {
    WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

  var path = await getApplicationDocumentsDirectory();
    Hive.init(path.path);
  runApp(    BlocProvider(create: (context) => LanguageCubit(),
  child:  const MyApp(),
  ));
}