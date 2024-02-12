import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

class ResultsSection extends StatelessWidget {
  final String name;
  final String type;
  final String description;
  final String content;
  const ResultsSection({
    super.key,
    required this.name,
    required this.type,
    required this.description,
    required this.content,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: DataTable(
            dividerThickness: 0,
            columns: [
              const DataColumn(label: Expanded(child: Text("Name"))),
              DataColumn(label: Expanded(child: Text(name))),
            ],
            rows: [
              DataRow(
                cells: [const DataCell(Text("Type")), DataCell(Text(type))],
              ),
              DataRow(
                cells: [
                  const DataCell(Text("Description")),
                  DataCell(Text(description)),
                ],
              ),
            ],
          ),
        ),
        ConstrainedBox(
          constraints: BoxConstraints(
              maxHeight: MediaQuery.of(context).size.height * 0.5),
          child: Markdown(
            data: "```\n$content\n```",
            selectable: true,
            shrinkWrap: true,
          ),
        ),
      ],
    );
  }
}
