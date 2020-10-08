# APP

Some text about app...

#### Exercise box

A base Exercise model (without params)

```dart
Hive.openBox('exercise').get<List<BaseExercise>>('20201010121230900');
class BaseExercise {
  String id; // required
  String date; // required
  String time: // required
  String name; // required
  String note;
  List<String> muscleGroup; // required
}
// Day exercise instance will extend from this class
```

```json
{
  "20201010121230900": {
    "id": "20201010121230900",
    "date": "20201010",
    "time": "121230900",
    "name": "Bary 1",
    "note": "Lorem ipsum bla bla",
    "muscle_group": ["BARY"]
  }
}
```

---

#### Category box

```dart
Hive.openBox('category').get<List<String>>('muscle_group');
```

```json
{
  "muscle_group": ["BICEPS", "TRICEPS"]
  // in future
  "events": ["MEETING", "TODO", "CALL"]
}
```

---

#### Type box

```dart
Hive.openBox('type').get<List<String>>('action_type');
```

```json
{
  "action_type": ["EXERCISE", "REST", "PREPARE"],
  "body_parts": ["BOTH", "LEFT", "RIGHT"]
}
```

---

#### Day box

```dart
Hive.openBox('day').get<List<Exercise>>('20201010');

class Exercise extends BaseExercise {
  Parameters parameters;
}

class Parameters {
  String bodyParts; // required
  String actionType; // required
  int weight = 0;
  int reps = 0;
  int time = 0;
  bool solidTime = false;
  int intensity = 0;
  int inSet = 0; // default 0, zero means that exercise is not applied to any set
  List<String> note;
}
```

Device calendar API package
https://pub.dev/packages/device_calendar

```json
{
  "20201010": [
    {
      "id": "20201010121230900",
      "instance_id": "06dad158-08d2-11eb-adc1-0242ac120002",
      "date": "20201010",
      "time": "121230900",
      "name": "Bary 1",
      "note": "Lorem ipsum bla bla",
      "parameters": {
        "body_parts": "BOTH",
        "action_type": "EXERCISE",
        "weight": 40,
        "reps": 15,
        "time": 60,
        "solid_time": true,
        "intensity": 3,
        "in_set": 0,
        "note": ["note 1"]
      }
    },
    {
      "id": "20201010121230900",
      "instance_id": "06dad158-08d2-11eb-adc1-0242ac120002",
      "date": "20201010",
      "time": "121230901",
      "name": "Bary 2",
      "note": "Lorem ipsum bla bla",
      "parameters": {
        "body_parts": "BOTH",
        "action_type": "EXERCISE",
        "weight": 40,
        "reps": 15,
        "time": 60,
        "solid_time": true,
        "intensity": 3,
        "in_set": 0,
        "note": ["note 1"]
      }
    }
  ]
}
```

---

#### History box

```dart
// id of the main object in exercise `Box()`
Hive.openBox('history').get<List<History>>('20201010121230900')
class History {}
```

```json
{
  "20201010121230900": [
    {
      "id": "20201010121330423",
      "params": {
        "weight": 40,
        "reps": 15,
        "time": 60
      }
    },
    {
      "id": "20201010121330423",
      "params": {
        "weight": 40,
        "reps": 15,
        "time": 60
      }
    }
  ]
}
```
