import 'package:flutter/material.dart';

class IncomeCategoryList extends StatelessWidget {
  const IncomeCategoryList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
    itemBuilder: (BuildContext context, int index) {
      return Card(
        child: ListTile(
          title: Text("Income Category $index"),
          trailing: IconButton(
            onPressed: (){
              print("Delete button cliked $index");
            }, 
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