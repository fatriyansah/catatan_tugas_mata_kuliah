// ignore: depend_on_referenced_packages
import 'package:google_generative_ai/google_generative_ai.dart';

class AIService {
  static const _apiKey = "AIzaSyDBiEwh6XeqY5Abv8TyOwZ2t4iidHgXIUY";

  static final _model = GenerativeModel(
    model: 'gemini-1.5-flash',
    apiKey: _apiKey,
  );

  static Future<String> ask(String prompt) async {
    if (_apiKey.isEmpty) {
      return "API Key belum disetting.";
    }

    try {
      final response = await _model.generateContent([
        Content.text(prompt),
      ]);
      return response.text ?? "Tidak ada respons.";
    } catch (e) {
      return "Terjadi kesalahan AI: $e";
    }
  }

  // Tambahkan ini jika ingin tetap pakai nama lama
  static Future<String> askGemini(String prompt) {
    return ask(prompt);
  }
}
