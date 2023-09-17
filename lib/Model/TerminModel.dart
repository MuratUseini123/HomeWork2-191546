class Termin {
  final int? id;
  // ignore: non_constant_identifier_names
  final String course_name;
  // ignore: non_constant_identifier_names
  final String termin_date;
  // ignore: non_constant_identifier_names
  final int created_by;
  final double? latitude;
  final double? longitude;
  Termin(
      {this.id,
      // ignore: non_constant_identifier_names
      required this.course_name,
      // ignore: non_constant_identifier_names
      required this.termin_date,
      // ignore: non_constant_identifier_names
        this.latitude,
        this.longitude,
      required this.created_by});
  factory Termin.fromMap(Map<String, dynamic> json) => new Termin(
      id: json['id'],
      course_name: json['course_name'],
      termin_date: json['termin_date'],
      created_by: json['created_by']);
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'course_name': course_name,
      'termin_date': termin_date,
      'created_by': created_by,
    };
  }

  @override
  String toString() {
    return 'Termin id:$id Course Name: $course_name Date: $termin_date Location: ($latitude, $longitude)';  }
}
