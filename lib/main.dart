import 'dart:math';

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:states_rebuilder/states_rebuilder.dart';

import 'models/models.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(BaseExerciseModelAdapter());
  Hive.registerAdapter(ExerciseModelAdapter());
  Hive.registerAdapter(ParametersModelAdapter());

  RM.debugPrintActiveRM = true;
  RM.debugWidgetsRebuild = true;

  runApp(MyApp());
}

class Service1 {
  bool boxExists = false;

  Future<void> init() async {
    await Hive.deleteBoxFromDisk('foo');
    boxExists = await Hive.boxExists('foo');
  }
}

class BoxService {
  Box box;
  List list = [];

  Future<void> init() async {
    await Future.delayed(Duration(milliseconds: 1000));
    box = await Hive.openBox('foo');
  }

  Future<void> adding() async {
    await Future.delayed(Duration(milliseconds: 1000));
    int id = await box.add(Random().nextDouble().toString());
    list.add(box.get(id));
  }

  Future<void> listing() async {
    list = box.values.toList();
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Injector(
      inject: [
        Inject<Service1>(() => Service1(), name: 'Service1'),
        Inject<BoxService>(() => BoxService()),
      ],
      builder: (_) {
        return MaterialApp(
          navigatorKey: RM.navigate.navigatorKey,
          themeMode: ThemeMode.dark,
          home: Scaffold(
            body: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                WhenRebuilder(
                  tag: '1',
                  observe: () => RM.future(IN.get<Service1>().init()),
                  onWaiting: () => Center(child: Text('Waiting')),
                  onIdle: () => Container(),
                  onError: (error) => Text('Error'),
                  onData: (data) {
                    print(data);
                    return StateBuilder<Service1>(
                      tag: '2',
                      observe: () => RM.get<Service1>(),
                      watch: (m) => m.state.boxExists,
                      builder: (_, m) {
                        print('refresh ${m.state.boxExists}');

                        return Center(
                          child: m.state.boxExists
                              ? Text('Box exists')
                              : Column(
                                  children: [
                                    RaisedButton(
                                      onPressed: () {
                                        RM.navigate.to(CreateExercise());
                                      },
                                      child: Text('Create Exercise'),
                                    ),
                                    RaisedButton(
                                      onPressed: () {},
                                      child: Text('Create Routine'),
                                    )
                                  ],
                                ),
                        );
                      },
                    );
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class CreateExercise extends StatelessWidget {
  const CreateExercise({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Expanded(
              child: WhenRebuilder(
                tag: '3',
                observe: () => RM.future(IN.get<BoxService>().init()),
                onWaiting: () => Text('Waiting 1'),
                onIdle: () => Text('Idle'),
                onError: (error) => Text('Error'),
                onData: (data) => WhenRebuilderOr<BoxService>(
                  tag: 'add',
                  observe: () => RM.get<BoxService>(),
                  //onWaiting: () => Text('Waiting 2'),
                  onError: (error) => Text('Error'),
                  builder: (context, model) {
                    print(model.state.list);
                    return ListView.builder(
                      itemBuilder: (_, index) =>
                          Text(model.state.list[index].toString()),
                      itemCount: model.state.list.length,
                    );
                  },
                ),
              ),
            ),
            WhenRebuilderOr<BoxService>(
              tag: '4',
              observe: () => RM.get<BoxService>(),
              builder: (context, model) {
                print('fefe');
                return model.isWaiting
                    ? CircularProgressIndicator()
                    : RaisedButton(
                        onPressed: () async {
                          await RM.get<BoxService>().setState(
                                (s) async => await s.adding(),
                              );
                        },
                        child: Text('Add'),
                      );
              },
            ),
            RaisedButton(
              onPressed: () async {
                await RM
                    .get<BoxService>()
                    .setState((s) async => await s.listing());
              },
              child: Text('Get'),
            )
          ],
        ),
      ),
    );
  }
}
