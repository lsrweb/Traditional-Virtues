import 'package:flutter_tts/flutter_tts.dart';

/// The TTS speed.
///

class TtsSpeedUtils {
  // 构造初始化,可以定义 语言|音量|语速|音调
  final FlutterTts flutterTts = FlutterTts();

  // Constructs a [TtsSpeedUtils]

  TtsSpeedUtils() {
    flutterTts.setLanguage('zh-CN');
    flutterTts.setVolume(1.0);
    flutterTts.setSpeechRate(0.5);
    flutterTts.setPitch(1.0);
  }

  // 播放传入的文本
  Future<void> speak(String text) async {
    await flutterTts.speak(text);
  }
}
