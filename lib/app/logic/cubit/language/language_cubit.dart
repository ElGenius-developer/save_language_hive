import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';

part 'language_state.dart';

enum LangEnum { ar, en }

class LanguageCubit extends Cubit<LanguageState> {
  String appLanguage = LangEnum.en.name;
  late Box<String> box;

  LanguageCubit() : super(LanguageInitial());

  void switchLanguage(LangEnum langEnum) {
    switch (langEnum) {
      case LangEnum.ar:
        appLanguage = 'ar';

        break;
      case LangEnum.en:
        appLanguage = 'en';
        break;
    }
    emit(LanguageChanged(appLanguage));
    saveLanguage();
  }

  void saveLanguage() async {
    try {
      await box.put('language', appLanguage);
      emit(LanguageSaved(appLanguage));
    } catch (error) {
      emit(LanguageErrorState(error.toString()));
      if (kDebugMode) {
        print(error.toString());
      }
      throw (error.toString());
    }
  }

  void languageInitialization()async {
    box = await Hive.openBox<String>("language");

    if (box.isEmpty) {
      appLanguage = LangEnum.en.name;
      saveLanguage();
    } else {
      if (box.get('language') != null) {
        appLanguage = box.get('language')!;
        saveLanguage();
      }
    }
  }

  @override
  Future close() {
    Hive.close();
    box.close();
    return super.close();
  }
}
