// ignore_for_file: prefer_interpolation_to_compose_strings

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CartPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
  return CartPageState();
  }

}
class CartPageState extends State<CartPage>{

  cartlist(){
    return Container(
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: Colors.orangeAccent,
          borderRadius: BorderRadius.circular(30)
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(height: 100,width: 100
              ,child: Image.network(imgurl.toString())),

          //description
          Column(children: [
            Text(title.toString()),
            Text("${"Rs"+price}per bag"),
            Row(
              children: [
                //minus button
                Container(
                  decoration: BoxDecoration(
                    color: Colors.orangeAccent,
                    borderRadius: BorderRadius.circular(50),
                  ),
                  padding: const EdgeInsets.all(10),
                  child: const Center(child: Text("-",style: TextStyle(fontSize: 20,color: Colors.white),)),
                ),
                 Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(qty.toString(),style: const TextStyle(fontSize: 14,color: Colors.white),),
                ),
                //plus
                Container(
                  decoration: BoxDecoration(
                    color: Colors.orangeAccent,
                    borderRadius: BorderRadius.circular(50),

                  ),
                  padding: const EdgeInsets.all(10),
                  child: const Center(child: Text("+",style: TextStyle(fontSize: 20,color: Colors.white),)),
                ),
              ],
            ),
            Text("Remarks...")
          ],)


        ],
      ),
    );
  }
  var imgurl;
  var title;
  var qty;
  var price;
  readfromstorage() async {
    //get
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    imgurl = prefs.get('imgurl' );
    title = prefs.get('title');
    qty = prefs.get('qty');
    price = prefs.get('price');
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    readfromstorage();
  }
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
   return Scaffold(
     body: Column(
       mainAxisAlignment: MainAxisAlignment.spaceBetween,
       children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            //icon and back button
            AppBar(
              backgroundColor: Colors.white,
              leading:  Image.network("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS3Lmq1cpBUiRrf3mCH5Pr4EMg44o3jRRnPSZgFL0XDWSZkSu9Ofn0zHvG52JHNE-gSoAE&usqp=CAU"
                ,height: 100,width: 150,fit: BoxFit.fitWidth,
              ),
              actions: [
                GestureDetector(onTap: (){
                  Navigator.pop(context);
                },child: const Padding(
                  padding:  EdgeInsets.all(10.0),
                  child:  Icon(Icons.backspace,color: Colors.black,),
                ))
              ],
            ),

            //cart list of items
            Padding(
              padding: const EdgeInsets.only(left:15.0,top: 15),
              child: Text("My Cart",style: TextStyle(color: Colors.black,fontSize: 18,fontWeight: FontWeight.bold),),
            ),

            //list card
            Container(
              height: size.height/2.2,
              width: size.width,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    cartlist(),
                  ],
                ),
              ),
            )
          ],
        ),


        Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            //total sum, qty
            Container(
              padding: EdgeInsets.all(15),
              child:
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Cost Break Down"),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text("Location: ",style: TextStyle(color: Colors.black54,fontSize: 12,fontWeight: FontWeight.bold),),
                          Text("Qty: ",style: TextStyle(color: Colors.black54,fontSize: 12,fontWeight: FontWeight.bold)),
                          Text("SubTotal: ",style: TextStyle(color: Colors.black54,fontSize: 12,fontWeight: FontWeight.bold)),
                          Text("Total: ",style: TextStyle(color: Colors.black54,fontSize: 12,fontWeight: FontWeight.bold)),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left:20.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text(" add your location here"),
                            Text(" 2"),
                            Text(" Rs.100/-"),
                            Text(" Rs.500/-"),
                          ],
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
            // purchase button

            Container(
                height: 70,
                margin: const EdgeInsets.only(top: 10),
                width: size.width,
                decoration: const BoxDecoration(
                  color: Colors.orange,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),

                ),   child: const Center(
              child: Text(
                "Purchase"
                ,style: TextStyle(color: Colors.white,
                  fontWeight: FontWeight.bold,fontSize: 14),),
            )
            )
          ],
        )
       ],
     ),
   );
  }

}