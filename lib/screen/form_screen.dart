import 'package:basic_command_app/models/TransactionInfos.dart';
import 'package:basic_command_app/provider/transaction_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FormScreen extends StatelessWidget {
  final formkey = GlobalKey<FormState>();

  //controller
  final nameController = TextEditingController(); //รับค่า ชื่อ
  final surnameController = TextEditingController(); //รับค่า นามสกุล
  final phoneController = TextEditingController(); //รับค่า เบอร์
  final scoreController = TextEditingController(); //รับค่า คะแนน
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          "เพิ่มรายชื่อสมาชิก",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.orange[400],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: formkey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextFormField(
                controller: nameController,
                autofocus: true,
                decoration: InputDecoration(labelText: "ชื่อ"),
                validator: (String text) {
                  if (text.isEmpty) {
                    return "กรุณากรอกชื่อ";
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: surnameController,
                decoration: InputDecoration(labelText: "นามสกุล"),
                validator: (String text) {
                  if (text.isEmpty) {
                    return "กรุณากรอกนามสกุล";
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: phoneController,
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(labelText: "เบอร์ติดต่อ"),
                validator: (String text) {
                  if (text.isEmpty) {
                    return "กรุณากรอกเบอร์โทรศัพย์";
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: scoreController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(labelText: "จำนวนคะแนน"),
                validator: (String text) {
                  if (text.isEmpty) {
                    return "กรุณากรอกจำนวนคะแนน";
                  }

                  if (int.parse(text) <= 0) {
                    return "กรุณากรอกคะแนน > 0 คะแนน";
                  }
                  return null;
                },
              ),
              FlatButton(
                textColor: Colors.white,
                child: Text("เพิ่มข้อมูล"),
                color: Colors.teal,
                onPressed: () {
                  if (formkey.currentState.validate()) {
                    var name = nameController.text;
                    var surname = surnameController.text;
                    var phone = phoneController.text;
                    var score = scoreController.text;

                    //print(name + " " + surname);

                    //เตรียมข้อมูล
                    TransactionInFos memberInfo = TransactionInFos(
                        name: name,
                        surname: surname,
                        phone: int.parse(phone),
                        score: int.parse(score),
                        date: DateTime.now());

                    //เรียก provider
                    var provider = Provider.of<TransactionProvider>(context,
                        listen: false);
                    provider.addTransaction(memberInfo);
                    Navigator.pop(context);
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
