import 'package:flutter/material.dart';
import 'model/meal.dart';
import 'model/sure.dart';
import 'suregoster.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            title: Text("Sureler"),
            backgroundColor: Colors.brown,
            actions: [
              Icon(Icons.search),
            ],
          ),
          body: BodyLayout(),
          bottomNavigationBar: BottomNavigationBar(
            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                  icon: Icon(Icons.description), label: "Sureler"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.radio), label: "Fıtrat FM"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.more), label: "Daha Fazla"),
            ],
          ),
        ),
      ),
    );
  }

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    throw UnimplementedError();
  }
}

class BodyLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return _myListViewDynamic(context);
  }
}

// replace this function with the code in the examples
Widget _myListView(BuildContext context) {
  return ListView(
    children: <Widget>[
      ListTile(
        title: Text('Sun'),
      ),
      ListTile(
        title: Text('Moon'),
      ),
      ListTile(
        title: Text('Star'),
      ),
    ],
  );
}

Widget _myListViewDynamic(BuildContext context) {


  List<Sure> sure;
  return ListView.builder(
    itemBuilder: (context, index) {
      return Card(
          child: Column(
            children: [
                ListTile(
                  title: Text((index + 1).toString() +
                      ". " +
                      sureler2[index]["sureAd"].toString()),
                  subtitle: Padding(
                    padding: const EdgeInsets.all(9.0),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              Text("İndiği Yer: " +
                                  sureler2[index]["sureIndigiYer"].toString()),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              Text("İniş Sırası: " +
                                  sureler2[index]["indirilmeSirasi"].toString()),
                              SizedBox(width: 30),
                              Text("Ayet Sayısı: " +
                                  sureler2[index]["ayetSayisi"].toString())
                            ],
                          ),
                        ),
                      ],
                    ),
            ),
            trailing: Icon(Icons.keyboard_arrow_right),
            onTap: () {
              Sure.fromObject(sureler2[index]);
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          SureSayfa(Sure.fromObject(sureler2[index]))));
            },
          ),
        ],
      ));
    },
    itemCount: sureler2.length,
  );
}
