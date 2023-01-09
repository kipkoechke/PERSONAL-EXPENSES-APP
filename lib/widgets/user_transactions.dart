import 'package:flutter/material.dart';
import '../models/transaction.dart';
import './transaction_list.dart';

import './new_transaction.dart';

class UserTransactions extends StatefulWidget {
  @override
  State<UserTransactions> createState() => _UserTransactionsState();
}



class _UserTransactionsState extends State<UserTransactions> {
  final List<Transaction> _UserTransactions = [
    Transaction(
      id: 't1',
      title: 'New Shoe',
      amount: 99.00,
      date: DateTime.now(),
    ),
    Transaction(
      id: 't2',
      title: 'New Book',
      amount: 10.00,
      date: DateTime.now(),
    )
  ];

  void _addNewTransaction(String transationTitle, double transactionAmount) {
    final newTransaction = Transaction(
      title: transationTitle,
      amount: transactionAmount,
      date: DateTime.now(),
      id: DateTime.now().toString(),
    );

    setState(() {
      _UserTransactions.add(newTransaction);
    });
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        NewTransaction(_addNewTransaction),
        TransactionList(_UserTransactions),
      ],
    );
  }
}
