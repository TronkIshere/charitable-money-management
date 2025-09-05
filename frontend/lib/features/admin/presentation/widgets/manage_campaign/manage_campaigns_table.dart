import 'package:flutter/material.dart';
import 'package:frontend/features/admin/presentation/widgets/manage_campaign/manage_campaigns_button.dart';

class ManageCampaignsTable extends StatelessWidget {
  final List<Map<String, dynamic>> campaigns;
  const ManageCampaignsTable({super.key, required this.campaigns});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 8, offset: const Offset(0, 4))],
          ),
          child: DataTable(
            dataRowHeight: 56,
            headingRowHeight: 56,
            headingRowColor: MaterialStateProperty.all(Colors.grey.shade100),
            dataRowColor: MaterialStateProperty.resolveWith<Color?>((Set<MaterialState> states) {
              // xen kẽ màu row
              if (states.contains(MaterialState.selected)) {
                return Colors.grey.shade200;
              }
              return null;
            }),
            columnSpacing: 32,
            border: TableBorder.symmetric(inside: BorderSide(color: Colors.grey.shade300)),
            columns: const [
              DataColumn(
                label: Text("Tên", style: TextStyle(fontWeight: FontWeight.bold)),
              ),
              DataColumn(
                label: Text("Trạng thái", style: TextStyle(fontWeight: FontWeight.bold)),
              ),
              DataColumn(
                label: Text("Số tiền gây quỹ được", style: TextStyle(fontWeight: FontWeight.bold)),
              ),
              DataColumn(
                label: Text("Mục tiêu", style: TextStyle(fontWeight: FontWeight.bold)),
              ),
              DataColumn(
                label: Text("Thao tác", style: TextStyle(fontWeight: FontWeight.bold)),
              ),
            ],
            rows: List.generate(campaigns.length, (index) {
              final campaign = campaigns[index];
              return DataRow(
                color: MaterialStateProperty.all(index.isEven ? Colors.grey.shade50 : Colors.white),
                cells: [
                  DataCell(Text(campaign["title"])),
                  DataCell(Text(campaign["status"])),
                  DataCell(Text("${campaign["raised"]} đ")),
                  DataCell(Text("${campaign["goal"]} đ")),
                  DataCell(
                    Row(
                      children: [
                        const ManageCampaignsButton(title: "Chi tiết", horizontal: 15, vertical: 6),
                        const SizedBox(width: 8),
                        const ManageCampaignsButton(title: "Sửa", horizontal: 15, vertical: 5),
                      ],
                    ),
                  ),
                ],
              );
            }),
          ),
        ),
      ),
    );
  }
}
