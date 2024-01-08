import 'package:flutter/material.dart';
import 'package:note_app/component/note_drawer_tile.dart';

class NoteDrawer extends StatefulWidget {
  const NoteDrawer({super.key});

  @override
  State<NoteDrawer> createState() => _NoteDrawerState();
}

class _NoteDrawerState extends State<NoteDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      semanticLabel: "Note Drawer Menu",
      child: Column(
        children: [
          const DrawerHeader(
            child: Icon(
              Icons.note_add_rounded
            ),
          ),
          NoteDrawerTile(
            title: "Home",
            leading: const Icon(Icons.home),
            onTap: () {
              Navigator.pop(context);
            }
          ),

          const NoteDrawerTile(
            title: "Settings",
            leading: Icon(Icons.settings),
            onTap: null
          )
        ],
      ),
    );
  }
}