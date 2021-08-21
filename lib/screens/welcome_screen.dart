import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:intl/intl.dart';

// flutter build web
// firebase deploy --only hosting

class WelcomeScreen extends StatefulWidget {
  static String id = 'welcome_screen';

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  String day = DateFormat('EEEE').format(DateTime.now());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Color(0xffdddddd),
      appBar: AppBar(
        // backgroundColor: Color(0xff125D98),
        title: Center(child: Text("Time Table for " + day)),
      ),
      body: Center(
        child: Widget1(day: day),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () => launch(
              "https://docs.google.com/document/d/1oSufQstQBZx3i5hJk1z_rWVv-2vY0yNz2kNNevmWoiU/edit"),
          child: Icon(Icons.navigate_next),
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
    List<Widget> classes = [
      classButton(
          link: 'https://meet.google.com/acf-bufq-gpu?authuser=1&pli=1',
          title: Text("Database Systems"),
          width: 0.6),
      classButton(
          link: 'https://meet.google.com/gqm-qqhv-gcm?authuser=1&pli=1',
          title: Text("D&A of Algorithms"),
          width: 0.6),
      classButton(
          link:
              'https://iitjodhpur.webex.com/iitjodhpur/j.php?MTID=mc8e757b66ca9a13b5ad5a0315cf37aff',
          title: size.width > 1100
              ? Text("Principles of Programming Languages")
              : Text("PPL"),
          width: 0.29),
      classButton(
          link: 'https://meet.google.com/oyk-xigy-itt?pli=1&authuser=1',
          title: Text("Operating system"),
          width: 0.6),
      classButton(
          link: 'https://meet.google.com/yje-pqbg-pxv?pli=1&authuser=1',
          title: Text("Computer Architecture"),
          width: 0.6),
      classButton(
          link: 'https://meet.google.com/fzf-drhk-tnw?pli=1&authuser=1',
          title: Text("Law and Society"),
          width: 0.6),
      classButton(
          link: 'https://meet.google.com/hvt-vqmt-wcb?pli=1&authuser=1',
          title:
              size.width > 600 ? Text("Professional Ethics") : Text("Ethics"),
          width: 0.29),
      classButton(
          link: 'https://meet.google.com/sam-zqcq-bvs?pli=1&authuser=1',
          title: Text("OS lab"),
          width: 0.6),
      classButton(
          link: 'https://meet.google.com/gqm-qqhv-gcm?authuser=1&pli=1',
          title: Text("D&A Algo tutorial"),
          width: 0.6),
      classButton(
          link: 'https://meet.google.com/acf-bufq-gpu?authuser=1&pli=1',
          title: Text("DBMS Lab"),
          width: 0.6),
      classButton(
          link: 'https://meet.google.com/gqm-qqhv-gcm?authuser=1&pli=1',
          title: Text("D&A Algo tutorial"),
          width: 0.6),
      classButton(
          link:
              'https://iitjodhpur.webex.com/iitjodhpur/j.php?MTID=md8f148dac8ee9070f4547d24f5e235f9',
          title: size.width > 1100
              ? Text("Principles of Programming Languages")
              : Text("PPL"),
          width: 0.29),
      classButton(
          link: 'https://meet.google.com/wbi-hxox-nbf?pli=1&authuser=1',
          title:
              size.width > 600 ? Text("Professional Ethics") : Text("Ethics"),
          width: 0.29),
    ];

    switch (day) {
      case "Monday":
        {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Widget2(time: "8:00 - 8:50", wid: classes[5]),
              Widget2(time: "9:00 - 9:50", wid: classes[0]),
              Widget2(
                  time: "10:00 - 10:50",
                  wid: Row(
                    children: [
                      classes[2],
                      SizedBox(
                        width: size.width * 0.02,
                      ),
                      classes[11]
                    ],
                  )),
              Widget2(time: "11:00 - 11:50", wid: classes[4]),
              Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(right: 15, top: 30, bottom: 30),
                      height: 1.3,
                      width: size.width * 0.2,
                      color: Colors.blue,
                    ),
                    Text(
                      "Evening Classes",
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                          fontSize: 17),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 15, top: 30, bottom: 30),
                      height: 1.3,
                      width: size.width * 0.2,
                      color: Colors.blue,
                    ),
                  ]),
              Widget2(time: "4:00 - 4:50", wid: classes[10]),
              Widget2(
                  time: "5:00 - 5:50",
                  wid: Row(
                    children: [
                      classes[6],
                      SizedBox(
                        width: size.width * 0.02,
                      ),
                      classes[12]
                    ],
                  )),
            ],
          );
        }
        break;
      case "Tuesday":
        {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Widget2(time: "9:00 - 9:50", wid: classes[0]),
              Widget2(time: "10:00 - 10:50", wid: classes[3]),
              Widget2(time: "11:00 - 11:50", wid: classes[1]),
              Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(right: 15, top: 30, bottom: 30),
                      height: 1.3,
                      width: size.width * 0.2,
                      color: Colors.blue,
                    ),
                    Text(
                      "Lab",
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                          fontSize: 17),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 15, top: 30, bottom: 30),
                      height: 1.3,
                      width: size.width * 0.2,
                      color: Colors.blue,
                    ),
                  ]),
              Widget2(time: "1:00 - 2:50", wid: classes[7])
            ],
          );
        }
        break;
      case "Wednesday":
        {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Widget2(time: "8:00 - 8:50 AM", wid: classes[5]),
              Widget2(time: "9:00 - 9:50 AM", wid: classes[4]),
              Widget2(
                  time: "10:00 - 10:50",
                  wid: Row(
                    children: [
                      classes[2],
                      SizedBox(
                        width: size.width * 0.02,
                      ),
                      classes[11]
                    ],
                  )),
              Widget2(time: "11:00 - 11:50 AM", wid: classes[1]),
              Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(right: 15, top: 30, bottom: 30),
                      height: 1.3,
                      width: size.width * 0.2,
                      color: Colors.blue,
                    ),
                    Text(
                      "Tutorial",
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                          fontSize: 17),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 15, top: 30, bottom: 30),
                      height: 1.3,
                      width: size.width * 0.2,
                      color: Colors.blue,
                    ),
                  ]),
              Widget2(time: "3:00 - 3:50 PM", wid: classes[8])
            ],
          );
        }
        break;
      case "Thursday":
        {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Widget2(time: "9:00 - 9:50", wid: classes[0]),
              Widget2(
                  time: "10:00 - 10:50",
                  wid: Row(
                    children: [
                      classes[2],
                      SizedBox(
                        width: size.width * 0.02,
                      ),
                      classes[11]
                    ],
                  )),
              Widget2(time: "11:00 - 11:50", wid: classes[3])
            ],
          );
        }
        break;
      case "Friday":
        {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Widget2(time: "8:00 - 8:50", wid: classes[5]),
              Widget2(time: "9:00 - 9:50", wid: classes[4]),
              Widget2(time: "10:00 - 10:50", wid: classes[3]),
              Widget2(time: "11:00 - 11:50", wid: classes[1]),
              Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(right: 15, top: 30, bottom: 30),
                      height: 1.3,
                      width: size.width * 0.2,
                      color: Colors.blue,
                    ),
                    Text(
                      "Lab",
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                          fontSize: 17),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 15, top: 30, bottom: 30),
                      height: 1.3,
                      width: size.width * 0.2,
                      color: Colors.blue,
                    ),
                  ]),
              Widget2(time: "1:00 - 2:50", wid: classes[9])
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
            primary: Colors.blue.shade500,
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
