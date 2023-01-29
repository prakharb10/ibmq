import 'package:data_table_2/data_table_2.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ibmq/jobs/cubit/jobs_cache_cubit.dart';
import 'package:ibmq/jobs/cursor/bloc/cursors_bloc.dart';
import 'package:ibmq/jobs/data/jobs_data_table_source.dart';
import 'package:ibmq/router.dart';

class JobsPage extends StatefulWidget {
  final Dio dio;
  final Dio runtimeDio;
  final IBMQAppState appState;
  const JobsPage({
    Key? key,
    required this.dio,
    required this.runtimeDio,
    required this.appState,
  }) : super(key: key);

  @override
  State<JobsPage> createState() => _JobsPageState();
}

class _JobsPageState extends State<JobsPage> {
  // int _rowsPerPage = 10;

  @override
  void initState() {
    super.initState();
    context.read<CursorsBloc>().add(GetCursors());
    context.read<JobsCacheCubit>().getJobs();
  }

  @override
  Widget build(BuildContext context) {
    return AsyncPaginatedDataTable2(
      columns: const [
        DataColumn2(label: Text("Job Id")),
        DataColumn2(label: Text("Status")),
        DataColumn2(label: Text("Created")),
        DataColumn2(label: Text("Run")),
        DataColumn2(label: Text("Program")),
        DataColumn2(
          label: Text("Compute Resource"),
          size: ColumnSize.L,
        ),
        DataColumn2(
          label: Text("Provider"),
          size: ColumnSize.L,
        ),
        DataColumn2(label: Text("QR Usage")),
        DataColumn2(label: Text("Tags")),
      ],
      source: JobsDataTableSource(
        dio: widget.dio,
        runtimeDio: widget.runtimeDio,
        appState: widget.appState,
        bloc: context.read<CursorsBloc>(),
        jobsCacheCubit: context.read<JobsCacheCubit>(),
      ),
      wrapInCard: false,
      fixedLeftColumns: 1,
      minWidth: 1600,
      sortColumnIndex: 2,
      // TODO: Handle changing rows per page
      // rowsPerPage: _rowsPerPage,
      // availableRowsPerPage: const [10, 20, 50],
      // onRowsPerPageChanged: (value) => _rowsPerPage = value!,
    );
  }
}
