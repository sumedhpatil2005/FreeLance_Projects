import 'package:flutter/material.dart';
import 'package:grievancemanagement/data/models/complaint_model.dart';
import 'package:grievancemanagement/services/complaint_service.dart';

class SubmitComplaintScreen extends StatefulWidget {
  @override
  _SubmitComplaintScreenState createState() => _SubmitComplaintScreenState();
}

class _SubmitComplaintScreenState extends State<SubmitComplaintScreen> {
  final _formKey = GlobalKey<FormState>();
  final _categoryController = TextEditingController();
  final _descriptionController = TextEditingController();
  final ComplaintService _complaintService = ComplaintService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Submit Complaint')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              DropdownButtonFormField(
                items:
                    [
                          'Academic',
                          'Administrative',
                          'Infrastructure',
                          'Financial',
                          'Harassment',
                        ]
                        .map(
                          (category) => DropdownMenuItem(
                            value: category,
                            child: Text(category),
                          ),
                        )
                        .toList(),
                onChanged:
                    (value) => _categoryController.text = value.toString(),
                decoration: InputDecoration(labelText: 'Category'),
              ),
              TextFormField(
                controller: _descriptionController,
                decoration: InputDecoration(labelText: 'Description'),
                maxLines: 5,
                validator:
                    (value) =>
                        value!.isEmpty ? 'Please enter a description' : null,
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _submitComplaint,
                child: Text('Submit'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _submitComplaint() async {
    if (_formKey.currentState!.validate()) {
      Complaint complaint = Complaint(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        studentId: 'student123', // Replace with actual student ID
        category: _categoryController.text,
        description: _descriptionController.text,
        assignedModeratorId: 'moderator123', // Assign to a moderator
        createdAt: DateTime.now(),
      );
      await _complaintService.submitComplaint(complaint);
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Complaint submitted!')));
    }
  }
}
