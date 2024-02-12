import 'package:flutter/material.dart';
import 'package:ibmq/jobs/job/views/job_page.dart';
import 'package:ibmq/jobs/job/views/runtime_job_page.dart';
import 'package:ibmq/jobs/model/job.dart';

import '../model/runtime_data.dart';

class JobShell extends StatelessWidget {
  final BaseJob job;
  const JobShell({super.key, required this.job});

  @override
  Widget build(BuildContext context) {
    if (job is Job) {
      return JobPage(jobId: (job as Job).id);
    } else if (job is RuntimeData) {
      return RuntimeJobPage(data: job as RuntimeData);
    }
    return Container();
  }
}
