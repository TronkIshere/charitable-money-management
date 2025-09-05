import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:frontend/core/theme/theme.dart';

class ReportCampaignDropDownBar extends StatefulWidget {
  const ReportCampaignDropDownBar({super.key});

  @override
  State<ReportCampaignDropDownBar> createState() => _ReportCampaignDropDownBarState();
}

class _ReportCampaignDropDownBarState extends State<ReportCampaignDropDownBar> {
  String selectedOption = 'Chiến dịch giả mạo';

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const Text(
            "Báo cáo gian lận: ",
            style: TextStyle(color: DefaultColors.darkText, fontWeight: FontWeight.w600, fontSize: 18),
            overflow: TextOverflow.ellipsis,
          ),
          DropdownButtonHideUnderline(
            child: DropdownButton2<String>(
              value: selectedOption,
              isExpanded: false, // giữ icon + text gọn lại
              style: const TextStyle(fontSize: 16, color: DefaultColors.darkText),
              buttonStyleData: const ButtonStyleData(
                padding: EdgeInsets.symmetric(horizontal: 8),
                height: 40,
                width: null, // để nó co theo nội dung
              ),
              iconStyleData: const IconStyleData(
                icon: Icon(Icons.arrow_drop_down, color: DefaultColors.darkText, size: 20),
                iconSize: 20,
                openMenuIcon: Icon(Icons.arrow_drop_up, color: DefaultColors.darkText, size: 20),
              ),
              selectedItemBuilder: (context) {
                return [
                  'Chiến dịch giả mạo',
                  'Thông tin sai sự thật',
                  'Lạm dụng quyên góp',
                  'Trùng lặp chiến dịch',
                  'Khác',
                ].map((item) {
                  return Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        item,
                        style: const TextStyle(
                          color: DefaultColors.greyText,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  );
                }).toList();
              },

              items: const [
                DropdownMenuItem(value: 'Chiến dịch giả mạo', child: Text('Chiến dịch giả mạo')),
                DropdownMenuItem(value: 'Thông tin sai sự thật', child: Text('Thông tin sai sự thật')),
                DropdownMenuItem(value: 'Lạm dụng quyên góp', child: Text('Lạm dụng quyên góp')),
                DropdownMenuItem(value: 'Trùng lặp chiến dịch', child: Text('Trùng lặp chiến dịch')),
                DropdownMenuItem(value: 'Khác', child: Text('Khác')),
              ],

              onChanged: (value) {
                setState(() {
                  selectedOption = value!;
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}
