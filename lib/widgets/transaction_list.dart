import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final Function deleteTx;

  TransactionList(this.transactions, this.deleteTx);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 450,
      child: transactions.isEmpty
          ? Column(
              children: <Widget>[
                Text(
                  'No transactions added yet!',
                  style: Theme.of(context)
                      .textTheme
                      .headline6, // Use headline6 instead of title
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  height: 200,
                  child: Image.asset(
                    'assets/images/waiting.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            )
          : ListView.builder(
              itemBuilder: (ctx, index) {
                return Card(
                  elevation: 5,
                  margin: EdgeInsets.symmetric(
                    vertical: 8,
                    horizontal: 5,
                  ),
                  child: ListTile(
                    leading: CircleAvatar(
                      radius: 30,
                      child: Padding(
                        padding: EdgeInsets.all(6),
                        child: FittedBox(
                          child: Text('\$${transactions[index].amount}'),
                        ),
                      ),
                    ),
                    title: Text(
                      transactions[index].title,
                      style: Theme.of(context)
                          .textTheme
                          .headline6, // Use headline6 instead of title
                    ),
                    subtitle: Text(
                      DateFormat.yMMMd().format(transactions[index].date),
                    ),
                    trailing: IconButton(
                      icon: Icon(Icons.delete),
                      color: Theme.of(context).errorColor,
                      onPressed: () => deleteTx(transactions[index].id),
                    ),
                  ),
                );
              },
              itemCount: transactions.length,
            ),
    );
  }
}

// import 'package:flutter/material.dart';
// import '../Models/transaction.dart';
// import 'package:intl/intl.dart';

// class TransactionList extends StatelessWidget {
//   final List<Transaction> transactions;

//   TransactionList(this.transactions);

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: 390,
//       child: transactions.isEmpty
//           ? Column(
//               children: <Widget>[
//                 const Text('No Transaction Added Yet'),
//                 const SizedBox(
//                   height: 10,
//                 ),
//                 Container(
//                   height: 200,
//                   child: Image.asset(
//                     'assets/images/waiting.png',
//                     fit: BoxFit.cover,
//                   ),
//                 )
//               ],
//             )
//           : ListView.builder(
//               itemBuilder: (ctx, index) {
//                 return Card(
//                   elevation: 5,
//                   margin:
//                       const EdgeInsets.symmetric(vertical: 8, horizontal: 5),
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(10),
//                     side: BorderSide(
//                       color: Theme.of(context).primaryColor,
//                       width: 2,
//                     ),
//                   ),
//                   child: ListTile(
//                     leading: CircleAvatar(
//                       radius: 30,
//                       child: Padding(
//                         padding: const EdgeInsets.all(6),
//                         child: FittedBox(
//                           child: Text(
//                             'Rs. ${transactions[index].amount.toStringAsFixed(2)}',
//                             style: TextStyle(
//                               fontWeight: FontWeight.bold,
//                               color: Theme.of(context).primaryColor,
//                             ),
//                           ),
//                         ),
//                       ),
//                     ),
//                     title: Text(
//                       transactions[index].title,
//                       style: const TextStyle(
//                         fontSize: 16,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                     subtitle: Text(
//                       DateFormat.yMMMd().format(transactions[index].date),
//                       style: const TextStyle(
//                         color: Colors.grey,
//                       ),
//                     ),
//                   ),
//                 );
//               },
//               itemCount: transactions.length,
//             ),
//     );
//   }
// }
