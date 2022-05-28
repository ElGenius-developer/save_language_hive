import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lang_save/app/logic/cubit/language/language_cubit.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

   return Scaffold(
      appBar: AppBar(
        title: const Text('Test Hive'),
        centerTitle: true,

      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text( "language is : "
            "${context.watch<LanguageCubit>().appLanguage.toLowerCase()=='ar'?
            "Arabic" : "English"
            }"),
            const SizedBox(height: 50,),
            CupertinoButton.filled(child: const Text('Change Language'), onPressed: (){
              if(context.read<LanguageCubit>().appLanguage == LangEnum.ar.name){
                context.read<LanguageCubit>().switchLanguage( LangEnum.en);
              }else{
                 context.read<LanguageCubit>().switchLanguage( LangEnum.ar);
              }
            })
          ],
        ),
      ),
    ); 
  }
}