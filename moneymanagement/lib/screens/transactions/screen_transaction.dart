import 'package:flutter/material.dart';

class ScreenTransaction extends StatelessWidget {
  const ScreenTransaction({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding:const EdgeInsets.all(10),
      itemBuilder: (ctx,index){
        return const Card(
          elevation: 0,
          child: ListTile(
            leading: CircleAvatar(
              radius: 60,
              child: Text('12\nDec',
              textAlign: TextAlign.center,)),
            title: Text('RS 10000'),
            subtitle: Text('Travel'),
          ),
        );

      }, 
      separatorBuilder: (ctx,index){
       return SizedBox(
        height: 10,
       );
      }, 
      itemCount: 10
      );
  }
}