import 'package:cloud_firestore/cloud_firestore.dart';

// class DatabaseService{

//   //reference collection

// }
class Event {
  final String Name;
  final String? Category;
  final DateTime date;
  final String? Eligibility;
  // final Reference
  final String? Coordinator;
  final String? Venue;

  final String id;
  Event({
    required this.Name,
    required this.Category,
    required this.date,
    required this.Eligibility,
    required this.Coordinator,
    required this.Venue,
    required this.id,
  });

  factory Event.fromFirestore(DocumentSnapshot<Map<String, dynamic>> snapshot,
      [SnapshotOptions? options]) {
    final data = snapshot.data()!;
    return Event(
      date: data['date'].toDate(),
      Name: data['Name'],
      Category: data['Category'],
      Eligibility: data['Eligibility'],
      Coordinator: data['Coordinator'],
      Venue: data['Venue'],
      id: snapshot.id,
    );
  }

  Map<String, Object?> toFirestore() {
    return {
      "date": Timestamp.fromDate(date),
      "Name": Name,
      "Category": Category,
      "Eligibility": Eligibility,
      "Coordinator": Coordinator
    };
  }
}
