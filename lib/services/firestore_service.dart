import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/note.dart';

class FirestoreService {
  // Tham chiếu đến collection 'notes' trong Firestore
  final CollectionReference _notesCollection =
      FirebaseFirestore.instance.collection('notes');

  // R - Read: Lấy tất cả các ghi chú dưới dạng Stream để cập nhật real-time
  Stream<List<Note>> getNotes() {
    return _notesCollection.orderBy('timestamp', descending: true).snapshots().map(
      (snapshot) {
        return snapshot.docs.map(
          (doc) {
            // Chuyển đổi DocumentSnapshot thành đối tượng Note
            return Note.fromMap(doc.data() as Map<String, dynamic>, doc.id);
          },
        ).toList();
      },
    );
  }

  // C - Create & U - Update: Thêm mới hoặc cập nhật một ghi chú
  Future<void> saveNote(Note note) {
    if (note.id == null) {
      // Create: Nếu không có ID, đây là một ghi chú mới
      return _notesCollection.add(note.toMap());
    } else {
      // Update: Nếu có ID, cập nhật ghi chú hiện có
      return _notesCollection.doc(note.id).update(note.toMap());
    }
  }

  // D - Delete: Xóa một ghi chú
  Future<void> deleteNote(String noteId) {
    return _notesCollection.doc(noteId).delete();
  }
}