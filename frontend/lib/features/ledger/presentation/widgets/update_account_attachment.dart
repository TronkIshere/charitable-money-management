import 'package:flutter/material.dart';
import 'package:frontend/core/theme/theme.dart';

class UpdateAccountAttachment extends StatefulWidget {
  const UpdateAccountAttachment({super.key});

  @override
  State<UpdateAccountAttachment> createState() => _UpdateAccountAttachmentState();
}

class _UpdateAccountAttachmentState extends State<UpdateAccountAttachment> {
  final List<String> _attachments = [];

  void _addAttachment() {
    setState(() {
      _attachments.add("chung_cu_${_attachments.length + 1}.png");
    });
  }

  void _removeAttachment(int index) {
    setState(() {
      _attachments.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Đính kèm chứng cứ:",
          style: TextStyle(color: DefaultColors.darkText, fontWeight: FontWeight.w600, fontSize: 18),
        ),
        const SizedBox(height: 10),
        Center(
          child: OutlinedButton.icon(
            onPressed: _addAttachment,
            icon: const Icon(Icons.attach_file, color: DefaultColors.darkText),
            label: const Text("Thêm tệp"),
            style: OutlinedButton.styleFrom(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            ),
          ),
        ),
        const SizedBox(height: 10),
        if (_attachments.isNotEmpty)
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: List.generate(_attachments.length, (index) {
              final fileName = _attachments[index];
              return Chip(
                label: Text(fileName, overflow: TextOverflow.ellipsis),
                deleteIcon: const Icon(Icons.close),
                onDeleted: () => _removeAttachment(index),
              );
            }),
          ),
      ],
    );
  }
}
