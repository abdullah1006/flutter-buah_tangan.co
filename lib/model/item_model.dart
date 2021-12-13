class ItemModel {
  int index;
  String title;
  String src;
  int rating;
  int price;
  bool favorite;

  ItemModel({
    required this.index,
    required this.favorite,
    required this.title,
    required this.src,
    required this.rating,
    required this.price,
  });
}
