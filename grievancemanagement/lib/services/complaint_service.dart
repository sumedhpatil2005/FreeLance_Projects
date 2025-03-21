import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:grievancemanagement/data/models/complaint_model.dart';

class ComplaintService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Submit a new complaint
  Future<void> submitComplaint(Complaint complaint) async {
    await _firestore
        .collection('complaints')
        .doc(complaint.id)
        .set(complaint.toMap());
  }

  // Fetch complaints for a student
  Stream<List<Complaint>> getComplaintsForStudent(String studentId) {
    return _firestore
        .collection('complaints')
        .where('studentId', isEqualTo: studentId)
        .snapshots()
        .map(
          (snapshot) =>
              snapshot.docs
                  .map((doc) => Complaint.fromMap(doc.data()))
                  .toList(),
        );
  }

  // Fetch complaints assigned to a specific moderator
  Stream<List<Complaint>> getComplaintsForModerator(String moderatorId) {
    return _firestore
        .collection('complaints')
        .where('assignedModeratorId', isEqualTo: moderatorId)
        .snapshots()
        .map(
          (snapshot) =>
              snapshot.docs
                  .map((doc) => Complaint.fromMap(doc.data()))
                  .toList(),
        );
  }

  // Fetch all complaints (for the principal)
  Stream<List<Complaint>> getAllComplaints() {
    return _firestore
        .collection('complaints')
        .snapshots()
        .map(
          (snapshot) =>
              snapshot.docs
                  .map((doc) => Complaint.fromMap(doc.data()))
                  .toList(),
        );
  }

  // Update complaint status
  Future<void> updateComplaintStatus(String complaintId, String status) async {
    await _firestore.collection('complaints').doc(complaintId).update({
      'status': status,
    });
  }
}
