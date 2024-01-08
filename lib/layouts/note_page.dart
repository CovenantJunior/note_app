import 'package:flutter/material.dart';
import 'package:note_app/component/note_drawer.dart';
import 'package:note_app/component/note_options.dart';
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
            // color: Colors.blueGrey,
            onPressed: () {
              String text = textController.text;
              if (text.isNotEmpty) {
                context.read<NoteDatabase>().addNote(text);
                Navigator.pop(context);
                textController.clear();
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text(
                    'Note secured',
                    style: TextStyle(
                      fontFamily: "Quicksand",
                      fontWeight: FontWeight.bold
                    )
                  )));
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text(
                    'Oops, blank shot!',
                    style: TextStyle(
                      fontFamily: "Quicksand",
                      fontWeight: FontWeight.bold
                    )
                  )));
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

  @override
  Widget build(BuildContext context) {
    List notes = context.watch<NoteDatabase>().notes;

    return Scaffold(
      appBar: AppBar(
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              "Notes",
              style: TextStyle(
                fontFamily: "Quicksand",
                fontWeight: FontWeight.bold,
                fontSize: 30
              ),
            ),
            SizedBox(width: 3),
            Icon(
              Icons.bookmark_added_rounded,
              // color: Colors.blueGrey,
            ),
          ],
        ),
        centerTitle: true,
      ),

      drawer: const NoteDrawer(),

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
                      fontWeight: FontWeight.w600,
                      fontSize: 16
                    ),
                  ),
                  NoteOptions(
                    id: note.id,
                    note: note.note
                  )
                ],
              ),
            ),
          );
        }),
      ) : const Center(child: Text(
          "No notes yet, tap the icon below to add",
          style: TextStyle(
            // color: Colors.blueGrey,
          ),
          )
        ),

      floatingActionButton: FloatingActionButton(
        onPressed: createNote,
        backgroundColor: Theme.of(context).colorScheme.background,
        child: const Icon(
          Icons.add,
          // color: Colors.blueGrey,
        ),
      ),
    );
  }
}