import 'package:flutter/material.dart';

class ExpenseCategoryList extends StatelessWidget {
  const ExpenseCategoryList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
    itemBuilder: (BuildContext context, int index) {
      return Card(
        child: ListTile(
          title: Text("Expense Category $index"),
          trailing: IconButton(
            onPressed: (){}, 
          icon: Icon(Icons.delete)),
        ),
      );
      }, 
    itemCount: 100, 
    separatorBuilder: (BuildContext context, int index) { 
      return SizedBox(
        height: 10,
      );
     },
      
    );
  }
}