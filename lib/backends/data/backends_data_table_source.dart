import 'package:data_table_2/data_table_2.dart';
import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:flutter/material.dart';
import 'package:fpdart/fpdart.dart';
import 'package:ibmq/backends/model/backend.dart';

class BackendsDataTableSource extends DataTableSource {
  final IList<Backend> _backends;

  BackendsDataTableSource({
    required IList<Backend> backends,
  }) : _backends = backends;

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => _backends.length;

  @override
  int get selectedRowCount => 0;

  @override
  DataRow2 getRow(int index) =>
      backendToDataRow(backend: _backends[index], index: index);

  DataRow2 backendToDataRow({required Backend backend, required int index}) =>
      DataRow2.byIndex(
        index: index,
        cells: [
          DataCell(Text(backend.name)),
          DataCell(Text(backend.qubits.toString())),
          DataCell(Text(
              "${(backend.performance.eplg * 100).toStringAsPrecision(3)}%")),
          DataCell(
            Text(switch (backend.performance.clopsH.alt(
              () => backend.performance.clopsV,
            )) {
              None() => '',
              Some(:final value) => "${value / 1000}K",
            }),
          ),
          DataCell(Text(backend.deviceStatus.status)),
          DataCell(Text(backend.queueLength.toString())),
          DataCell(Text(
              "${backend.processorType.family} r${backend.processorType.revision}")),
          DataCell(Text(backend.supportedFeatures.join(', '))),
        ],
      );
}
