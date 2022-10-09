class Plate {
  int id;
  String name;
  String description;
  int price;
  String image;
  List comboContains;
  int colorCardExadecimal;

  Plate({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.image,
    required this.comboContains,
    required this.colorCardExadecimal,
  });

  factory Plate.fromJson(Map<String, dynamic> json) => Plate(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        price: json["price"],
        image: json["image"],
        comboContains: json["combo_contains"],
        colorCardExadecimal: json["color_card_exadecimal"],
      );
}
