import 'package:data_table_2/data_table_2.dart';
import 'package:fluent_ui/fluent_ui.dart' as fluent;
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ibmq/backends/bloc/backends_bloc.dart';
import 'package:ibmq/backends/data/backends_data_table_source.dart';
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
    context.read<BackendsBloc>().add(const BackendsEvent.backendsFetched());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BackendsBloc, BackendsState>(
      builder: (context, state) {
        return switch (state) {
          Success(:final backends) => PaginatedDataTable2(
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
                      TargetPlatform.linux => const Icon(YaruIcons.refresh),
                      TargetPlatform.windows =>
                        const Icon(FluentIcons.arrow_clockwise_24_filled),
                      _ => const Icon(Icons.refresh),
                    },
                    onPressed: () => context
                        .read<BackendsBloc>()
                        .add(const BackendsEvent.backendsFetched()),
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
              source: BackendsDataTableSource(backends: backends),
              fixedLeftColumns: 1,
              lmRatio: 1.5,
              minWidth: 1500,
              // sortColumnIndex: 3,
              columnSpacing: 40,
              renderEmptyRowsInTheEnd: false,
              rowsPerPage: 15,
              empty: const Center(
                child: Text("No backends available"),
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
