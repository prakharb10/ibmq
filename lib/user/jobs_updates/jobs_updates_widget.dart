import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ibmq/user/jobs_updates/bloc/user_jobs_updates_bloc.dart';
import 'package:ibmq/user/jobs_updates/job_updates_list.dart';
import 'package:ibmq/utils/notifications/bloc/notifications_bloc.dart';
import 'package:ibmq/utils/notifications/local_notifications.dart';

class JobsUpdatesWidget extends StatelessWidget {
  const JobsUpdatesWidget({
    super.key,
    this.scrollController,
  });
  final ScrollController? scrollController;

  @override
  Widget build(BuildContext context) {
    return BlocListener<UserJobsUpdatesBloc, UserJobsUpdatesState>(
      listener: (context, state) async {
        switch (state) {
          case Listening(:final jobStatusUpdate):
            context
                .read<NotificationsBloc>()
                .add(NotificationsEvent.received(jobStatusUpdate));
            await context.read<LocalNotifications>().sendNotification(
                  id: jobStatusUpdate.id.hashCode,
                  title: jobStatusUpdate.status.name,
                  body: "Job ID: ${jobStatusUpdate.id}",
                );
            break;
          default:
        }
      },
      child: BlocBuilder<NotificationsBloc, NotificationsState>(
        builder: (context, state) => switch (state) {
          Initial() => const Center(
              child: Text("Listening for job updates..."),
            ),
          Loaded(:final jobStatusUpdates) => JobUpdatesList(
              jobStatusUpdates: jobStatusUpdates,
              scrollController: scrollController,
            ),
          _ => const SizedBox.shrink(),
        },
      ),
    );
  }
}
