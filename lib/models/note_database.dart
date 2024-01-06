import 'package:isar/isar.dart';
import 'package:note_app/models/note.dart';
import 'package:path_provider/path_provider.dart';

class NoteDatabase {
  static late Isar isar;

  // Initialize DB
  static Future<void> initialize() async {
    final dir = await getApplicationDocumentsDirectory();
    final isar = Isar.open(
      [NoteSchema],
      directory: dir.path
    );
  }

  // List Notes
  List<Note> notes = [];

  // Handle CRUD operations

  // CREATE
  void addNote(String note, DateTime created) async {
    final newNote = Note()..note = note..created = DateTime.now();
    await isar.writeTxn(() => isar.notes.put(newNote));
  }
}