import 'package:demo/model/newsapi.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../api/getapi.dart';
import '../../modules/cardsandmodules.dart';

class NewsDetail extends StatefulWidget{
  Articles article;
  NewsDetail(this.article);

  @override
  State<StatefulWidget> createState() {
    return NewsDetailState(article);
  }
}
class NewsDetailState extends State<NewsDetail>{
  Articles article;

  late Future<Newsapi?>? _futureverticallist;

  NewsDetailState(this.article);
  apicallv(){
    _futureverticallist = GetApi.getnewsdata();
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    apicallv();
  }
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 60,),
            //top part
            // stack //image // icon // appbar //back button
            // text title, author ,date and description
            Stack(
              children: [
                Image.network(article.urlToImage!,height: size.height/3.5,
                  width: size.width,fit: BoxFit.cover,),

                Positioned(top: 15,left: 20,
                    child: GestureDetector(
                      onTap: (){
                        Navigator.pop(context);
                      },
                      child: Icon(Icons.arrow_back,
                        color: Colors.white,size: 30,),
                    )),

                Positioned(top: 15,right: 20,
                    child: Icon(Icons.share,
                      color: Colors.white,size: 30,)),
                Container(
                  height: size.height/3.5,
                    width: size.width,
                    child: Center(
                      child: Icon(Icons.play_circle,
                        color: Colors.white,size: 50,),
                    ))
              ],
            ),
            //title
            Container(
              width: size.width/1.5,
              padding: EdgeInsets.only(bottom: 20,top: 15),
              child: Text(article.title!
                ,maxLines: 2,overflow: TextOverflow.ellipsis,
                style: TextStyle(color: Colors.black,fontSize: 16,
                    fontWeight:FontWeight.bold),),
            ),
            Padding(
              padding: const EdgeInsets.only(left:15.0,right: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  //author
                  Text(article.author!,style: TextStyle(color: Colors.black,
                    fontSize: 14,fontWeight: FontWeight.normal,),),
                  //date
                  Text(CardsandModules.formatDateTimestring(article.publishedAt!),style:
                  TextStyle(color: Colors.black,
                    fontSize: 14,fontWeight: FontWeight.normal,),),
                ],
              ),
            ),
            //description
            Container(
              width: size.width/1.2,
              padding: EdgeInsets.only(bottom: 20,top: 15,left: 15,right: 15),
              child: Text(article.description!
                ,maxLines: 2,overflow: TextOverflow.ellipsis,
                style: TextStyle(color: Colors.black,fontSize: 14,
                    fontWeight:FontWeight.normal),),
            ),
            //divider
            Padding(
              padding: const EdgeInsets.only(left:15.0,right: 15),
              child: Divider(color: Colors.black26,height: 10,thickness: 0.8,),
            ),

            //bottom part
            // vertical list card
            //
            //future builder
            FutureBuilder<Newsapi?>(
                future: _futureverticallist, // a previously-obtained Future<String> or null
                builder: (BuildContext context, AsyncSnapshot<Newsapi?> snapshot) {
                  //switch
                  switch (snapshot.connectionState){
                    case ConnectionState.none:
                    //error
                      return Container(); // paxi dialog box thapne
                    case ConnectionState.waiting: //loading
                      return Center(
                        child: Container(
                          height: 50,
                          width: 50,
                          child: CircularProgressIndicator(),
                        ),
                      );//
                    case ConnectionState.done:
                      if(snapshot.data==null || snapshot.data!.articles!.isEmpty){
                        return Center(
                          child: Container(
                            child: Text("No Data or api issue"),
                          ),
                        );
                      }else{
                        // data ayo
                        //show ui

                        return Container(
                          width: size.width,
                          height: size.height/1.8,
                          child: ListView.builder(
                              scrollDirection: Axis.vertical,
                              padding: const EdgeInsets.all(8),
                              itemCount: snapshot.data!.articles!.length,
                              itemBuilder: (BuildContext context, int index) {
                                return CardsandModules.verticallistitem(context,size,snapshot.data!.articles![index]);
                              }
                          ),
                        );

                      }
                    default: //error
                      return Container();//error paxi thapaula
                  }
                }),
            //list view
          ],
        ),
      ),
    );
  }

}