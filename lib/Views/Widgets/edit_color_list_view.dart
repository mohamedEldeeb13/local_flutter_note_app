import 'package:flutter/material.dart';
import 'package:local_notes_flutter/Models/note_model.dart';
import 'package:local_notes_flutter/Views/Widgets/color_item.dart';

class EditColorListView extends StatefulWidget {
  const EditColorListView({super.key, required this.note});
  final NoteModel note;

  @override
  State<EditColorListView> createState() => _EditColorListViewState();
}

class _EditColorListViewState extends State<EditColorListView> {
  late int currentIndex;
  List<Color> colors = const [
    Color(0xffAC3931),
    Color(0xffE5D352),
    Color(0xffD9E76C),
    Color(0xff537D8D),
    Color(0xff482C3D),
  ];

  @override
  void initState() {
    super.initState();
    currentIndex = colors.indexOf(Color(widget.note.color));
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 35 * 2,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: colors.length,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.only(right: 5),
            child: GestureDetector(
              onTap: () {
                currentIndex = index;
                widget.note.color = colors[index].value;
                setState(() {});
              },
              child: ColorItem(
                isActive: currentIndex == index,
                backgroundColor: colors[index],
              ),
            ),
          );
        },
      ),
    );
  }
}
