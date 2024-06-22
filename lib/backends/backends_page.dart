import 'package:fluent_ui/fluent_ui.dart' as fluent;
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ibmq/backends/backends_data_table.dart';
import 'package:ibmq/backends/status/bloc/backends_status_updates_bloc.dart';
import 'package:ibmq/instances/cubit/instances_cubit.dart';
import 'package:ibmq/instances/instance_selector.dart';
import 'package:ibmq/user/info/user_info_tile.dart';
import 'package:macos_ui/macos_ui.dart';
import 'package:yaru/yaru.dart';

class BackendsPage extends StatefulWidget {
  const BackendsPage({super.key});

  @override
  State<BackendsPage> createState() => _BackendsPageState();
}

class _BackendsPageState extends State<BackendsPage> {
  @override
  void initState() {
    super.initState();
    context
        .read<BackendsStatusUpdatesBloc>()
        .add(const BackendsStatusUpdatesEvent.started());
  }

  @override
  Widget build(BuildContext context) {
    return switch (Theme.of(context).platform) {
      TargetPlatform.macOS => MacosScaffold(
          toolBar: ToolBar(
            enableBlur: true,
            leading: MacosTooltip(
              message: 'Toggle Sidebar',
              useMousePosition: false,
              child: MacosIconButton(
                icon: MacosIcon(
                  CupertinoIcons.sidebar_left,
                  color: MacosTheme.brightnessOf(context).resolve(
                    const Color.fromRGBO(0, 0, 0, 0.5),
                    const Color.fromRGBO(255, 255, 255, 0.5),
                  ),
                  size: 20.0,
                ),
                boxConstraints: const BoxConstraints(
                  minHeight: 20,
                  minWidth: 20,
                  maxWidth: 48,
                  maxHeight: 38,
                ),
                onPressed: () => MacosWindowScope.of(context).toggleSidebar(),
              ),
            ),
            actions: [
              CustomToolbarItem(
                tooltipMessage: "Current Instance",
                inToolbarBuilder: (context) => const InstanceSelector(),
              ),
              ToolBarIconButton(
                label: "Notifications",
                icon: const MacosIcon(CupertinoIcons.bell),
                showLabel: false,
                onPressed: () =>
                    MacosWindowScope.of(context).toggleEndSidebar(),
              )
            ],
          ),
          children: [
            ContentArea(
              builder: (context, scrollController) =>
                  BlocBuilder<InstancesCubit, InstancesState>(
                builder: (context, state) => switch (state) {
                  InstancesLoadSuccess() => Material(
                      child: BackendsDataTable(
                        scrollController: scrollController,
                      ),
                    ),
                  InstancesLoadInProgress() => const Center(
                      child: MacosTooltip(
                        message: "Loading Instances",
                        child: ProgressCircle(),
                      ),
                    ),
                  _ => const SizedBox.shrink(),
                },
              ),
            )
          ],
        ),
      TargetPlatform.iOS => CupertinoTabView(
          defaultTitle: 'Backends',
          builder: (context) => const CupertinoPageScaffold(
            child: CustomScrollView(
              slivers: <Widget>[
                CupertinoSliverNavigationBar(
                  middle: Text("IBM Quantum Dashboard"),
                  trailing: UserInfoTile(),
                ),
                SliverFillRemaining(
                  child: Center(
                    child: Text('Backends Page'),
                  ),
                ),
              ],
            ),
          ),
        ),
      TargetPlatform.linux => YaruDetailPage(
          appBar: const YaruWindowTitleBar(
            actions: [
              InstanceSelector(),
            ],
          ),
          body: BlocBuilder<InstancesCubit, InstancesState>(
            builder: (context, state) => switch (state) {
              InstancesLoadSuccess() => const BackendsDataTable(),
              InstancesLoadInProgress() => const Center(
                  child: YaruCircularProgressIndicator(),
                ),
              _ => const SizedBox.shrink(),
            },
          ),
        ),
      TargetPlatform.windows => fluent.ScaffoldPage.withPadding(
          header: fluent.PageHeader(
            commandBar: fluent.CommandBar(
              mainAxisAlignment: fluent.MainAxisAlignment.end,
              primaryItems: [
                fluent.CommandBarBuilderItem(
                  builder: (context, displayMode, child) => fluent.Tooltip(
                    message: 'Current Instance',
                    child: child,
                  ),
                  wrappedItem: WindowsInstanceSelector(),
                ),
                fluent.CommandBarButton(
                  icon: const Icon(FluentIcons.alert_24_regular),
                  onPressed: () {},
                ),
              ],
            ),
          ),
          content: BlocBuilder<InstancesCubit, InstancesState>(
            builder: (context, state) => switch (state) {
              InstancesLoadSuccess() => const Material(
                  child: BackendsDataTable(),
                ),
              InstancesLoadInProgress() => const Center(
                  child: fluent.Tooltip(
                    message: "Loading Instances",
                    child: fluent.ProgressRing(),
                  ),
                ),
              _ => const SizedBox.shrink(),
            },
          ),
        ),
      _ => const Center(
          child: Text('Backends Page'),
        ),
    };
  }
}
