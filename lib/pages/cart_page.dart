import 'package:creativa/constants.dart';
import 'package:creativa/providers/cart_provider.dart';
import 'package:creativa/providers/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //var size=MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor:Provider.of<DarkThemeProvider>(context).isSwitched?bgDark:bgLight ,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding:EdgeInsets.only(top:MediaQuery.of(context).viewPadding.top,right: 15,left: 15),
              child:Text("My Cart",style: TextStyle(fontSize:25,
                color:Provider.of<DarkThemeProvider>(context).isSwitched?
                Colors.white   :Colors.black,),),
            ),
            ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              padding: EdgeInsets.zero,
              shrinkWrap: true,
              itemCount: Provider.of<CatProvider>(context).cartList.length,
              itemBuilder:(context, index) =>Padding(
                  padding: const EdgeInsets.all(12),
                  child: Container(
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
                              padding: const EdgeInsets.all(8.0),
                              child: Image.network(Provider.of<CatProvider>(context).cartList.elementAt(index).image),
                            ),),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(Provider.of<CatProvider>(context).cartList.elementAt(index).title.substring(0,6),
                            style: const TextStyle(fontSize:20),),
                            Row(
                              children: [
                                const Icon(Icons.star,color: Colors.amberAccent,),
                                Text(" (${Provider.of<CatProvider>(context).cartList.elementAt(index).rating})",
                                  style: const TextStyle(fontSize: 15,color: Colors.amberAccent),),
                              ],
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('\$ ${Provider.of<CatProvider>(context).cartList.elementAt(index).price}'
                                ,style: const TextStyle(fontSize:20,fontWeight:
                            FontWeight.bold,color: Color(0xff00c669))),
                            Row(
                              children: [
                               GestureDetector(
                                onTap:()=>Provider.of<CatProvider>(context,listen:false).reduceUnit(index),
                                child:const Text("-",style: TextStyle(fontSize: 20),)
                               ),
                                Container(
                                  height:25,
                                  width:20,
                                  margin: const EdgeInsets.all(8),
                                  color: Colors.black12,
                                  child:Center(child: Text(Provider.of<CatProvider>(context).unit[index].toString())),
                                ),
                                GestureDetector(
                                 onTap:()=>Provider.of<CatProvider>(context,listen:false).addUnit(index),
                                  child:const Text("+"))

                              ],
                            ),

                          ],
                        ),
                      ],
                    ),
                  ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12),
              child: Row(
                children: [
                  Text("Total Price : ",style: TextStyle(fontSize:25,color:
                  Provider.of<DarkThemeProvider>(context).isSwitched?
                 Colors.white   :Colors.black,),),
                  Text("\$${Provider.of<CatProvider>(context).totalPrice.toStringAsFixed(2)}",
                    style: const TextStyle(fontSize:30,color: Color(0xff00c669)),),
                ],
              ),
            )
            //
          ],
        ),
      ),
    );
  }
}
