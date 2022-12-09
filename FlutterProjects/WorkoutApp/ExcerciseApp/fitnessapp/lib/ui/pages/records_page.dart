import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class RecordsPage extends StatefulWidget {
  const RecordsPage({Key? key}) : super(key: key);

  @override
  _RecordsPage createState() => _RecordsPage();
}

class _RecordsPage extends State<RecordsPage> {
  //final Future<FirebaseApp> _fApp = Firebase.initializeApp();

  String newRecord = 'insert record here';

  var recordData = ['bench: 200lbs', 'adf', 'adfd'];
  
  String text = '';
  String temp = "";
  @override
  Widget build(BuildContext context) {
    DatabaseReference _testRef =
        FirebaseDatabase.instance.ref().child('record0');
    //FirebaseDatabase.instance.ref().child('record1');

    for (int i = 0; i < 3; i++) {
      _testRef = FirebaseDatabase.instance.ref().child('record$i');
       _testRef.onValue.listen(
        (event) {
          temp = event.snapshot.value.toString();
        },
      );
      recordData.add(temp);
    }
    // for (int i = 0; i < 3; i++) {
    //   _testRef = FirebaseDatabase.instance.ref().child(recordIndex[i]);
    //   recordData.add(temp);
    //   _testRef.onValue.listen(
    //     (event) {
    //       temp = event.snapshot.value.toString();
    //     },
    //   );
    // }

    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 1, 217, 255),
          title: const Text("Personal Records"),
          foregroundColor: Color.fromARGB(255, 0, 0, 0),
        ),
        backgroundColor: Colors.black,
        body: ListView.builder(
            scrollDirection: Axis.vertical,
            itemCount: recordData.length,
            itemBuilder: (context, index) {
              return Card(
                color: Color.fromARGB(255, 1, 217, 255),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: ListTile(
                    textColor: Color.fromARGB(255, 0, 0, 0),
                    selectedTileColor: Colors.white,
                    title: Text(recordData[index]),
                    trailing: Container(
                        width: 100,
                        child: Row(
                          children: [
                            Expanded(
                                child: IconButton(
                                    color: Colors.black,
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
                                                  recordData[index] = text;
                                                });
                                                Navigator.pop(context);
                                              },
                                              child: Text('update'),
                                            )
                                          ],
                                        ),
                                      );
                                    },
                                    icon: Icon(Icons.edit))),
                            Expanded(
                                child: IconButton(
                                    color: Colors.black,
                                    onPressed: () {
                                      setState(() {
                                        recordData.removeAt(index);
                                      });
                                    },
                                    icon: Icon(Icons.delete))),
                            Expanded(
                                child: IconButton(
                                    color: Colors.black,
                                    onPressed: () {
                                      setState(() {
                                        _testRef.onValue.listen(
                                          (event) {
                                            setState(() {
                                              newRecord = event.snapshot.value
                                                  .toString();
                                            });
                                          },
                                        );
                                        recordData.add(newRecord);
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
