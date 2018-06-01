class CardPost {
  final String id;
  final String oracleId;
  final String name;
  final String body;
  final Map<String, dynamic> imageUris;
  final String setName;
  final String rarity;
  final bool isReprint;
  final String manaCost;


  CardPost({this.id, this.oracleId, this.name, this.body, this.imageUris, this.setName, this.rarity, this.isReprint, this.manaCost});

  factory CardPost.fromJson(Map<String, dynamic> json) {
    return new CardPost(
      oracleId: json['oracle_id'],
      id: json['id'],
      name: json['name'],
      body: json['oracle_text'],
      imageUris: json['image_uris'],
      setName: json['set_name'],
      rarity: json['rarity'],
      isReprint: json['reprint'],
      manaCost: json['mana_cost']
    );
  }
}