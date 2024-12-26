import 'package:flutter/material.dart';
import 'package:noteapp_getx/controllers/notes_controller.dart';
import 'package:noteapp_getx/models/notes_model.dart';
import 'package:get/get.dart';
import 'package:noteapp_getx/screens/create_update_note.dart';

class CustomNotesTile extends StatelessWidget {
  final NotesModel note;
  final int index;

  const CustomNotesTile({
    super.key,
    required this.note,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NotesController());
    return Container(
      decoration: BoxDecoration(
        color: Colors.white10,
        borderRadius: BorderRadius.circular(13),
      ),
      child: ListTile(
        onTap: () {
          Get.to(
            () => CreateUpdateNote(
              appbartitle: "Update Note",
              note: note,
            ),
          );
        },
        contentPadding: const EdgeInsets.fromLTRB(10, 10, 5, 10),
        title: Text(
          note.title,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 20,
          ),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              note.description,
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                color: Colors.white70,
                fontSize: 16,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              "Created At: ${note.createdat.day}-${note.createdat.month}-${note.createdat.year}: ${note.createdat.hour}.${note.createdat.minute}",
              style: const TextStyle(color: Colors.white54),
            ),
          ],
        ),
        trailing: IconButton(
          onPressed: () {
            controller.deleteNote(index);
          },
          icon: const Icon(
            Icons.delete,
            color: Colors.white60,
          ),
        ),
      ),
    );
  }
}
