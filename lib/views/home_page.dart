import 'package:flutter/material.dart';
import '../models/note.dart';
import '../services/firestore_service.dart';
import '../widgets/note_card.dart';
import 'note_details_page.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final FirestoreService _firestoreService = FirestoreService();

  // Hàm xử lý khi xóa Note
  void _deleteNote(BuildContext context, String noteId) {
    // Hiển thị dialog xác nhận trước khi xóa
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Xác nhận Xóa'),
        content: const Text('Bạn có chắc chắn muốn xóa ghi chú này?'),
        actions: <Widget>[
          TextButton(
            child: const Text('Hủy'),
            onPressed: () => Navigator.of(ctx).pop(),
          ),
          TextButton(
            child: const Text('Xóa', style: TextStyle(color: Colors.red)),
            onPressed: () {
              _firestoreService.deleteNote(noteId);
              Navigator.of(ctx).pop();
            },
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Quản lý Note Flutter/Firebase'),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      // Sử dụng StreamBuilder để lắng nghe dữ liệu real-time từ Firestore
      body: StreamBuilder<List<Note>>(
        stream: _firestoreService.getNotes(),
        builder: (context, snapshot) {
          // Trạng thái: Đang kết nối
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          // Trạng thái: Có lỗi
          if (snapshot.hasError) {
            return Center(child: Text('Đã xảy ra lỗi: ${snapshot.error}'));
          }
          // Trạng thái: Không có dữ liệu
          if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('Chưa có ghi chú nào. Hãy tạo một cái!'));
          }

          // Trạng thái: Có dữ liệu (hiển thị danh sách)
          final notes = snapshot.data!;
          return ListView.builder(
            itemCount: notes.length,
            itemBuilder: (context, index) {
              final note = notes[index];
              return NoteCard(
                note: note,
                // Chức năng Update: Điều hướng đến trang chi tiết để chỉnh sửa
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => NoteDetailsPage(note: note),
                    ),
                  );
                },
                // Chức năng Delete: Gọi hàm xóa
                onDelete: () => _deleteNote(context, note.id!),
              );
            },
          );
        },
      ),
      // Floating Action Button cho chức năng Create
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          // Điều hướng đến trang chi tiết để tạo Note mới (note = null)
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const NoteDetailsPage(),
            ),
          );
        },
      ),
    );
  }
}