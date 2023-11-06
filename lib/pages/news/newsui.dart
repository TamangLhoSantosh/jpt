import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:demo/api/getapi.dart';
import 'package:demo/modules/cardsandmodules.dart';
import 'package:demo/modules/dialogboxes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../../model/newsapi.dart';

class NewsUI extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return NewsUIState();
  }
}

class NewsUIState extends State<NewsUI> {
  late Future<Newsapi?>? _futurehorizontallist;
  late Future<Newsapi?>? _futureverticallist;
  final RefreshController _refreshController = RefreshController(
      initialRefresh: false);
  ConnectivityResult _connectionStatus = ConnectivityResult.none;
  final Connectivity _connectivity = Connectivity();
  late StreamSubscription<ConnectivityResult> _connectivitySubscription;

  void _onRefresh() async {
    // monitor network fetch
    await Future.delayed(Duration(milliseconds: 1000));
    setState(() {
      // variables or classes to refresh
    });
    // if failed,use refreshFailed()
    _refreshController.refreshCompleted();
  }

  void _onLoading() async {
    setState(() {

    });
    _refreshController.loadComplete();
  }

  horizontalcard(var size, Articles article) {
    return Container(
      margin: EdgeInsets.only(left: 10),
      child: Stack(children: [
        Container(
          height: size.height / 4,
          width: size.width / 1.5,
          margin: const EdgeInsets.only(left: 10),
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.network(
              article.urlToImage!,
              fit: BoxFit.cover,
            ),
          ),
        ),
        Positioned(
          left: 15,
          bottom: 70,
          child: Container(
              width: size.width / 1.7,
              child: Text(
                article.title!,
                maxLines: 2,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold),
              )),
        ),
        Positioned(
          bottom: 10,
          left: 15,
          child: Text(
            CardsandModules.formatDateTimestring(article.publishedAt!),
            style: TextStyle(
                color: Colors.white,
                fontSize: 14,
                fontWeight: FontWeight.normal),
          ),
        ),
        const Positioned(
            right: 10,
            bottom: 10,
            child: Icon(
              Icons.play_circle,
              size: 40,
              color: Colors.white,
            ))
      ]),
    );
  }

  Gridcarditem(var size, Articles article) {
    return Container(
      child: Column(
        children: [
          //image
          Container(
            height: 80,
            margin: const EdgeInsets.only(left: 10),
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.network(
                article.urlToImage!,
                fit: BoxFit.cover,
              ),
            ),
          ),
          //col
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                  width: 100,
                  child: Text(
                    article.title!,
                    maxLines: 2,
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                    overflow: TextOverflow.ellipsis,
                  )),
              Container(
                  width: 100,
                  child: Text(
                    article.author!,
                    maxLines: 2,
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                    overflow: TextOverflow.ellipsis,
                  )),
              Container(
                  width: 100,
                  child: Text(
                    CardsandModules.formatDateTimestring(article.publishedAt!),
                    maxLines: 2,
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                    overflow: TextOverflow.ellipsis,
                  )),
            ],
          )
        ],
      ),
    );
  }

  apicallh() {
    _futurehorizontallist = GetApi.getnewsdata();
  }

  apicallv() {
    _futureverticallist = GetApi.getnewsdata();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initConnectivity();

    _connectivitySubscription =
        _connectivity.onConnectivityChanged.listen(_updateConnectionStatus);
    apicallh();
    apicallv();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initConnectivity() async {
    late ConnectivityResult result;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      result = await _connectivity.checkConnectivity();
    } on PlatformException catch (e) {
      ShowDialogBox.warningdialogbox(context, e.message.toString());
      //dialog box (error)
      //  developer.log('Couldn\'t check connectivity status', error: e);
      return;
    }
  }

  Future<void> _updateConnectionStatus(ConnectivityResult result) async {
    _connectionStatus = result;
    //dialogbox(connection status )
    if (_connectionStatus == ConnectivityResult.mobile) {
      // I am connected to a mobile network.
      //dialog box
      //  ShowDialogBox.warningdialogbox(context, "Internet Connection is : "+_connectionStatus.name);

    } else if (_connectionStatus == ConnectivityResult.wifi) {
      //dialogbox
      //ShowDialogBox.warningdialogbox(context, "Internet Connection is : "+_connectionStatus.name);

    } else {
      //dialogbox
      ShowDialogBox.warningdialogbox(context,
          "Internet Connection issue. Please check your internet connection");
    }
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery
        .of(context)
        .size;
    return SmartRefresher(
      controller: _refreshController,
      onRefresh: _onRefresh,
      onLoading: _onLoading,
      child: Scaffold(
      body: SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        children: [
          // horizontal list
          //stack // image // text // date // icon
          //futurebuilder horizontal list
          FutureBuilder<Newsapi?>(
              future: _futurehorizontallist,
              builder:
                  (BuildContext context, AsyncSnapshot<Newsapi?> snapshot) {
                switch (snapshot.connectionState) {
                  case ConnectionState.none:
                    return Container(); // error
                  case ConnectionState.waiting: //loading
                    return Container(
                      height: 20,
                      width: 20,
                      child: const Center(child: CircularProgressIndicator()),
                    );
                  case ConnectionState.done:
                    if (snapshot.data == null ||
                        snapshot.data!.articles!.isEmpty) {
                      return Container(
                        child: Text("No data"),
                      ); // no data
                    } else {
                      //ui
                      var newshdata = snapshot.data;
                      return Container(
                        height: size.height / 4,
                        width: size.width,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: newshdata!.articles!.length,
                          itemBuilder: (BuildContext context, int index) {
                            return horizontalcard(
                                size, newshdata!.articles![index]);
                          },
                        ),
                      );
                    }
                  default:
                    return Container(); //error page
                }
              }),
          //vertical list
          //Row
          //Col
          //stack // image // icon //center

          //futurebuilder vertical list
          FutureBuilder<Newsapi?>(
              future: _futureverticallist,
              builder:
                  (BuildContext context, AsyncSnapshot<Newsapi?> snapshot) {
                switch (snapshot.connectionState) {
                  case ConnectionState.none:
                    return ShowDialogBox.warningdialogbox(
                        context, "No data available");
                // error
                  case ConnectionState.waiting: //loading
                    return Container(
                      height: 20,
                      width: 20,
                      child: const Center(child: CircularProgressIndicator()),
                    );
                  case ConnectionState.done:
                    if (snapshot.data == null ||
                        snapshot.data!.articles!.isEmpty) {
                      return Container(
                        child: Text("No data"),
                      ); // no data
                    } else {
                      //ui
                      var newsvdata = snapshot.data;
                      return Column(
                        children: [
                          Container(
                            height: size.height,
                            width: size.width,
                            child: GridView.builder(
                                gridDelegate:
                                const SliverGridDelegateWithMaxCrossAxisExtent(
                                    maxCrossAxisExtent: 250,
                                    childAspectRatio: 1 / 1,
                                    crossAxisSpacing: 10,
                                    mainAxisSpacing: 10),
                                itemCount: newsvdata!.articles!.length,
                                itemBuilder: (BuildContext ctx, index) {
                                  return Gridcarditem(
                                      size, newsvdata.articles![index]);
                                }),
                          ),
                          //listview
                          Container(
                            width: size.width,
                            child: ListView.builder(
                              scrollDirection: Axis.vertical,
                              primary: true,
                              physics: const NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: newsvdata!.articles!.length,
                              itemBuilder: (BuildContext context, int index) {
                                return CardsandModules.verticallistitem(
                                    context,
                                    size,
                                    newsvdata.articles![index]);
                              },
                            ),
                          ),
                        ],
                      );
                    }
                  default:
                    return Container(); //error page
                }
              }),
          //Col // text
          // row // container // text  /// date
        ],
      ),
    ),
    drawer: Drawer(
    // Add a ListView to the drawer. This ensures the user can scroll
    // through the options in the drawer if there isn't enough vertical
    // space to fit everything.
    child: ListView(
    // Important: Remove any padding from the ListView.
    padding: EdgeInsets.zero,
    children: const [
    DrawerHeader(
    decoration: BoxDecoration(
    color: Colors.blue,
    ),
    child: Text('Drawer Header'),
    )
    ,
    ]
    )


    )));

  }
}
