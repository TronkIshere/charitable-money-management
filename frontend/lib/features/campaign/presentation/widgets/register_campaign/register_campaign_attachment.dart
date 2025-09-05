import 'package:flutter/material.dart';
import 'package:frontend/core/theme/theme.dart';

class RegisterCampaignAttachment extends StatefulWidget {
  final String label;
  const RegisterCampaignAttachment({super.key, required this.label});

  @override
  State<RegisterCampaignAttachment> createState() => _RegisterCampaignAttachmentState();
}

class _RegisterCampaignAttachmentState extends State<RegisterCampaignAttachment> {
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
        Text(
          widget.label, // sửa ở đây
          style: const TextStyle(color: DefaultColors.darkText, fontWeight: FontWeight.w600, fontSize: 18),
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
