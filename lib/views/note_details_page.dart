import 'package:flutter/material.dart';
import '../models/note.dart';
import '../services/firestore_service.dart';

class NoteDetailsPage extends StatefulWidget {
  // Note có thể là null (nếu là Thêm mới) hoặc có giá trị (nếu là Chỉnh sửa)
  final Note? note;

  const NoteDetailsPage({this.note, super.key});

  @override
  State<NoteDetailsPage> createState() => _NoteDetailsPageState();
}

class _NoteDetailsPageState extends State<NoteDetailsPage> {
  final _formKey = GlobalKey<FormState>();
  final _firestoreService = FirestoreService();

  late TextEditingController _titleController;
  late TextEditingController _contentController;

  @override
  void initState() {
    super.initState();
    // Khởi tạo Controller với dữ liệu hiện có hoặc rỗng
    _titleController = TextEditingController(text: widget.note?.title ?? '');
    _contentController = TextEditingController(text: widget.note?.content ?? '');
  }

  @override
  void dispose() {
    _titleController.dispose();
    _contentController.dispose();
    super.dispose();
  }

  // Hàm lưu Note
  void _saveNote() {
    if (_formKey.currentState!.validate()) {
      final newNote = Note(
        id: widget.note?.id, // Giữ ID nếu đang chỉnh sửa
        title: _titleController.text,
        content: _contentController.text,
        timestamp: DateTime.now(), // Cập nhật thời gian hiện tại
      );

      _firestoreService.saveNote(newNote).then((_) {
        Navigator.pop(context); // Quay lại trang trước sau khi lưu
      }).catchError((error) {
        // Xử lý lỗi (ví dụ: hiển thị SnackBar)
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Lưu thất bại: $error')),
        );
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.note == null ? 'Thêm Note mới' : 'Chỉnh sửa Note'),
        actions: [
          IconButton(
            icon: const Icon(Icons.save),
            onPressed: _saveNote,
          ),
        ],
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: <Widget>[
              TextFormField(
                controller: _titleController,
                decoration: const InputDecoration(
                  labelText: 'Tiêu đề',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Vui lòng nhập tiêu đề';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              Expanded(
                child: TextFormField(
                  controller: _contentController,
                  decoration: const InputDecoration(
                    labelText: 'Nội dung',
                    border: OutlineInputBorder(),
                    alignLabelWithHint: true,
                  ),
                  maxLines: null, // Cho phép nhiều dòng
                  keyboardType: TextInputType.multiline,
                  expands: true, // Cho phép mở rộng để lấp đầy không gian
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Vui lòng nhập nội dung';
                    }
                    return null;
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}