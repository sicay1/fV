import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:transparent_image/transparent_image.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

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
    return SizedBox(
      width: 150,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Card(
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
                  height: 150,
                  width: 150,
                  placeholder: kTransparentImage,
                  image:
                      "https://image.tmdb.org/t/p/w370_and_h556_bestv2/aMpyrCizvSdc0UIMblJ1srVgAEF.jpg",
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(top: 8),
              child: Text(
                "result.originalTitle",
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.title,
              ),
            ),
          ),
          Expanded(
            child: Text(
              "result.voteAverage/10",
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.title,
            ),
          ),
        ],
      ),
    );
  }
}
