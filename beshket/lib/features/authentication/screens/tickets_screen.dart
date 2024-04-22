//<Martin Podmanicky>                   child: MessageScreen(user: users[builder]),
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:beshket/models/ticket.dart';
import 'package:http/http.dart' as http;

class TicketPage extends StatefulWidget {
  const TicketPage({super.key, required this.name});

  final String name;

  @override
  State<TicketPage> createState() => _TicketPageState();
}

class _TicketPageState extends State<TicketPage> {
  int currentPageIndex = 2;
  List<Ticket> tickets = [];

  Future<void> _getTickets() async {
    try {
      final response =
          await http.post(Uri.parse('http://localhost:3000/temp/tickets'),
              body: jsonEncode({
                'name': widget.name,
              }),
              headers: {'Content-Type': 'application/json'},
              encoding: Encoding.getByName('utf-8'));
      if (response.statusCode == 200) {
        final ticketsJson = jsonDecode(response.body) as List;
        tickets = ticketsJson
            .map((ticketJson) => Ticket.fromJson(ticketJson))
            .toList();
        setState(() {});
      } else {
        print('Failed to connect to server.');
      }
    } catch (error) {
      print(error);
    }
  }

  @override
  initState() {
    super.initState();
    _getTickets();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tickets',
            style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Theme.of(context).colorScheme.tertiary)),
        centerTitle: false,
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      body: tickets.isEmpty
          ? Center(
              child: Column(
                children: [
                  Icon(Icons.emoji_people_rounded,
                      size: 100.0,
                      color: Theme.of(context).colorScheme.primary),
                  Text(
                    'You have no tickets...',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w900,
                        color: Theme.of(context).colorScheme.primary),
                  )
                ],
              ),
            )
          : Expanded(
              child: ListView.builder(
                itemCount: tickets.length,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  final ticket = tickets[index];
                  return Card(
                    child: Row(
                      children: [
                        Expanded(
                          child: GestureDetector(
                              child: ListTile(
                            title: Text(ticket.name),
                            subtitle:
                                Text('${ticket.date} -${ticket.location}'),
                            trailing: Text(ticket.code),
                          )),
                        )
                      ],
                    ),
                  );
                },
              ),
            ),
    );
  }
}
