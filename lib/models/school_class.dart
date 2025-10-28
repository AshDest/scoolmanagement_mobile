class SchoolClass {
  final String id;
  final String name;
  final String teacherId;
  final String teacherName;
  final int studentCount;
  final String schedule;

  SchoolClass({
    required this.id,
    required this.name,
    required this.teacherId,
    required this.teacherName,
    required this.studentCount,
    required this.schedule,
  });

  factory SchoolClass.fromJson(Map<String, dynamic> json) {
    return SchoolClass(
      id: json['id'].toString(),
      name: json['name'] ?? '',
      teacherId: json['teacherId']?.toString() ?? json['teacher_id']?.toString() ?? '',
      teacherName: json['teacherName'] ?? json['teacher_name'] ?? '',
      studentCount: json['studentCount'] ?? json['student_count'] ?? 0,
      schedule: json['schedule'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'teacherId': teacherId,
      'teacherName': teacherName,
      'studentCount': studentCount,
      'schedule': schedule,
    };
  }
}

