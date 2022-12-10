import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ThursdayPage extends StatefulWidget {
  const ThursdayPage({Key? key}) : super(key: key);

  @override
  _ThursdayPage createState() => _ThursdayPage();
}

@override
class _ThursdayPage extends State<ThursdayPage> {
  @override
  DateTime now = DateTime.now();
  String formattedDate = DateFormat.MMMMEEEEd().format(DateTime.now());

  List<String> workouts = [
    "workout THURSDAY",
    "workout 2",
    "workout 3",
    "workout 4",
    "workout 5",
    "workout 6",
    "workout 7",
    "workout 8",
    "workout 9",
    "workout 10",
    "workout 11",
    "workout 12",
  ];

  String text = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: const Text(
            '                          Add Workouts',
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
                    title: Text(workouts[index]),
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
