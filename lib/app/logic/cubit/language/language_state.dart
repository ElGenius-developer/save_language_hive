part of 'language_cubit.dart';


abstract class LanguageState {}

class LanguageInitial extends LanguageState {}
class LanguageLoading extends LanguageState {}

class LanguageChanged extends LanguageState{
    final String lang;
   LanguageChanged(this.lang);
}

class LanguageSaved extends LanguageState{
   final String lang;
   LanguageSaved(this.lang);
}


class LanguageErrorState extends LanguageState{
  final String error;
  LanguageErrorState(this.error);
}
