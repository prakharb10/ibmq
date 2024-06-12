// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'iqx_job.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$IQXJobImpl _$$IQXJobImplFromJson(Map<String, dynamic> json) => _$IQXJobImpl(
      kind: json['kind'] as String,
      backend: _$recordConvert(
        json['backend'],
        ($jsonValue) => (
          id: $jsonValue['id'] as String,
          name: $jsonValue['name'] as String,
        ),
      ),
      status: $enumDecode(_$JobStatusEnumMap, json['status']),
      creationDate: DateTime.parse(json['creationDate'] as String),
      deleted: json['deleted'] as bool,
      summaryData:
          SummaryData.fromJson(json['summaryData'] as Map<String, dynamic>),
      timePerStep:
          TimePerStep.fromJson(json['timePerStep'] as Map<String, dynamic>),
      hubInfo: _$recordConvert(
        json['hubInfo'],
        ($jsonValue) => (
          group: _$recordConvert(
            $jsonValue['group'],
            ($jsonValue) => (name: $jsonValue['name'] as String,),
          ),
          hub: _$recordConvert(
            $jsonValue['hub'],
            ($jsonValue) => (name: $jsonValue['name'] as String,),
          ),
          project: _$recordConvert(
            $jsonValue['project'],
            ($jsonValue) => (name: $jsonValue['name'] as String,),
          ),
        ),
      ),
      endDate: Option<DateTime>.fromJson(
          json['endDate'], (value) => DateTime.parse(value as String)),
      tags: Option<IList<String>>.fromJson(json['tags'],
          (value) => IList<String>.fromJson(value, (value) => value as String)),
      runMode: Option<RunMode>.fromJson(
          json['runMode'], (value) => $enumDecode(_$RunModeEnumMap, value)),
      id: json['id'] as String,
      userId: json['userId'] as String,
      createdBy: json['createdBy'] as String,
    );

$Rec _$recordConvert<$Rec>(
  Object? value,
  $Rec Function(Map) convert,
) =>
    convert(value as Map<String, dynamic>);

const _$JobStatusEnumMap = {
  JobStatus.creating: 'CREATING',
  JobStatus.created: 'CREATED',
  JobStatus.transpiling: 'TRANSPILING',
  JobStatus.transpiled: 'TRANSPILED',
  JobStatus.validating: 'VALIDATING',
  JobStatus.validated: 'VALIDATED',
  JobStatus.running: 'RUNNING',
  JobStatus.Running: 'Running',
  JobStatus.completed: 'COMPLETED',
  JobStatus.Completed: 'Completed',
  JobStatus.pendingInQueue: 'PENDING_IN_QUEUE',
  JobStatus.queued: 'QUEUED',
  JobStatus.Queued: 'Queued',
  JobStatus.cancelled: 'CANCELLED',
  JobStatus.Cancelled: 'Cancelled',
  JobStatus.cancelledRanTooLong: 'CANCELLED - RAN TOO LONG',
  JobStatus.failed: 'FAILED',
  JobStatus.Failed: 'Failed',
  JobStatus.errorCreatingJob: 'ERROR_CREATING_JOB',
  JobStatus.errorValidatingJob: 'ERROR_VALIDATING_JOB',
  JobStatus.errorTranspilingJob: 'ERROR_TRANSPILING_JOB',
  JobStatus.errorRunningJob: 'ERROR_RUNNING_JOB',
};

const _$RunModeEnumMap = {
  RunMode.fairshare: 'fairshare',
  RunMode.dedicated: 'dedicated',
  RunMode.priority: 'priority',
  RunMode.session: 'session',
};

_$TimePerStepImpl _$$TimePerStepImplFromJson(Map<String, dynamic> json) =>
    _$TimePerStepImpl(
      creating: DateTime.parse(json['CREATING'] as String),
      created: Option<DateTime>.fromJson(
          json['CREATED'], (value) => DateTime.parse(value as String)),
      transpiling: Option<DateTime>.fromJson(
          json['TRANSPILING'], (value) => DateTime.parse(value as String)),
      transpiled: Option<DateTime>.fromJson(
          json['TRANSPILED'], (value) => DateTime.parse(value as String)),
      validating: Option<DateTime>.fromJson(
          json['VALIDATING'], (value) => DateTime.parse(value as String)),
      validated: Option<DateTime>.fromJson(
          json['VALIDATED'], (value) => DateTime.parse(value as String)),
      queued: Option<DateTime>.fromJson(
          json['QUEUED'], (value) => DateTime.parse(value as String)),
      running: Option<DateTime>.fromJson(
          json['RUNNING'], (value) => DateTime.parse(value as String)),
      completed: Option<DateTime>.fromJson(
          json['COMPLETED'], (value) => DateTime.parse(value as String)),
    );
