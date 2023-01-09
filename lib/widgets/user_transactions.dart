import 'package:flutter/material.dart';
import '../models/transaction.dart';
import './transaction_list.dart';

import './new_transaction.dart';

class USerTransactions extends StatefulWidget {
  @override
  State<USerTransactions> createState() => _USerTransactionsState();
}

class _USerTransactionsState extends State<USerTransactions> {
  final List<Transaction> _userTransactions = [
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
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        NewTransaction(),
        TransactionList(),
      ],
    );
  }
}
