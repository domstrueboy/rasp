import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class EventForm extends StatefulWidget {
  final bool isLoading;

  final void Function(
    String title,
    Timestamp from,
    Timestamp till,
    BuildContext context,
  ) submitEventForm;

  EventForm(this.submitEventForm, this.isLoading);

  @override
  _EventFormState createState() => _EventFormState();
}

class _EventFormState extends State<EventForm> {
  final _formKey = GlobalKey<FormState>();

  var _title = '';
  var _from = Timestamp.now();
  var _till = Timestamp.now();

  void _trySubmit() {
    final isValid = _formKey.currentState.validate();
    FocusScope.of(context).unfocus();

    if (isValid) {
      _formKey.currentState.save();
      widget.submitEventForm(
        _title.trim(),
        _from,
        _till,
        context,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        margin: EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(16),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextFormField(
                    key: ValueKey('title'),
                    autocorrect: false,
                    textCapitalization: TextCapitalization.none,
                    keyboardType: TextInputType.name,
                    decoration: InputDecoration(labelText: 'Title'),
                    validator: (value) {
                      if (value.isNotEmpty) return null;
                      return 'Please enter a title';
                    },
                    onSaved: (value) {
                      _title = value;
                    },
                  ),
                  // TextFormField(
                  //   key: ValueKey('from'),
                  //   keyboardType: TextInputType.datetime,
                  //   decoration: InputDecoration(labelText: 'From'),
                  //   validator: (value) {
                  //     if (value.isNotEmpty) return null;
                  //     return 'Please enter a time';
                  //   },
                  //   onSaved: (value) {
                  //     _from = value;
                  //   },
                  // ),
                  SizedBox(height: 12),
                  if (widget.isLoading) CircularProgressIndicator(),
                  if (!widget.isLoading)
                    RaisedButton(
                      child: Text('Add'),
                      onPressed: _trySubmit,
                    ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
