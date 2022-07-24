class ItemModel {
  String itemName;
  String imgUrl;
  String unit;
  double price;
  String description;

  ItemModel({
    required this.itemName,
    required this.imgUrl,
    required this.unit,
    required this.price,
    required this.description,
  });

  @override
  String toString() {
    return 'ItemModel(itemName: $itemName, imgUrl: $imgUrl, unit: $unit, price: $price, description: $description)';
  }
}
