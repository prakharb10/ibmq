import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/jobs_bloc.dart';

class JobsPage extends StatefulWidget {
  const JobsPage({Key? key}) : super(key: key);

  @override
  State<JobsPage> createState() => _JobsPageState();
}

class _JobsPageState extends State<JobsPage> {
  @override
  void initState() {
    super.initState();
    context.read<JobsBloc>().add(const JobsRequested(skip: 0));
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<JobsBloc, JobsState>(
      builder: (context, state) {
        if (state is JobsLoading) {
          return const Center(child: CircularProgressIndicator());
        }
        if (state is JobsLoaded) {
          return Center(
            child: Text(state.items.toString()),
          );
        }
        return Container();
      },
    );
  }
}
