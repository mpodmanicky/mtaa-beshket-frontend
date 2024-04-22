import 'dart:convert';

import 'package:beshket/features/authentication/widgets/homescreen_buttons.dart';
import 'package:beshket/features/authentication/widgets/profile_widget.dart';
import 'package:beshket/models/event.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class MainScreen extends StatefulWidget {
  const MainScreen({super.key, required this.name});
  final String name;

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  // String _buttonText = 'Push me!';
  List<Event> _events = [];
  Future<void> _fetchEvents() async {
    try {
      final response =
          await http.get(Uri.parse('http://localhost:3000/temp/events'));
      if (response.statusCode == 200) {
        final eventsJson = jsonDecode(response.body) as List;
        _events =
            eventsJson.map((eventJson) => Event.fromJson(eventJson)).toList();
        setState(() {});
      }
    } catch (error) {
      print(error);
    }
  }

  @override
  Widget build(BuildContext context) {
    @override
    void initState() {
      super.initState();
      _fetchEvents();
    }

    _fetchEvents();

    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(top: 15.0),
            child: ProfileWidget(name: widget.name),
          ),
          Padding(
            padding: EdgeInsets.all(15.0),
            child: SearchBar(
              leading: Icon(Icons.search),
              hintText: 'Search',
              onSubmitted: (query) {
                print('Searched for $query');
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.0),
            child: SegmentedFilterButton(),
          ),
          SizedBox(height: 10.0),
          _events.isEmpty
              ? Center(child: CircularProgressIndicator())
              : Expanded(
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: _events.length,
                    itemBuilder: (context, index) {
                      final event = _events[index];
                      return Card(
                        child: Row(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(8.0),
                              child: Image.network(
                                event.imagePath,
                                width: 100,
                                height: 100,
                                fit: BoxFit.cover,
                              ),
                            ),
                            SizedBox(width: 10.0),
                            Expanded(
                              child: ListTile(
                                title: Text(event.name),
                                subtitle:
                                    Text('${event.date} - ${event.location}'),
                                trailing: Text(event.price),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
        ],
      ),
    );
  }
}
