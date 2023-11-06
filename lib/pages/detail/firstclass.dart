import 'package:flutter/material.dart';

class firstclass extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return firstclassState();
  }
}

class firstclassState extends State<firstclass> {

  // category list
  textcard(String txt) {
    return Container(
      height: 40,
      width: 100,
      margin: const EdgeInsets.only(left: 8, right: 8),
      decoration: BoxDecoration(
          color: Colors.red, borderRadius: BorderRadius.circular(20)),
      child: Center(
          child: Text(
            txt,
            style: const TextStyle(color: Colors.white),
          )),
    );
  }

  //product list horizontal
  horizonalcard(){
    return Container(
      margin: EdgeInsets.only(left:15,),
      padding: EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(30)
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,

        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30)
                ),
                child: Image.network("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSNRmZNcg_ps_kZ-ErArvHb69QJd27PaCYmvJciBSEV9lLbgTXWkjxAanglbn8BP5w77pM&usqp=CAU"
                  ,fit: BoxFit.cover,
                ),
              ),
              Positioned(
                left: 15,
                top: 15,
                child: Container(
                    padding: EdgeInsets.all(15),
                    decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(50)
                    ),
                    child: Icon(Icons.heart_broken,size: 30,color: Colors.white,)),
              )
            ],
          ),

          Padding(
            padding: const EdgeInsets.only(left: 8.0,top: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                //text
                const Text(
                  "Food Home Delivery",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                      fontWeight: FontWeight.bold),
                ),
                //row // icons
                Row(
                  children: [
                    const Icon(Icons.star_border),
                    const Icon(Icons.star_border),
                    const Icon(Icons.star_border),
                    const Icon(Icons.star_border),
                    const Icon(Icons.star_border),
                  ],
                ),

                // rs 500
                Padding(
                  padding: const EdgeInsets.only(top:10.0),
                  child: const Text(
                    "RS.500/-",
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 16),
                  ),
                )
              ],
            ),
          )

        ],
      ),

    );
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.grey,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              color: Colors.black12,
              child: Column(
                children: [
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 60,
                        width: size.width / 1.1,
                        decoration: BoxDecoration(
                            color: Colors.grey,
                            borderRadius: BorderRadius.circular(50)),
                        child: Row(
                          children: const [
                            Padding(
                              padding: EdgeInsets.only(left: 15.0, right: 15.0),
                              child: Icon(
                                Icons.search,
                                color: Colors.white,
                                size: 18,
                              ),
                            ),
                            Text(
                              "Search Here...",
                              style: TextStyle(color: Colors.white),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 20),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Container(
                      child: Row(
                        children: [
                          textcard("lab1"),
                          textcard("lab2"),
                          textcard("lab3"),
                          textcard("lab1"),
                          textcard("lab2"),
                          textcard("lab3")
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15.0, right: 15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Food Home Delivery",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                      Row(
                        children: [
                          const Icon(Icons.star_border),
                          const Icon(Icons.star_border),
                          const Icon(Icons.star_border),
                          const Icon(Icons.star_border),
                          const Icon(Icons.star_border),
                        ],
                      )
                    ],
                  ),
                  const Text(
                    "RS.500/-",
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 35),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            const Padding(
              padding: EdgeInsets.only(left: 15.0),
              child: Text(
                "Details",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            const Padding(
              padding: EdgeInsets.only(left: 15.0),
              child: Text(
                "Generated Lorem IpsumLorem ipsum dolor sit amet, "
                    "consectetur adipiscing elit, sed do eiusmod tempor incididunt ut "
                    "labore et dolore magna aliqua. Semper quis lectus nulla at volutpat diam ut. "
                    "Nibh ipsum consequat nisl vel pretium",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 12,
                    fontWeight: FontWeight.normal),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 15.0),
              child: Text(
                "Location",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            const Padding(
              padding: EdgeInsets.only(left: 15.0),
              child: Text(
                "Kathmandu, Nepal",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 12,
                    fontWeight: FontWeight.normal),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 15.0),
              child: Text(
                "Phone",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            const Padding(
              padding: EdgeInsets.only(left: 15.0),
              child: Text(
                "9849950328",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 12,
                    fontWeight: FontWeight.normal),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            const Padding(
              padding: EdgeInsets.only(left: 15.0),
              child: Text(
                "Website",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            const Padding(
              padding: EdgeInsets.only(left: 15.0),
              child: Text(
                "https://snmn.com",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 12,
                    fontWeight: FontWeight.normal),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            // horizontal list

            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  horizonalcard(),
                  horizonalcard(),
                  horizonalcard(),
                  horizonalcard()
                ],
              ),
            ),



            const SizedBox(height: 100,)
          ],
        ),
      ),
    );
  }
}
