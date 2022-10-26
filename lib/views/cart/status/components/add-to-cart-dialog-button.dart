import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hain/controllers/status-controller.dart';

class StatusTable extends StatefulWidget {
  const StatusTable({super.key});

  @override
  State<StatusTable> createState() => _StatusTableState();
}

class _StatusTableState extends State<StatusTable> {
  final statusLogsList = [];
  final orderStatusController = Get.put(StatusController());
  final tableData = [];
  @override
  void initState() {
    getStatusLog();

    super.initState();
  }

  getStatusLog() async {
    await orderStatusController.getOrderLogs().then((value) {
      addData(value);
    });
  }

  @override
  Widget build(BuildContext context) {
    return DataTable(
      columns: const <DataColumn>[
        DataColumn(
          label: Expanded(
            child: Text(
              'Name',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
        ),
        DataColumn(
          label: Expanded(
            child: Text(
              'Age',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
        ),
        DataColumn(
          label: Expanded(
            child: Text(
              'Role',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ],
      rows: <DataRow>[...tableData],
    );
  }

// TODO LESSON LEARNED MADER FUCKING DATA STRUCTURES
  addData(value) {
    var liss = [];
    liss.add(value);
    // print(liss[0][0]['order'][0]);
    for (var i = 0; i <= liss.length; i++) {
      print(liss[0][0]['order'][i]);
      setState(() {
        tableData.add(
          DataRow(
            cells: <DataCell>[
              DataCell(Text(liss[0][0]['order'][i]['name'])),
              DataCell(Text(liss[0][0]['order'][i]['quantity'].toString())),
              DataCell(Text(liss[0][0]['order'][i]['price'].toString())),
            ],
          ),
        );
      });
    }
    // for (var v in liss[0]) {
    //   print(v['order']['name']);

    // }
  }
}
