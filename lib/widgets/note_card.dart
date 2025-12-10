import 'package:flutter/material.dart';
import '../models/note.dart';

class NoteCard extends StatelessWidget {
  final Note note;
  final VoidCallback onTap; // Xử lý khi người dùng chạm vào note
  final VoidCallback onDelete; // Xử lý khi người dùng xóa note

  const NoteCard({
    required this.note,
    required this.onTap,
    required this.onDelete,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    // Định dạng thời gian
    final formattedTime =
        '${note.timestamp.day}/${note.timestamp.month}/${note.timestamp.year} ${note.timestamp.hour}:${note.timestamp.minute.toString().padLeft(2, '0')}';

    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: ListTile(
        onTap: onTap,
        title: Text(
          note.title,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Text(
          // Hiển thị một phần nội dung và thời gian
          '${note.content.length > 50 ? note.content.substring(0, 50) + '...' : note.content}\n$formattedTime',
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
        isThreeLine: true,
        trailing: IconButton(
          icon: const Icon(Icons.delete, color: Colors.red),
          onPressed: onDelete, // Gọi hàm xóa
        ),
      ),
    );
  }
}