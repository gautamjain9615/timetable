import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:intl/intl.dart';
import './../widget/change_theme_button_widget.dart';
import 'package:provider/provider.dart';
import './../provider/theme_provider.dart';
import 'package:http/http.dart';

// flutter build web
// firebase deploy --only hosting

class Cse extends StatefulWidget {
  static String id = 'cse';

  @override
  _CseState createState() => _CseState();
}

final url = "https://gautamjain9615.github.io/jsonapi/cselinks.json";
var temp = {};
var _postsJson = {
  "cn": "https://meet.google.com/yha-okqk-pdf?authuser=1&pli=1",
  "cs": "https://meet.google.com/oca-bhjk-vcc?authuser=1&pli=1",
  "es": "https://meet.google.com/pjn-zcqt-juo?pli=1&authuser=1",
  "mpc": "https://meet.google.com/xbg-pbrq-ujo?pli=1&authuser=1",
  "sde": "https://meet.google.com/ykt-qvky-hqt?pli=1&authuser=1",
  "dsl": "https://meet.google.com/ttt-zohf-brc?pli=1&authuser=1",
  "cnl": "https://meet.google.com/yha-okqk-pdf?authuser=1&pli=1",
  "csl": "https://meet.google.com/oca-bhjk-vcc?authuser=1&pli=1",
  "om": "https://meet.google.com/tpf-gysz-ekf?authuser=1&pli=1",
  "mhc": "https://meet.google.com/yeu-tsoq-ihn?authuser=1&pli=1",
  "pe": "",
  "free": ""
};
var finalList = {};

class _CseState extends State<Cse> {
  String day = DateFormat('EEEE').format(DateTime.now());
  GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey();

  void fetchData() async {
    try {
      final response = await get(Uri.parse(url));
      final jsonData = jsonDecode(response.body) as Map;

      setState(() {
        temp = jsonData;
      });
    } catch (err) {
      print("Error Occoured");
      print(err);
    }
  }

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    if (temp.length == 0) {
      print("temp empty");
      finalList = _postsJson;
    } else {
      print("temp nto empty");
      finalList = temp;
    }

    return Scaffold(
      // backgroundColor: mode == "light" ? Colors.white : Colors.black26,
      appBar: AppBar(
        backgroundColor: Color(0xFF6E40C9),
        // actions: [
        //   IconButton(
        //       onPressed: () {
        //         print(temp.length);
        //       },
        //       icon: Icon(Icons.account_tree_outlined))
        // ],
        title: Center(child: Text("Time Table for " + day)),
        leading: IconButton(
          icon: Icon(Icons.menu_rounded),
          // color: Colors.white,
          tooltip: 'Menu Icon',
          onPressed: () {
            if (_scaffoldKey.currentState.isDrawerOpen == false) {
              _scaffoldKey.currentState.openDrawer();
            } else {
              _scaffoldKey.currentState.openEndDrawer();
            }
          },
        ),
      ),
      key: _scaffoldKey,
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            Container(
              decoration: BoxDecoration(
                // border: Border(
                //   bottom: BorderSide(width: 2.0, color: Colors.grey),
                // ),
                // color: Colors.blue,
                color: Color(0xFF6E40C9),
              ),
              padding: EdgeInsets.fromLTRB(0, 120, 0, 30),
              child: Center(
                  child: Text(
                "Change Week Day",
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                    fontSize: 18),
              )),
            ),
            SizedBox(height: 7),
            // Divider(
            //   color: Colors.grey,
            //   thickness: 2,
            // ),
            ListTile(
              leading: Icon(Icons.date_range_outlined),
              title: const Text('Monday'),
              onTap: () {
                // day = "Monday";
                setState(() {
                  day = "Monday";
                });
                Navigator.of(context).pop();
              },
            ),
            ListTile(
              leading: Icon(Icons.date_range_outlined),
              title: const Text('Tuesday'),
              onTap: () {
                setState(() {
                  day = "Tuesday";
                });
                Navigator.of(context).pop();
              },
            ),
            ListTile(
              leading: Icon(Icons.date_range_outlined),
              title: const Text('Wednesday'),
              onTap: () {
                setState(() {
                  day = "Wednesday";
                });
                Navigator.of(context).pop();
              },
            ),
            ListTile(
              leading: Icon(Icons.date_range_outlined),
              title: const Text('Thursday'),
              onTap: () {
                setState(() {
                  day = "Thursday";
                });
                Navigator.of(context).pop();
              },
            ),
            ListTile(
              leading: Icon(Icons.date_range_outlined),
              title: const Text('Friday'),
              onTap: () {
                setState(() {
                  day = "Friday";
                });
                Navigator.of(context).pop();
              },
            ),
            ListTile(
              leading: Icon(Icons.date_range_outlined),
              title: const Text('Saturday'),
              onTap: () {
                setState(() {
                  day = "Saturday";
                });
                Navigator.of(context).pop();
              },
            ),
            ListTile(
              leading: Icon(Icons.today_outlined),
              title: const Text('Default'),
              onTap: () {
                setState(() {
                  day = DateFormat('EEEE').format(DateTime.now());
                });
                Navigator.of(context).pop();
              },
            ),
            SizedBox(height: 20),
            ChangeThemeButtonWidget(),
          ],
        ),
      ),
      body: Center(
        child: Widget1(day: day),
      ),
      floatingActionButton: FloatingActionButton(
          backgroundColor: Color(0xFF6E40C9),
          onPressed: () => launch(
              "https://docs.google.com/document/d/1agz6D23hR1A7QH7yBSm7005vlQm3mpyeTBQwHWa3A-Y/edit?usp=sharing"),
          child: Icon(Icons.navigate_next, color: Colors.white),
          tooltip: "Complete Timetable"),
    );
  }
}

