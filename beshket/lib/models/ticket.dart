class Ticket {
  final String owner;
  final String name;
  final String date;
  final String location;
  final String code;

  Ticket({
    required this.owner,
    required this.name,
    required this.date,
    required this.location,
    required this.code,
  });

  factory Ticket.fromJson(Map<String, dynamic> json) {
    return Ticket(
      owner: json['owner'],
      name: json['name'],
      date: json['date'],
      location: json['location'],
      code: json['code'],
    );
  }

  String get ownerName => owner;
  String get eventName => name;
  String get eventDate => date;
  String get eventLocation => location;
  String get ticketCode => code;
}
