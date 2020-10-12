import 'package:app/models/exercise_model.dart';
import 'package:app/screens/screens.dart';
import 'package:app/services/local_data_service.dart';
import 'package:app/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:states_rebuilder/states_rebuilder.dart';

class MockExerciseListService extends ExerciseListService {
  // @override
  // String get currentDate => throw UnimplementedError();

  // @override
  // void getExercisesBy(String date) {
  //   list = [
  //     ExerciseModel(id: '1', date: '20200101', time: '1010', name: 'Test 1')
  //   ];
  // }
}

List<ExerciseModel> mockDataExerciseList = [
  ExerciseModel(id: '1', date: '20200101', time: '1010', name: 'Test 1'),
  ExerciseModel(id: '2', date: '20200101', time: '1010', name: 'Test 1'),
  ExerciseModel(id: '3', date: '20200101', time: '1010', name: 'Test 1'),
  ExerciseModel(id: '4', date: '20200101', time: '1010', name: 'Test 1'),
];

void main() {
  Injector.enableTestMode = true;
  group('ExerciseListScreen', () {
    Widget exerciseListScreen;
    setUp(() {
      exerciseListScreen = MaterialApp(
        home: Injector(
          inject: [
            Inject<ExerciseListService>(() => MockExerciseListService())
          ],
          builder: (_) => ExerciseListScreen(),
        ),
      );
    });
    testWidgets(
      'should show welcome message and two buttons when no data was found in the local storage',
      (WidgetTester tester) async {
        await tester.pumpWidget(exerciseListScreen);
        expect(find.byType(Scaffold), findsOneWidget);

        expect(
          (IN.get<ExerciseListService>() as MockExerciseListService)
              .exerciseExists,
          false,
        );
        expect(find.text('Welcome to APP'), findsOneWidget);
        expect(find.text('You have no exercises today'), findsOneWidget);
        expect(find.text('Which action do you want to do?'), findsOneWidget);

        expect(find.byKey(Key('EXERCISE_LIST')), findsNothing);
        expect(find.text('Create exercise'), findsOneWidget);
        expect(find.text('Create routin'), findsOneWidget);
      },
    );

    group('when loading data form local storage', () {
      testWidgets(
        'should show list of exercises when data was found for the currnet day "2020-01-01"',
        (WidgetTester tester) async {
          await tester.pumpWidget(exerciseListScreen);
          expect(find.byType(Scaffold), findsOneWidget);

          expect(
            (IN.get<ExerciseListService>() as MockExerciseListService)
                .exerciseExists,
            false,
          );
          (IN.get<ExerciseListService>() as MockExerciseListService)
              .exerciseExists = true;
          await tester.pump();

          expect(
            (IN.get<ExerciseListService>() as MockExerciseListService)
                .list
                .length,
            4,
          );

          expect(find.text('Item'), findsNWidgets(4));
        },
      );
    });
  });
}