class Widget1 extends StatelessWidget {
  Widget1({@required this.day});
  final String day;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    var classes_mp = {
      'cn': classButton(
          link: 'https://meet.google.com/yha-okqk-pdf?authuser=1&pli=1',
          title: Text("Computer Networks"),
          width: 0.6),
      'cs': classButton(
          link: 'https://meet.google.com/oca-bhjk-vcc?authuser=1&pli=1',
          title: Text("Cyber Security"),
          width: 0.6),
      'es': classButton(
          link: 'https://meet.google.com/pjn-zcqt-juo?pli=1&authuser=1',
          title: Text("Embedded Systems"),
          width: 0.6),
      'mpc': classButton(
          link: 'https://meet.google.com/xbg-pbrq-ujo?pli=1&authuser=1',
          title: size.width > 600
              ? Text("Mobile and Pervasive Computing")
              : Text("MPC"),
          width: 0.6),
      'sde': classButton(
          link: 'https://meet.google.com/ykt-qvky-hqt?pli=1&authuser=1',
          title: size.width > 600
              ? Text("Software and Data Engineering")
              : Text("SDE"),
          width: 0.6),
      'dsl': classButton(
          link: 'https://meet.google.com/ttt-zohf-brc?pli=1&authuser=1',
          title:
              size.width > 600 ? Text("Digital Systems Lab") : Text("DS lab"),
          width: 0.6),

      'cnl': classButton(
          link: 'https://meet.google.com/yha-okqk-pdf?pli=1&authuser=1',
          title:
          size.width > 600 ? Text("Computer Networks Lab") : Text("CN lab"),
          width: 0.6),

      'csl': classButton(
          link: 'https://meet.google.com/oca-bhjk-vcc?authuser=1&pli=1',
          title:
          size.width > 600 ? Text("Cyber Security Lab") : Text("CS lab"),
          width: 0.6),

      'om': classButton(
          link: 'https://meet.google.com/tpf-gysz-ekf?authuser=1&pli=1',
          title: size.width > 600
              ? Text("Operations Management")
              : Text("Ops Mgmt"),
          width: 0.6),
      'mhc': classButton(
          link: 'https://meet.google.com/yeu-tsoq-ihn?authuser=1&pli=1',
          title: size.width > 600
              ? Text("Managing Human Capital")
              : Text("Mng HC"),
          width: 0.6),
      'pe': classButton(
          link: '',
          title:
              size.width > 600 ? Text("Professional Ethics") : Text("Ethics"),
          width: 0.6),

      'free': classButton(
          link: '',
          title:Text("Free Slot"),
          width: 0.6),
    };

