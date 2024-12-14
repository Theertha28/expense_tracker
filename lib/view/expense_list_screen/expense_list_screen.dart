import 'package:expense_tracker/view/expense_screen/expense_screen.dart';
import 'package:flutter/material.dart';

class ExpenseListScreen extends StatelessWidget {
  const ExpenseListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        leading: IconButton(
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => ExpenseScreen()));
          },
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.separated(
              itemBuilder: (context, index) => ListTile(
                title: Text("Food"),
                subtitle: Text("description..."),
                trailing: Text("\$1050"),
              ),
              separatorBuilder: (context, index) => Divider(),
              itemCount: 5,
            ),
          ),
        ],
      ),
    );
  }
}
