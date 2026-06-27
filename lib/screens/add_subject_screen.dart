import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/grade_provider.dart';

class AddSubjectScreen extends StatelessWidget {
  const AddSubjectScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    final nameController = TextEditingController();
    final markController = TextEditingController();

    return Padding(
      padding: const EdgeInsets.all(16),
      child: Form(
        key: formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Add Subject',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 20),

            TextFormField(
              controller: nameController,
              decoration: const InputDecoration(
                labelText: 'Subject Name',
                hintText: 'Example: Math',
              ),
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return 'Subject name cannot be empty';
                }
                return null;
              },
            ),

            const SizedBox(height: 16),

            TextFormField(
              controller: markController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Mark',
                hintText: 'Enter mark between 0-100',
              ),
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return 'Mark cannot be empty';
                }

                final mark = double.tryParse(value);

                if (mark == null) {
                  return 'Enter a valid number';
                }

                if (mark < 0 || mark > 100) {
                  return 'Mark must be between 0 and 100';
                }

                return null;
              },
            ),

            const SizedBox(height: 20),

            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    context.read<GradeProvider>().addSubject(
                          nameController.text.trim(),
                          double.parse(markController.text.trim()),
                        );

                    nameController.clear();
                    markController.clear();

                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Subject added successfully'),
                      ),
                    );
                  }
                },
                child: const Text('Add Subject'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
