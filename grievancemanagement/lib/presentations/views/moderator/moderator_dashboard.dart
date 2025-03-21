import 'package:flutter/material.dart';
import 'package:grievancemanagement/data/models/complaint_model.dart';
import 'package:grievancemanagement/services/complaint_service.dart';

class ModeratorDashboard extends StatelessWidget {
  final ComplaintService _complaintService = ComplaintService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Moderator Dashboard'),
        actions: [
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: () {
              // Refresh the complaints list
              // You can use a state management solution (e.g., Provider, Riverpod) to trigger a refresh
            },
          ),
        ],
      ),
      body: StreamBuilder<List<Complaint>>(
        stream: _complaintService.getComplaintsForModerator(
          'moderator123',
        ), // Replace with actual moderator ID
        builder: (context, snapshot) {
          // Handle loading state
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }

          // Handle errors
          if (snapshot.hasError) {
            return Center(
              child: Text(
                'Error loading complaints: ${snapshot.error}',
                style: TextStyle(color: Colors.red),
              ),
            );
          }

          // Handle empty state
          if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(
              child: Text(
                'No complaints found',
                style: TextStyle(fontSize: 18, color: Colors.grey),
              ),
            );
          }

          // Display the list of complaints
          return ListView.builder(
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) {
              Complaint complaint = snapshot.data![index];
              return Card(
                margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                elevation: 2,
                child: ListTile(
                  title: Text(
                    complaint.category,
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 4),
                      Text(
                        'Status: ${complaint.status}',
                        style: TextStyle(
                          color: _getStatusColor(complaint.status),
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        'Submitted on: ${_formatDate(complaint.createdAt)}',
                        style: TextStyle(fontSize: 12, color: Colors.grey),
                      ),
                    ],
                  ),
                  trailing: Icon(Icons.arrow_forward_ios, size: 16),
                  onTap: () {
                    // Navigate to complaint details screen
                    _navigateToComplaintDetails(context, complaint);
                  },
                ),
              );
            },
          );
        },
      ),
    );
  }

  // Helper method to get status color
  Color _getStatusColor(String status) {
    switch (status.toLowerCase()) {
      case 'pending':
        return Colors.orange;
      case 'in progress':
        return Colors.blue;
      case 'resolved':
        return Colors.green;
      default:
        return Colors.grey;
    }
  }

  // Helper method to format date
  String _formatDate(DateTime date) {
    return '${date.day}/${date.month}/${date.year} ${date.hour}:${date.minute}';
  }

  // Navigate to complaint details screen
  void _navigateToComplaintDetails(BuildContext context, Complaint complaint) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ComplaintDetailsScreen(complaint: complaint),
      ),
    );
  }
}

// Placeholder for ComplaintDetailsScreen (you can implement this separately)
class ComplaintDetailsScreen extends StatelessWidget {
  final Complaint complaint;

  ComplaintDetailsScreen({required this.complaint});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Complaint Details')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Category: ${complaint.category}',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            Text(
              'Description: ${complaint.description}',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16),
            Text(
              'Status: ${complaint.status}',
              style: TextStyle(
                fontSize: 16,
                color: Colors.green, // Customize based on status
              ),
            ),
            SizedBox(height: 16),
            Text(
              'Submitted on: ${_formatDate(complaint.createdAt)}',
              style: TextStyle(fontSize: 14, color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }

  // Reuse the same date formatting method
  String _formatDate(DateTime date) {
    return '${date.day}/${date.month}/${date.year} ${date.hour}:${date.minute}';
  }
}
