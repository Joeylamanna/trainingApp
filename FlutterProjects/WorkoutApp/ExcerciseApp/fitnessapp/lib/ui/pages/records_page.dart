import 'package:flutter/material.dart';

class RecordsPage extends StatefulWidget {
  const RecordsPage({Key? key}) : super(key: key);

  @override
  _RecordsPage createState() => _RecordsPage();
}

class _RecordsPage extends State<RecordsPage> {
  List<String> recordData = ['Bench: 225lbs', 'Squat: 315lbs ', 'Deadlift 405lbs'];
  String text = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: const Color.fromARGB(255, 1, 217, 255),
          title: const Text(
            "Personal Records",
            style: TextStyle(
              color: Color.fromARGB(255, 0, 0, 0),
              fontFamily: ".SF UI Text",
              fontSize: 25,
              fontWeight: FontWeight.w700,
            ),
          ),
          actions: <Widget>[
            IconButton(
              splashRadius: 35,
              autofocus: false,
              icon: const Icon(Icons.add),
              onPressed: () {
                setState(() {
                  recordData.add('add record');
                });
              },
            ),
          ],
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
                                          
                                          backgroundColor: Color.fromARGB(255, 1, 217, 255),
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
                                        recordData.add('add record');
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
