import 'package:flutter/material.dart';

void main() => runApp(
  ByteBankApp()
);

class ByteBankApp extends StatelessWidget {
  const ByteBankApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      home: Scaffold(
        body: TransferForm(),
      ),
    );
  }
}

class TransferForm extends StatelessWidget {
  const TransferForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Creating Transfers'),),
    );
  }
}


class TransferList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(title: Text('Transfers'),),
      body: Column(
        children: [
          TransferItem(Transfer(100.00, 123)),
          TransferItem(Transfer(200.00, 456)),
          TransferItem(Transfer(300.00, 789)),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add),
      ),
    );
  }
}

class TransferItem extends StatelessWidget {
  final Transfer _transfer;

  TransferItem(this._transfer);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Card(
        child: ListTile(
          leading: Icon(Icons.monetization_on),
          title: Text(_transfer.value.toString()),
          subtitle: Text(_transfer.accountNumber.toString()),
        )
    );
  }
}

class Transfer {
  final double value;
  final int accountNumber;

  Transfer(this.value, this.accountNumber);
}