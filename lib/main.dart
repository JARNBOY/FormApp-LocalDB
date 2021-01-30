import 'package:basic_command_app/models/TransactionInfos.dart';
import 'package:basic_command_app/provider/transaction_provider.dart';
import 'package:basic_command_app/screen/form_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';

void main() {
  runApp(Basic_Command_App());
}

class Basic_Command_App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) {
          return TransactionProvider();
        })
      ],
      child: MaterialApp(
        title: 'Basic_Command_App',
        home: Scaffold(
          appBar: AppBar(
            title: Text("Basic Learn App"),
            backgroundColor: Colors.orange[400],
            actions: [
              IconButton(
                icon: Icon(Icons.list),
                onPressed: () {
                  print("Show List");
                },
              )
            ],
          ),
          body: HomeBodyContainer(),
        ),
      ),
    );
  }
}

class HomeBodyContainer extends StatefulWidget {
  @override
  _HomeBodyContainerState createState() => _HomeBodyContainerState();
}

class _HomeBodyContainerState extends State<HomeBodyContainer> {
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
        builder: (context, TransactionProvider provider, Widget child) {
          var count = provider.transaction.length;
          if (count > 0) {
            return ListView.builder(
              itemCount: count,
              itemBuilder: (context, int index) {
                TransactionInFos transaction = provider.transaction[index];

                return Card(
                  margin:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
                  elevation: 10,
                  child: ListTile(
                    trailing: Text(transaction.phone.toString()),
                    leading: CircleAvatar(
                      radius: 22,
                      child: FittedBox(
                        child: Text(transaction.score.toString()),
                      ),
                    ),
                    title: Text(transaction.name + " " + transaction.surname),
                    subtitle:
                        Text(DateFormat("dd-mm-yyyy").format(DateTime.now())),
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
