import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class MondayPage extends StatefulWidget {
  const MondayPage({Key? key}) : super(key: key);

  @override
  _MondayPage createState() => _MondayPage();
}

@override
class _MondayPage extends State<MondayPage> {
  @override
  DateTime now = DateTime.now();
  String formattedDate = DateFormat.MMMMEEEEd().format(DateTime.now());

  List<String> workouts = [
    "Bench Press: 135lb x 10reps",
    "Bench Press: 155lb x 3reps",
    "Bench Press: 165lb x 10reps",
    "Bench Press: 185lb x 5reps",
    "Bench Press: 185lb x 5reps",
    "Bench Press: 225lb x 3reps",
    "Bench Press: 185lb x 5reps",
    "Bench Press: 185lb x 5reps",
    "Incline Dumbbells: 40lbs x 10reps",
    "Incline Dumbbells: 45lbs x 8reps",
    "Incline Dumbbells: 50lbs x 5reps",
    "Incline Dumbbells: 60lbs x 5reps",
    "Tricep Pulldowns: 40lb x 20reps",
    "Tricep Pulldowns: 45lb x 15reps",
    "Tricep Pulldowns: 45lb x 15reps",
    "Tricep Pulldowns: 50lb x 10reps",
    "Pec Deck Machine: 70lb x 20reps",
    "Pec Deck Machine: 80lb x 20reps",
    "Pec Deck Machine: 90lb x 15reps",
    "Pec Deck Machine: 100lb x 15reps",
  ];

  String text = '';
  Color currentColor = Colors.white;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: const Text(
            '                    Add Workouts',
            style: TextStyle(
              color: Color.fromARGB(255, 255, 255, 255),
              fontFamily: "SF UI Text",
              fontSize: 20,
              fontWeight: FontWeight.w800,
            ),
          ),
          actions: <Widget>[
            IconButton(
              splashRadius: 35,
              autofocus: false,
              icon: const Icon(Icons.add),
              onPressed: () {
                setState(() {
                  workouts.add("workout ${workouts.length + 1}");
                });
              },
            ),
          ],
        ),
        backgroundColor: Colors.black,
        body: ListView.builder(
            scrollDirection: Axis.vertical,
            itemCount: workouts.length,
            itemBuilder: (context, index) {
              return Card(
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(45.0)),
                  side: BorderSide(color: Color.fromARGB(255, 255, 255, 255)),
                ),
                color: Color.fromARGB(255, 0, 0, 0),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: ListTile(
                    textColor: Color.fromARGB(255, 255, 255, 255),
                    selectedTileColor: Colors.white,
                    title: Text(workouts[index],
                        style: const TextStyle(fontSize: 15)),
                    trailing: Container(
                        width: 80,
                        child: Row(
                          children: [
                            Expanded(
                                child: IconButton(
                                    padding: const EdgeInsets.all(1.0),
                                    splashRadius: 2,
                                    color: Color.fromARGB(255, 255, 255, 255),
                                    onPressed: () {
                                      showDialog(
                                        context: context,
                                        builder: (context) => SimpleDialog(
                                          children: [
                                            TextField(onChanged: (value) {
                                              setState(() {
                                                text = value;
                                              });
                                            }),
                                            ElevatedButton(
                                              onPressed: () {
                                                setState(() {
                                                  workouts[index] = text;
                                                });
                                                Navigator.pop(context);
                                              },
                                              child: const Text(
                                                'Update',
                                                style: TextStyle(
                                                  color: Color.fromARGB(
                                                      255, 255, 255, 255),
                                                  fontFamily: "SF UI Text",
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.w800,
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                      );
                                    },
                                    icon: Icon(Icons.edit))),
                            Expanded(
                                child: IconButton(
                                    padding: const EdgeInsets.all(7.0),
                                    splashRadius: 2,
                                    color: Color.fromARGB(255, 255, 255, 255),
                                    onPressed: () {
                                      setState(() {
                                        workouts.removeAt(index);
                                      });
                                    },
                                    icon: Icon(Icons.delete))),
                            Expanded(
                                child: IconButton(
                                    splashRadius: 2,
                                    color: Color.fromARGB(255, 255, 255, 255),
                                    onPressed: () {
                                      setState(() {
                                        workouts.add(
                                            "workout ${workouts.length + 1}");
                                      });
                                    },
                                    icon: Icon(Icons.add)))
                          ],
                        )),
                  ),
                ),
              );
            }));
  }
}
