import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/models/transaction.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final Function deleteTransaction;

  TransactionList(this.transactions, this.deleteTransaction);
  @override
  Widget build(BuildContext context) {
    return transactions.isEmpty
        ? LayoutBuilder(builder: ((ctx, constraints) {
            return Column(
              children: [
                Text(
                  'No transactions added yet!',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                SizedBox(
                  height: 20.0,
                ),
                Container(
                  height: constraints.maxHeight * 0.6,
                  child: Image.asset(
                    'assets/images/waiting.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            );
          }))
        : ListView.builder(
            itemBuilder: (context, index) {
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
                          '\$${transactions[index].amount}',
                        ),

                      ),
                    ),
                  ),
                  title: Text(
                    transactions[index].title,
                    style: Theme.of(context).appBarTheme.titleTextStyle,
                  ),
                  subtitle: Text(
                    DateFormat.yMMMd().format(transactions[index].date),
                  ),
                  trailing: MediaQuery.of(context).size.width > 460
                      ? TextButton.icon(
                          icon: Icon(
                            Icons.delete,
                            color: Theme.of(context).colorScheme.error,
                          ),
                          onPressed: (() =>
                              deleteTransaction(transactions[index].id)),
                          label: Text('Delete',
                              style: TextStyle(
                                color: Theme.of(context).colorScheme.error,
                              )),
                        )
                      : IconButton(
                          color: Theme.of(context).colorScheme.error,
                          icon: Icon(Icons.delete),
                          onPressed: (() =>
                              deleteTransaction(transactions[index].id)),
                  ),
                ),
              );
            },
            itemCount: transactions.length,
          );
  }
}
