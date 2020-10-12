import 'package:app/services/local_data_service.dart';
import 'package:flutter/material.dart';
import 'package:states_rebuilder/states_rebuilder.dart';

class ExerciseListScreen extends StatelessWidget {
  const ExerciseListScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WhenRebuilderOr<ExerciseListService>(
        initState: (_, model) {
          print('initState()');
          model.setState((s) => s.getExercisesBy('20201010'));
        },
        observe: () => RM.get<ExerciseListService>(),
        onWaiting: () => Text('Waiting...'),
        onIdle: () => Text('Idle'),
        onError: (error) => Text('Error'),
        builder: (context, model) {
          print('builder() ${model.state.list.length}');
          return !model.state.exerciseExists
              ? Container(
                  color: Colors.green.shade100,
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text('Welcome to APP'),
                        Text('Which action do you want to do?'),
                        RaisedButton(
                          onPressed: () {},
                          child: Text('Create exercise'),
                        ),
                        RaisedButton(
                          onPressed: () {},
                          child: Text('Create routin'),
                        )
                      ],
                    ),
                  ),
                )
              : Column(
                  children: model.state.list.map((e) => Text('Item')).toList());
        },
      ),
    );
  }
}
