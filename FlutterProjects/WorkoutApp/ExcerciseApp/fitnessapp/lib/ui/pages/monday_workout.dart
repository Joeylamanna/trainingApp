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
    "workout 1",
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
  // List<int> bottom = <int>[0];
  String text = '';

  @override
  Widget build(BuildContext context) {
    const Key centerKey = ValueKey<String>('bottom-sliver-list');
    Color getColor(Set<MaterialState> states) {
      const Set<MaterialState> interactiveStates = <MaterialState>{
        MaterialState.pressed,
        MaterialState.hovered,
        MaterialState.focused,
      };
      if (states.any(interactiveStates.contains)) {
        return Colors.blue;
      }
      return Colors.red;
    }

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
                  workouts.add('add workout');
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
                        width: 60,
                        child: Row(
                          children: [
                            Expanded(
                                child: IconButton(
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
                                               style:
                                                 TextStyle(
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
                                    color: Color.fromARGB(255, 255, 255, 255),
                                    onPressed: () {
                                      setState(() {
                                        workouts.removeAt(index);
                                      });
                                    },
                                    icon: Icon(Icons.delete))),
                            // Expanded(
                            //     child: IconButton(
                            //         color: Colors.black,
                            //         onPressed: () {
                            //           setState(() {
                            //             workouts.add('add record');
                            //           });
                            //         },
                            //         icon: Icon(Icons.add)))
                          ],
                        )),
                  ),
                ),
              );
            })
        // body: CustomScrollView(
        //   center: centerKey,
        //   slivers: <Widget>[
        //     SliverList(
        //       delegate: SliverChildBuilderDelegate(
        //         (BuildContext context, int index) {
        //           return Container(
        //             decoration: BoxDecoration(
        //               borderRadius: BorderRadius.circular(20.0),
        //               color: Colors.black,
        //             ),
        //             alignment: Alignment.center,
        //             color: Colors.blue[200 + top[index] % 4 * 100],
        //             height: 100 + top[index] % 4 * 20.0,
        //             child: Text('Item: ${top[index]}'),
        //           );
        //         },
        //         childCount: top.length,
        //       ),
        //     ),
        //     SliverList(
        //       key: centerKey,
        //       delegate: SliverChildBuilderDelegate(
        //         (BuildContext context, int index) {
        //           return Container(
        //             alignment: Alignment.center,
        //             color: Colors.blue[200 + bottom[index] % 4 * 100],
        //             height: 100 + bottom[index] % 4 * 20.0,
        //             child: Text('Item: ${bottom[index]}'),
        //           );
        //         },
        //         childCount: bottom.length,
        //       ),
        //     ),
        // ],
        // );
        );
  }
}


    // List<int> top = <int>[];
    // List<int> bottom = <int>[0];
    // const Key centerKey = ValueKey<String>('bottom-sliver-list');
    // return Scaffold(
    //   backgroundColor: Color.fromARGB(255, 255, 255, 255),
    //   appBar: AppBar(
    //     backgroundColor: Colors.black,
    //     title: const Text(
    //       'Add Workouts',
    //       style: TextStyle(
    //         color: Color.fromARGB(255, 255, 255, 255),
    //         fontFamily: "SF UI Text",
    //         fontSize: 20,
    //         fontWeight: FontWeight.w800,
    //       ),
    //     ),
    //     leading: IconButton(
    //       icon: const Icon(Icons.add),
    //       onPressed: () {
    //         setState(
    //           () {
    //             top.add(-top.length - 1);
    //             bottom.add(bottom.length);
    //           },
    //         );
    //       },
    //     ),
    //   ),
    //   body: CustomScrollView(
    //     center: centerKey,
    //     slivers: <Widget>[
    //       SliverList(
    //         delegate: SliverChildBuilderDelegate(
    //           (BuildContext context, int index) {
    //             return Container(
    //               alignment: Alignment.center,
    //               color: Colors.blue[200 + top[index] % 4 * 100],
    //               height: 100 + top[index] % 4 * 20.0,
    //               child: Text('Item: ${top[index]}'),
    //             );
    //           },
    //           childCount: top.length,
    //         ),
    //       ),
    //       SliverList(
    //         key: centerKey,
    //         delegate: SliverChildBuilderDelegate(
    //           (BuildContext context, int index) {
    //             return Container(
    //               alignment: Alignment.center,
    //               color: Colors.blue[200 + bottom[index] % 4 * 100],
    //               height: 100 + bottom[index] % 4 * 20.0,
    //               child: Text('Item: ${bottom[index]}'),
    //             );
    //           },
    //           childCount: bottom.length,
    //         ),
    //       ),
    //     ],
    //   ),
      // body: Stack(
      //   children: <Widget>[
      //     CustomScrollView(
      //       scrollDirection: Axis.vertical,
      //       slivers: <Widget>[ //new code check later
      //       Padding(
      //         padding: const EdgeInsets.symmetric(
      //           horizontal: 16.0,
      //           vertical: 16,
      //         ),
      //         child: Column(
      //           children: <Widget>[
      //             Padding(
      //               padding: const EdgeInsets.only(top: 16.0),
      //               child: IconButton(
      //                 icon: const Icon(
      //                   Icons.close,
      //                   color: Colors.white,
      //                   size: 40,
      //                 ),
      //                 onPressed: () {
      //                   Navigator.of(context).pop();
      //                 },
      //               ),
      //             ),
      //             const SizedBox(
      //               height: 20,
      //             ),
      //             ListTile(
      //               title: Text(
      //                 formattedDate,
      //                 style: const TextStyle(
      //                   fontWeight: FontWeight.w400,
      //                   fontSize: 18,
      //                   color: Colors.white,
      //                 ),
      //               ),
      //               subtitle: const Text(
      //                 "Upper Body",
      //                 style: TextStyle(
      //                   fontWeight: FontWeight.w800,
      //                   fontSize: 24,
      //                   color: Colors.white,
      //                 ),
      //               ),
      //               trailing: Column(
      //                 crossAxisAlignment: CrossAxisAlignment.start,
      //                 children: <Widget>[
      //                   Row(
      //                     mainAxisSize: MainAxisSize.min,
      //                     children: const <Widget>[
      //                       Icon(
      //                         Icons.access_time,
      //                         color: Colors.white30,
      //                       ),
      //                       SizedBox(
      //                         width: 5,
      //                       ),
      //                       Text(
      //                         "90 mins",
      //                         style: TextStyle(
      //                             color: Colors.white70,
      //                             fontWeight: FontWeight.w600,
      //                             fontSize: 16),
      //                       )
      //                     ],
      //                   ),
      //                   const SizedBox(
      //                     height: 4,
      //                   ),
      //                   Row(
      //                     mainAxisSize: MainAxisSize.min,
      //                     children: const <Widget>[
      //                       Icon(
      //                         Icons.shutter_speed,
      //                         color: Colors.white30,
      //                       ),
      //                       SizedBox(
      //                         width: 5,
      //                       ),
      //                       Text(
      //                         "Hard",
      //                         style: TextStyle(
      //                             color: Colors.white70,
      //                             fontWeight: FontWeight.w600,
      //                             fontSize: 16),
      //                       )
      //                     ],
      //                   ),
      //                 ],
      //               ),
      //             ),
      //             const SizedBox(
      //               height: 20,
      //             ),
      //           ],
      //         ),
      //       ),
      //       ],
      //     ),

      //     Positioned(
      //       top: 300,
      //       height: .4,
      //       left: 20,
      //       right: 20,
      //       child: ListView(
      //         scrollDirection: Axis.vertical,
      //         addAutomaticKeepAlives: false,
      //         // padding: const EdgeInsets.all(10),
      //         children: <Widget>[
      //           Expanded(
      //             child: Container(
      //               decoration: BoxDecoration(
      //                 borderRadius: BorderRadius.circular(20.0),
      //                 gradient: const LinearGradient(
      //                   begin: Alignment.topCenter,
      //                   end: Alignment.bottomCenter,
      //                   colors: <Color>[
      //                     Color.fromARGB(255, 1, 217, 255),
      //                     Colors.black
      //                   ],
      //                 ),
      //               ),
      //               height: 100,
      //               // color: Color.fromARGB(255, 1, 217, 255),
      //               child: const Center(
      //                 child: Text(
      //                   "Monday",
      //                   style: TextStyle(
      //                     color: Color.fromARGB(255, 255, 255, 255),
      //                     fontFamily: ".SF UI Text",
      //                     fontSize: 30,
      //                     fontWeight: FontWeight.w300,
      //                   ),
      //                 ),
      //               ),
      //             ),
      //           ),
      //           Container(
      //             decoration: BoxDecoration(
      //               borderRadius: BorderRadius.circular(20.0),
      //               gradient: const LinearGradient(
      //                   begin: Alignment.topCenter,
      //                   end: Alignment.bottomCenter,
      //                   colors: <Color>[
      //                     Color.fromARGB(255, 1, 217, 255),
      //                     Colors.black
      //                   ]),
      //             ),
      //             height: 100,
      //             // color: Color.fromARGB(255, 1, 217, 255),
      //             child: const Center(
      //                 child: Text('Tuesday',
      //                     style: TextStyle(
      //                       color: Color.fromARGB(255, 255, 255, 255),
      //                       fontFamily: ".SF UI Text",
      //                       fontSize: 30,
      //                       fontWeight: FontWeight.w300,
      //                     ))),
      //           ),
      //           Container(
      //             decoration: BoxDecoration(
      //               borderRadius: BorderRadius.circular(20.0),
      //               gradient: const LinearGradient(
      //                   begin: Alignment.topCenter,
      //                   end: Alignment.bottomCenter,
      //                   colors: <Color>[
      //                     Color.fromARGB(255, 1, 217, 255),
      //                     Colors.black
      //                   ]),
      //             ),
      //             height: 100,
      //             // color: Color.fromARGB(255, 1, 217, 255),
      //             child: const Center(
      //                 child: Text('Wednesday',
      //                     style: TextStyle(
      //                       color: Color.fromARGB(255, 255, 255, 255),
      //                       fontFamily: ".SF UI Text",
      //                       fontSize: 30,
      //                       fontWeight: FontWeight.w300,
      //                     ))),
      //           ),
      //           Container(
      //             decoration: BoxDecoration(
      //               borderRadius: BorderRadius.circular(20.0),
      //               gradient: const LinearGradient(
      //                   begin: Alignment.topCenter,
      //                   end: Alignment.bottomCenter,
      //                   colors: <Color>[
      //                     Color.fromARGB(255, 1, 217, 255),
      //                     Colors.black
      //                   ]),
      //             ),
      //             height: 100,
      //             // color: Color.fromARGB(255, 1, 217, 255),
      //             child: const Center(
      //                 child: Text('Thursday',
      //                     style: TextStyle(
      //                       color: Color.fromARGB(255, 255, 255, 255),
      //                       fontFamily: ".SF UI Text",
      //                       fontSize: 30,
      //                       fontWeight: FontWeight.w300,
      //                     ))),
      //           ),
      //           Container(
      //             decoration: BoxDecoration(
      //               borderRadius: BorderRadius.circular(20.0),
      //               gradient: const LinearGradient(
      //                   begin: Alignment.topCenter,
      //                   end: Alignment.bottomCenter,
      //                   colors: <Color>[
      //                     Color.fromARGB(255, 1, 217, 255),
      //                     Colors.black
      //                   ]),
      //             ),
      //             height: 100,
      //             // color: Color.fromARGB(255, 1, 217, 255),
      //             child: const Center(
      //                 child: Text('Friday',
      //                     style: TextStyle(
      //                       color: Color.fromARGB(255, 255, 255, 255),
      //                       fontFamily: ".SF UI Text",
      //                       fontSize: 30,
      //                       fontWeight: FontWeight.w300,
      //                     ))),
      //           ),
      //         ],
      //       ),
      //     ),
      //   ],
      // ),
//     );
//   }
// }