    var classes = {
      'cn': classButton(
          link: finalList["cn"].toString(),
          title: Text("Computer Networks"),
          width: 0.6),
      'cs': classButton(
          link: finalList["cs"].toString(),
          title: Text("Cyber Security"),
          width: 0.6),
      'es': classButton(
          link: finalList["es"].toString(),
          title: Text("Embedded Systems"),
          width: 0.6),
      'mpc': classButton(
          link: finalList["mpc"].toString(),
          title: size.width > 600
              ? Text("Mobile and Pervasive Computing")
              : Text("MPC"),
          width: 0.6),
      'sde': classButton(
          link: finalList["sde"].toString(),
          title: size.width > 600
              ? Text("Software and Data Engineering")
              : Text("SDE"),
          width: 0.6),
      'dsl': classButton(
          link: finalList["dsl"].toString(),
          title:
              size.width > 600 ? Text("Digital Systems Lab") : Text("DS lab"),
          width: 0.6),

      'cnl': classButton(
          link: finalList["cnl"].toString(),
          title:
          size.width > 600 ? Text("Computer Networks Lab") : Text("CN lab"),
          width: 0.6),

      'csl': classButton(
          link: finalList["csl"].toString(),
          title:
          size.width > 600 ? Text("Cyber Security Lab") : Text("CS lab"),
          width: 0.6),

      'om': classButton(
          link: finalList["om"].toString(),
          title: size.width > 600
              ? Text("Operations Management")
              : Text("Ops Mgmt"),
          width: 0.6),
      'mhc': classButton(
          link: finalList["mhc"].toString(),
          title: size.width > 600
              ? Text("Managing Human Capital")
              : Text("Mng HC"),
          width: 0.6),
      'pe': classButton(
          link: finalList["pe"].toString(),
          title:
              size.width > 600 ? Text("Professional Ethics") : Text("Ethics"),
          width: 0.6),

      'free': classButton(
          link: finalList["free"].toString(),
          title:Text("Free Slot"),
          width: 0.6),
    };

