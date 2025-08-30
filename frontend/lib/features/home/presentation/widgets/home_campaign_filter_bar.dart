import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:frontend/core/theme/theme.dart';

class HomeCampaignFilterBar extends StatefulWidget {
  const HomeCampaignFilterBar({super.key});

  @override
  State<HomeCampaignFilterBar> createState() => _CampaignFilterBarState();
}

class _CampaignFilterBarState extends State<HomeCampaignFilterBar> {
  String selectedOption = 'Kết thúc sớm';

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            "Đang nổi lên",
            style: TextStyle(color: DefaultColors.darkText, fontWeight: FontWeight.w600, fontSize: 18),
            overflow: TextOverflow.ellipsis,
          ),
          DropdownButtonHideUnderline(
            child: DropdownButton2<String>(
              value: selectedOption,
              isDense: true,
              style: const TextStyle(fontSize: 14, color: DefaultColors.darkText),
              alignment: Alignment.centerRight,
              buttonStyleData: const ButtonStyleData(
                padding: EdgeInsets.symmetric(horizontal: 8),
                height: 40,
                width: 180,
              ),
              dropdownStyleData: DropdownStyleData(
                maxHeight: 200,
                decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(12)),
                offset: const Offset(0, -5),
              ),
              iconStyleData: const IconStyleData(icon: Icon(Icons.arrow_drop_down, color: DefaultColors.darkText)),
              items: const [
                DropdownMenuItem(
                  value: 'Kết thúc sớm',
                  child: Text('Kết thúc sớm', style: TextStyle(color: DefaultColors.darkText)),
                ),
                DropdownMenuItem(
                  value: 'Mới nhất',
                  child: Text('Mới nhất', style: TextStyle(color: DefaultColors.darkText)),
                ),
                DropdownMenuItem(
                  value: 'Gây quỹ nhiều nhất',
                  child: Text('Gây quỹ nhiều nhất', style: TextStyle(color: DefaultColors.darkText)),
                ),
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
