import 'package:creativa/model.dart';
import 'dart:convert';

import 'package:http/http.dart'as http;
import 'package:flutter/material.dart';
class HomePage extends StatefulWidget {
  const HomePage( {Key? key, required this.user}) : super(key: key);
 final String user;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Model> dataList = [];
  bool categoryTapped =false;
  int selectedIndex=0;
  Set categories={};
  String chosenCategory="";
  List indexesOfChosenCategory=[];
  removeDuplicatedCategories(){
    setState(() {
      for(int i=0;i<dataList.length;i++){
        categories.add(dataList[i].category);
      }
    });
  }
  chosenCategoryMethod(){
    setState(() {
      for(int i=0;i<dataList.length;i++){
        if(dataList[i].category==chosenCategory) {
          indexesOfChosenCategory.add(i);

        }
      }
    });
  }
  @override
  void initState()  {
    getProducts();
  removeDuplicatedCategories();
    super.initState();
  }
  @override
  Widget build(BuildContext context)  {

    var size=MediaQuery.of(context).size;

    return SafeArea(
        child: Scaffold(
          backgroundColor: const Color(0xfff1c7b9),
         body: dataList.isEmpty?const Center(child:  CircularProgressIndicator(color:  Color(0xffe90001),))
             :SingleChildScrollView(
               child: Column(
                 crossAxisAlignment: CrossAxisAlignment.start,
                 mainAxisSize: MainAxisSize.min,
                 children: [
                   const  Padding(
                      padding:  EdgeInsets.all(16),
                      child:  Text("Categories",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25),),
                    ),
                   SizedBox(
                     height: 50,
                     child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount:categories.length,
                      itemBuilder: (context, index) =>
                        Padding(padding: const EdgeInsets.all(8),child:
                       GestureDetector(
                         onTap: (){setState(() {
                           indexesOfChosenCategory=[];
                           selectedIndex=index;
                           categoryTapped=true;
                           chosenCategory=categories.elementAt(selectedIndex);
                           chosenCategoryMethod();
                         });},
                         child: Container(
                           decoration:BoxDecoration(
                             borderRadius: const BorderRadius.all(Radius.circular(20)),
                             color: categoryTapped? (selectedIndex==index ? const Color(0xff00c669) :Colors.white60) :Colors.white60
                           ),
                             child: Center(child: Padding(
                               padding: const EdgeInsets.all(8),
                               child: Text(categories.elementAt(index)),
                             ))),
                       ),)),
                   ),
                   Padding(
                   padding: const EdgeInsets.all(12),
                   child: GridView.builder(
                       shrinkWrap: true,
                       physics: const NeverScrollableScrollPhysics(),
                       itemCount:chosenCategory==""?dataList.length:indexesOfChosenCategory.length,
                       itemBuilder: (context, index) => Padding(
                         padding: const EdgeInsets.all(8),
                         child: Container(
                           decoration: const BoxDecoration(color: Colors.white,
                               borderRadius: BorderRadius.all(Radius.circular(20)) ),
                           child: SingleChildScrollView(
                             child: Column(
                               children: [
                                 Image.network(chosenCategory==""?dataList[index].image:dataList[indexesOfChosenCategory[index]].image
                                     ,width: size.width*0.16,height:size.height*0.16
                                 ),
                                 Row(
                                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                   children: [
                                     Text(chosenCategory==""?dataList[index].title.substring(0,6):dataList[indexesOfChosenCategory[index]].title.substring(0,6),
                                         style: const TextStyle(fontWeight: FontWeight.bold)),
                                     Text('\$ ${chosenCategory==""?dataList[index].price:dataList[indexesOfChosenCategory[index]].price}',style: const TextStyle(fontWeight:
                                     FontWeight.bold,color: Color(0xff00c669))),
                                   ],
                                 ),
                                 Padding(
                                   padding: const EdgeInsets.only(right:8,left: 12 ,top: 8 ),
                                   child: Text(chosenCategory==""?dataList[index].description:dataList[indexesOfChosenCategory[index]].description,style:const TextStyle(color: Colors.black45),
                                   overflow: TextOverflow.ellipsis,maxLines: 10,),
                                 )
                               ],
                             ),
                           ),
                         ),
                       ), gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),)),
                 ],
               ),
             ),

        )
    );
  }
 getProducts()async {
    Uri url = Uri.parse('https://fakestoreapi.com/products');
    http.Response response = await http.get(url);
    if (response.statusCode == 200) {
      List data = jsonDecode(response.body);
      setState(() {
        for(int i=0;i<data.length;i++){
          dataList.add(Model(image: data[i]['image'], title:data[i]['title'],
              price:data[i]['price'], category:data[i]['category'],
              description: data[i]['description']));
        }
      });
      removeDuplicatedCategories();
    }
    else{
      throw Exception(" ${response.reasonPhrase}");
    }
  }
}
