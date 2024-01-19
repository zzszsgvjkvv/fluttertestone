import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class Userimge extends StatefulWidget {
  const Userimge({super.key, required this.onpicimage});
  final void Function(File picimage) onpicimage;
  @override
  State<Userimge> createState() => _UserimgeState();
}

class _UserimgeState extends State<Userimge> {
  File? imagepicer;
  void picimage() async {
    final XFile? fileimage = await ImagePicker()
        .pickImage(source: ImageSource.camera, maxWidth: 150, imageQuality: 50);
    if (fileimage == null) {
      return;
    }
    setState(() {
      imagepicer = File(fileimage.path);
    });
    widget.onpicimage(imagepicer!);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          radius: 40,
          backgroundColor: Theme.of(context).colorScheme.primary,
          foregroundImage: imagepicer == null ? null : FileImage(imagepicer!),
        ),
        TextButton.icon(
            onPressed: picimage,
            icon: Icon(Icons.image),
            label: Text(
              "select image",
              style: TextStyle(
                color: Theme.of(context).colorScheme.primary,
              ),
            ))
      ],
    );
  }
}
