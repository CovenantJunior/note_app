import 'package:flutter/material.dart';

class NoteDrawerTile extends StatelessWidget {
  
  final String title;
  final Widget leading;
  final void Function()? onTap;


  const NoteDrawerTile({
    super.key,
    required this.title,
    required this.leading,
    this.onTap
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title),
      leading: leading,
      onTap: onTap,
    );
  }
}