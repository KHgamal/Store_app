import 'package:creativa/providers/product_provider.dart';
import 'package:creativa/providers/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../constants.dart';
class FavPage extends StatelessWidget {
  const FavPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size=MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor:Provider.of<DarkThemeProvider>(context).isSwitched?bgDark:bgLight ,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding:EdgeInsets.only(top:MediaQuery.of(context).viewPadding.top,right: 15,left: 15),
              child:Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("My Fav",style: TextStyle(fontSize:25,
                    color:Provider.of<DarkThemeProvider>(context).isSwitched?
                    Colors.white   :Colors.black,),),
                ],
              ),
            ),
            ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              padding: EdgeInsets.zero,
              shrinkWrap: true,
              itemCount: Provider.of<ProductProvider>(context).favourite.length,
              itemBuilder:(context, index) =>Padding(
                padding: const EdgeInsets.all(12),
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 8),
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(25),
                      bottomLeft: Radius.circular(25),
                    ),
                    color:Colors.white,
                  ),
                  height:80,
                  child: Row(
                   mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(25),
                        child: Padding(
                          padding:const  EdgeInsets.all(8.0),
                          child: Image.network(Provider.of<ProductProvider>(context).favourite[index].image,
                          width: 50,height: 50,),
                        ),),
                      Flexible(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(Provider.of<ProductProvider>(context).favourite[index].title.substring(0,6),
                              style: TextStyle(fontSize:20),),
                            Text(Provider.of<ProductProvider>(context).favourite[index].description,
                              style: TextStyle(fontSize: 15,color: Colors.grey),
                              overflow: TextOverflow.ellipsis,),
                          ],
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        //mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          IconButton(onPressed: ()=>Provider.of<ProductProvider>(context, listen: false).addToFavourite(index),
                              icon:Icon(!Provider.of<ProductProvider>(context).dataList[index].isFavourite?Icons.favorite:
                              Icons.favorite_border,
                                  color: Colors.red)),
                          Text('\$ ${Provider.of<ProductProvider>(context).favourite[index].price}'
                              ,style: const TextStyle(fontSize:20,fontWeight:
                              FontWeight.bold,color: Color(0xff00c669))),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),

            //
          ],
        ),
      ),
    );
  }
}