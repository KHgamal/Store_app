class ProductModel {
  String title;

  var price;

  bool isFavourite=false;

  String category;

  String description;

  String image;

  var rating;

  ProductModel({
    required this.rating,
    required this.description,
    required this.image,
    required this.title,
    required this.price,
    required this.category,
  });

 factory ProductModel.fromJson(dynamic data){
   return ProductModel(description: data['description'], image: data['image'],
       title:data['title'], price: data['price'], category: data['category'], rating: data['rating']["rate"]);
 }
 

  @override
  String toString() {
    return 'title =$title price=$price category=$category';
  }
}
