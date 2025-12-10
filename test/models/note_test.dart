// Tạo file: test/models/note_test.dart

import 'package:flutter_test/flutter_test.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_project/models/note.dart'; 

void main() {
  group('Note Model', () {
    final testTimestamp = DateTime.now();
    // Tạo mock Timestamp của Firestore
    final mockTimestamp = Timestamp.fromDate(testTimestamp);

    // Dữ liệu Map mô phỏng dữ liệu từ Firestore
    final firestoreData = {
      'title': 'Test Title',
      'content': 'Test Content',
      'timestamp': mockTimestamp,
    };
    const testId = 'noteId123';

    test('should correctly convert from Firestore Map', () {
      final note = Note.fromMap(firestoreData, testId);

      expect(note.id, testId);
      expect(note.title, 'Test Title');
      expect(note.content, 'Test Content');
      // Kiểm tra xem DateTime có khớp với mock Timestamp không
      expect(note.timestamp.isAtSameMomentAs(testTimestamp), isTrue); 
    });

    test('should correctly convert to Firestore Map (toMap)', () {
      final note = Note(
        title: 'New Note',
        content: 'New Content',
        timestamp: testTimestamp,
      );
      
      final map = note.toMap();
      
      expect(map['title'], 'New Note');
      expect(map['content'], 'New Content');
      // Kiểm tra xem timestamp có phải là DateTime không (chú ý: Firebase Service sẽ chuyển nó sang Firestore Timestamp)
      expect(map['timestamp'], isA<DateTime>()); 
    });
  });
}