

// ignore_for_file: use_build_context_synchronously

import 'package:carousel_slider/carousel_slider.dart';
import 'package:demo/api/getapi.dart';
import 'package:demo/pages/cart/cart.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class detailPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return detailPageState();
  }
}
class detailPageState extends State<detailPage>{
  late final List<Widget> items ;
  String imgurl = "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQl_7Rsu_JFK7SRZbk4eQb99dd1x7cxnNaXww&usqp=CAU";
  String qty= "40";
  String name = "OPC Cement";
  String price = "500";
  getitems (){
    items = [
     //img1
     Container(child: Center(
         child:
         Image.network
           (imgurl)),),
    //img2
      Container(child: Center(
          child:
          Image.network
            (imgurl)),),   ];
 }
  int _current = 0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getitems();
    GetApi.getnewsdata();
  }
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        children: [
          //back button
          AppBar(),
          Container(
            height: size.height/1.11,
            width: size.width,
            child: Stack(
              children: [
                //slider

                Container(
                  width: size.width,
                  height: size.height/2,
                  color: Colors.grey,
                  child: CarouselSlider(
                      items: items,
                      options: CarouselOptions(
                        height: 400,
                        aspectRatio: 16/9,
                        viewportFraction: 0.8,
                        initialPage: 0,
                        enableInfiniteScroll: true,
                        reverse: false,
                        autoPlay: true,
                        autoPlayInterval: const Duration(seconds: 3),
                        autoPlayAnimationDuration: const Duration(milliseconds: 800),
                        autoPlayCurve: Curves.fastOutSlowIn,
                        enlargeCenterPage: true,
                        enlargeFactor: 0.3,
                        onPageChanged: (index, reason) {
                          setState(() {
                            _current = index;
                          });
                        },
                        scrollDirection: Axis.horizontal,
                      )
                  ),
                ),

                //Container
                Positioned(
                  bottom: 0,
                  child: Container(
                   // padding: const EdgeInsets.only(left: 15,right: 15,top: 20),
                    height: size.height/2.0,
                    decoration: const BoxDecoration(
                        color: Color(0xff404042),
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(30),
                            topLeft: Radius.circular(30)
                        )
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: size.width/1,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              // text
                              Padding(
                                padding: const EdgeInsets.only(left:15.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text("OPC Premium",style:
                                    TextStyle(color: Colors.white,
                                      fontWeight: FontWeight.bold,fontSize: 16,),),
                                    const SizedBox(height:15),
                                    const Text("RS. 1080/- per Bag",style:
                                    TextStyle(color: Colors.white,
                                      fontWeight: FontWeight.normal,fontSize: 14,),),
                                    const SizedBox(height:15),
                                    const Text("Minimum Bags: 500.",style:
                                    TextStyle(color: Colors.white,
                                      fontWeight: FontWeight.normal,fontSize: 12,),)
                                  ],
                                ),
                              ),
                              //buttons
                              Padding(
                                padding: const EdgeInsets.only(right: 8.0),
                                child: Column(
                                  children: [
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
                                        const Padding(
                                          padding: EdgeInsets.all(8.0),
                                          child: Text("41",style: TextStyle(fontSize: 14,color: Colors.white),),
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
                                    Container(
                                        padding: const EdgeInsets.only(left:20.0,right:20,top:10,bottom:10),
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(30),
                                            color: Colors.orange
                                        ),
                                        child: const Text("Bags",style: TextStyle(color: Colors.white),)
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(left: 15,right: 15,top: 15),
                          width: size.width/1.1,
                          child: const Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec id ex libero. Praesent ultricies ipsum sit amet sapien porta, et vehicula sapien vulputate. Aliquam aliquet purus et justo bibendum, sit amet faucibus velit egestas. Duis fringilla arcu in lorem placerat, ac pharetra lacus finibus. Nulla ut nulla et ligula aliquam facilisis ac eget purus. Phasellus elementum dui vel libero eleifend bibendum. Proin sed nisl id enim ullamcorper lacinia.",
                            style: TextStyle(color: Colors.white,fontSize: 11,fontWeight: FontWeight.normal), maxLines: 4,),
                        ),
                        SizedBox(height:size.height/5),
                        //add to cart
                        GestureDetector(
                          onTap: () async {
                            // add to cart storage
                            final SharedPreferences prefs = await SharedPreferences.getInstance();
                            prefs.setString('imgurl', imgurl );
                            prefs.setString('title', name);
                            prefs.setString('qty', qty);
                            prefs.setString('price', price);

                            //navigate
                             Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) =>
                                  CartPage()),
                            );
                          },
                          child: Container(
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
                              "Add to Cart"
                              ,style: TextStyle(color: Colors.white,
                                fontWeight: FontWeight.bold,fontSize: 14),),
                          )
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          )

        ],
      ),
    );
  }

}