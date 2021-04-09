import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:path_drawing/path_drawing.dart';
import 'package:traveling_app/components/route_dot.dart';
import 'package:traveling_app/styles.dart';
import 'dart:math' as math;

class RouteScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    MediaQueryData media = MediaQuery.of(context);

    return Scaffold(
      backgroundColor: AKColors.bg,
      body: Stack(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              color: AKColors.primary,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(40),
                bottomRight: Radius.circular(40),
              ),
            ),
            height: media.size.height * 0.65,
          ),
          Container(
            padding: EdgeInsets.only(
              top: media.padding.top,
            ),
            child: Column(
              children: <Widget>[
                RouteAppBar(),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 20,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            "Odessa",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 24,
                            ),
                          ),
                          Text(
                            "Fr 6 Mar.",
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                      Text(
                        "Los Angeles",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 32,
                        ),
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      Row(
                        children: <Widget>[
                          Text(
                            "Sort by:",
                            style: TextStyle(
                              color: Colors.white.withOpacity(.75),
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          SortBySelect(),
                          Expanded(
                            child: SizedBox(),
                          ),
                          Badge(
                            badgeColor: AKColors.orange,
                            badgeContent: Text(
                              "1",
                              style: GoogleFonts.roboto(
                                color: Colors.white,
                                fontSize: 11,
                              ),
                            ),
                            position: BadgePosition.topRight(
                              top: -8,
                              right: -5,
                            ),
                            elevation: 0,
                            child: ClipOval(
                              child: Material(
                                color: Colors.white.withOpacity(.1),
                                child: InkWell(
                                  onTap: () {},
                                  child: Padding(
                                    padding: EdgeInsets.all(6),
                                    child: Icon(
                                      Icons.person,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          ClipOval(
                            child: Material(
                              color: Colors.white.withOpacity(.1),
                              child: InkWell(
                                onTap: () {},
                                child: Padding(
                                  padding: EdgeInsets.all(6),
                                  child: Icon(
                                    Icons.settings,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Expanded(
                  child: DefaultTabController(
                    length: 3,
                    child: Column(
                      children: <Widget>[
                        RouteTabBar(),
                        SizedBox(
                          height: 20,
                        ),
                        Expanded(
                          child: TabBarView(
                            children: <Widget>[
                              DemoTabContent(
                                routeType: "train",
                              ),
                              DemoTabContent(
                                routeType: "bus",
                              ),
                              DemoTabContent(
                                routeType: "plane",
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class DemoTabContent extends StatelessWidget {
  const DemoTabContent({
    Key key,
    this.routeType,
  }) : super(key: key);

  final String routeType;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 20,
        ),
        child: Column(
          children: <Widget>[
            RouteCard(
              routeType: routeType,
              price: 634,
              className: "Top",
              classColor: AKColors.orange,
              classTextColor: Colors.white,
              fromDate: "Fr 6 Mar.",
              fromName: "ODS",
              fromTime: "2:55 pm",
              toDate: "Fr 6 Mar.",
              toName: "CA (LAX)",
              toTime: "8:20 pm",
              tripList: ["13 h 25 m"],
            ),
            RouteCard(
              routeType: routeType,
              price: 1120,
              className: "Med",
              classColor: AKColors.grey2,
              classTextColor: AKColors.dark2,
              fromDate: "Fr 6 Mar.",
              fromName: "ODS",
              fromTime: "2:55 pm",
              toDate: "Fr 6 Mar.",
              toName: "CA (ONT)",
              toTime: "8:20 pm",
              tripList: [
                "7 h 28 m",
                "5 h 15 m",
              ],
            ),
            RouteCard(
              routeType: routeType,
              price: 1528,
              className: "Med",
              classColor: AKColors.grey2,
              classTextColor: AKColors.dark2,
              fromDate: "Fr 6 Mar.",
              fromName: "ODS",
              fromTime: "2:55 pm",
              toDate: "Fr 6 Mar.",
              toName: "CA (ONT)",
              toTime: "8:20 pm",
              tripList: [
                "1 h 28 m",
                "12 h 15 m",
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class RouteCard extends StatelessWidget {
  const RouteCard({
    Key key,
    this.price,
    this.routeType,
    this.fromDate,
    this.fromName,
    this.fromTime,
    this.toDate,
    this.toName,
    this.toTime,
    this.className,
    this.tripList,
    this.classColor,
    this.classTextColor,
  }) : super(key: key);

  final double price;
  final String routeType, fromDate, fromName, fromTime, toDate, toName, toTime, className;
  final List<String> tripList;
  final Color classColor, classTextColor;

  buildTripList() {
    List<Widget> widgets = [];
    widgets.add(RouteDotStart());
    for (var item in tripList.asMap().entries) {
      if (item.key > 0) {
        widgets.add(RouteDotMid());
      }

      widgets.add(RouteCardTimeItem(
        time: item.value,
        type: routeType,
      ));
    }
    widgets.add(RouteDotEnd());
    return widgets;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            offset: Offset(0, 4),
            blurRadius: 20,
            color: Colors.black.withOpacity(.1),
          ),
        ],
      ),
      width: double.infinity,
      margin: EdgeInsets.only(
        bottom: 20,
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(
                left: 30,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  Text(
                    "\$${price.round()}",
                    style: GoogleFonts.roboto(
                      fontWeight: FontWeight.w900,
                      fontSize: 24,
                      color: AKColors.orange,
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(20),
                      ),
                      color: classColor,
                    ),
                    padding: EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 15,
                    ),
                    child: Text(
                      className,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: classTextColor,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: 30,
                vertical: 15,
              ),
              child: Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            fromDate,
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: AKColors.grey,
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            fromName,
                            style: GoogleFonts.roboto(
                              fontSize: 22,
                              fontWeight: FontWeight.w800,
                              color: AKColors.dark,
                            ),
                          ),
                          SizedBox(
                            height: 2,
                          ),
                          Text(
                            fromTime,
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: AKColors.dark2,
                            ),
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: <Widget>[
                          Text(
                            toDate,
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: AKColors.grey,
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            toName,
                            style: GoogleFonts.roboto(
                              fontSize: 22,
                              fontWeight: FontWeight.w800,
                              color: AKColors.dark,
                            ),
                          ),
                          SizedBox(
                            height: 2,
                          ),
                          Text(
                            toTime,
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: AKColors.dark2,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Stack(
                    children: <Widget>[
                      Container(
                        width: double.infinity,
                        height: 22,
                        child: CustomPaint(
                          painter: RouteCardDashLinePainter(),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: buildTripList(),
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class RouteCardTimeItem extends StatelessWidget {
  const RouteCardTimeItem({
    Key key,
    this.type,
    this.time,
  }) : super(key: key);

  final String type, time;

  buildIcon() {
    switch (type) {
      case "train":
        return Transform.translate(
          offset: Offset(0, -2),
          child: Icon(
            Icons.train,
            color: AKColors.routeIcon,
            size: 28,
          ),
        );
        break;
      case "bus":
        return Transform.translate(
          offset: Offset(0, -2),
          child: Icon(
            Icons.directions_bus,
            color: AKColors.routeIcon,
            size: 28,
          ),
        );
        break;
      case "plane":
        return Transform.translate(
          offset: Offset(0, -2),
          child: Transform.rotate(
            angle: 90 * math.pi / 180,
            child: Icon(
              Icons.flight,
              color: AKColors.routeIcon,
              size: 28,
            ),
          ),
        );
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        //  Icon
        buildIcon(),
        SizedBox(
          height: 5,
        ),
        //  Time
        Text(
          time,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: AKColors.routeIcon,
          ),
        ),
      ],
    );
  }
}

class RouteCardDashLinePainter extends CustomPainter {
  final Paint paintStyle = Paint()
    ..color = AKColors.routeIcon
    ..strokeWidth = 1.0
    ..style = PaintingStyle.stroke;

  @override
  void paint(Canvas canvas, Size size) {
    Path p = Path()
      ..moveTo(10, size.height / 2)
      ..lineTo(size.width - 10, size.height / 2);

    canvas.drawPath(
      dashPath(
        p,
        dashArray: CircularIntervalList<double>([10, 5]),
      ),
      paintStyle,
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}

class RouteTabBar extends StatelessWidget {
  const RouteTabBar({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: 20,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: Colors.white.withOpacity(.25),
        ),
      ),
      height: 40,
      child: TabBar(
        labelColor: AKColors.primary2,
        unselectedLabelColor: Colors.white.withOpacity(.85),
        indicator: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        tabs: <Widget>[
          Tab(
            text: "TRAIN",
          ),
          Tab(
            text: "BUS",
          ),
          Tab(
            text: "PLANE",
          ),
        ],
      ),
    );
  }
}

class SortBySelect extends StatelessWidget {
  const SortBySelect({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.1),
        borderRadius: BorderRadius.circular(10),
      ),
      padding: EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 8,
      ),
      child: Row(
        children: <Widget>[
          Text(
            "Price",
            style: TextStyle(
              fontSize: 14,
              color: Colors.white,
            ),
          ),
          SizedBox(
            width: 10,
          ),
          Transform.rotate(
            angle: -90 * math.pi / 180,
            child: Icon(
              Icons.chevron_left,
              color: Colors.white,
              size: 14,
            ),
          ),
        ],
      ),
    );
  }
}

class RouteAppBar extends StatelessWidget {
  const RouteAppBar({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.chevron_left,
            color: Colors.white,
          ),
        ),
        IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.sort,
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}
