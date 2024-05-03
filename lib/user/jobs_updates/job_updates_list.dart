import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ibmq/user/jobs_updates/model/job_status_update.dart';
import 'package:ibmq/utils/notifications/bloc/notifications_bloc.dart';
import 'package:intl/intl.dart';
import 'package:macos_ui/macos_ui.dart';
import 'package:yaru/yaru.dart';

class JobUpdatesList extends StatelessWidget {
  const JobUpdatesList({
    super.key,
    this.scrollController,
    required this.jobStatusUpdates,
  });

  final ScrollController? scrollController;
  final Map<String, JobStatusUpdate> jobStatusUpdates;

  @override
  Widget build(BuildContext context) {
    final reversedJobStatusUpdates = jobStatusUpdates.entries.toList()
      ..sort((a, b) => b.value.timestamp.compareTo(a.value.timestamp));
    return ListView.separated(
      controller: scrollController,
      itemCount: jobStatusUpdates.length,
      itemBuilder: (context, index) {
        final subtitle = Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Expanded(
              child: Text(
                reversedJobStatusUpdates[index].value.id,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Text(
              DateFormat(DateFormat.HOUR_MINUTE).format(
                  reversedJobStatusUpdates[index].value.timestamp.toLocal()),
            ),
          ],
        );
        return switch (Theme.of(context).platform) {
          TargetPlatform.macOS => MacosListTile(
              title: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Expanded(
                    child: Text(
                      reversedJobStatusUpdates[index].value.status.name,
                    ),
                  ),
                  MacosIconButton(
                    icon: const MacosIcon(CupertinoIcons.xmark_circle),
                    onPressed: () => context.read<NotificationsBloc>().add(
                        NotificationsEvent.clear(
                            reversedJobStatusUpdates[index].value)),
                  )
                ],
              ),
              subtitle: Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: subtitle,
              ),
            ),
          TargetPlatform.linux => YaruTile(
              title: Text(
                reversedJobStatusUpdates[index].value.status.name,
              ),
              trailing: YaruIconButton(
                icon: const Icon(YaruIcons.error),
                onPressed: () => context.read<NotificationsBloc>().add(
                    NotificationsEvent.clear(
                        reversedJobStatusUpdates[index].value)),
              ),
              subtitle: subtitle,
            ),
          _ => ListTile(
              title: Text(
                reversedJobStatusUpdates[index].value.status.name,
              ),
              trailing: IconButton(
                icon: const Icon(Icons.clear),
                onPressed: () => context.read<NotificationsBloc>().add(
                    NotificationsEvent.clear(
                        reversedJobStatusUpdates[index].value)),
              ),
              subtitle: subtitle,
            ),
        };
      },
      separatorBuilder: (context, index) =>
          switch (Theme.of(context).platform) {
        TargetPlatform.macOS => const MacosPulldownMenuDivider(),
        _ => const Divider(),
      },
    );
  }
}
