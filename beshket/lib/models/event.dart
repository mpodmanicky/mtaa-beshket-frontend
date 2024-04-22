class Event {
  String name;
  String price;
  String location;
  String date;
  String imagePath;

  Event({
    required this.name,
    required this.price,
    required this.location,
    required this.date,
    required this.imagePath,
  });

  String get getName => name;
  String get getPrice => price;
  String get getLocation => location;
  String get getDate => date;
  String get getImagePath => imagePath;

  factory Event.fromJson(Map<String, dynamic> json) {
    return Event(
      name: json['name'] as String,
      location: json['location'] as String,
      price: json['price'] as String,
      date: json['date'] as String,
      imagePath: json['image_url'] as String,
    );
  }
}
