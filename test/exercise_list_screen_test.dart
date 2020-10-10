import 'package:app/screens/screens.dart';
import 'package:app/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('ExerciseListScreen', () {
    Widget exerciseListScreen;
    setUp(() {
      exerciseListScreen = MaterialApp(home: ExerciseListScreen());
    });
    testWidgets(
      'should show welcome message and two buttons when no data was found in the local storage',
      (WidgetTester tester) async {
        await tester.pumpWidget(exerciseListScreen);

        expect(find.byType(Scaffold), findsOneWidget);

        expect(find.text('Welcome to APP'), findsOneWidget);
        expect(find.text('Which action do you want to do?'), findsOneWidget);

        expect(find.byKey(Key('EXERCISE_LIST')), findsNothing);
        expect(find.text('Create exercise'), findsOneWidget);
        expect(find.text('Create routin'), findsOneWidget);
      },
    );

    testWidgets(
      'should show list of exercises when data was found for the currnet day "2020-01-01"',
      (WidgetTester tester) async {
        await tester.pumpWidget(exerciseListScreen);

        expect(find.byType(Scaffold), findsOneWidget);

        expect(find.byKey(Key('EXERCISE_LIST')), findsOneWidget);
        expect(find.byType(ExerciseItemWidget), 4);
      },
    );
  });
}
