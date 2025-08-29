import 'dart:io';

import 'package:flutter/material.dart';
import 'package:frontend/core/theme/theme.dart';
import 'package:image_picker/image_picker.dart';

class AvatarPicker extends StatefulWidget {
  final double size;
  final Function(File?) onImageSelected;

  const AvatarPicker({super.key, this.size = 100, required this.onImageSelected});

  @override
  State<AvatarPicker> createState() => _AvatarPickerState();
}

class _AvatarPickerState extends State<AvatarPicker> {
  File? _imageFile;

  Future<void> _pickImage() async {
    final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _imageFile = File(pickedFile.path);
      });
      widget.onImageSelected(_imageFile);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        GestureDetector(
          onTap: _pickImage,
          child: CircleAvatar(
            radius: widget.size * 2 / 3,
            backgroundColor: Colors.grey[300],
            backgroundImage: _imageFile != null ? FileImage(_imageFile!) : null,
            child: _imageFile == null ? Icon(Icons.person, size: widget.size * 2 / 3, color: Colors.black54) : null,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          "Chọn ảnh đại diện",
          style: TextStyle(color: DefaultColors.greyText, fontSize: FontsSizes.standardUp),
        ),
      ],
    );
  }
}
