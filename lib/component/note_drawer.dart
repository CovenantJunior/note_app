import 'package:flutter/material.dart';
import 'package:note_app/component/note_drawer_tile.dart';
import 'package:note_app/layouts/note_page.dart';
import 'package:note_app/layouts/note_settings.dart';

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
              Navigator.push(context, MaterialPageRoute(builder: (context) => const NotePage()));
            }
          ),

          NoteDrawerTile(
            title: "Settings",
            leading: const Icon(Icons.settings),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(context, MaterialPageRoute(builder: (context) => const NoteSettings()));
            }
          )
        ],
      ),
    );
  }
}