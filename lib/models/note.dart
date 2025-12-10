class Note {
  // ID duy nhất của document trong Firestore
  final String? id;
  // Tiêu đề của note
  final String title;
  // Nội dung chi tiết của note
  final String content;
  // Thời gian note được tạo/cập nhật
  final DateTime timestamp;

  Note({
    this.id,
    required this.title,
    required this.content,
    required this.timestamp,
  });

  // Factory constructor để tạo đối tượng Note từ DocumentSnapshot của Firestore
  factory Note.fromMap(Map<String, dynamic> data, String id) {
    return Note(
      id: id,
      title: data['title'] as String,
      content: data['content'] as String,
      // Lấy từ Firebase Timestamp
      timestamp: (data['timestamp']).toDate(),
    );
  }

  // Phương thức chuyển đổi đối tượng Note thành Map (dùng để thêm/cập nhật lên Firestore)
  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'content': content,
      'timestamp': timestamp,
    };
  }
}