import 'package:flutter/material.dart';
import 'package:note_app/layouts/note_page.dart';
import 'package:note_app/models/note_database.dart';
import 'package:note_app/theme/theme_provider.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await NoteDatabase.initialize();
  runApp(
    
    MultiProvider(
      providers: [
        // Note Database Provider
        ChangeNotifierProvider(
          create: (context) => NoteDatabase(),
          child: const MyApp()
        ),
        
        // Theme Provider
        ChangeNotifierProvider(
          create: (context) => ThemeProvider(),
          child: const MyApp()
        )
      ],
    )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: NotePage(),
    );
  }
}