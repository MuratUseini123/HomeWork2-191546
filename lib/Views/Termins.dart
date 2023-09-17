import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../Controller/TerminController.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../Controller/TerminController.dart';
import '../Model/MyEventModel.dart';
import '../Model/TerminModel.dart';

class TerminWidget extends StatefulWidget {
  final List<MyEvent> events;

  TerminWidget({required this.events});

  @override
  State<TerminWidget> createState() => _TerminWidgetState();
}

class _TerminWidgetState extends State<TerminWidget> {
  void _showEventLocationOnMap(Termin event) {
    showModalBottomSheet(
      context: context,
      builder: (_) {
        return GestureDetector(
          onTap: () {},
          behavior: HitTestBehavior.opaque,
          child: Scaffold(
            appBar: AppBar(title: Text(event.course_name)),
            body: GoogleMap(
              initialCameraPosition: CameraPosition(
                target: LatLng(event.latitude ?? 41.9981, event.longitude ?? 21.4254),
                zoom: 14.0,
              ),
              markers: Set<Marker>.of([
                Marker(
                  markerId: MarkerId('event_location'),
                  position: LatLng(event.latitude ?? 41.9981, event.longitude ?? 21.4254),
                ),
              ]),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('List of Events'),
      ),
      body: ListView.builder(
        itemCount: widget.events.length,
        itemBuilder: (BuildContext context, int index) {
          Termin event = widget.events[index].termin;
          return ListTile(
            title: Text(event.course_name),
            subtitle: Text(event.termin_date),
            onTap: () => _showEventLocationOnMap(event),
          );
        },
      ),
    );
  }
}