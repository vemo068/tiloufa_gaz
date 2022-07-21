import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:tiloufa_1/main.dart';

int x = 0;
var clr = Colors.blue;

class ClientsPage extends StatefulWidget {
  const ClientsPage({Key? key}) : super(key: key);

  @override
  State<ClientsPage> createState() => _ClientsPageState();
}

class _ClientsPageState extends State<ClientsPage> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Center(
          child: Container(
        height: size.height / 3,
        width: size.width / 2,
        color: clr,
        child: Center(child: Text("$x")),
      )),
      appBar: AppBar(
        title: Text("My App"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            x++;

            if (x % 2 == 0) {
              clr = Colors.red;
            } else {
              clr = Colors.amber;
            }
          });
        },
        child: Icon(Icons.plus_one),
      ),
    );
  }
}

class Clients extends StatelessWidget {
  const Clients({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(items: [
        BottomNavigationBarItem(
            icon: Icon(Icons.drive_eta_rounded), label: "jhjh"),
        BottomNavigationBarItem(icon: Icon(Icons.share), label: "jjoh b"),
      ]),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
                child: SizedBox(
              child: Center(
                child: Text(
                  "الزبائن",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                    color: Colors.black,
                  ),
                ),
              ),
            )),
            Expanded(
              flex: 6,
              child: Container(
                child: GridView(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                  ),
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (BuildContext x) {
                          return BuysPage();
                        }));
                      },
                      child: Card(
                        color: Color.fromARGB(255, 238, 143, 136),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8)),
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [Icon(Icons.drive_eta), Text("data")]),
                      ),
                    )
                  ],
                ),
                padding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                color: Colors.indigo,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class BuysPage extends StatelessWidget {
  const BuysPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        Expanded(
          child: Container(
            child: Column(
              children: [
                Row(
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(6),
                          color: const Color(0xffEAEAEA),
                        ),
                        margin: EdgeInsets.all(10),
                        padding:
                            EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Icon(
                                Icons.arrow_back_ios_new,
                                size: 20,
                              ),
                              Text("رجوع"),
                            ]),
                      ),
                    )
                  ],
                )
              ],
            ),
            color: Color.fromARGB(255, 104, 135, 151),
          ),
        ),
        Expanded(
            flex: 3,
            child: DataTable2(
              columnSpacing: 20,
              columns: [
                DataColumn2(label: Center(child: Text("التاريخ"))),
                DataColumn2(label: Center(child: Text("السائق"))),
                DataColumn2(label: Center(child: Text("الصافي"))),
                DataColumn2(label: Center(child: Text("المبلغ"))),
                DataColumn2(label: Center(child: Text("سعر الدجاج"))),
              ],
              rows: [],
            ))
      ]),
    );
  }
}
