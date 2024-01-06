import 'package:flutter/material.dart';
import 'package:note_app/models/note_database.dart';
import 'package:provider/provider.dart';

class NotePage extends StatefulWidget {
  const NotePage({super.key});

  @override
  State<NotePage> createState() => _NotePageState();
}

class _NotePageState extends State<NotePage> {
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
              context.read<NoteDatabase>().addNote(textController.text);
            }
          )
        ],
      )
    );
  }

  // Update

  // Delete


  @override
  Widget build(BuildContext context) {
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
      floatingActionButton: FloatingActionButton(
        onPressed: createNote,
        backgroundColor: Colors.blueGrey[200],
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }
}