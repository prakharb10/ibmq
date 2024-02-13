import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ibmq/user/cubit/user_cubit.dart';
import 'package:macos_ui/macos_ui.dart';

class JobsPage extends StatefulWidget {
  final String accessToken;
  const JobsPage({
    super.key,
    required this.accessToken,
  });

  @override
  State<JobsPage> createState() => _JobsPageState();
}

class _JobsPageState extends State<JobsPage> {
  // int _rowsPerPage = 10;

  @override
  void initState() {
    super.initState();
    context.read<UserCubit>().loadUserInfo(widget.accessToken);
    // context.read<CursorsBloc>().add(GetCursors());
    // context.read<JobsCacheCubit>().getJobs();
  }

  @override
  Widget build(BuildContext context) {
    return switch (Theme.of(context).platform) {
      TargetPlatform.macOS => MacosScaffold(children: [
          ContentArea(
            builder: (context, scrollController) => const Center(
              child: Text('Jobs Page'),
            ),
          )
        ]),
      _ => const Center(
          child: Text('Jobs Page'),
        ),
    };
    // return AsyncPaginatedDataTable2(
    //   columns: const [
    //     DataColumn2(label: Text("Job Id")),
    //     DataColumn2(label: Text("Status")),
    //     DataColumn2(label: Text("Created")),
    //     DataColumn2(label: Text("Run")),
    //     DataColumn2(label: Text("Program")),
    //     DataColumn2(
    //       label: Text("Compute Resource"),
    //       size: ColumnSize.L,
    //     ),
    //     DataColumn2(
    //       label: Text("Provider"),
    //       size: ColumnSize.L,
    //     ),
    //     DataColumn2(label: Text("QR Usage")),
    //     DataColumn2(label: Text("Tags")),
    //   ],
    //   source: JobsDataTableSource(
    //     dio: widget.dio,
    //     runtimeDio: widget.runtimeDio,
    //     // appState: widget.appState,
    //     bloc: context.read<CursorsBloc>(),
    //     jobsCacheCubit: context.read<JobsCacheCubit>(),
    //   ),
    //   wrapInCard: false,
    //   fixedLeftColumns: 1,
    //   minWidth: 1600,
    //   sortColumnIndex: 2,
    //   // TODO: Handle changing rows per page
    //   // rowsPerPage: _rowsPerPage,
    //   // availableRowsPerPage: const [10, 20, 50],
    //   // onRowsPerPageChanged: (value) => _rowsPerPage = value!,
    // );
  }
}
