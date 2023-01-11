import 'package:data_table_2/data_table_2.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:ibmq/jobs/data/jobs_data_table_source.dart';

class JobsPage extends StatefulWidget {
  final Dio dio;
  const JobsPage({Key? key, required this.dio}) : super(key: key);

  @override
  State<JobsPage> createState() => _JobsPageState();
}

class _JobsPageState extends State<JobsPage> {
  int _rowsPerPage = 10;
  @override
  Widget build(BuildContext context) {
    return AsyncPaginatedDataTable2(
      columns: const [
        DataColumn2(label: Text("Job Id")),
        DataColumn2(label: Text("Status")),
        DataColumn2(label: Text("Created")),
        DataColumn2(label: Text("Run")),
        DataColumn2(
          label: Text("Compute Resource"),
          size: ColumnSize.L,
        ),
        DataColumn2(
          label: Text("Provider"),
          size: ColumnSize.L,
        ),
        DataColumn2(label: Text("Tags")),
      ],
      source: JobsDataTableSource(widget.dio),
      wrapInCard: false,
      fixedLeftColumns: 1,
      minWidth: 1200,
      sortColumnIndex: 2,
      rowsPerPage: _rowsPerPage,
      availableRowsPerPage: const [10, 20, 50],
      onRowsPerPageChanged: (value) => _rowsPerPage = value!,
    );
  }
}