    switch (day) {
      case "Monday":
        {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Widget2(time: "8:00 - 8:50", wid: classes['om']),
              Widget2(time: "9:00 - 9:50", wid: classes['free']),
              Widget2(time: "10:00 - 10:50", wid: classes['cn']),
              Widget2(time: "11:00 - 11:50", wid: classes['es']),
              Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(right: 15, top: 30, bottom: 30),
                      height: 1.3,
                      width: size.width * 0.2,
                      color: Color(0xFF6E40C9),
                    ),
                    Text(
                      "Evening Classes",
                      style: TextStyle(
                          // color: Colors.black,
                          fontWeight: FontWeight.w500,
                          fontSize: 17),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 15, top: 30, bottom: 30),
                      height: 1.3,
                      width: size.width * 0.2,
                      color: Color(0xFF6E40C9),
                    ),
                  ]),
              Widget2(time: "5:00 - 5:50", wid: classes['pe']),
            ],
          );
        }
        break;
      case "Tuesday":
        {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Widget2(time: "8:00 - 8:50", wid: classes['mhc']),
              Widget2(time: "9:00 - 9:50", wid: classes['free']),
              Widget2(time: "10:00 - 10:50", wid: classes['cs']),
              Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(right: 15, top: 30, bottom: 30),
                      height: 1.3,
                      width: size.width * 0.2,
                      color: Color(0xFF6E40C9),
                    ),
                    Text(
                      "Evening Classes",
                      style: TextStyle(
                        // color: Colors.black,
                          fontWeight: FontWeight.w500,
                          fontSize: 17),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 15, top: 30, bottom: 30),
                      height: 1.3,
                      width: size.width * 0.2,
                      color: Color(0xFF6E40C9),
                    ),
                  ]),
              Widget2(time: "4:00 - 4:50", wid: classes['mpc']),
            ],
          );
        }
        break;
      case "Wednesday":
        {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Widget2(time: "8:00 - 8:50", wid: classes['om']),
              Widget2(time: "9:00 - 9:50", wid: classes['cs']),
              Widget2(time: "10:00 - 10:50", wid: classes['cn']),
              Widget2(time: "11:00 - 11:50", wid: classes['es']),
              Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(right: 15, top: 30, bottom: 30),
                      height: 1.3,
                      width: size.width * 0.2,
                      color: Color(0xFF6E40C9),
                    ),
                    Text(
                      "Evening Classes",
                      style: TextStyle(
                          // color: Colors.black,
                          // fontWeight: FontWeight.w500,
                          fontSize: 17),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 15, top: 30, bottom: 30),
                      height: 1.3,
                      width: size.width * 0.2,
                      color: Color(0xFF6E40C9),
                    ),
                  ]),
              Widget2(time: "1:00 - 2:50", wid: classes['cnl']),
              Widget2(time: "6:00 - 7:30", wid: classes['sde'])
            ],
          );
        }
        break;
      case "Thursday":
        {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Widget2(time: "8:00 - 8:50", wid: classes['mhc']),
              Widget2(time: "9:00 - 9:50", wid: classes['free']),
              Widget2(time: "10:00 - 10:50", wid: classes['cn']),
              Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(right: 15, top: 30, bottom: 30),
                      height: 1.3,
                      width: size.width * 0.2,
                      color: Color(0xFF6E40C9),
                    ),
                    Text(
                      "Evening Classes",
                      style: TextStyle(
                          // color: Colors.black,
                          // fontWeight: FontWeight.w500,
                          fontSize: 17),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 15, top: 30, bottom: 30),
                      height: 1.3,
                      width: size.width * 0.2,
                      color: Color(0xFF6E40C9),
                    ),
                  ]),
              Widget2(time: "1:00 - 2:50", wid: classes['dsl']),
              Widget2(time: "4:00 - 4:50", wid: classes['mpc'])
            ],
          );
        }
        break;
      case "Friday":
        {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Widget2(time: "8:00 - 8:50", wid: classes['om']),
              Widget2(time: "9:00 - 9:50", wid: classes['cs']),
              Widget2(time: "10:00 - 10:50", wid: classes['es']),
              Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(right: 15, top: 30, bottom: 30),
                      height: 1.3,
                      width: size.width * 0.2,
                      color: Color(0xFF6E40C9),
                    ),
                    Text(
                      "Evening Classes",
                      style: TextStyle(
                          // color: Colors.black,
                          fontWeight: FontWeight.w500,
                          fontSize: 17),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 15, top: 30, bottom: 30),
                      height: 1.3,
                      width: size.width * 0.2,
                      color: Color(0xFF6E40C9),
                    ),
                  ]),
              Widget2(time: "1:00 - 2:50", wid: classes['csl']),
              Widget2(time: "4:00 - 4:50", wid: classes['mpc'])
            ],
          );
        }
        break;
      case "Saturday":
        {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Widget2(time: "3:00 - 3:50", wid: classes['sde']),
            ],
          );
        }
        break;

      default:
        {
          return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [Text("No classes today :)")]);
        }
        break;
    }
  }
}

class Widget2 extends StatelessWidget {
  Widget2({@required this.time, @required this.wid});
  final String time;
  final Widget wid;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10),
      child: Row(
        // mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: MediaQuery.of(context).size.width * 0.35,
            child: Center(
              child: Text(
                time,
                style: TextStyle(fontSize: 17),
              ),
            ),
          ),
          wid,
        ],
      ),
    );
  }
}

class classButton extends StatelessWidget {
  classButton(
      {@required this.link, @required this.title, @required this.width});
  final String link;
  final Widget title;
  final double width;
  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
        onPressed: () => launch(link),
        style: OutlinedButton.styleFrom(
            // primary: Colors.blue.shade500,
            // onSurface: Colors.orangeAccent,
            side: BorderSide(color: Colors.black26, width: 1.5),
            // minimumSize: Size(50, 50),
            fixedSize: Size(MediaQuery.of(context).size.width * width, 50),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
            textStyle: TextStyle(fontSize: 17)),
        child: title);
  }
}
