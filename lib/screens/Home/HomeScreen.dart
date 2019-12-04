import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:provider/provider.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:vertical_tabs/vertical_tabs.dart';
import 'package:videoplayer1/Models/Beer_model.dart';
import 'package:videoplayer1/Repository/Beer_Repository.dart';
import 'package:videoplayer1/Repository/VideoData.dart';
import 'About.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<String> listVideoPoster = [
    "https://image.tmdb.org/t/p/w500/c24sv2weTHPsmDa7jEMN0m2P3RT.jpg",
    "https://image.tmdb.org/t/p/w500/y4MBh0EjBlMuOzv9axM4qJlmhzz.jpg",
    "https://image.tmdb.org/t/p/w500/fnbjcRDYn6YviCcePDnGdyAkYsB.jpg",
    "https://image.tmdb.org/t/p/w500/yEv8c6i79vk06sZDC3Z9D8HQLVV.jpg",
    "https://image.tmdb.org/t/p/w500/4PiiNGXj1KENTmCBHeN6Mskj2Fq.jpg",
    "https://image.tmdb.org/t/p/w500/tFI8VLMgSTTU38i8TIsklfqS9Nl.jpg",
    "https://image.tmdb.org/t/p/w500/zSouWWrySXshPCT4t3UKCQGayyo.jpg",
    "https://image.tmdb.org/t/p/w500/kSBXou5Ac7vEqKd97wotJumyJvU.jpg",
    "https://image.tmdb.org/t/p/w500/inVq3FRqcYIRl2la8iZikYYxFNR.jpg",
    "https://image.tmdb.org/t/p/w500/g23cs30dCMiG4ldaoVNP1ucjs6.jpg",
    "https://image.tmdb.org/t/p/w500/D6e8RJf2qUstnfkTslTXNTUAlT.jpg",
  ];

  String barcodeScanRes = "";
  // List<BeerModel> _beers = new List<BeerModel>();

  @override
  void initState() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
    ]);
    super.initState();
    listenForBeers();
  }

  void listenForBeers() async {
    final List<BeerModel> lBeers = await getBeers();
    log('aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa ${jsonEncode(lBeers)}');
    // _beers.addAll(lBeers);
  }

  @override
  Widget build(BuildContext context) {
    return
        // Row(

        //   crossAxisAlignment: CrossAxisAlignment.stretch,
        //   children: <Widget>[

        //     Container(
        //       width: 50,
        //       child: Placeholder(),
        //     ),
        //     Expanded(

        //       child: SingleChildScrollView(
        //         padding: EdgeInsets.only(top: 20),
        //         child: Column(
        //           children: <Widget>[
        //             horizontalScrollingList(),
        //             horizontalScrollingList(),
        //           ],
        //         ),
        //       ),
        //     ),
        //   ],
        // );
        ChangeNotifierProvider<VideoData>(
      create: (context) => VideoData(),
      child: Scaffold(
        body: VerticalTabs(
          tabsWidth: 50,
          indicatorColor: Colors.red,
          selectedTabBackgroundColor: Colors.black,
          unselectedTabBackgroundColor: Color.fromARGB(50, 0, 0, 0),
          tabs: <Tab>[
            Tab(child: Center(child: Icon(Icons.image))),
            Tab(child: Center(child: Icon(Icons.format_color_text))),
            Tab(child: Center(child: Icon(Icons.cloud_queue))),
            Tab(child: Center(child: Icon(Icons.info_outline))),
            Tab(child: Center(child: Icon(Icons.info_outline))),
            Tab(child: Center(child: Icon(Icons.info_outline))),
            // Tab(child: Center(child: Icon(Icons.info_outline))),
            // Tab(child: Center(child: Icon(Icons.info_outline))),
          ],
          contents: <Widget>[
            Container(
                child: Column(children: <Widget>[
              horizontalScrollingList(),
              horizontalScrollingList(),
            ])),
            detailScrollingList(),

            Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text("QR code scan"),
                  MaterialButton(
                    child: Text('SCAN'),
                    // color: Colors.blue,
                    shape: RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(18.0),
                        side: BorderSide(color: Colors.red)),
                    onPressed: () async {
                      var stxt = await FlutterBarcodeScanner.scanBarcode(
                          'red', 'cancel', true, ScanMode.QR);
                      setState(() {
                        barcodeScanRes = stxt;
                      });
                      log('scanned text: $barcodeScanRes');
                    },
                  ),
                  Text("scanned: $barcodeScanRes"),
                ],
              ),
            ),
            Container(),
            Container(),
            aboutPage(),
            // detailScrollingList(),
            // horizontalScrollingList(),
          ],
        ),
      ),
    );
  }

  Widget horizontalScrollingList() {
    return Container(
      padding: EdgeInsets.only(top: 20, left: 8),
      // margin: EdgeInsets.symmetric(vertical: 5.0),
      height: 160.0,
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: 10,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, counter) {
          return Card(
            elevation: 8,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(
                16,
              ),
            ),
            child: InkWell(
              onTap: () => Navigator.pushNamed(context, '/videoscreen'),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: FadeInImage.memoryNetwork(
                  width: 100,
                  placeholder: kTransparentImage,
                  image: "${listVideoPoster[counter]}",
                  fit: BoxFit.cover,
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  // Row detailScrollingList() {
  //   return Row(
  //     children: <Widget>[
  //       ListView.builder(
  //         shrinkWrap: true,
  //         itemCount: 10,
  //         itemBuilder: (context, counter) {
  //           return Card(
  //             elevation: 8,
  //             shape: RoundedRectangleBorder(
  //               borderRadius: BorderRadius.circular(
  //                 16,
  //               ),
  //             ),
  //             child: InkWell(
  //               onTap: () => Navigator.pushNamed(context, '/videoscreen'),
  //               child: ClipRRect(
  //                 borderRadius: BorderRadius.circular(16),
  //                 child: FadeInImage.memoryNetwork(
  //                   width: 250,
  //                   height: 200,
  //                   placeholder: kTransparentImage,
  //                   image: "${listVideoPoster[counter]}",
  //                   fit: BoxFit.cover,
  //                 ),
  //               ),
  //             ),
  //           );
  //         },
  //       ),
  //     ],
  //   );
  // }

  Widget detailScrollingList() {
    return ListView.builder(
      itemCount: 10,
      itemBuilder: (BuildContext context, int index) {
        return new Column(
          children: <Widget>[
            new Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                new Padding(
                  padding: const EdgeInsets.all(0.0),
                  child: new Container(
                    margin: const EdgeInsets.only(left: 8, bottom: 16),
                    child: new Container(
                      width: 180,
                      height: 250,
                    ),
                    decoration: new BoxDecoration(
                      borderRadius: new BorderRadius.circular(10.0),
                      color: Colors.grey,
                      image: new DecorationImage(
                          image: new NetworkImage(listVideoPoster[index]),
                          fit: BoxFit.cover),
                      boxShadow: [
                        new BoxShadow(
                            color: Colors.black38,
                            blurRadius: 5.0,
                            offset: new Offset(2.0, 5.0))
                      ],
                    ),
                  ),
                ),
                new Expanded(
                    child: new Container(
                  margin: const EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 0.0),
                  child: new Column(
                    children: [
                      new Text(
                        'movie abc xyz',
                        style: new TextStyle(
                          color: const Color(0xff8785A4),
                          fontFamily: 'Arvo',
                        ),
                      ),
                      new Padding(padding: const EdgeInsets.all(2.0)),
                      new Text(
                        "Superman vs Gorila",
                        style: new TextStyle(
                          fontFamily: 'Arvo',
                          fontSize: 20.0,
                          color: const Color(0xff8785A4),
                        ),
                      )
                    ],
                    crossAxisAlignment: CrossAxisAlignment.start,
                  ),
                )),
              ],
            ),
          ],
        );
      },
    );
  }
}
