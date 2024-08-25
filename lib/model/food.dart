class Food {
  final String name;
  final String description;
  final String image;
  final double price;
  final FoodCategory category;
  final List<Addon> addons;

  const Food({
    required this.name,
    required this.description,
    required this.image,
    required this.price,
    required this.category,
    required this.addons,
  });
}

//Food Categories
enum FoodCategory {
  burgers,
  salads,
  sides,
  desserts,
  drinks,
}
class Addon{
  final String name;
  final double price;

  const Addon({
    required this.name,
    required this.price,
  });
}
