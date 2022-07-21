import 'package:flutter/material.dart';
import 'package:tiloufa_1/main.dart';

import 'gazbuy.dart';

class MyBtm extends StatelessWidget {
  var textplus = TextEditingController();

  var textmoin = TextEditingController();

  var textpay = TextEditingController();
  @override
  Widget build(BuildContext context) {
    textmoin.text = '0';
    textpay.text = '0';
    textplus.text = '0';
    TextDirection.rtl;
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Container(
            padding: const EdgeInsets.all(10),
           
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Text(
                    "إضافة عملية شراء",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  TextField(
                    keyboardType: TextInputType.number,
                    textDirection: TextDirection.rtl,
                    autofocus: true,
                    // initialValue: '0',
                    controller: textplus,
      
                    decoration: const InputDecoration(
                        label: Text(
                          'تم شراء',
                          style: TextStyle(fontSize: 20),
                        ),
                        hintTextDirection: TextDirection.rtl,
                        border: OutlineInputBorder(),
                        hintText: "تم شراء",
                        icon: Icon(
                          Icons.arrow_downward,
                          color: Colors.red,
                        )),
                  ),
                  const SizedBox(height: 8),
                  TextField(
                    textDirection: TextDirection.rtl,
                    keyboardType: TextInputType.number,
                    //initialValue: '0',
                    controller: textmoin,
                    decoration: const InputDecoration(
                        label: Text("تم إرجاع"),
                        border: OutlineInputBorder(),
                        hintTextDirection: TextDirection.rtl,
                        hintText: "تم إرجاع",
                        icon: Icon(
                          Icons.arrow_upward,
                          color: Colors.blue,
                        )),
                  ),
                  const SizedBox(height: 8),
                  TextField(
                    textDirection: TextDirection.rtl,
                    keyboardType: TextInputType.number,
                    //       initialValue: '0',
                    controller: textpay,
                    decoration: const InputDecoration(
                        label: Text("تم دفع"),
                        border: OutlineInputBorder(),
                        hintTextDirection: TextDirection.rtl,
                        hintText: "تم دفع",
                        icon: Icon(
                          Icons.money_sharp,
                          color: Colors.green,
                        )),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      buildCancelButton(context),
                      buildAddButton(context),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget buildCancelButton(BuildContext context) => TextButton(
        child: const Text(
          'إلغاء',
          style: TextStyle(color: Colors.red),
        ),
        onPressed: () => Navigator.of(context).pop(),
      );

  Widget buildAddButton(BuildContext ctx) {
    return Expanded(
      child: MaterialButton(
          height: 60,
          minWidth: 100,
          color: Colors.blue[900],
          child: const Text(
            "حفظ",
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
          ),
          onPressed: () async {
            var c = Gazbuy(
                date: DateTime.now(),
                payed: int.parse(textpay.text),
                recived: int.parse(textplus.text),
                ruterned: int.parse(textmoin.text));
            addGazBuy(c);

            Navigator.of(ctx).pop();
          }),
    );
  }
}
