import 'package:flutter/material.dart';
import 'package:jobified/models/job.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Your App Title',
      home: CreatePage(),
    );
  }
}

class CreatePage extends StatelessWidget {
  const CreatePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create Job Posting'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: JobPostingForm(),
      ),
    );
  }
}

class JobPostingForm extends StatefulWidget {
  const JobPostingForm({Key? key}) : super(key: key);

  @override
  _JobPostingFormState createState() => _JobPostingFormState();
}

class _JobPostingFormState extends State<JobPostingForm> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _companyNameController = TextEditingController();
  final TextEditingController _locationController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  String _selectedType = 'Full-time'; // Default type selected

  @override
  Widget build(BuildContext context) {
    return Form(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextFormField(
              controller: _titleController,
              decoration: InputDecoration(
                labelText: 'Title',
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter a title';
                }
                return null;
              },
            ),
            SizedBox(height: 16.0),
            TextFormField(
              controller: _companyNameController,
              decoration: InputDecoration(
                labelText: 'Company Name',
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter a company name';
                }
                return null;
              },
            ),
            SizedBox(height: 16.0),
            TextFormField(
              controller: _locationController,
              decoration: InputDecoration(
                labelText: 'Location',
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter a location';
                }
                return null;
              },
            ),
            SizedBox(height: 16.0),
            TextFormField(
              controller: _descriptionController,
              decoration: InputDecoration(
                labelText: 'Description',
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter a description';
                }
                return null;
              },
              maxLines: 4,
            ),
            SizedBox(height: 16.0),
            DropdownButtonFormField<String>(
              value: _selectedType,
              onChanged: (newValue) {
                setState(() {
                  _selectedType = newValue!;
                });
              },
              items: <String>['Full-time', 'Part-time', 'Remote'].map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              decoration: InputDecoration(
                labelText: 'Job Type',
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please select a job type';
                }
                return null;
              },
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                if (Form.of(context)!.validate()) {
                  _submitForm();
                }
              },
              child: Text('Post Job'),
            ),
          ],
        ),
      ),
    );
  }

  void _submitForm() {
    String title = _titleController.text;
    String companyName = _companyNameController.text;
    String location = _locationController.text;
    String description = _descriptionController.text;

    Job newJob = Job(
      title: title,
      companyName: companyName,
      location: location,
      description: description,
      type: _selectedType,
    );

    // Example: Posting the new job
    print('Posting job: $newJob');

    _titleController.clear();
    _companyNameController.clear();
    _locationController.clear();
    _descriptionController.clear();

    // Optionally, you can also show a confirmation dialog or navigate to another page after submission
  }
}
