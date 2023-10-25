import 'package:abc/transaction_item.dart';
import 'package:flutter/material.dart';

class TransactionData extends ChangeNotifier {
  List<TransactionItem> allTransactions = [];

  List<TransactionItem> getAllTransaction() {
    return allTransactions;
  }

  void addTransaction(TransactionItem newTransaction) {
    allTransactions.add(newTransaction);

    notifyListeners();
  }

  void deleteTransaction(TransactionItem transaction) {
    allTransactions.remove(transaction);

    notifyListeners();
  }
}
