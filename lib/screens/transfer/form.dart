import 'package:bytebank/components/editor.dart';
import 'package:bytebank/models/transfer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

const _appBarTittle = 'Creating Transfers';
const _campLabel = 'Value';
const _campTip = '0.00';
const _campAccountNumber = '1234';
const _campAccountNumberTip = 'Account Number';
const _buttonText = 'Confirm';

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
      appBar: AppBar(title: Text(_appBarTittle),),
      body:
      Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Editor(controller: _campControllerAccountNumber,
                label: _campAccountNumber,
                tip: _campAccountNumberTip,),
              Editor(controller: _campControllerValue,
                label: _campLabel,
                tip: _campTip,
                icone: Icons.monetization_on,),
              ElevatedButton(
                child: Text(_buttonText),
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
      Navigator.pop(context, TransferCreated);
    }
  }
}