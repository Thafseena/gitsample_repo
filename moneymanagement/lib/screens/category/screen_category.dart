import 'package:flutter/material.dart';
import 'package:moneymanagement/screens/category/expense_category_list.dart';
import 'package:moneymanagement/screens/category/income_category_list.dart';

class ScreenCategory extends StatefulWidget {
  const ScreenCategory({super.key});

  @override
  State<ScreenCategory> createState() => _ScreenCategoryState();
}

class _ScreenCategoryState extends State<ScreenCategory> with SingleTickerProviderStateMixin {
  late TabController _tabController;

@override
  void initState() {
    _tabController=TabController(length: 2, vsync: this);
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(children:[
      TabBar(
        unselectedLabelColor: Colors.grey,
        controller: _tabController,
        tabs: [
        Tab(text: 'INCOME',),
        Tab(text: 'EXPENSE',),
      ]),
      Expanded(
        child: TabBarView(
          controller: _tabController,
          children: [
            IncomeCategoryList(),
            ExpenseCategoryList()
          // Text("Income List Here..."),
          // Text("Expense List Here..."),
        ]),
      )
    ]);
  }
}