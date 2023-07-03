import 'package:flutter/material.dart';
import 'package:habit_tracker/details.dart';
import 'package:intl/intl.dart';

void main() {
  runApp(MyApp());
}


class MyApp extends StatelessWidget {
  // This widget is the root of the application
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Habit Tracker',
      theme: ThemeData(
          primarySwatch: Colors.blue,
        fontFamily: 'Raleway'
      ),
      home: Home(),
      routes: {
        '/details': (context) => const Details(),
      },
    );
  }
}

List<Map<String, dynamic>> habits = [
  {
    'color': Colors.blue,
    'title': 'YP',
    'fulltext': 'Yoga Practices',
  },
  {
    'color': Colors.red,
    'title': 'GE',
    'fulltext': 'Get Up Early',
  },  {
    'color': Colors.cyan,
    'title': 'NS',
    'fulltext': 'No Sugar',
  },
];

List<Map<String, dynamic>> habits2 = [
  {
    'color': const Color(0xff7524ff),
    'objective': 'Learn 5 new words',
    'progress': '5 from 7 this week'
  },
  {
    'color': const Color(0xfff03244),
    'objective': 'Get Up Early',
    'progress': '5 from 7 this week'
  },  {
    'color': const Color(0xff00d5e2),
    'objective': 'Create an App a Day',
    'progress': '6 from 7 this week'
  },
];

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          backgroundColor: const Color(0xff131b26),
          body: Container(
            padding: const EdgeInsets.only(top: 25.0, left: 25.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget> [
                  Row(
                    children: <Widget> [
                      Expanded(
                          child: RichText(
                            softWrap: true,
                            text: const TextSpan(
                              children: [
                                TextSpan(
                                  text: 'Most Popular',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                    fontSize: 25,
                                  )
                                ),
                                TextSpan(
                                  text: 'Habits',
                                  style: TextStyle(
                                    fontSize: 25,
                                    color: Colors.white,
                                  )
                                )
                              ]
                            ),
                          )
                      ),
                      Material(
                        color: Colors.transparent,
                          child: InkWell(
                            onTap: () {},
                            child: Container(
                              padding: const EdgeInsets.all(9.0),
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: Color(0xff6f1bff),
                                boxShadow: [
                                  BoxShadow(
                                    color: Color(0xff6f1bff),
                                    offset: Offset(0, 3),
                                    blurRadius: 5.0,
                                  )
                                ]
                              ),
                              child: const Icon(
                                Icons.add,
                                color: Colors.white,
                              ),
                            ),
                          ),
                      ),
                      const SizedBox(
                        width: 25.0,
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 35.0,
                  ),
                  Container(
                    height: 150,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                          itemCount: habits.length,
                          itemBuilder: (ctx, id) {
                          return Container(
                            width: 150,
                              margin:
                            const EdgeInsets.only(right: 15.0, top: 9.0, bottom: 9.0),
                            padding: const EdgeInsets.all(13.0),
                            decoration: BoxDecoration(
                              color: habits[id]['colors'],
                              borderRadius: BorderRadius.circular(15),
                              boxShadow: [
                                BoxShadow(
                                  color: habits[id]['color'],
                                  blurRadius: 5.0,
                                  offset: const Offset(0, 3),
                                )
                              ]
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget> [
                                  Text(
                                    habits[id]['title'],
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 27,
                                      color: Colors.white
                                    ),
                                  ),
                                  Text(
                                    habits[id]['fulltext'],
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15,
                                        color: Colors.white
                                    ),
                                  ),
                                ],
                            ),
                          );
                          }
                      ),
                  ),
                  const SizedBox(
                    height: 35.0,
                  ),
                  Container(
                    height: 90,
                    decoration: const BoxDecoration(
                      color: Color(0xff1b232e),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(15),
                        bottomLeft: Radius.circular(15),
                      )
                    ),
                    padding: const EdgeInsets.all(15),
                    child: ListView.builder(
                      itemCount: 7,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (ctx, f) {
                        int day = DateTime.now().day + f;
                        return FittedBox(
                          child: Container(
                            width: 90,
                              height: 90,
                              margin: const EdgeInsets.only(right: 15.0),
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: day == DateTime.now().day
                                  ? const Color(0xff727be8)
                                  : const Color(0xff131b26),
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                            padding: const EdgeInsets.all(15.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget> [
                                Text(
                                  '${DateTime.now().day + f}',
                                  style: TextStyle(
                                    fontSize: 25,
                                    fontWeight: day == DateTime.now().day
                                      ? FontWeight.bold
                                        : FontWeight.normal,
                                    color: day == DateTime.now().day
                                      ? Colors.white
                                        : Colors.grey[500],
                                  ),
                                ),
                                Text(
                                  DateFormat('EE').format(
                                    DateTime.now().add(
                                      Duration(days: f),
                                    ),
                                  ),
                                  style: TextStyle(
                                    color: day == DateTime.now().day
                                        ? Colors.white
                                    : Colors.grey[700],
                                    fontWeight: day == DateTime.now().day
                                      ? FontWeight.bold
                                        : FontWeight.normal
                                  ),
                                )
                              ],
                            ),
                          ),
                        );
                        }
                    ),
                  ),
                  const SizedBox(
                    height: 35.0,
                  ),
                  RichText(
                      text: TextSpan(
                        children: [
                          const TextSpan(
                          text: 'Your Habits',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 21
                            )
                          ),
                          TextSpan(
                            text: " 5",
                            style: TextStyle(
                              color: Colors.grey[500],
                              fontSize: 21
                            )
                          )
                        ]
                      )
                  ),
                  // ListItem(id: 1,)
                  Expanded(
                      child: ListView.builder(
                        itemCount: habits2.length,
                          itemBuilder: (ctx, id) {
                          return ListItem(id: id);

                          }
                      )
                  )
                ],
            ),
          ),
        )
    );
  }
}

class ListItem extends StatelessWidget {
  final int id;

  const ListItem({key, required this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, '/details');
      },
      child: Container(
// height 150
        margin: const EdgeInsets.symmetric(vertical: 21.0),
        padding: const EdgeInsets.only(right: 25.0),
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Container(
                  padding: const EdgeInsets.all(5.0),
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: id == 0 ? habits2[id]['color'] : Colors
                          .transparent,
                      border: id == 0
                          ? const Border()
                          : Border.all(
                        color: Colors.grey,
                      )
                  ),
                  child: Icon(
                    Icons.check,
                    color: id == 0 ? Colors.white : Colors.grey[500]
                  ),
                ),
                const SizedBox(
                  width: 15,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget> [
                    Text(
                      habits2[id]['objective'],
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 19
                      ),
                    ),
                    const SizedBox(
                      height: 3,
                    ),
                    Text(
                      habits2[id]['progress'],
                      style: TextStyle(
                        color: Colors.grey[500],
                        fontSize: 17
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    )
                  ],
                )
              ],
            ),
            LinearProgressIndicator(
              value: .71,
              backgroundColor: const Color(0xff1c232d),
              valueColor: AlwaysStoppedAnimation(
                habits2[id]['color']
              ),
            )
          ],
        ),
      ),
    );
  }
}