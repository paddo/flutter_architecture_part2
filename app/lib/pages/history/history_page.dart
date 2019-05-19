import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:functional_widget_annotation/functional_widget_annotation.dart';
import 'package:time_tracking/core/backend_service.dart';
import 'package:time_tracking/core/service_locator.dart';
import 'package:intl/intl.dart';

part 'history_page.g.dart';

@widget
Widget historyPage() {
  final historyItems = useStream(sl<BackendService>().getHistory()).data ?? [];

  return Container(
    child: ListView(
      children: historyItems.map((item) => HistoryRow(item)).toList(),
    ),
  );
}

@widget
Widget historyRow(HistoryItem historyItem) => Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text(DateFormat.yMd().add_jm().format(historyItem.dateTime)),
        Text(historyItem.duration.toString()),
      ],
    );
