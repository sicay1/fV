import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:vertical_tabs/vertical_tabs.dart';

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

  @override
  void initState() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
    ]);
    super.initState();
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
    VerticalTabs(
      tabsWidth: 50,
      tabs: <Tab>[
        Tab(child: Icon(Icons.access_time)),
        Tab(child: Icon(Icons.access_time)),
      ],
      contents: <Widget>[
        Container(child: Column(
          children: <Widget>[
            horizontalScrollingList(),
            horizontalScrollingList(),
          ],
        )),
        
        Container(child: SingleChildScrollView(child: Column(
          children: <Widget>[
            horizontalScrollingList(),
            horizontalScrollingList(),
            horizontalScrollingList(),
          ],
        ))),
      ],
    );
  }

  Container horizontalScrollingList() {
    return Container(
      padding: EdgeInsets.only(top: 5),
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
}
