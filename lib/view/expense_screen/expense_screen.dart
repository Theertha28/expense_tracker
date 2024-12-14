import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ExpenseScreen extends StatefulWidget {
  const ExpenseScreen({super.key});

  @override
  State<ExpenseScreen> createState() => _ExpenseScreenState();
}

class _ExpenseScreenState extends State<ExpenseScreen> {
  final TextEditingController amountController = TextEditingController();
  final TextEditingController categoryController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  List expenses = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        title: Text(
          "Expense Tracker",
          style: GoogleFonts.cormorantGaramond(
              color: Colors.teal, fontSize: 26, fontWeight: FontWeight.w900),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                  child: Text(
                "This month spend",
                style: GoogleFonts.cormorantGaramond(
                    fontWeight: FontWeight.w600, fontSize: 18),
              )),
              SizedBox(height: 10),
              Text(
                "\$234",
                style: TextStyle(fontWeight: FontWeight.w900, fontSize: 30),
              ),
              SizedBox(height: 20),

              // Amount TextField
              TextFormField(
                controller: amountController,
                decoration: InputDecoration(
                  labelText: "Amount",
                  hintText: "Enter the amount",
                  border: OutlineInputBorder(),
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                ),
                keyboardType: TextInputType.number,
              ),
              SizedBox(height: 20),

              // Category TextField
              TextFormField(
                controller: categoryController,
                decoration: InputDecoration(
                  labelText: "Category",
                  hintText: "Enter the category",
                  border: OutlineInputBorder(),
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                ),
              ),
              SizedBox(height: 20),

              // Description TextField
              TextFormField(
                controller: descriptionController,
                decoration: InputDecoration(
                  labelText: "Description",
                  hintText: "Enter the description",
                  border: OutlineInputBorder(),
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                ),
              ),
              SizedBox(height: 30),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        // Collect the data from the text controllers
                        final amount = amountController.text;
                        final category = categoryController.text;
                        final description = descriptionController.text;

                        if (amount.isNotEmpty &&
                            category.isNotEmpty &&
                            description.isNotEmpty) {
                          setState(() {
                            expenses.add({
                              'category': category,
                              'description': description,
                              'amount': '\$$amount',
                            });
                          });

                          amountController.clear();
                          categoryController.clear();
                          descriptionController.clear();
                        }
                      },
                      child: Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 30, vertical: 12),
                        decoration: BoxDecoration(
                          color: Colors.teal,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Center(
                          child: Text(
                            "Save",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 15),
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        amountController.clear();
                        categoryController.clear();
                        descriptionController.clear();
                      },
                      child: Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 30, vertical: 12),
                        decoration: BoxDecoration(
                          color: Colors.black.withOpacity(0.8),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Center(
                          child: Text(
                            "Cancel",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 30),

              Text(
                "Expense List",
                style: GoogleFonts.cormorantGaramond(
                    fontWeight: FontWeight.w900,
                    fontSize: 25,
                    color: Colors.teal),
              ),

              SizedBox(
                height: 250,
                child: ListView.separated(
                  itemCount: expenses.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      leading: IconButton(
                          onPressed: () {
                            setState(() {
                              expenses.removeAt(index);
                            });
                          },
                          icon: Icon(Icons.delete)),
                      title: Text(expenses[index]['category'] ?? 'Unknown'),
                      subtitle: Text(
                          expenses[index]['description'] ?? 'No Description'),
                      trailing: Text(
                        expenses[index]['amount'] ?? '\$0',
                        style: TextStyle(
                            fontWeight: FontWeight.w900, fontSize: 20),
                      ),
                    );
                  },
                  separatorBuilder: (context, index) => Divider(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
