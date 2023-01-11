import 'package:data_table_2/data_table_2.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

import '../model/job.dart';
import 'jobs_data_provider.dart';

class JobsDataTableSource extends AsyncDataTableSource {
  final Dio dio;

  JobsDataTableSource(this.dio);
  // `start` is the number of rows to be skipped
  // `end` is the number of rows to be fetched i.e. limit
  @override
  Future<AsyncRowsResponse> getRows(int start, int end) async {
    final jobsDataProvider = JobsDataProvider(dio);
    final response = await jobsDataProvider.getJobs(start, end);
    final totalRows = response.data['meta']['count'] as int;
    final items = response.data['items'] as List;
    // TODO: Compute this in a separate isolate
    final jobs = items.map((e) => Job.fromJson(e)).toList();
    final rows = jobs
        .map(
          (e) => DataRow2(
            cells: [
              DataCell(
                Text(e.id),
                onLongPress: () async =>
                    await Clipboard.setData(ClipboardData(text: e.id)),
              ),
              DataCell(Text(e.status.name)),
              DataCell(Text(DateFormat.yMd().format(e.creationDate))),
              DataCell(
                Text(e.endDate != null
                    ? DateFormat.yMd().format(e.endDate!)
                    : "Running"),
              ),
              DataCell(Text(e.backend.name)),
              DataCell(Text(e.provider.toString())),
              DataCell(Text(e.tags.toString())),
            ],
            key: ValueKey(e.id),
          ),
        )
        .toList();
    return AsyncRowsResponse(totalRows, rows);
  }
}
