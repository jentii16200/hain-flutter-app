import 'package:flutter/material.dart';
import 'package:hain/global/add-cart-global.dart';

class TableContent extends StatefulWidget {
  const TableContent({super.key});

  @override
  State<TableContent> createState() => _TableContentState();
}

class _TableContentState extends State<TableContent> {
  var dataRowContent = [];
  @override
  void initState() {
    addData();
    super.initState();
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
      rows: <DataRow>[...dataRowContent],
    );
  }

  addData() {
    cart.value.forEach((v) {
      dataRowContent.add(
        DataRow(
          cells: <DataCell>[
            DataCell(Text(v.name)),
            DataCell(Text(v.quantity.toString())),
            DataCell(Text(v.price.toString())),
          ],
        ),
      );
    });
  }
}
