import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:noteapp_getx/controllers/notes_controller.dart';
import 'package:noteapp_getx/screens/create_update_note.dart';
import 'package:noteapp_getx/widgets/custom_notes_tile.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NotesController());

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        centerTitle: false,
        backgroundColor: Colors.black,
        title: const Text(
          "Notes",
          style: TextStyle(
            fontSize: 30,
            color: Colors.white,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              controller.loadNotes();
            },
            icon: const Icon(
              Icons.settings,
              color: Colors.white,
            ),
          ),
        ],
      ),
      body: Obx(() {
        if (controller.notes.isEmpty) {
          return const Center(
            child: Text(
              "No Notes Found",
              style: TextStyle(
                color: Colors.white70,
              ),
            ),
          );
        } else {
          return ListView.separated(
            padding: const EdgeInsets.all(10),
            itemBuilder: (context, index) {
              return CustomNotesTile(
                note: controller.notes[index],
                index: index,
              );
            },
            separatorBuilder: (context, index) {
              return const SizedBox(
                height: 10,
              );
            },
            itemCount: controller.notes.length,
          );
        }
      }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.to(
            () => const CreateUpdateNote(appbartitle: "Create Note",),
          );
        },
        backgroundColor: Colors.white70,
        shape: const CircleBorder(),
        child: const Icon(
          Icons.add,
          color: Colors.black,
        ),
      ),
    );
  }
}
