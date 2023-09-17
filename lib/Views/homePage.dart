import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:src/Views/take_picture_screen.dart';
import '../Controller/TerminController.dart';
import '../Model/TerminModel.dart';

import 'Termins.dart';
import 'add_new_elem.dart';
import 'auth.dart';
import 'calendar.dart';
import '../Model/MyEventModel.dart';
import 'random_fact_page.dart';
import 'package:flutter/material.dart';
import 'package:camera/camera.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  void _addItemFunction(BuildContext ct) {
    showModalBottomSheet(
      context: ct,
      builder: (_) {
        return GestureDetector(
          onTap: () {},
          behavior: HitTestBehavior.opaque,
          child: NewCourseTermin(),
        );
      },
    ).whenComplete(() {
      setState(() {});
    });
  }

  void _showCalendar(BuildContext ctx, List<MyEvent> evs) {
    showModalBottomSheet(
      context: ctx,
      builder: (_) {
        return GestureDetector(
          onTap: () {},
          behavior: HitTestBehavior.opaque,
          child: MyCalendar(events: evs),
        );
      },
    );
  }

  List<MyEvent> initEvents() {
    final List<MyEvent> evs = <MyEvent>[];
    List<Termin> termins = TerminHelper.temp;
    print(termins);
    for (var termin in termins) {
      evs.add(MyEvent(termin: termin, c: Theme.of(context).primaryColor));
    }
    return evs;
  }
   var firstCamera = null;
   void initCamera() async {
    final cameras = await availableCameras();
    firstCamera = cameras.first;
  }

  @override
  Widget build(BuildContext context) {
    List<MyEvent> myEvents = initEvents();
    initCamera();

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showCalendar(context, myEvents),
        tooltip: "Calendar",
        child: const Icon(Icons.calendar_month),
      ),
      appBar: AppBar(
        automaticallyImplyLeading: true,
        title: Text(widget.title),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => TerminWidget(events: myEvents)),
              );
            },
            icon: const Icon(Icons.format_list_bulleted_add),
            tooltip: "List of Termins",
          ),
          const SizedBox(
            width: 15,
          ),
          IconButton(
            onPressed: () => _addItemFunction(context),
            icon: const Icon(Icons.add),
            tooltip: "Create new termin",
          ),
          const SizedBox(
            width: 15,
          ),
          IconButton(
            icon: const Icon(Icons.logout),
            tooltip: "Log out",
            onPressed: () {
              print(LoginAuth.isLoggedin);
              LoginAuth.isLoggedin = false;
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (_) => const LoginAuth()),
              );
            },
          ),
        ],
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: ListView(
            children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => RandomFactPage()),
                  );
                },
                child: Text('Get Random Science Fact'),
              ),
              const SizedBox(
                width: 15,
                height: 15,
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => TakePictureScreen(camera: firstCamera)),
                  );
                },
                child: Text('Take a Picture'),
              ),
            ],
          ),
        ),
      )
    );
  }
}