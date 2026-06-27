import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/grade_provider.dart';

class SubjectListScreen extends StatelessWidget {
  const SubjectListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<GradeProvider>(
      builder: (context, provider, child) {
        if (provider.subjects.isEmpty) {
          return const Center(child: Text('No subjects added yet'));
        }

        return ListView.builder(
          itemCount: provider.subjects.length,
          itemBuilder: (context, index) {
            final subject = provider.subjects[index];

            return Dismissible(
              key: ValueKey(subject.name + subject.mark.toString()),
              direction: DismissDirection.endToStart,
              onDismissed: (direction) {
                provider.deleteSubject(index);

                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Subject deleted')),
                );
              },
              background: Container(
                alignment: Alignment.centerRight,
                padding: const EdgeInsets.only(right: 20),
                color: Theme.of(context).colorScheme.error,
                child: Icon(
                  Icons.delete,
                  color: Theme.of(context).colorScheme.onError,
                ),
              ),
              child: Card(
                color: Theme.of(context).cardColor,
                margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                child: ListTile(
                  title: Text(
                    'Subject: ${subject.name}',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Mark: ${subject.mark}'),
                      Text('Grade: ${subject.grade}'),
                    ],
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }
}
