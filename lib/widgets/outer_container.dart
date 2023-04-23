import 'package:flutter/material.dart';

import '../constants.dart';
class OuterContainer extends StatelessWidget {
  const OuterContainer({Key? key,required this.size,required this.title,required this.subTitle}) : super(key: key);
final size;
final title;
final subTitle;
  @override
  Widget build(BuildContext context) {
    return Container(
      width:double.infinity,
      height:size.height*0.33,
      decoration:BoxDecoration(color:navBarColor,
        borderRadius:const BorderRadius.only(bottomLeft: Radius.circular(35),
          bottomRight: Radius.circular(35),),
      ) ,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(top: size.height*0.06,left: size.width*0.04),
            child: Text(title,style: const TextStyle(fontSize: 30,fontWeight: FontWeight.bold,
                color: Colors.white),),
          ),
           Padding(
            padding:const EdgeInsets.all(12),
            //""
            child: Text(subTitle,style:const TextStyle(fontSize: 15,color: Colors.white60),),
          ),
        ],
      ),
    );
  }
}
