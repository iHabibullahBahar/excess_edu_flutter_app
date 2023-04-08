class Instructor {
  Instructor({
    required this.name,
    required this.designation,
    required this.institution,
  });

  String name;
  String designation;
  String institution;

  factory Instructor.fromJson(Map<String, dynamic> json) => Instructor(
        name: json["name"],
        designation: json["designation"],
        institution: json["institution"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "designation": designation,
        "institution": institution,
      };
}
