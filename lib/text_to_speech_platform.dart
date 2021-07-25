import 'package:plugin_platform_interface/plugin_platform_interface.dart';
import 'locales.dart';
import 'method_channel_text_to_speech.dart';

abstract class TextToSpeechPlatform extends PlatformInterface {
  TextToSpeechPlatform() : super(token: _token);

  static final Object _token = Object();

  static TextToSpeechPlatform _instance = MethodChannelTextToSpeech();

  /// Getter of current platform instance
  static TextToSpeechPlatform get instance => _instance;

  /// Setter of current platform interface
  static set instance(TextToSpeechPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<bool?> speak(String text) async {
    throw UnimplementedError('speak() has not been implemented');
  }

  Future<bool?> stop() async {
    throw UnimplementedError('stop() has not been implemented');
  }

  Future<bool?> pause() async {
    throw UnimplementedError('pause() has not been implemented');
  }

  Future<bool?> resume() async {
    throw UnimplementedError('resume() has not been implemented');
  }

  Future<bool?> setRate(num rate) async {
    throw UnimplementedError('setRate() has not been implemented');
  }

  Future<bool?> setVolume(num volume) async {
    throw UnimplementedError('setVolume() has not been implemented');
  }

  Future<bool?> setLanguage(String language) async {
    throw UnimplementedError('setLanguage() has not been implemented');
  }

  Future<bool?> setPitch(num pitch) async {
    throw UnimplementedError('setPitch() has not been implemented');
  }

  Future<List<String>> getLanguages() async {
    throw UnimplementedError('getLanguages() has not been implemented');
  }

  Future<String?> getDefaultLanguage() async {
    throw UnimplementedError('getDefaultLanguage() has not been implemented');
  }

  Future<List<String>?> getVoice() async {
    throw UnimplementedError('getVoice() has not been implemented');
  }

  Future<List<String>?> getVoiceByLang(String lang) async {
    throw UnimplementedError('getVoiceByLang() has not been implemented');
  }

  Future<List<String>?> getDisplayLanguages() async {
    List<String> displayedLanguages = <String>[];
    List<dynamic> langList = await getLanguages();
    for (dynamic lang in langList) {
      String? displayLang = await getDisplayLanguageByCode(lang);
      if (displayLang != null) {
        displayedLanguages.add(displayLang);
      }
    }
    return displayedLanguages;
  }

  Future<String?> getDisplayLanguageByCode(String langCode) async {
    if (langCode.isEmpty) {
      return null;
    }

    Map<String, dynamic> languageNamesDict =
        locales['language-names'] as Map<String, dynamic>;
    if (languageNamesDict.containsKey(langCode)) {
      final List<dynamic> langNames =
          languageNamesDict[langCode] as List<dynamic>;
      String displayLang = langNames.first as String;
      return displayLang;
    }

    return null;
  }

  Future<String?> getLanguageCodeByName(String languageName) async {
    if (languageName.isEmpty) {
      return Future.value(null);
    }

    Map<String, dynamic> langName =
        locales['language-names'] as Map<String, dynamic>;

    String? languageCode = langName.keys.firstWhereOrNull((dynamic key) {
      List<dynamic> langNameList = langName[key as String] as List<dynamic>;
      return (langNameList.first as String) == languageName;
    });

    return languageCode;
  }
}
