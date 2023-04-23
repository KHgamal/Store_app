import 'package:creativa/models/product_model.dart';
import 'package:flutter/material.dart';

class CatProvider extends ChangeNotifier {
  List<ProductModel> cartList = [];
  List<int>unit=[];
  double totalPrice=0;

  addToCart({data, required var dataPrice}){
      cartList.add(data);
      unit.add(1);
      totalPrice+=dataPrice;
      notifyListeners();
  }
  addUnit(i){
    unit[i]++;
    calculatingTotalPrice();
    notifyListeners();
  }
  reduceUnit(i){
    if(unit[i]>1) {
      unit[i]--;
      calculatingTotalPrice();
    }

    notifyListeners();
  }
  calculatingTotalPrice(){
    totalPrice=0;
    for(int i=0;i<cartList.length;i++){
      totalPrice+=unit[i]*cartList[i].price;
    }
    notifyListeners();
  }
  clearCart(){
    cartList.clear();
    notifyListeners();
  }
}