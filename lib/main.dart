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
        body: TransferList(),
      ),
    );
  }
}

class Editor extends StatelessWidget {

  final TextEditingController controller;
  final String label;
  final String tip;
  final IconData? icone;


  // ignore: use_key_in_widget_constructors
  const Editor({required this.controller, required this.label, required this.tip, this.icone});

  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: TextField(
        controller: controller,
        style: TextStyle(
          fontSize: 24.0,
        ),
        decoration: InputDecoration(
          icon: icone != null ? Icon(icone) : null,
          labelText: label,
          hintText: tip, // tip to the user
        ),
        keyboardType: TextInputType.number,
      ),
    ) ;
  }
}

class TransferForm extends StatefulWidget {
  //const TransferForm({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return TransferFormState();
  }
}

class TransferFormState extends State<TransferForm> {
  final TextEditingController _campControllerAccountNumber = TextEditingController();
  final TextEditingController _campControllerValue = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Creating Transfers'),),
      body:
      Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Editor(controller: _campControllerAccountNumber,
                label: 'Account Number',
                tip: '1234',),
              Editor(controller: _campControllerValue,
                label: 'Value',
                tip: '1000.00',
                icone: Icons.monetization_on,),
              ElevatedButton(
                child: Text('Confirm'),
                onPressed: () => _TransferCreate(context),
                //child: Text(_textButtonConfirm),
                //onPressed: () => _TransferCreation(context),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _TransferCreate(BuildContext context) {
    final int accountNumber = int.parse(_campControllerAccountNumber.text);
    final double value = double.parse(_campControllerValue.text);
    if(accountNumber != null && value != null) {
      final TransferCreated = Transfer(value, accountNumber);
      debugPrint('criando transferencia');
      debugPrint('$TransferCreated');
      Navigator.pop(context, TransferCreated);
    }
  }
}

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
      appBar: AppBar(title: Text('Transfers'),),
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
          final Future<Transfer?> future = Navigator.push(context, MaterialPageRoute(builder: (context) {
            return TransferForm();
          }));
          future.then((TransferRecieved) {
            Future.delayed(Duration(seconds: 3), () {
              if(TransferRecieved != null ) {
                setState(() {
                  widget._transfers.add(TransferRecieved);
                });
              }
            });
          });
        },
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

