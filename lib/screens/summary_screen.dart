import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/grade_provider.dart';

class SummaryScreen extends StatelessWidget {
  const SummaryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<GradeProvider>(
      builder: (context, provider, child) {
        return Center(
          child: Card(
            color: Theme.of(context).cardColor,
            margin: const EdgeInsets.all(20),
            child: Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Result Summary',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const SizedBox(height: 20),

                  Text('Total Subjects: ${provider.totalSubjects}'),
                  const SizedBox(height: 10),

                  Text(
                    'Average Mark: ${provider.averageMark.toStringAsFixed(2)}',
                  ),
                  const SizedBox(height: 10),

                  Text('Overall Grade: ${provider.overallGrade}'),
                  const SizedBox(height: 10),

                  Text(
                    'Passing Subjects: ${provider.passingSubjects.length}',
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
