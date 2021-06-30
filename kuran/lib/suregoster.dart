import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:kuran/model/meal.dart';
import 'package:kuran/model/sure.dart';

class SureSayfa extends StatelessWidget {
  Sure sureadi;
  SureSayfa(this.sureadi);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.brown,
          title: Text(sureadi.sureAd.toString()),
        ),
        body: ListView.builder(
            shrinkWrap: true,
            padding: const EdgeInsets.all(8),
            itemCount: mealler[0]["ayetSayisi"],
            scrollDirection: Axis.vertical,
            itemBuilder: (context, index) {
              return Card(
                child: ListTile(
                    trailing: menu(),
                    title: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          /*   Text(mealler[0]["meal"][index].toString()),*/
                          Text(
                              "(" +
                                  mealler[0]["sureAd"].toString() +
                                  " " +
                                  mealler[0]["ayetSayisi"].toString() +
                                  " / " +
                                  mealler[0]["meal2"][index]["ayet"]
                                      .toString() +
                                  ")",
                              style: TextStyle(
                                  color: Colors.black87,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold)),
                          SizedBox(
                            height: 20,
                          ),
                          Text(mealler[0]["meal2"][index]["ceviri"].toString()),
                          SizedBox(
                            height: 50,
                          ),
                          Text(mealler[0]["meal2"][index]["dipnot"].toString()),
                          SizedBox(
                            height: 50,
                          ),
                        ])),
              );
            }));
  }
}

List<Widget> dipNotButton(dipnotMsg) {
  List<Widget> temp = [];
  int i = 0;

  int dipNotCount = dipnotMsg.length;

  for (i; i < dipNotCount; i++) {
    if (i % 2 == 0) {
      temp.add(FlatButton(
        color: Colors.black12,
        onPressed: () {},
        child: Text(dipnotMsg[i]),
      ));
      temp.add(SizedBox(
        width: 10,
      ));
    }
  }

  return temp;
}

Widget menu() {
  return PopupMenuButton(
      icon: Icon(Icons.more_vert),
      itemBuilder: (context) => [
            PopupMenuItem(
              child: Row(
                children: [
                  Icon(Icons.share),
                  SizedBox(
                    width: 10,
                  ),
                  Text("Paylaş "),
                ],
              ),
              value: 1,
            ),
            PopupMenuItem(
              child: Row(
                children: [
                  Icon(Icons.favorite),
                  SizedBox(
                    width: 10,
                  ),
                  Text("Favoriye Ekle Ekle"),
                ],
              ),
              value: 2,
            ),
            PopupMenuItem(
              child: Row(
                children: [
                  Icon(Icons.note),
                  SizedBox(
                    width: 10,
                  ),
                  Text("Not Al"),
                ],
              ),
              value: 3,
            ),
            PopupMenuItem(
              child: Row(
                children: [
                  Icon(Icons.copy),
                  SizedBox(
                    width: 10,
                  ),
                  Text("Kopyala"),
                ],
              ),
              value: 4,
            ),
            PopupMenuItem(
              child: Row(
                children: [
                  Icon(Icons.bookmark),
                  SizedBox(
                    width: 10,
                  ),
                  Text("Kaldığım Yer Olarak İşaretle"),
                ],
              ),
              value: 5,
            ),
          ]);
}


Widget gridd() {
  return GridView.count(
    // Create a grid with 2 columns. If you change the scrollDirection to
    // horizontal, this produces 2 rows.
    crossAxisCount: 2,
    // Generate 100 widgets that display their index in the List.
    children: List.generate(2, (index) {
      return Center(
        child: Text(
          'Item $index',
        ),
      );
    }),
  );

}

/*/u*ğ
* ListView.builder(
              itemBuilder:(context,index){
                return ListTile(
                  title:Text(mealler[0]["meal"][0]["1"].toString()) ,
              );
        },

    )
* */
