class Complaint {
  String id;
  String studentId;
  String category;
  String description;
  String status; // e.g., "Pending", "In Progress", "Resolved"
  String assignedModeratorId;
  DateTime createdAt;
  DateTime? resolvedAt;

  Complaint({
    required this.id,
    required this.studentId,
    required this.category,
    required this.description,
    this.status = "Pending",
    required this.assignedModeratorId,
    required this.createdAt,
    this.resolvedAt,
  });

  factory Complaint.fromMap(Map<String, dynamic> data) {
    return Complaint(
      id: data['id'],
      studentId: data['studentId'],
      category: data['category'],
      description: data['description'],
      status: data['status'],
      assignedModeratorId: data['assignedModeratorId'],
      createdAt: DateTime.parse(data['createdAt']),
      resolvedAt:
          data['resolvedAt'] != null
              ? DateTime.parse(data['resolvedAt'])
              : null,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'studentId': studentId,
      'category': category,
      'description': description,
      'status': status,
      'assignedModeratorId': assignedModeratorId,
      'createdAt': createdAt.toIso8601String(),
      'resolvedAt': resolvedAt?.toIso8601String(),
    };
  }
}
