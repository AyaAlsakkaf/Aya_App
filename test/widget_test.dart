// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:ayaasssigmnent3/widgets/custom_form.dart';

void main() {
  testWidgets('Form widget test', (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(
      home: CustomForm(),
    ));
    
   
    expect(find.byType(TextFormField), findsNWidgets(3));
    expect(find.byType(ElevatedButton), findsOneWidget);
  });
}
