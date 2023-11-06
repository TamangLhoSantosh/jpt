import 'package:demo/model/newsapi.dart';
import 'package:demo/pages/news/newsdetail.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CardsandModules {

  //widgets eg dialog box, toast, cards, error handleling
  //date time formatter
  static String formatDateTimestring(String date) {
    DateFormat dateFormat = DateFormat("yyyy-MM-dd");
    DateTime format = (dateFormat.parse(date));
    DateFormat longdate = DateFormat("MMM dd, yyyy");
    date = longdate.format(format);
    return date;
  }

  //vertical list card item
  static verticallistitem(context,size,Articles article){
    return  GestureDetector(
      onTap: (){
        //navigator// login sucess //go to detail page
        Navigator.push(
            context,
            MaterialPageRoute(builder: (context) =>
                NewsDetail(article)));
      },
      child: Row(
        children: [
          //col 1
          Column(
            children: [
              Stack(
                children: [
                  Image.network(article.urlToImage!,height: 150,width: 100,
                    fit: BoxFit.cover,),
                  Positioned(
                      left: 40,
                      top: 65,
                      child: Icon(Icons.play_circle,
                        size: 20,color: Colors.white,))
                ],
              )
            ],
          ),
          //col2
          Column(
            children: [
              Text(article.title!.toUpperCase()
                ,maxLines: 2,overflow: TextOverflow.ellipsis,
                style: TextStyle(color: Colors.white,fontSize: 16,
                    fontWeight:FontWeight.bold),),

              //Row
              Row(children: [
                //Container
                Container(
                  padding: EdgeInsets.only(left: 20,
                      right: 20,top: 10,bottom: 10),
                  decoration: BoxDecoration(color: Colors.red,
                      borderRadius: BorderRadius.circular(20)),
                  child:
                  Text(article.author!
                    ,maxLines: 1,overflow: TextOverflow.ellipsis,
                    style: TextStyle(color: Colors.white,fontSize: 10,
                        fontWeight:FontWeight.bold),),
                ),
                //text
                Text(formatDateTimestring(article.publishedAt!)
                  ,maxLines: 2,overflow: TextOverflow.ellipsis,
                  style: TextStyle(color: Colors.white,fontSize: 10,
                      fontWeight:FontWeight.normal),)

              ],)
            ],
          )
        ],
      ),
    );
  }
}