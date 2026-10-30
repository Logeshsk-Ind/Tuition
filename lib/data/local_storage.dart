import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../models/models.dart';

class StoredCentreData {
  const StoredCentreData({
    required this.boards,
    required this.students,
    required this.payments,
    required this.customFields,
  });

  final List<Board> boards;
  final List<Student> students;
  final List<FeePayment> payments;
  final List<String> customFields;
}

class LocalStorage {
  static const _storageKey = 'tuition_centre_data_v1';

  Future<StoredCentreData?> load() async {
    final preferences = await SharedPreferences.getInstance();
    final rawData = preferences.getString(_storageKey);
    if (rawData == null) return null;

    final json = jsonDecode(rawData) as Map<String, dynamic>;
    return StoredCentreData(
      boards: (json['boards'] as List<dynamic>)
          .map((item) => Board.fromJson(item as Map<String, dynamic>))
          .toList(),
      students: (json['students'] as List<dynamic>)
          .map((item) => Student.fromJson(item as Map<String, dynamic>))
          .toList(),
      payments: (json['payments'] as List<dynamic>)
          .map((item) => FeePayment.fromJson(item as Map<String, dynamic>))
          .toList(),
      customFields: (json['customFields'] as List<dynamic>? ?? [])
          .cast<String>(),
    );
  }

  Future<void> save(StoredCentreData data) async {
    final preferences = await SharedPreferences.getInstance();
    final saved = await preferences.setString(
      _storageKey,
      jsonEncode({
        'boards': data.boards.map((board) => board.toJson()).toList(),
        'students': data.students.map((student) => student.toJson()).toList(),
        'payments': data.payments.map((payment) => payment.toJson()).toList(),
        'customFields': data.customFields,
      }),
    );
    if (!saved) {
      throw StateError('The device could not save tuition centre data.');
    }
  }
}
