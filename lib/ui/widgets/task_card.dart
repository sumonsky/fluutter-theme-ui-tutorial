import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:theme_app/ui/overview_page.dart';

import '../../utils/labels.dart';

class TaskCard extends StatelessWidget {
  const TaskCard({super.key, required this.e});

  final MapEntry e;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final scheme = theme.colorScheme;
    final style = theme.textTheme;
    return Padding(
      padding:
          e.key == Labels.addTask ? EdgeInsets.zero : const EdgeInsets.all(8),
      child: OpenContainer(
        closedShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        closedColor:
            e.key == Labels.addTask ? scheme.surfaceVariant : scheme.surface,
        openColor:
            e.key == Labels.addTask ? scheme.surfaceVariant : scheme.surface,
        closedBuilder: (context, action) => Padding(
          padding: EdgeInsets.all(e.key == Labels.addTask ? 14 : 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Material(
                borderRadius: BorderRadius.circular(8),
                color: e.key == Labels.addTask
                    ? scheme.primaryContainer
                    : scheme.surfaceVariant,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  child: Text(
                    e.key,
                    style: const TextStyle(
                        fontSize: 12, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Text(e.value),
            ],
          ),
        ),
        openBuilder: (context, action) => const OverviewPage(),
      ),
    );
  }
}
