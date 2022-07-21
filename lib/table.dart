// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:tiloufa_1/cache.dart';
import 'package:tiloufa_1/gazbuy.dart';
import 'package:tiloufa_1/main.dart';

class MyTable extends StatelessWidget {
  const MyTable({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<Box<Gazbuy>>(
      valueListenable: Cache.getGazBuys().listenable(),
      builder: (context, box, _) {
        final gaz = box.values.toList().cast<Gazbuy>();

        return DataTable2(
          horizontalMargin: 10,
          dataRowHeight: 40,
          dividerThickness: 1,
          columnSpacing: 5,
          decoration: BoxDecoration(
            color: Color(0xffEAEAEA),
          ),
          columns: [
            DataColumn(
                label: Center(
              child: Text(
                "التاريخ",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
            )),
            DataColumn(
                label: Center(
                    child: Text(
              "تم شراء",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ))),
            DataColumn(
                label: Center(
                    child: Text(
              "تم إرجاع",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ))),
            DataColumn(
                label: Center(
                    child: Text(
              "الفرق",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ))),
            DataColumn(
                label: Center(
                    child: Text(
              "تم دفع",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ))),
          ],
          rows: getRows(gaz, context),
        );
      },
    );
  }
}

List<DataRow> getRows(List<Gazbuy> gaz, BuildContext ct) =>
    gaz.map((Gazbuy gazt) {
      final cells = [
        "${gazt.date.day}/${gazt.date.month}",
        gazt.recived,
        gazt.ruterned,
        (gazt.recived - gazt.ruterned),
        "${gazt.payed} دج"
      ];

      return DataRow(cells: getCells(cells, gazt, ct));
    }).toList();

List<DataCell> getCells(List<dynamic> cells, Gazbuy gazt, BuildContext ct) =>
    cells
        .map((data) => DataCell(Center(
                child: InkWell(
              onDoubleTap: () {
                showDialog(
                    context: ct,
                    builder: (cts) {
                      return AlertDialog(
                        title: Text(
                            "هل انت متأكد من حذف العملية التي بتاريخ ${gazt.date.day}/${gazt.date.month}"),
                        actions: [
                          TextButton(
                              onPressed: () {
                                Navigator.of(cts).pop();
                              },
                              child: Text(
                                "إلغاء",
                                style: TextStyle(color: Colors.grey),
                              )),
                          TextButton(
                            onPressed: () {
                              deleteGazBuy(gazt);
                              Navigator.of(cts).pop();
                            },
                            child: Text(
                              "حذف",
                              style: TextStyle(color: Colors.red),
                            ),
                          )
                        ],
                      );
                    });
              },
              child: Text(
                '$data',
                style: TextStyle(
                  fontSize: 17,
                ),
              ),
            ))))
        .toList();
