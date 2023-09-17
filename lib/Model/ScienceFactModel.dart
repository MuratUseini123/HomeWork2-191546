class ScienceFact {
  final String fact;
  final String type;
  final String category;
  final String date;
  final String number;
  final String related;

  ScienceFact({
    required this.fact,
    required this.type,
    required this.category,
    required this.date,
    required this.number,
    required this.related,
  });

  factory ScienceFact.fromJson(Map<String, dynamic> json) {
    return ScienceFact(
      fact: json['text'] ?? "",
      type: json['type'] ?? "",
      category: json['category'] ?? "",
      date: json['date'] ?? "",
      number: json['number'] ?? "",
      related: json['related_text'] ?? "",
    );
  }
}
