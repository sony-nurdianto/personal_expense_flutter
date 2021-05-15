import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:personal_expense_flutter/models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transactions> userTransaction;
  final Function deleteTransaction;

  TransactionList(
      {@required this.userTransaction, @required this.deleteTransaction});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      child: userTransaction.isEmpty
          ? Column(
              children: [
                Text('No Transaction added yet'),
                SizedBox(
                  height: 10,
                ),
                Container(
                  height: 200,
                  child: Image.network(
                      'https://res.cloudinary.com/galonku/image/upload/v1621096023/waiting_kwg210.png',
                      fit: BoxFit.cover),
                ),
              ],
            )
          : ListView.builder(
              itemBuilder: (context, index) {
                return Card(
                  elevation: 5,
                  margin: EdgeInsets.symmetric(vertical: 8, horizontal: 5),
                  child: ListTile(
                    leading: CircleAvatar(
                      radius: 30,
                      child: Container(
                        padding: EdgeInsets.all(6),
                        child: FittedBox(
                          child: Text('\$ ${userTransaction[index].amount}'),
                        ),
                      ),
                    ),
                    title: Text(
                      '${userTransaction[index].title}',
                    ),
                    subtitle: Text(
                      DateFormat.yMMMd().format(userTransaction[index].date),
                    ),
                    trailing: IconButton(
                      icon: Icon(
                        Icons.delete,
                        color: Colors.red,
                      ),
                      onPressed: () {
                        deleteTransaction(userTransaction[index].id);
                      },
                    ),
                  ),
                );
              },
              itemCount: userTransaction.length,
            ),
    );
  }
}
