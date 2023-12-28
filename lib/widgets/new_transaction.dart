import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewTransaction extends StatefulWidget {
  final Function addTx;

  NewTransaction(this.addTx);

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  DateTime? _selectedDate;

  void _submitData() {
    if (_amountController.text.isEmpty) {
      return;
    }
    final enteredTitle = _titleController.text;
    final enteredAmount = double.parse(_amountController.text);

    if (enteredTitle.isEmpty || enteredAmount <= 0) {
      return;
    }

    widget.addTx(
      enteredTitle,
      enteredAmount,
      _selectedDate,
    );

    Navigator.of(context).pop();
  }

  void _presentDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2019),
      lastDate: DateTime.now(),
    ).then((pickedDate) {
      if (pickedDate == null) {
        return;
      }
      setState(() {
        _selectedDate = pickedDate;
      });
    });
    print('...');
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            TextField(
              decoration: InputDecoration(labelText: 'Title'),
              controller: _titleController,
              onSubmitted: (_) => _submitData(),
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Amount'),
              controller: _amountController,
              keyboardType: TextInputType.number,
              onSubmitted: (_) => _submitData(),
            ),
            Container(
              height: 70,
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Text(
                      _selectedDate == null
                          ? 'No Date Chosen!'
                          : 'Picked Date: ${DateFormat.yMd().format(_selectedDate!)}',
                    ),
                  ),
                  TextButton(
                    // Replace FlatButton with TextButton
                    style: TextButton.styleFrom(
                      primary: Theme.of(context).primaryColor,
                      textStyle: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    onPressed: _presentDatePicker,
                    child: Text('Choose Date'),
                  ),
                ],
              ),
            ),
            ElevatedButton(
              // Replace RaisedButton with ElevatedButton
              onPressed: _submitData,
              style: ElevatedButton.styleFrom(
                primary: Theme.of(context).primaryColor,
                onPrimary: Theme.of(context).textTheme.button?.color,
              ),
              child: Text('Add Transaction'),
            ),
          ],
        ),
      ),
    );
  }
}


// import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';

// class NewTransaction extends StatefulWidget {
//   final Function addTx;

//   NewTransaction(this.addTx);

//   @override
//   State<NewTransaction> createState() => _NewTransactionState();
// }

// class _NewTransactionState extends State<NewTransaction> {
//   final titleController = TextEditingController();
//   final amountController = TextEditingController();
//   DateTime _selectedDate = DateTime.now();

//   void submitData() {
//     final enteredTitle = titleController.text;
//     final enteredAmount = double.tryParse(amountController.text);

//     if (enteredTitle.isEmpty || enteredAmount == null || enteredAmount <= 0) {
//       return;
//     }

//     widget.addTx(enteredTitle, enteredAmount, _selectedDate);
//     // Clear the text fields after submitting
//     titleController.clear();
//     amountController.clear();
//   }

//   void _presentDatePicker() {
//     showDatePicker(
//       context: context,
//       firstDate: DateTime(2023),
//       lastDate: DateTime.now(),
//     ).then((pickedDate) {
//       if (pickedDate == null) {
//         return;
//       }
//       setState(() {
//         _selectedDate = pickedDate;
//       });
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       elevation: 5,
//       child: Container(
//         padding: EdgeInsets.all(10),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.end,
//           children: <Widget>[
//             TextField(
//               decoration: InputDecoration(labelText: 'Title'),
//               controller: titleController,
//               onSubmitted: (_) => submitData(),
//             ),
//             TextField(
//               decoration: InputDecoration(labelText: 'Amount'),
//               controller: amountController,
//               keyboardType: TextInputType.numberWithOptions(decimal: true),
//               onSubmitted: (_) => submitData(),
//             ),
//             Container(
//               height: 70,
//               child: Row(
//                 children: <Widget>[
//                   Text(_selectedDate == null
//                       ? 'No Date Chosen'
//                       : DateFormat.yMd().format(_selectedDate)),
//                   ElevatedButton(
//                     onPressed: _presentDatePicker,
//                     style: ElevatedButton.styleFrom(
//                       primary: Theme.of(context).primaryColor,
//                       // Use backgroundColor instead of primary
//                       backgroundColor: Theme.of(context).primaryColor,
//                     ),
//                     child: Text(
//                       'Choose Date',
//                       style: TextStyle(
//                         fontWeight: FontWeight.bold,
//                         color: Colors.white,
//                       ),
//                     ),
//                   )
//                 ],
//               ),
//             ),
//             ElevatedButton(
//               onPressed: submitData,
//               style: ElevatedButton.styleFrom(
//                 // Use backgroundColor instead of primary
//                 backgroundColor: Theme.of(context).primaryColor.withAlpha(2),
//               ),
//               child: Text("Add Transaction"),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
