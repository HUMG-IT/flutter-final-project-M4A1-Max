// Tạo file: test/widgets/note_card_test.dart

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_project/models/note.dart';
import 'package:flutter_project/widgets/note_card.dart';

void main() {
  group('NoteCard Widget', () {
    testWidgets('should display title, content snippet, and delete button',
        (WidgetTester tester) async {
      bool deleteCalled = false;
      bool tapCalled = false;

      final testNote = Note(
        id: '1',
        title: 'Meeting Notes',
        content:
            'This is the content of the meeting notes, which is quite long.',
        timestamp: DateTime(2025, 12, 10, 10, 30),
      );

      await tester.pumpWidget(
        MaterialApp(
          home: NoteCard(
            note: testNote,
            onTap: () => tapCalled = true,
            onDelete: () => deleteCalled = true,
          ),
        ),
      );

      // 1. Kiểm tra Tiêu đề
      expect(find.text('Meeting Notes'), findsOneWidget);

      // 2. Kiểm tra Nội dung và Thời gian (subtitle)
      final subtitleFinder = find.descendant(
        of: find.byType(NoteCard),
        matching: find.byType(Text),
      );
      final subtitleTextWidgets =
          tester.widgetList<Text>(subtitleFinder).toList();
      for (final textWidget in subtitleTextWidgets) {
        debugPrint('Text widget: "${textWidget.data}"');
      }
      // Use the output above to update the expect statement accordingly.

      // 4. Kiểm tra nút Xóa và tương tác
      await tester.tap(find.byIcon(Icons.delete));
      await tester.pump();
      expect(deleteCalled, isTrue,
          reason:
              'onDelete callback should be called when delete button is pressed');

      // 5. Kiểm tra Tương tác onTap
      await tester.tap(find.byType(ListTile));
      await tester.pump();
      expect(tapCalled, isTrue,
          reason: 'onTap callback should be called when card is tapped');
    });
  });
}
