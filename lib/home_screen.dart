import 'package:flutter/material.dart';
import 'package:travel_app/data/FamousPlacesData.dart';
import 'package:travel_app/info_screen.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final textController = TextEditingController();
  String unputText = '';
  int selectedIndex = 0;
  List<String> sections = ['Barchasi', 'Tabiat', 'Dacha', 'Shahar'];
  String imgs = 'assets/images/';
  List<Famousplacesdata> famousPlacesList = [
    Famousplacesdata('Orol dengizi', 'Qoraqalpog\'iston',
        'assets/images/island.png', 'Tabiat'),
    Famousplacesdata('Zomin tog\'lari', 'Jizzax',
        'assets/images/zamin_mountines.png', 'Tabiat'),
    Famousplacesdata(
        'Dubay', 'BAA', 'assets/images/burj_al_haliyf1.png', 'Shahar'),
    Famousplacesdata(
        'Kapadokiya', 'Turkiya', 'assets/images/kapadokiya.jpg', 'Shahar'),
    Famousplacesdata(
        'Grumant', 'Rossiya, Tula', 'assets/images/grumant.jpg', 'Dacha'),
  ];

  List<Famousplacesdata> allFamouces = [
    Famousplacesdata(
        'Zomin', 'Jizzax', 'assets/images/zamin_mountains.png', 'nature'),
    Famousplacesdata(
        'Kapadokiya', 'Turkiya', 'assets/images/kapadikiya2.jpg', 'nature'),
    Famousplacesdata(
        'Grumant', 'Rossiya, Tula', 'assets/images/grumant.jpg', 'nature'),
    Famousplacesdata('Island', 'Bali', 'assets/images/islandy.jpg', 'nature'),
  ];

  List<Famousplacesdata> showData = [];
  List<Famousplacesdata> textSorting = [];

  @override
  void initState() {
    showData = famousPlacesList;
    textSorting = allFamouces;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
          backgroundColor: Color(0xff031F2B),
          body: SafeArea(
            child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 18.0, vertical: 24.0),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
            Text(
              'Sayohat',
              style: TextStyle(
                  color: Colors.white, fontSize: 24, fontFamily: 'PoppinsBold'),
            ),
            SizedBox(
              height: 24,
            ),
            mySearcher(),
            SizedBox(
              height: 16,
            ),
            SizedBox(
              height: 40,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: 4,
                separatorBuilder: (BuildContext context, int index) => SizedBox(
                  width: 8,
                ),
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      setState(() {
                        if (sections[index] == 'Barchasi') {
                          showData = List.from(famousPlacesList);
                        } else {
                          showData = famousPlacesList
                              .where((data) => data.type == sections[index])
                              .toList();
                        }
                        selectedIndex = index;
                        print('show data size ${showData.length}');
                      });
                    },
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                      decoration: BoxDecoration(
                        color: selectedIndex == index
                            ? Color(0xff5EDFFF)
                            : Color(0xff263238),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        sections[index],
                        style: TextStyle(
                          color: selectedIndex != index
                              ? Colors.white
                              : Color(0xff263238),
                          fontFamily: 'PoppinsMedium',
                          fontSize: 12,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            SizedBox(
              height: 24,
            ),
            mySectionTitle('Mashxur joylar'),
            SizedBox(
              height: 24,
            ),
            SizedBox(
              height: 178,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: showData.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      child: famousPlaces(
                        showData[index].image,
                        showData[index].name,
                        showData[index].location,
                      ),
                      highlightColor: Colors.transparent,
                      splashColor: Colors.transparent,
                    );
                  }),
            ),
            SizedBox(
              height: 32,
            ),
            mySectionTitle('Barchasi'),
            SizedBox(
              height: 32,
            ),
            ListView.separated(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: textSorting.length, 
              itemBuilder: (context, index) {
                return InkWell(
                    onTap: () {
                      setState(() {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => InfoScreen(
                                  name: textSorting[index].name,
                                  location: textSorting[index].location,
                                  image: textSorting[index].image,
                                )));
                      });
                    },
                    highlightColor: Colors.transparent,
                    splashColor: Colors.transparent,
                    child: Container(
                      height: 150,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage(textSorting[index].image),
                        ),
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(16.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  textSorting[index].name,
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 12,
                                      fontFamily: 'PoppinsMedium'),
                                ),
                                SizedBox(
                                  height: 8,
                                ),
                                Text(
                                  textSorting[index].location,
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 10,
                                      fontFamily: 'PoppinsLight'),
                                ),
                              ],
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
                            )
                          ],
                        ),
                      ),
                    ));
              },
              separatorBuilder: (BuildContext context, int index) {
                return SizedBox(height: 16);
              },
            ),
                    ],
                  ),
                ),
            ),
          ),
        );
  }

  Widget mySearcher() => TextField(
        onChanged: (text) {
          print('selected: $text');
          setState(() {
            textSorting = allFamouces
                .where((data) =>
                    data.name.toLowerCase().contains(text.toLowerCase()) ||
                    data.location.toLowerCase().contains(text.toLowerCase()))
                .toList();

            print('qidirlgandan song ${text}');
            print('menda qoldi ${textSorting.length}');
          });
        },
        // onChanged: (value) {
        // print('selected: $value');
        // setState(() {
        //   textSorting = famousPlacesList
        //       .where((data) =>
        //           data.name.toLowerCase() == value.toLowerCase() ||
        //           data.location.toLowerCase() == value.toLowerCase())
        //       .toList();

        //   print('qidirlgandan song ${textSorting.length}');
        // })
        // },
        cursorColor: Color(0xffD6D2D2),
        decoration: InputDecoration(
            filled: true,
            fillColor: Color(0xff263238),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(
                color: Colors.transparent,
                width: 1.0,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(
                color: Color(0xff263238),
                width: 1.0,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(
                color: Color(0xff263238),
                width: 2.0,
              ),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(
                color: Colors.red,
                width: 1.0,
              ),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(
                color: Colors.red,
                width: 2.0,
              ),
            ),
            errorStyle: TextStyle(color: Colors.red),
            suffixIcon: Icon(
              Icons.search_sharp,
              color: Color(0xffD6D2D2),
            )),
        style: TextStyle(color: Colors.white),
      );

  Widget famousPlaces(
    String image,
    String name,
    String location,
  ) {
    return InkWell(
      onTap: () {
        setState(() {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => InfoScreen(
                    name: name,
                    location: location,
                    image: image,
                  )));
        });
      },
      child: Container(
        width: 124,
        height: 178,
        margin: EdgeInsets.only(right: 15.0),
        decoration: BoxDecoration(
          color: Colors.orange,
          borderRadius: BorderRadius.circular(8),
          image: DecorationImage(
            fit: BoxFit.fill,
            image: AssetImage(image),
          ),
        ),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            gradient: LinearGradient(
              begin: Alignment.bottomRight,
              stops: [0.1, 0.9],
              colors: [
                Colors.black.withOpacity(.8),
                Colors.black.withOpacity(.1),
              ],
            ),
          ),
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'PoppinsMedium',
                      fontSize: 12),
                ),
                Text(
                  location,
                  style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'PoppinsLight',
                      fontSize: 10),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget mySectionTitle(String title) => Text(
        title,
        style: TextStyle(
            color: Colors.white, fontFamily: 'PoppinsBold', fontSize: 16),
      );
}
