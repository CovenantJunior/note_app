import 'package:flutter/material.dart';

class NotePage extends StatefulWidget {
  const NotePage({super.key});

  @override
  State<NotePage> createState() => _NotePageState();
}

class _NotePageState extends State<NotePage> {
  // CUD Operations

  // Create
  void createNote() {
    showDialog(
      context: context,
      builder: (context) => const AlertDialog(
        content: TextField(),
        actions: [
          Icon(
            Icons.save,
            color: Colors.blueGrey,
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