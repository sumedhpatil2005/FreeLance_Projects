import 'package:flutter/material.dart';
import 'package:grievancemanagement/data/models/complaint_model.dart';
import 'package:grievancemanagement/services/complaint_service.dart';

class PrincipalDashboard extends StatelessWidget {
  final ComplaintService _complaintService = ComplaintService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Principal Dashboard')),
      body: StreamBuilder<List<Complaint>>(
        stream: _complaintService.getAllComplaints(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('No complaints found'));
          }
          return ListView.builder(
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) {
              Complaint complaint = snapshot.data![index];
              return ListTile(
                title: Text(complaint.category),
                subtitle: Text('Status: ${complaint.status}'),
              );
            },
          );
        },
      ),
    );
  }
}
