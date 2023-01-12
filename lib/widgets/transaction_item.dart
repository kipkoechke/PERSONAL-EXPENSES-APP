import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/transaction.dart';

class TransactionItem extends StatelessWidget {
  const TransactionItem({
    Key? key,
    required this.transaction,
    required this.deleteTransaction,
  }) : super(key: key);

  final Transaction transaction;
  final Function deleteTransaction;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5.0,
      margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 5.0),
      child: ListTile(
        leading: CircleAvatar(
          radius: 30.0,
          child: Padding(
            padding: EdgeInsets.all(6.0),
            child: FittedBox(
              child: Text(
                '\$${transaction.amount}',
              ),
            ),
          ),
        ),
        title: Text(
          transaction.title,
          style: Theme.of(context).appBarTheme.titleTextStyle,
        ),
        subtitle: Text(
          DateFormat.yMMMd().format(transaction.date),
        ),
        trailing: MediaQuery.of(context).size.width > 460
            ? TextButton.icon(
                icon: Icon(
                  Icons.delete,
                  color: Theme.of(context).colorScheme.error,
                ),
                onPressed: (() => deleteTransaction(transaction.id)),
                label: Text('Delete',
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.error,
                    )),
              )
            : IconButton(
                color: Theme.of(context).colorScheme.error,
                icon: Icon(Icons.delete),
                onPressed: (() => deleteTransaction(transaction.id)),
              ),
      ),
    );
  }
}
