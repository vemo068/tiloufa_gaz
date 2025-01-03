import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:tiloufa_1/bottomsheet.dart';
import 'package:tiloufa_1/cache.dart';
import 'package:tiloufa_1/gazbuy.dart';
import 'package:tiloufa_1/inis.dart';
import 'package:tiloufa_1/table.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(GazbuyAdapter());

  await Hive.openBox<Gazbuy>('gazbuy');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: "غاز تيلوفة",
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void dispose() {
    Hive.close();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    TextDirection.rtl;

    return SafeArea(
      child: Scaffold(
        floatingActionButton: FloatingActionButton.extended(
            backgroundColor: const Color(0xff08D9D6),
            foregroundColor: const Color(0xff04293A),
            label: const Text(
              "إضافة",
              style: TextStyle(fontSize: 30),
            ),
            icon: const Icon(Icons.plus_one_rounded),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (ctx) {
                return MyBtm();
              }));
            }),
        body: Column(
          children: [
            Expanded(
                child: Container(
                    padding: const EdgeInsets.only(top: 20),
                    color: const Color(0xff04293A),
                    child: ValueListenableBuilder<Box<Gazbuy>>(
                        valueListenable: Cache.getGazBuys().listenable(),
                        builder: (context, box, _) {
                          final gaz = box.values.toList().cast<Gazbuy>();
                          int totalPayed = 0;
                          int totalRecived = 0;
                          int totalReturned = 0;
                          for (var item in gaz) {
                            totalRecived = totalRecived + item.recived;
                            totalPayed = totalPayed + item.payed;
                            totalReturned = totalReturned + item.ruterned;
                          }
                          int dif = totalRecived - totalReturned;
                          int money = (totalRecived * kunitPrice) - totalPayed;
                          return Row(
                            children: [
                              Expanded(
                                child: Container(
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                    width: 2,
                                    color: Colors.white,
                                  )),
                                  child: Column(
                                    children: [
                                      const Text(
                                        ":عدد غير مدفوعة",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            fontSize: 18,
                                            color: Color(0xffEAEAEA),
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        "${(money + knowMoney) / kunitPrice} ",
                                        style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 18,
                                            color: Color(0xffEAEAEA)),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              Expanded(
                                  child: Container(
                                decoration: BoxDecoration(
                                    border: Border.all(
                                  width: 2,
                                  color: Colors.white,
                                )),
                                child: Column(
                                  children: [
                                    const Text(
                                      ":يجب دفع",
                                      style: TextStyle(
                                          fontSize: 20,
                                          color: Color(0xffEAEAEA),
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      "${(money + knowMoney)} دج",
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18,
                                          color: Color(0xffEAEAEA)),
                                    )
                                  ],
                                ),
                              )),
                              Expanded(
                                  child: Container(
                                decoration: BoxDecoration(
                                    border: Border.all(
                                  width: 2,
                                  color: Colors.white,
                                )),
                                child: Column(
                                  children: [
                                    const Text(
                                      ":يجب إرجاع",
                                      style: TextStyle(
                                          fontSize: 20,
                                          color: Color(0xffEAEAEA),
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      "قارورة ${dif + knowdif} ",
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18,
                                          color: Color(0xffEAEAEA)),
                                    )
                                  ],
                                ),
                              )),
                            ],
                          );
                        }))),
            const Expanded(
              flex: 3,
              child: MyTable(),
            ),
            Expanded(
                child: Container(
              color: const Color(0xff04293A),
            )),
          ],
        ),
      ),
    );
  }
}

Future addGazBuy(Gazbuy gaz) async {
  final box = Cache.getGazBuys();
  box.add(gaz);
}

void deleteGazBuy(Gazbuy gaz) {
  gaz.delete();
}
