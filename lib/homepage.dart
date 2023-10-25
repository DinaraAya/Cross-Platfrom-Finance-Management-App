//import 'dart:html';

// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:abc/transaction_data.dart';
import 'package:abc/transaction_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:toggle_switch/toggle_switch.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TransactionAmountController = TextEditingController();
  final TransactionNameController = TextEditingController();

  List<bool> isSelected = [true, false];

  void addExpense() {
    String dropDownValue = 'Food';
    int? incomeExpense = 0;
    double width = MediaQuery.of(context).size.width;
    showDialog(
        context: context,
        builder: (context) => StatefulBuilder(builder: (context, setState) {
              return AlertDialog(
                backgroundColor: Color.fromARGB(255, 28, 26, 50),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0)),
                title: Center(
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(colors: [
                        Color.fromARGB(255, 230, 18, 133),
                        Color.fromARGB(255, 10, 96, 169),
                      ]),
                      borderRadius: BorderRadius.circular(10),
                      /*border: Border.all(
                          color: Color.fromARGB(255, 33, 88, 165),
                        ),*/
                    ),
                    height: 30,
                    child: ToggleSwitch(
                        minWidth: 100,
                        initialLabelIndex: incomeExpense,
                        activeBgColor: [Color.fromARGB(255, 201, 195, 231)],
                        activeFgColor: Color.fromARGB(255, 5, 52, 93),
                        inactiveFgColor: Color.fromARGB(255, 250, 233, 254),
                        totalSwitches: 2,
                        labels: ['Income', 'Expense'],
                        onToggle: (index) {
                          setState(() {
                            incomeExpense = index;
                          });
                        }),
                  ),
                ),
                content: Container(
                  height: 100,
                  width: width * 1,
                  child: Column(
                    children: [
                      Row(
                        children: [],
                      ),
                      incomeExpense == 1
                          ? Container(
                              width: 350,
                              height: 35,
                              decoration: BoxDecoration(
                                color: Color.fromARGB(255, 201, 195, 231),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.only(left: 10),
                                child: DropdownButton(
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Color.fromARGB(255, 5, 52, 93)),
                                  items: const [
                                    DropdownMenuItem<String>(
                                        value: 'Food', child: Text('Food')),
                                    DropdownMenuItem<String>(
                                        value: 'Transport',
                                        child: Text('Transport')),
                                    DropdownMenuItem<String>(
                                        value: 'Utilities',
                                        child: Text('Utilities'))
                                  ],
                                  value: dropDownValue,
                                  onChanged: (String? value) {
                                    setState(() {
                                      dropDownValue = value!;
                                    });
                                  },
                                  isExpanded: true,
                                ),
                              ),
                            )
                          : TextField(
                              style: TextStyle(
                                  color: Color.fromARGB(255, 250, 233, 254)),
                              controller: TransactionNameController,
                              decoration: InputDecoration(
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color.fromARGB(255, 201, 195, 231),
                                  ),
                                ),
                                hintText: "Name",
                                hintStyle: TextStyle(
                                    color: Color.fromARGB(255, 98, 94, 118),
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                      TextField(
                        style: TextStyle(
                            color: Color.fromARGB(255, 250, 233, 254)),
                        controller: TransactionAmountController,
                        decoration: InputDecoration(
                            enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: Color.fromARGB(255, 201, 195, 231))),
                            hintText: "Amount",
                            hintStyle: TextStyle(
                                color: Color.fromARGB(255, 98, 94, 118),
                                fontWeight: FontWeight.bold)),
                      ),
                    ],
                  ),
                ),
                actions: [
                  MaterialButton(
                    onPressed: cancel,
                    child: Container(
                      width: 83,
                      height: 24,
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 201, 195, 231),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Center(
                        child: Text(
                          'Cancel',
                          style: TextStyle(
                              color: Color.fromARGB(255, 5, 52, 93),
                              fontWeight: FontWeight.bold,
                              fontSize: 13),
                        ),
                      ),
                    ),
                  ),
                  MaterialButton(
                      onPressed: () {
                        if (incomeExpense == 0) {
                          saveIncome(incomeExpense);
                        } else if (incomeExpense == 1) {
                          saveExpense(incomeExpense, dropDownValue);
                        }
                      },
                      child: Container(
                        width: 83,
                        height: 24,
                        decoration: BoxDecoration(
                          color: Color.fromARGB(255, 201, 195, 231),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Center(
                          child: Text(
                            'Save',
                            style: TextStyle(
                                color: Color.fromARGB(255, 5, 52, 93),
                                fontWeight: FontWeight.bold,
                                fontSize: 13),
                          ),
                        ),
                      )),
                ],
              );
            }));
  }

  void cancel() {
    Navigator.pop(context);
  }

  void saveIncome(int? incomeExpense) {
    setState(() {});
    double AmountToController = double.parse(TransactionAmountController.text);
    String NameController = TransactionNameController.text;
    TransactionItem newTransaction = TransactionItem(
        category: NameController,
        amount: AmountToController,
        type: incomeExpense);
    TransactionAmountController.clear();
    TransactionNameController.clear();

    Provider.of<TransactionData>(context, listen: false)
        .addTransaction(newTransaction);

    Navigator.pop(context);
  }

  void saveExpense(int? incomeExpense, String cat) {
    setState(() {});
    double AmountToController = double.parse(TransactionAmountController.text);
    TransactionItem newTransaction = TransactionItem(
        category: cat, amount: AmountToController, type: incomeExpense);

    Provider.of<TransactionData>(context, listen: false)
        .addTransaction(newTransaction);

    Navigator.pop(context);
    TransactionAmountController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<TransactionData>(
        builder: (context, value, child) => Scaffold(
              backgroundColor: Color.fromARGB(255, 28, 26, 50),
              drawer: NavigationDrawer(
                backgroundColor: Color.fromARGB(255, 28, 26, 50),
                indicatorColor: Color.fromARGB(255, 28, 26, 50),
                children: [
                  NavigationDrawerDestination(
                    icon: Icon(Icons.person,
                        color: Color.fromARGB(255, 201, 195, 231)),
                    label: Text(
                      'Account',
                      style:
                          TextStyle(color: Color.fromARGB(255, 201, 195, 231)),
                    ),
                  ),
                  NavigationDrawerDestination(
                    icon: Icon(
                      Icons.settings,
                      color: Color.fromARGB(255, 201, 195, 231),
                    ),
                    label: Text(
                      'Settings',
                      style:
                          TextStyle(color: Color.fromARGB(255, 201, 195, 231)),
                    ),
                  ),
                  NavigationDrawerDestination(
                    icon: Icon(
                      Icons.feedback,
                      color: Color.fromARGB(255, 201, 195, 231),
                    ),
                    label: Text(
                      'Feedback',
                      style:
                          TextStyle(color: Color.fromARGB(255, 201, 195, 231)),
                    ),
                  ),
                  NavigationDrawerDestination(
                    icon: Icon(
                      Icons.logout,
                      color: Color.fromARGB(255, 201, 195, 231),
                    ),
                    label: Text(
                      'Logout',
                      style:
                          TextStyle(color: Color.fromARGB(255, 201, 195, 231)),
                    ),
                  ),
                ],
              ),
              appBar: AppBar(
                toolbarHeight: 50,
                backgroundColor: Color.fromARGB(255, 28, 26, 50),
                shadowColor: Color.fromARGB(255, 28, 26, 50),
                //leading: MaterialButton(
                //child: Icon(
                //Icons.menu,
                //color: Color.fromARGB(255, 201, 195, 231),
                //size: 30,
                //),
                //onPressed: settings,
                //),
              ),
              body: Center(
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 10, bottom: 40),
                      child: Container(
                        height: 189,
                        width: 350,
                        decoration: BoxDecoration(
                            color: Color.fromARGB(255, 100, 10, 200),
                            borderRadius: BorderRadius.circular(20.0),
                            gradient: LinearGradient(
                                begin: Alignment.topRight,
                                end: Alignment.bottomLeft,
                                colors: [
                                  Color.fromARGB(255, 234, 17, 132),
                                  Color.fromARGB(255, 0, 99, 171),
                                ]),
                            boxShadow: [
                              BoxShadow(
                                  color: Color.fromARGB(255, 201, 195, 231),
                                  blurRadius: 0,
                                  offset: Offset(10, 10)),
                            ]),
                        child: Column(
                          children: [
                            SizedBox(
                              width: 350,
                              height: 35,
                              child: Padding(
                                padding:
                                    const EdgeInsets.only(left: 10, top: 10),
                                child: Text(
                                  'Balance',
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 201, 195, 231),
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                            StatefulBuilder(builder:
                                (BuildContext context, StateSetter refreshBal) {
                              return SizedBox(
                                width: 350,
                                height: 32,
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 10),
                                  child: Text(
                                    '\$' +
                                        calculateBalance(
                                                value.getAllTransaction())
                                            .toString(),
                                    style: TextStyle(
                                        color:
                                            Color.fromARGB(255, 201, 195, 231),
                                        fontSize: 24,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              );
                            }),
                            SizedBox(height: 75, width: 350),
                            Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 10),
                                  child: Icon(
                                    Icons.arrow_circle_up,
                                    size: 40,
                                    color: Color.fromARGB(255, 201, 195, 231),
                                  ),
                                ),
                                Column(
                                  children: [
                                    SizedBox(
                                      height: 15,
                                      width: 125,
                                      child: Text('Income',
                                          style: TextStyle(
                                              color: Color.fromARGB(
                                                  255, 201, 195, 231),
                                              fontSize: 12,
                                              fontWeight: FontWeight.bold)),
                                    ),
                                    SizedBox(
                                      height: 20,
                                      width: 125,
                                      child: Text(
                                          '\$' +
                                              calculateIncome(
                                                      value.getAllTransaction())
                                                  .toString(),
                                          style:
                                              TextStyle(
                                                  color: Color.fromARGB(
                                                      255, 201, 195, 231),
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.bold)),
                                    ),
                                  ],
                                ),
                                Icon(
                                  Icons.arrow_circle_down,
                                  size: 40,
                                  color: Color.fromARGB(255, 201, 195, 231),
                                ),
                                Column(
                                  children: [
                                    SizedBox(
                                      height: 15,
                                      width: 125,
                                      child: Text('expenses',
                                          style: TextStyle(
                                              color: Color.fromARGB(
                                                  255, 201, 195, 231),
                                              fontSize: 12,
                                              fontWeight: FontWeight.bold)),
                                    ),
                                    SizedBox(
                                      height: 20,
                                      width: 125,
                                      child: Text(
                                          '\$' +
                                              calculateExpense(
                                                      value.getAllTransaction())
                                                  .toString(),
                                          style: TextStyle(
                                              color: Color.fromARGB(
                                                  255, 201, 195, 231),
                                              fontSize: 12,
                                              fontWeight: FontWeight.bold)),
                                    ),
                                  ],
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: SizedBox(
                        width: 380,
                        child: Expanded(
                          child: ListView.builder(
                            itemCount: value.getAllTransaction().length,
                            itemBuilder: (context, index) => Padding(
                              padding: const EdgeInsets.all(8),
                              child: Container(
                                height: 48,
                                decoration: BoxDecoration(
                                  color: Color.fromARGB(255, 201, 195, 231),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: ListTile(
                                  visualDensity: VisualDensity(vertical: -1),
                                  trailing: Text(
                                    getSign(value
                                            .getAllTransaction()[index]
                                            .type) +
                                        '\$' +
                                        value
                                            .getAllTransaction()[index]
                                            .amount
                                            .toString(),
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: getColour(value
                                          .getAllTransaction()[index]
                                          .type),
                                    ),
                                  ),
                                  leading:
                                      Icon(Icons.monetization_on, size: 30),
                                  title: Text(
                                    value.getAllTransaction()[index].category,
                                    style: TextStyle(
                                        color:
                                            Color.fromARGB(255, 110, 133, 124),
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10, bottom: 30),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          FloatingActionButton(
                            backgroundColor: Colors.transparent,
                            onPressed: showStatistics,
                            child: const Icon(
                              Icons.bar_chart,
                              size: 60,
                              color: Colors.transparent,
                            ),
                          ),
                          FloatingActionButton(
                            backgroundColor: Colors.transparent,
                            onPressed: addExpense,
                            child: const Icon(
                              Icons.add_circle_rounded,
                              size: 60,
                              color: Color.fromARGB(255, 201, 195, 231),
                            ),
                          ),
                          FloatingActionButton(
                            backgroundColor: Colors.transparent,
                            onPressed: history,
                            child: const Icon(
                              Icons.history,
                              size: 60,
                              color: Colors.transparent,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ));
  }
}

Color getColour(int? transactiontype) {
  if (transactiontype == 1) {
    return Colors.red;
  } else if (transactiontype == 0) {
    return Colors.green;
  }
  return Colors.grey;
}

String getSign(int? transactiontype) {
  if (transactiontype == 1) {
    return '-';
  } else if (transactiontype == 0) {
    return '+';
  }
  return '';
}

double calculateBalance(List<TransactionItem> itemslist) {
  double totalbalance = 0;
  for (var i = 0; i < itemslist.length; i++) {
    if (itemslist[i].type == 1) {
      totalbalance = totalbalance - itemslist[i].amount;
    } else if (itemslist[i].type == 0) {
      totalbalance = totalbalance + itemslist[i].amount;
    }
  }

  return totalbalance;
}

double calculateIncome(List<TransactionItem> itemslist) {
  double incomeBalance = 0;
  for (var i = 0; i < itemslist.length; i++) {
    if (itemslist[i].type == 0) {
      incomeBalance = incomeBalance + itemslist[i].amount;
    }
  }
  return incomeBalance;
}

double calculateExpense(List<TransactionItem> itemslist) {
  double expenseBalance = 0;
  for (var i = 0; i < itemslist.length; i++) {
    if (itemslist[i].type == 1) {
      expenseBalance = expenseBalance + itemslist[i].amount;
    }
  }
  return expenseBalance;
}

void showStatistics() {}

void history() {}

void settings() {}

// class NavigationDrawer extends StatelessWidget {
//   const NavigationDrawer({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) => Drawer(
//         backgroundColor: Color.fromARGB(255, 28, 26, 50),
//         child: SingleChildScrollView(
//             child: Column(
//           crossAxisAlignment: CrossAxisAlignment.stretch,
//           children: <Widget>[
//             buildHeader(context),
//             buildMenuItems(context),
//           ],
//         )),
//       );

//   Widget buildHeader(BuildContext context) => Container();
//   Widget buildMenuItems(BuildContext context) => Container();
// }
