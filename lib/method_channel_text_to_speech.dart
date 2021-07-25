import 'package:flutter/services.dart';
import 'locales.dart';
import 'text_to_speech_platform.dart';

const MethodChannel _channel = MethodChannel('dev.ixsans/text_to_speech');

class MethodChannelTextToSpeech extends TextToSpeechPlatform {
  @override
  Future<bool?> speak(String text) {
    return _channel.invokeMethod<bool>('speak', <String, Object>{'text': text});
  }

  @override
  Future<bool?> stop() {
    return _channel.invokeMethod('stop');
  }

  @override
  Future<bool?> pause() {
    return _channel.invokeMethod('pause');
  }

  @override
  Future<bool?> resume() {
    return _channel.invokeMethod('resume');
  }

  @override
  Future<bool?> setRate(num rate) {
    return _channel.invokeMethod('setRate', <String, dynamic>{'rate': rate});
  }

  @override
  Future<bool?> setVolume(num volume) {
    return _channel
        .invokeMethod('setVolume', <String, dynamic>{'volume': volume});
  }

  @override
  Future<bool?> setLanguage(String language) {
    if (language.isEmpty) {
      return Future.value(false);
    }
    return _channel
        .invokeMethod('setLanguage', <String, dynamic>{'lang': language});
  }

  @override
  Future<bool?> setPitch(num pitch) {
    return _channel.invokeMethod('setPitch', <String, dynamic>{'pitch': pitch});
  }

  @override
  Future<List<String>> getLanguages() async {
    List<dynamic> langCodes = await _channel.invokeMethod('getLanguages');
    return langCodes.map((dynamic e) => e as String).toList();
  }

  @override
  Future<String?> getDefaultLanguage() async {
    return _channel.invokeMethod('getDefaultLanguage') as String?;
  }

  @override
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

  @override
  Future<String?> getDisplayLanguageByCode(String langCode) async {
    if (langCode.isEmpty) {
      return null;
    }

    Map<String, dynamic> langNameMap =
        locales['language-names'] as Map<String, dynamic>;
    if (langNameMap.containsKey(langCode)) {
      final List<dynamic> langNames = langNameMap[langCode] as List<dynamic>;
      String displayLang = langNames.first as String;
      return displayLang;
    }

    return null;
  }

  @override
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

  @override
  Future<List<String>?> getVoice() async {
    List<dynamic> voices = await _channel.invokeMethod('getVoices');
    return voices.map((dynamic e) => e as String).toList();
  }

  @override
  Future<List<String>?> getVoiceByLang(String lang) async {
    List<dynamic> voices = await _channel
        .invokeMethod('getVoiceByLanguage', <String, dynamic>{'lang': lang});
    return voices.map((dynamic e) => e as String).toList();
  }
}

extension FirstWhereOrNullExtension<E> on Iterable<E> {
  E? firstWhereOrNull(bool Function(E) test) {
    for (E element in this) {
      if (test(element)) return element;
    }
    return null;
  }
}
