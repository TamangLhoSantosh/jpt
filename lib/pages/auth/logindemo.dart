import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class logindemo extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return loginstatedemo();
  }

}
class loginstatedemo extends State<logindemo>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Column(
        children: [
          // image
          SizedBox(height: 30,),
          Image.network("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS3Lmq1cpBUiRrf3mCH5Pr4EMg44o3jRRnPSZgFL0XDWSZkSu9Ofn0zHvG52JHNE-gSoAE&usqp=CAU"),
          SizedBox(height: 30,),
          Container(
            margin: EdgeInsets.only(left: 20,right: 20),
            decoration: BoxDecoration(
              color: Color(0xfffbaf43),
              borderRadius: BorderRadius.circular(30),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //signin text
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Text("Sign In",style:
                  TextStyle(color: Colors.black,
                  fontSize: 18,fontWeight: FontWeight.bold),),
                ),
                //container //email
                Container(
                  margin: EdgeInsets.only(left:15,right: 15),
                  decoration: BoxDecoration(color: Colors.white,
                  borderRadius: BorderRadius.circular(30)),
                  child: Center(child: Text("Email")),
                ),
                //password
                Container(
                  margin: EdgeInsets.only(left:15,right: 15,top: 15,bottom: 20),
                  decoration: BoxDecoration(color: Colors.white,
                      borderRadius: BorderRadius.circular(30)),
                  child: Center(child: Text("Password")),
                ),
                //Submit
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 50,width: 150,
                      decoration: BoxDecoration(color: Colors.white,
                          borderRadius: BorderRadius.circular(30)),
                      child: Center(child: Text("Sign In",style: TextStyle(
                        color: Colors.white,fontSize: 18
                      ),)),
                    ),
                  ],
                ),

              ],
            ),
          )
        ],
      ),
    );
  }

}