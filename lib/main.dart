import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:local_notes_flutter/Cubites/read_notes/read_notes_cubit.dart';
import 'package:local_notes_flutter/Models/note_model.dart';
import 'package:local_notes_flutter/Views/notes_view.dart';
import 'package:local_notes_flutter/observer/simple_observer.dart';

void main() async {
  await Hive.initFlutter();
  Bloc.observer = SimpleObserver();
  Hive.registerAdapter(NoteModelAdapter());
  await Hive.openBox<NoteModel>("note_box");
  runApp(const NotesApp());
}

class NotesApp extends StatelessWidget {
  const NotesApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ReadNotesCubit(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          brightness: Brightness.dark,
          fontFamily: 'Poppins',
        ),
        home: const NotesView(),
      ),
    );
  }
}
