import 'package:basic_command_app/models/TransactionInfos.dart';
import 'package:basic_command_app/provider/transaction_provider.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import 'form_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  void initState() {
    // TODO: implement initState
    super.initState();

    Provider.of<TransactionMemberProvider>(context, listen: false).initData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        title: Text(
          "รายชื่อสมาชิก",
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            color: Colors.black,
            onPressed: () {
              print("Show Add");
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return FormScreen();
              }));
            },
          )
        ],
      ),
      body: Consumer(
        builder: (context, TransactionMemberProvider provider, Widget child) {
          var count = provider.memberTransaction.length;
          if (count > 0) {
            return ListView.builder(
              itemCount: count,
              itemBuilder: (context, int index) {
                TransactionInFos memberInfo = provider.memberTransaction[index];

                return Card(
                  margin:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
                  elevation: 10,
                  child: ListTile(
                    trailing: Text(memberInfo.phone.toString()),
                    leading: CircleAvatar(
                      radius: 22,
                      child: FittedBox(
                        child: Text(memberInfo.score.toString()),
                      ),
                    ),
                    title: Text(memberInfo.name + " " + memberInfo.surname),
                    subtitle:
                        Text(DateFormat("dd-mm-yyyy").format(memberInfo.date)),
                  ),
                );
              },
            );
          } else {
            return Center(
              child: Text(
                "ไม่พบข้อมูล",
                style: TextStyle(fontSize: 35),
              ),
            );
          }
        },
      ),
    );
  }
}
