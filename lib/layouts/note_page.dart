import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:note_app/models/note_database.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';

class NotePage extends StatefulWidget {
  const NotePage({super.key});

  @override
  State<NotePage> createState() => _NotePageState();
}

class _NotePageState extends State<NotePage> {
  @override
  void initState() {
    super.initState();
    readNotes();
  }

  // Access user input
  final textController = TextEditingController();

  // Create
  void createNote() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: TextField(
          controller: textController,
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.save),
            color: Colors.blueGrey,
            onPressed: () {
              String text = textController.text;
              if (text.isNotEmpty) {
                context.read<NoteDatabase>().addNote(text);
                Navigator.pop(context);
                textController.clear();
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Note secured')));
              }
            }
          )
        ],
      )
    );
  }

  // Read
  void readNotes() {
    context.read<NoteDatabase>().fetchNote();
  }

  // Update
  void editNote(int id, note) {
    textController.text = note;
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: TextField(
          controller: textController,
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.save),
            color: Colors.blueGrey,
            onPressed: () {
              String text = textController.text;
              if (text.isNotEmpty) {
                context.read<NoteDatabase>().updateNote(id, text);
                Navigator.pop(context);
                textController.clear();
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Updated and fresh!')));
              }
            }
          )
        ],
      )
    );
  }

  // Delete
  void deleteNote(int id) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: const Text(
          "Delete Note?",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 20,
            fontFamily: 'Quicksand',
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              context.read<NoteDatabase>().deleteNote(id);
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Poof! Gone like the wind')));
            },
            icon: const Icon(
              Icons.done,
            ),
          ),
          IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.cancel_outlined,
            ),
          ),
        ],
      ) 
    );
  }

  // Miscellaneous

  // Share Note
  void share(String note) {
    Share.share(note);
  }

  void copy(String note) {
    Clipboard.setData (
      ClipboardData(
        text: note
        )
    );
    ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Copied and locked! Paste at your leisure!')));
  }


  @override
  Widget build(BuildContext context) {
    List notes = context.watch<NoteDatabase>().notes;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Notes"),
        titleTextStyle: const TextStyle(
          fontFamily: "Quicksand",
          color: Colors.blueGrey,
          fontWeight: FontWeight.bold,
          fontSize: 30
        ),
        centerTitle: true,
        backgroundColor: Colors.blueGrey[50],
      ),

      body: notes.isNotEmpty  ? Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
          itemCount: notes.length,
          itemBuilder: (context, index) {
          final note = notes[index];
          return Card(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    note.note,
                    style: const TextStyle(
                      fontFamily: "Quicksand",
                      fontWeight: FontWeight.w600
                    ),
                  ),
                  Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          editNote(note.id, note.note);
                        },
                        icon: const Icon(
                          Icons.edit,
                          color: Colors.blueGrey,
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          copy(note.note);
                        },
                        icon: const Icon(
                          Icons.copy,
                          color: Colors.blueGrey,
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          share(note.note);
                        },
                        icon: const Icon(
                          Icons.share,
                          color: Colors.blueGrey,
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          deleteNote(note.id);
                        },
                        icon: const Icon(
                          Icons.delete,
                          color: Colors.blueGrey,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        }),
      ) : const Center(child: Text(
          "No notes yet, tap the icon below to add",
          style: TextStyle(
            color: Colors.blueGrey,
          ),
          )
        ),

      floatingActionButton: FloatingActionButton(
        onPressed: createNote,
        backgroundColor: Colors.blueGrey[200],
        child: Icon(
          Icons.add,
          color: Colors.blueGrey[900],
        ),
      ),
    );
  }
}