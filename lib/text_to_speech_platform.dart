import 'package:plugin_platform_interface/plugin_platform_interface.dart';
import 'method_channel_text_to_speech.dart';

abstract class TextToSpeechPlatform extends PlatformInterface{
  TextToSpeechPlatform() : super(token: _token);

  static final Object _token = Object();

  static TextToSpeechPlatform _instance = MethodChannelTextToSpeech();

  /// Getter of current platform instance
  static TextToSpeechPlatform get instance => _instance;

  /// Setter
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

  Future<List<String>?> getDisplayLanguages() async {
    throw UnimplementedError('getDisplayLanguages() has not been implemented');
  }

  Future<String?> getDisplayLanguageByCode(String langCode) async {
    throw UnimplementedError('getDisplayLanguageByCode() has not been implemented');
  }

  Future<String?> getLanguageCodeByName(String languageName) async {
    throw UnimplementedError('getLanguageCodeByName() has not been implemented');
  }

  Future<List<String>?> getVoice() async {
    throw UnimplementedError('getVoice() has not been implemented');
  }

  Future<List<String>?> getVoiceByLang(String lang) async {
    throw UnimplementedError('getVoiceByLang() has not been implemented');
  }

  Future<Map<String, dynamic>?> getLocales() async {
    throw UnimplementedError('getLocales() has not been implemented');
  }

}