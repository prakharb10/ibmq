import 'package:data_table_2/data_table_2.dart';
import 'package:fluent_ui/fluent_ui.dart' as fluent;
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ibmq/backends/cubit/backends_cubit.dart';
import 'package:ibmq/backends/data/backends_data_table_source.dart';
import 'package:ibmq/backends/filter/bloc/backends_filter_bloc.dart';
import 'package:macos_ui/macos_ui.dart';
import 'package:yaru/yaru.dart';

class BackendsDataTable extends StatefulWidget {
  const BackendsDataTable({
    super.key,
    this.scrollController,
  });

  final ScrollController? scrollController;

  @override
  State<BackendsDataTable> createState() => _BackendsDataTableState();
}

class _BackendsDataTableState extends State<BackendsDataTable> {
  @override
  void initState() {
    super.initState();
    context.read<BackendsCubit>().fetchBackends();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BackendsCubit, BackendsState>(
      builder: (context, state) {
        return switch (state) {
          Success(:final backends) => BlocProvider(
              create: (context) => BackendsFilterBloc(backends: backends),
              child: BlocBuilder<BackendsFilterBloc, BackendsFilterState>(
                builder: (context, state) {
                  return PaginatedDataTable2(
                    wrapInCard: false,
                    scrollController: widget.scrollController,
                    headingTextStyle: switch (Theme.of(context).platform) {
                      TargetPlatform.macOS => MacosTheme.of(context)
                          .typography
                          .title3
                          .copyWith(color: MacosTheme.of(context).primaryColor),
                      TargetPlatform.windows =>
                        fluent.FluentTheme.of(context).typography.bodyLarge,
                      _ => Theme.of(context).textTheme.headlineMedium,
                    },
                    sortArrowIcon: switch (Theme.of(context).platform) {
                      TargetPlatform.macOS ||
                      TargetPlatform.iOS =>
                        CupertinoIcons.chevron_up,
                      TargetPlatform.linux => YaruIcons.pan_up,
                      TargetPlatform.windows => FluentIcons.arrow_up_24_regular,
                      _ => Icons.arrow_upward,
                    },
                    header: const Text("Backends"),
                    actions: [
                      Tooltip(
                        message: "Refresh Backends",
                        child: IconButton(
                          icon: switch (Theme.of(context).platform) {
                            TargetPlatform.macOS =>
                              const MacosIcon(CupertinoIcons.refresh),
                            TargetPlatform.linux =>
                              const Icon(YaruIcons.refresh),
                            TargetPlatform.windows =>
                              const Icon(FluentIcons.arrow_clockwise_24_filled),
                            _ => const Icon(Icons.refresh),
                          },
                          onPressed: () =>
                              context.read<BackendsCubit>().fetchBackends(),
                        ),
                      ),
                    ],
                    columns: [
                      DataColumn2(
                        label: Text(
                          "Name",
                          style: switch (Theme.of(context).platform) {
                            TargetPlatform.linux =>
                              Theme.of(context).textTheme.titleLarge,
                            _ => null,
                          },
                        ),
                      ),
                      DataColumn2(
                        label: Text(
                          "Qubits",
                          style: switch (Theme.of(context).platform) {
                            TargetPlatform.linux =>
                              Theme.of(context).textTheme.titleLarge,
                            _ => null,
                          },
                        ),
                        onSort: (columnIndex, ascending) {
                          context.read<BackendsFilterBloc>().add(
                                BackendsFilterEvent.sortBy(
                                  columnIndex: columnIndex,
                                  ascending: ascending,
                                ),
                              );
                        },
                      ),
                      DataColumn2(
                        label: Text(
                          "EPLG",
                          style: switch (Theme.of(context).platform) {
                            TargetPlatform.linux =>
                              Theme.of(context).textTheme.titleLarge,
                            _ => null,
                          },
                        ),
                        onSort: (columnIndex, ascending) {
                          context.read<BackendsFilterBloc>().add(
                                BackendsFilterEvent.sortBy(
                                  columnIndex: columnIndex,
                                  ascending: ascending,
                                ),
                              );
                        },
                      ),
                      DataColumn2(
                        label: Text(
                          "CLOPS",
                          style: switch (Theme.of(context).platform) {
                            TargetPlatform.linux =>
                              Theme.of(context).textTheme.titleLarge,
                            _ => null,
                          },
                        ),
                      ),
                      DataColumn2(
                        label: Text(
                          "Status",
                          style: switch (Theme.of(context).platform) {
                            TargetPlatform.linux =>
                              Theme.of(context).textTheme.titleLarge,
                            _ => null,
                          },
                        ),
                      ),
                      DataColumn2(
                        label: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Text(
                            "Total Pending Jobs",
                            style: switch (Theme.of(context).platform) {
                              TargetPlatform.linux =>
                                Theme.of(context).textTheme.titleLarge,
                              _ => null,
                            },
                          ),
                        ),
                        onSort: (columnIndex, ascending) {
                          context.read<BackendsFilterBloc>().add(
                                BackendsFilterEvent.sortBy(
                                  columnIndex: columnIndex,
                                  ascending: ascending,
                                ),
                              );
                        },
                      ),
                      DataColumn2(
                        label: Text(
                          "Processor Type",
                          style: switch (Theme.of(context).platform) {
                            TargetPlatform.linux =>
                              Theme.of(context).textTheme.titleLarge,
                            _ => null,
                          },
                        ),
                      ),
                      DataColumn2(
                        label: Text(
                          "Features",
                          style: switch (Theme.of(context).platform) {
                            TargetPlatform.linux =>
                              Theme.of(context).textTheme.titleLarge,
                            _ => null,
                          },
                        ),
                      ),
                    ],
                    source: BackendsDataTableSource(backends: state.backends),
                    fixedLeftColumns: 1,
                    lmRatio: 1.5,
                    minWidth: 1500,
                    sortColumnIndex: switch (state) {
                      Filtered(:final filter) => filter.sortColumn.toNullable(),
                      _ => null,
                    },
                    sortAscending: switch (state) {
                      Filtered(:final filter) => filter.sortAscending,
                      _ => true,
                    },
                    columnSpacing: 40,
                    renderEmptyRowsInTheEnd: false,
                    rowsPerPage: 15,
                    empty: const Center(
                      child: Text("No backends available"),
                    ),
                  );
                },
              ),
            ),
          Failure failure => Center(
              child: Text(failure.message),
            ),
          Loading() => Center(
              child: switch (Theme.of(context).platform) {
                TargetPlatform.macOS => const ProgressCircle(),
                TargetPlatform.linux => const YaruCircularProgressIndicator(),
                TargetPlatform.windows => const fluent.ProgressRing(),
                _ => const CircularProgressIndicator.adaptive(),
              },
            ),
          _ => const SizedBox.shrink(),
        };
      },
    );
  }
}
