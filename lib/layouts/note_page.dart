import 'package:flutter/material.dart';
import 'package:note_app/models/note_database.dart';
import 'package:provider/provider.dart';

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

  // Delete


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
                children: [
                  Text(
                    note.note,
                    style: const TextStyle(
                      fontFamily: "Quicksand",
                      fontWeight: FontWeight.w600
                    ),
                  ),
                  const Row(
                    children: [
                      IconButton.filled(onPressed: null, icon: Icon(Icons.edit)),
                      IconButton.filled(onPressed: null, icon: Icon(Icons.share)),
                      IconButton.filled(onPressed: null, icon: Icon(Icons.delete)),
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
        child: const Icon(
          Icons.add,
          color: Colors.blueGrey,
        ),
      ),
    );
  }
}