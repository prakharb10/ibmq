import 'package:fluent_ui/fluent_ui.dart' as fluent;
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ibmq/jobs/job/iqx/cubit/iqx_job_cubit.dart';
import 'package:ibmq/jobs/job/iqx/widgets/iqx_job_details.dart';
import 'package:macos_ui/macos_ui.dart';
import 'package:yaru/widgets.dart';
import 'package:yaru/yaru.dart';

class IQXJobPage extends StatefulWidget {
  final String jobId;
  const IQXJobPage({super.key, required this.jobId});

  @override
  State<IQXJobPage> createState() => _IQXJobPageState();
}

class _IQXJobPageState extends State<IQXJobPage> {
  @override
  void initState() {
    super.initState();
    context.read<IqxJobCubit>().getIQXJob(widget.jobId);
  }

  @override
  Widget build(BuildContext context) => BlocBuilder<IqxJobCubit, IqxJobState>(
        builder: (context, state) {
          return switch (state) {
            Success(:final job) => switch (Theme.of(context).platform) {
                TargetPlatform.macOS => MacosScaffold(
                    toolBar: ToolBar(
                      title: Text(widget.jobId),
                    ),
                    children: [
                      ContentArea(
                        builder: (context, scrollController) =>
                            SingleChildScrollView(
                          controller: scrollController,
                          padding: const EdgeInsets.all(16),
                          child: IQXJobDetails(job: job),
                        ),
                      )
                    ],
                  ),
                TargetPlatform.linux => YaruDetailPage(
                    appBar: YaruWindowTitleBar(
                      title: Text(widget.jobId),
                      leading: const YaruBackButton(),
                      centerTitle: false,
                    ),
                    body: SingleChildScrollView(
                      padding: const EdgeInsets.all(16),
                      child: IQXJobDetails(job: job),
                    ),
                  ),
                TargetPlatform.windows => fluent.ScaffoldPage.scrollable(
                    padding: const EdgeInsets.all(16),
                    header: fluent.PageHeader(
                      leading: fluent.IconButton(
                        icon: const Icon(FluentIcons.arrow_left_24_regular),
                        onPressed: () => Navigator.of(context).pop(),
                      ),
                      title: Text(widget.jobId),
                    ),
                    children: [
                      IQXJobDetails(job: job),
                    ],
                  ),
                _ => Scaffold(
                    appBar: AppBar(
                      title: Text(widget.jobId),
                    ),
                    body: Center(
                      child: Text(job.userId),
                    ),
                  ),
              },
            Failure(:final message) => Center(
                child: Text(message),
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
