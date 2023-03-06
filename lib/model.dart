class Model {
  String title;

  var price;

  String category;

  String description;

  String image;

  Model({
    required this.description,
    required this.image,
    required this.title,
    required this.price,
    required this.category,
  });

  @override
  String toString() {
    return 'title =$title price=$price category=$category';
  }
}
