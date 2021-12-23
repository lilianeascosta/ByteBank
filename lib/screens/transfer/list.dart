import 'package:bytebank/models/transfer.dart';
import 'package:bytebank/screens/transfer/form.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

const _appBarTittle = 'Transfers';

class TransferList extends StatefulWidget {

  final List<Transfer> _transfers = <Transfer>[];
  // final List<Transfer> _transfers = List();

  @override
  State<StatefulWidget> createState() {
    return TransferListState();
  }
}

class TransferListState extends State<TransferList>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(_appBarTittle),),
      body: ListView.builder(
        itemCount: widget._transfers.length,
        itemBuilder: (context, id) {
          final transfer = widget._transfers[id];
          return TransferItem(transfer);
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return TransferForm();
          })).then((TransferRecieved) =>
            _update(TransferRecieved!));
        },
      ),
    );
  }

  void _update(Transfer TransferRecieved) {
    if(TransferRecieved != null ) {
      setState(() {
        widget._transfers.add(TransferRecieved);
      });
    }
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