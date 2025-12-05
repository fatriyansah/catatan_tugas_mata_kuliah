import '../assignment.dart';
import 'ai_service.dart';

class AssignmentAIHelper {
  /// Menghasilkan deskripsi otomatis berdasarkan judul & mata kuliah
  static Future<String> generateDescription(Assignment a) async {
    final prompt = """
Buatkan deskripsi singkat, jelas, dan formal untuk tugas kuliah berikut:
Judul: ${a.title}
Mata Kuliah: ${a.course}
Deadline: ${a.dueDate}

Deskripsi maksimal 3 paragraf, nada profesional.
""";

    return await AIService.ask(prompt);
  }

  /// Ringkas assignment untuk tampilan cepat
  static Future<String> summarize(Assignment a) async {
    final prompt = """
Ringkas tugas berikut menjadi 2 kalimat:
Judul: ${a.title}
Deskripsi: ${a.description ?? "-"}
Deadline: ${a.dueDate}
""";

    return await AIService.ask(prompt);
  }

  /// Sarankan langkah pengerjaan tugas
  static Future<String> generateSteps(Assignment a) async {
    final prompt = """
Buatkan list langkah-langkah pengerjaan tugas berikut:
Judul: ${a.title}
Deskripsi: ${a.description ?? "-"}
Mata kuliah: ${a.course}

Berikan output dalam format:
1. ...
2. ...
""";

    return await AIService.ask(prompt);
  }
}
