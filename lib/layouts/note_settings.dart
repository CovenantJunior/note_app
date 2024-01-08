import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:note_app/theme/theme_provider.dart';
import 'package:provider/provider.dart';

class NoteSettings extends StatefulWidget {
  const NoteSettings({super.key});

  @override
  State<NoteSettings> createState() => _NoteSettingsState();
}

class _NoteSettingsState extends State<NoteSettings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Settings"),
        titleTextStyle: const TextStyle(
          fontFamily: "Quicksand",
          fontSize: 20,
          fontWeight: FontWeight.bold
        ),
        centerTitle: true,
      ),

      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text('Dark Mode'),
            CupertinoSwitch(
              value: Provider.of<ThemeProvider>(context, listen: false).isDarkMode,
              onChanged: (value) => Provider.of<ThemeProvider>(context, listen: false).toggleTheme()
            )
          ],
        ),
      ),
    );
  }
}