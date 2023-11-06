import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NewsClass extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return NewsClassState();
  }
}
class NewsClassState extends State<NewsClass>{

  horizontallist(size){
    return Stack(
        children:[
          Container(
            height: size.height/4,
            width: size.width/1.5,
            margin: EdgeInsets.only(left: 10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20)
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.network("https://images.moneycontrol.com/static-mcnews/2020/08/wall-street-1-770x433.jpg",
                fit: BoxFit.cover,),
            ),
          ),
          Positioned(
            left: 15,
            bottom: 70,
            child: Container(
                width: size.width/1.7,
                child:
                Text("PCPS NEWS CHANNEL 2023 UPDATES HERE",maxLines: 2,style:
                TextStyle(color: Colors.white,fontSize: 16,fontWeight: FontWeight.bold),)),
          ),
          Positioned(bottom: 10,left: 15,child: Text("26th OCT 2023",
            style:
            TextStyle(color: Colors.white,fontSize: 14,fontWeight: FontWeight.normal),),),
          Positioned(right: 10,bottom: 10,child:
          Icon(Icons.play_circle,size: 40,color: Colors.white,))
        ]
    );
  }

  verticallist(size){
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        //stack
        Column(
          children: [
            Stack(
              children: [
                Container(
                  height: 150,
                  width: 200,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.network("https://images.moneycontrol.com/static-mcnews/2020/08/wall-street-1-770x433.jpg",
                      fit: BoxFit.cover,),
                  ),
                ),
                Positioned(left: 85,top: 60,child:
                Icon(Icons.play_circle,color: Colors.white,size: 30,))
              ],
            )
          ],
        ),
        // text
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            //text
            Container(
              width: size.width/2,
              child: Text("PCPS NEWS UPDATES 2023 BLA BLA BLA",
                style: TextStyle(
                    fontWeight: FontWeight.bold,fontSize: 14,
                    color: Colors.black
                ),maxLines: 2,),
            ),
            //row
            // button
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: EdgeInsets.only(left: 20,right: 20,top: 15,bottom: 15),
                  decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(10)
                  ),
                  child: Text("Amazon.com",
                    style: TextStyle(color: Colors.white,fontSize: 10),),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 15.0),
                  child: Text("15th oct 2023",
                    style: TextStyle(color: Colors.black54,fontSize: 12),),
                )
              ],
            )
            // tex


          ],
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
    body: Column(
        children: [
          // horizontal list
              // Stack
                      // container // image
                      //Text title
                      //Text (Date)
                      //Icon
          //list view
          Container(
            height: size.height/4,
            width: size.width,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.all(8),
                itemCount: 5,
                itemBuilder: (BuildContext context, int index) {
                  return horizontallist(size);
                }),),
          //vertical list
              // Row  //2 cols
              //Col1
                  //stack // image //icon
              //Col 2
                  //Text
                  //Row
                        //Container //text publisher
                        //Text date
          Container(
            height: size.height/2,
            width: size.width,
            child: ListView.builder(
                padding: const EdgeInsets.all(8),
                itemCount: 5,
                itemBuilder: (BuildContext context, int index) {
                  return verticallist(size);
                }
            ),
          ),

        ],
      ),
    );
  }

}