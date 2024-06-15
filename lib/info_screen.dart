import 'dart:ui';

import 'package:flutter/material.dart';

class InfoScreen extends StatefulWidget {
  final String name;
  final String location;
  final String image;
  InfoScreen(
      {super.key,
      required this.name,
      required this.location,
      required this.image});

  @override
  State<InfoScreen> createState() =>
      _InfoScreenState(name: name, location: location, image: image);
}

class _InfoScreenState extends State<InfoScreen> {
  final String name;
  final String location;
  final String image;

  _InfoScreenState(
      {required this.location, required this.image, required this.name});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xff031F2B),
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              leading: Text(''), // for remove def na
              backgroundColor: Color(0xff031F2B),
              expandedHeight: 300,
              flexibleSpace: FlexibleSpaceBar(
                background: Container(
                  decoration: BoxDecoration(
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage(image),
                      ),
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(20),
                        bottomRight: Radius.circular(20),
                      )),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      GestureDetector(
                        onTap: () {
                          print('clicked');
                          Navigator.of(context).pop(context);
                        },
                        child: Container(
                          margin: EdgeInsets.all(24.0),
                          width: 42,
                          height: 42,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.3),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: BackdropFilter(
                                filter:
                                    ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
                                child: Icon(
                                  Icons.arrow_back,
                                  size: 20,
                                  color: Colors.white,
                                )),
                          ),
                        ),
                      ),
                      Spacer(),
                      Row(
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: 16, horizontal: 24),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  name,
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: 'PoppinsBold',
                                      fontSize: 20),
                                ),
                                SizedBox(
                                  height: 8,
                                ),
                                Text(
                                  location,
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: 'PoppinsLight',
                                      fontSize: 16),
                                ),
                              ],
                            ),
                          ),
                          Spacer(),
                          Text(
                            '4.7',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontFamily: 'PoppinsBold'),
                          ),
                          Icon(
                            Icons.star,
                            color: Color(0xffE58F3F),
                          ),
                          SizedBox(
                            width: 24,
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 16, horizontal: 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(
                      height: 20,
                    ),
                    mySectionTitle('Batafsil'),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      'Zomin tumani — Jizzax viloyatidagi tuman. 1926-yil 29-sentabrda tashkil etilgan (1962-yil 24-dekabrda Jizzax tumani bilan birlashtirilgan, 1964-yil 31-dekabrda qayta tuzilgan. Shimolda viloyatning Zarbdor tumani, gʻarbda ',
                      style: TextStyle(
                          color: Color(0xffD6D2D2),
                          fontFamily: 'PoppinsRegular',
                          fontSize: 14),
                      textAlign: TextAlign.justify,
                    ),
                    SizedBox(
                      height: 24,
                    ),
                    Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child:
                              myCategory('assets/images/map.png', 'Joylashuv'),
                        ),
                        SizedBox(
                          width: 24,
                        ),
                        Expanded(
                          flex: 1,
                          child:
                              myCategory('assets/images/network.png', 'Manba'),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget mySectionTitle(String title) => Text(
        title,
        style: TextStyle(
            color: Colors.white, fontFamily: 'PoppinsBold', fontSize: 16),
      );

  Widget myCategory(
    String image,
    String title,
  ) =>
      Container(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: Color(0xff5EDFFF), width: 1)),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              height: 20,
              width: 20,
              decoration: BoxDecoration(
                  image: DecorationImage(image: AssetImage(image))),
            ),
            SizedBox(
              width: 8,
            ),
            Text(
              title,
              style: TextStyle(
                  color: Color(0xff5EDFFF),
                  fontFamily: 'PoppinsMedium',
                  fontSize: 14),
            )
          ],
        ),
      );
}
