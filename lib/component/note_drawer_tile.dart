import 'package:flutter/material.dart';

class NoteDrawerTile extends StatefulWidget {
  const NoteDrawerTile({
    super.key,
    required String title,
    required Icon leading,
    required onTap
  });

  @override
  State<NoteDrawerTile> createState() => _NoteDrawerTileState();
}

class _NoteDrawerTileState extends State<NoteDrawerTile> {
  late final String title;
  late final Widget leading;
  late final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListTile(
        title: Text(title),
        leading: leading,
        onTap: onTap,
      ),
    );
  }
}