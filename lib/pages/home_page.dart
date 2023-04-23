import 'package:creativa/constants.dart';
import 'package:creativa/providers/cart_provider.dart';
import 'package:creativa/providers/product_provider.dart';
import 'package:creativa/providers/theme_provider.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
class HomePage extends StatelessWidget {
  const HomePage( {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context)  {
    var size=MediaQuery.of(context).size;
    var themeProvider=Provider.of<DarkThemeProvider>(context).isSwitched;
    var productProvider=Provider.of<ProductProvider>(context);

    return productProvider.dataList.isEmpty?const Center(child:CircularProgressIndicator(color:Color(0xffe90001),)) :
    Scaffold(
      backgroundColor:themeProvider?bgDark:bgLight ,
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
               Padding(
                padding:EdgeInsets.only(top:MediaQuery.of(context).viewPadding.top,left:12,bottom: 12),
                child:Text("Categories",style: TextStyle(fontSize: 30,
                  color:themeProvider?Colors.white:Colors.black ),),
              ),
              SizedBox(
                height: 50,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount:productProvider.categories.length,
                    itemBuilder: (context, index) =>
                        Padding(padding: const EdgeInsets.all(8),child:
                        GestureDetector(
                         onTap: ()=>Provider.of<ProductProvider>(context,listen: false).chosenCategoryMethod(index),
                          child: Container(
                              decoration:BoxDecoration(
                                  borderRadius: const BorderRadius.all(Radius.circular(20)),
                                  color:productProvider.categoryTapped? (productProvider.selectedIndex==index ?
                                  const Color(0xff00c669) :
                                 themeProvider? Colors.white60:Color(0xffb3b9da)) :themeProvider? Colors.white60:Color(0xffb3b9da)
                              ),
                              child: Center(child: Padding(
                                padding: const EdgeInsets.all(8),
                                child: Text(productProvider.categories.elementAt(index)),
                              ))),
                        ),)),
              ),
              Padding(
                  padding: const EdgeInsets.all(12),
                  child: GridView.builder(
                    padding: EdgeInsets.zero,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount:productProvider.chosenCategory==""?productProvider.dataList.length
                        :productProvider.indexesOfChosenCategory.length,
                    itemBuilder: (context, index) => Padding(
                      padding: const EdgeInsets.all(5),
                      child: Container(
                        decoration: BoxDecoration(color:themeProvider?containerDark:containerLight,
                            borderRadius:const BorderRadius.all(Radius.circular(20)) ),
                        child: SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Stack(
                                children: [
                                  Align(
                                      alignment: Alignment.topRight,
                                      child:IconButton(onPressed: ()=>Provider.of<ProductProvider>(context,listen:false).addToFavourite(index),
                                      icon:Icon(productProvider.dataList[index].isFavourite?Icons.favorite:
                                      Icons.favorite_border,
                                      color: Colors.red))),
                                  Center(
                                    child: Image.network(productProvider.chosenCategory==""?productProvider.dataList[index].image:productProvider.dataList[productProvider.indexesOfChosenCategory[index]].image
                                        ,width: size.width*0.14,height:size.height*0.14
                                    ),
                                  ),
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left:15),
                                child: Text(productProvider.chosenCategory==""?productProvider.dataList[index].title.substring(0,6):productProvider.dataList[productProvider.indexesOfChosenCategory[index]].title.substring(0,6),
                                    style: TextStyle(fontWeight: FontWeight.bold,
                                    color: themeProvider?Colors.white:Colors.black)),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(right:8,left: 12 ,top: 5),
                                child: Text(productProvider.chosenCategory==""?productProvider.dataList[index].description:productProvider.dataList[productProvider.indexesOfChosenCategory[index]].description,
                                  style: TextStyle(color: themeProvider?Colors.white60:Colors.black45),
                                  overflow: TextOverflow.ellipsis,maxLines:1,),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  Text('\$ ${productProvider.chosenCategory==""?productProvider.dataList[index].price:productProvider.dataList[productProvider.indexesOfChosenCategory[index]].price}',style: const TextStyle(fontWeight:
                                  FontWeight.bold,color: Color(0xff00c669))),
                                  IconButton(onPressed: ()=>Provider.of<CatProvider>(context,listen:false).addToCart(
                                      data: Provider.of<ProductProvider>(context,listen: false).dataList[index],
                                      dataPrice:Provider.of<ProductProvider>(context,listen: false).dataList[index].price),
                                      icon:Icon(Icons.shopping_cart_outlined,color: themeProvider?Colors.white:Colors.black))
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ), gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),)),
            ],
          ),
        ),
      );
  }
}
