import 'package:basic_command_app/provider/transaction_provider.dart';
import 'package:basic_command_app/screen/form_screen.dart';
import 'package:basic_command_app/screen/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(Basic_Command_App());
}

class Basic_Command_App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) {
          return TransactionMemberProvider();
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
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        body: TabBarView(
          children: [HomeScreen(), FormScreen()],
        ),
      ),
    );
  }
}
