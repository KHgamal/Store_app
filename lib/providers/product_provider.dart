import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:creativa/models/product_model.dart';
import 'package:flutter/material.dart';

class ProductProvider extends ChangeNotifier {
  List<ProductModel> dataList = [];
  int selectedIndex=0;

  bool categoryTapped =false;
  Set categories={};
  String chosenCategory="";
  List indexesOfChosenCategory=[];

  List<ProductModel>favourite=[];

  removeDuplicatedCategories(){
      for(int i=0;i<dataList.length;i++){
        categories.add(dataList[i].category);
      }
notifyListeners();
  }
  chosenCategoryMethod(index){
    indexesOfChosenCategory=[];
    selectedIndex=index;
    categoryTapped=true;
    chosenCategory=categories.elementAt(selectedIndex);
    for(int i=0;i<dataList.length;i++){
      if(dataList[i].category==chosenCategory) {
        indexesOfChosenCategory.add(i);

      }
    }
    notifyListeners() ;
  }
 /* getProducts(){
    dataList=[];
    for(int i=0;i<data.length;i++){
      dataList.add(ProductModel.fromJson(data[i]));
    }
    removeDuplicatedCategories();
    notifyListeners();
  }*/
  addToFavourite(index){
    dataList[index].isFavourite ==false ? dataList[index].isFavourite=true:
    dataList[index].isFavourite =false;
    favourite.add(dataList[index]);
    notifyListeners();
  }
 getProducts()async {
    Uri url = Uri.parse('https://fakestoreapi.com/products');
    http.Response response = await http.get(url);
    if (response.statusCode == 200) {
      List data = jsonDecode(response.body);
        for(int i=0;i<data.length;i++){
          dataList.add(ProductModel.fromJson(data[i]));
        }
      removeDuplicatedCategories();
      notifyListeners();
    }
    else{
      throw Exception(" ${response.reasonPhrase}");
    }
  }
}