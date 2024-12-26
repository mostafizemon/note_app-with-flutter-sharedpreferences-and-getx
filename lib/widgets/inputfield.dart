import 'package:flutter/material.dart';

import '../controllers/notes_controller.dart';

class InputField extends StatelessWidget {
  const InputField({
    super.key,
    required this.controller,
  });

  final NotesController controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        children: [
          TextFormField(
            controller: controller.titlecontroller,
            decoration: const InputDecoration(
                border: InputBorder.none,
                hintText: "Title..",
                hintStyle: TextStyle(
                  color: Colors.white70,
                )),
            style: const TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
          ),
          Expanded(
            child: TextFormField(
              controller: controller.descriptioncontroller,
              minLines: 100,
              maxLines: 100,
              decoration: const InputDecoration(
                  border: InputBorder.none,
                  hintText: "Description",
                  hintStyle: TextStyle(
                    color: Colors.white70,
                  )),
              style: const TextStyle(
                fontSize: 20,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}