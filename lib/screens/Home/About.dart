import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

Widget aboutPage() {
    return new Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        new Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            new Padding(
              padding: const EdgeInsets.all(0.0),
              child: GestureDetector(
                onTap: () async {
                  //
                  if (await canLaunch('https://github.com/sicay1/fV')) {
                    await launch('https://github.com/sicay1/fV');
                  } else {
                    throw 'Could not launch https://github.com/sicay1/fV';
                  }
                },
                child: new Container(
                  margin: const EdgeInsets.all(16.0),
                  child: new Container(
                    width: 200,
                    height: 200,
                  ),
                  decoration: new BoxDecoration(
                    borderRadius: new BorderRadius.circular(100.0),
                    color: Colors.black,
                    image: new DecorationImage(
                        image: new NetworkImage(
                            'https://avatars0.githubusercontent.com/u/23693701?s=460&v=4'),
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
            ),
            new Expanded(
                child: new Container(
              margin: const EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 0.0),
              child: new Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  new Text(
                    "fV - Flutter Video loader",
                    style: new TextStyle(
                      color: Colors.grey,
                      fontFamily: 'Roboto',
                      fontSize: 24
                    ),
                  ),
                  new Padding(padding: const EdgeInsets.all(2.0)),
                  new Text(
                    "@sicay1",
                    style: new TextStyle(
                      fontFamily: 'Roboto',
                      fontSize: 16.0,
                      color: Colors.blueGrey,
                    ),
                  )
                ],
              ),
            )),
          ],
        ),
      ],
    );
  }