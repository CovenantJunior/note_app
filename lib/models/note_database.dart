import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

class NoteDatabase {
  static late Isar isar;

  // Initialize DB
  static Future<void> Initialize() async {
    final dir = getApplicationDocumentsDirectory();
  }

  // Handle CRUD operations

}