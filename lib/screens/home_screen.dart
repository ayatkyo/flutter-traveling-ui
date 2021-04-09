import 'package:flutter/material.dart';
import 'package:traveling_app/screens/route_screen.dart';
import 'package:traveling_app/styles.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    MediaQueryData media = MediaQuery.of(context);

    return Scaffold(
      body: Container(
        color: Colors.white,
        padding: EdgeInsets.only(
          top: media.padding.top,
        ),
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            HomeImage(media: media),
            Expanded(
              child: Container(
                margin: EdgeInsets.symmetric(
                  horizontal: 30,
                  vertical: 30,
                ),
                width: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "Book your flight",
                      style: TextStyle(
                        color: AKColors.dark,
                        fontSize: 32,
                        fontWeight: FontWeight.w900,
                        letterSpacing: 1.15,
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Expanded(
                      child: Container(
                        child: Column(
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                Expanded(
                                  child: Column(
                                    children: <Widget>[
                                      Row(
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: <Widget>[
                                          Container(
                                            decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: AKColors.dark.withOpacity(.15),
                                            ),
                                            padding: EdgeInsets.all(4),
                                            child: Container(
                                              decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                color: AKColors.dark,
                                              ),
                                              height: 13,
                                              width: 13,
                                            ),
                                          ),
                                          SizedBox(
                                            width: 20,
                                          ),
                                          Text(
                                            "Odessa,",
                                            style: TextStyle(
                                              color: AKColors.dark,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 16,
                                            ),
                                          ),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Text(
                                            "Ukraine",
                                            style: TextStyle(
                                              color: AKColors.grey,
                                              fontSize: 16,
                                            ),
                                          ),
                                        ],
                                      ),
                                      Container(
                                        height: 1,
                                        color: Colors.black.withOpacity(0.1),
                                        width: double.infinity,
                                        margin: EdgeInsets.only(
                                          top: 15,
                                          bottom: 15,
                                          left: 40,
                                        ),
                                      ),
                                      Row(
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: <Widget>[
                                          Container(
                                            decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: AKColors.dark.withOpacity(.15),
                                            ),
                                            padding: EdgeInsets.all(4),
                                            child: Container(
                                              decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  color: Colors.white,
                                                  border: Border.all(
                                                    color: AKColors.dark,
                                                    width: 1.25,
                                                  )),
                                              height: 13,
                                              width: 13,
                                            ),
                                          ),
                                          SizedBox(
                                            width: 20,
                                          ),
                                          Text(
                                            "Los Angeles,",
                                            style: TextStyle(
                                              color: AKColors.dark,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 16,
                                            ),
                                          ),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Text(
                                            "USA",
                                            style: TextStyle(
                                              color: AKColors.grey,
                                              fontSize: 16,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                SwapBtn(),
                              ],
                            ),
                            Expanded(
                              child: Container(
                                margin: EdgeInsets.only(
                                  left: 40,
                                  top: 20,
                                ),
                                child: Row(
                                  children: <Widget>[
                                    Expanded(
                                      child: GestureDetector(
                                        onTap: () {
                                          showDatePicker(
                                            context: context,
                                            initialDate: DateTime.now(),
                                            firstDate: DateTime.now(),
                                            lastDate: DateTime.now().add(
                                              Duration(
                                                days: 7,
                                              ),
                                            ),
                                          );
                                        },
                                        child: Container(
                                          decoration: BoxDecoration(
                                            border: Border(
                                              bottom: BorderSide(
                                                color: Colors.black.withOpacity(0.1),
                                              ),
                                            ),
                                          ),
                                          padding: EdgeInsets.only(
                                            bottom: 8,
                                          ),
                                          child: Row(
                                            children: <Widget>[
                                              Text(
                                                "Fr 6 Mar",
                                                style: TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold,
                                                  color: AKColors.dark,
                                                ),
                                              ),
                                              Expanded(
                                                child: SizedBox(),
                                              ),
                                              Icon(
                                                Icons.calendar_today,
                                                size: 18,
                                                color: AKColors.dark,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 40,
                                    ),
                                    Expanded(
                                      child: GestureDetector(
                                        onTap: () {
                                          showDatePicker(
                                            context: context,
                                            initialDate: DateTime.now(),
                                            firstDate: DateTime.now(),
                                            lastDate: DateTime.now().add(
                                              Duration(
                                                days: 7,
                                              ),
                                            ),
                                          );
                                        },
                                        child: Container(
                                          decoration: BoxDecoration(
                                            border: Border(
                                              bottom: BorderSide(
                                                color: Colors.black.withOpacity(0.1),
                                              ),
                                            ),
                                          ),
                                          padding: EdgeInsets.only(
                                            bottom: 8,
                                          ),
                                          child: Row(
                                            children: <Widget>[
                                              Text(
                                                "Back",
                                                style: TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold,
                                                  color: AKColors.grey,
                                                ),
                                              ),
                                              Expanded(
                                                child: SizedBox(),
                                              ),
                                              Icon(
                                                Icons.calendar_today,
                                                size: 18,
                                                color: AKColors.grey,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    FindRouteBtn(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SwapBtn extends StatelessWidget {
  const SwapBtn({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: Material(
        color: AKColors.orange,
        child: InkWell(
          onTap: () {},
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: Icon(
              Icons.swap_vert,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}

class FindRouteBtn extends StatelessWidget {
  const FindRouteBtn({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      color: AKColors.dark,
      padding: EdgeInsets.symmetric(
        vertical: 16,
      ),
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => RouteScreen(),
          ),
        );
      },
      child: Container(
        width: double.infinity,
        child: Center(
          child: Text(
            "Find a route",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w600,
              fontSize: 16,
              letterSpacing: .75,
            ),
          ),
        ),
      ),
    );
  }
}

class HomeImage extends StatelessWidget {
  const HomeImage({
    Key key,
    @required this.media,
  }) : super(key: key);

  final MediaQueryData media;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Image.asset('assets/images/traveling.png'),
      height: media.size.height * 0.45,
      padding: EdgeInsets.symmetric(
        horizontal: 20,
      ),
    );
  }
}
