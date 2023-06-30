import 'package:flutter/material.dart';
import 'package:notes/screens/note_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Notes',
      debugShowCheckedModeBanner: false,
      home: NoteScreen(),
    );
  }
}
