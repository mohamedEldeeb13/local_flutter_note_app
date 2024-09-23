import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:local_notes_flutter/Views/Widgets/custom_app_bar.dart';
import 'package:local_notes_flutter/Views/Widgets/notes_list_view.dart';

class NotesViewBody extends StatelessWidget {
  const NotesViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          const SizedBox(
            height: 60,
          ),
          CustomAppBar(
            title: "Notes",
            icon: FontAwesomeIcons.magnifyingGlass,
            onTap: () {},
          ),
          const Expanded(child: NotesListView())
        ],
      ),
    );
  }
}
