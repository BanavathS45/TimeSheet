import 'package:flutter/material.dart';
 

class SummaryPage extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Summary'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Service ID', style: TextStyle(fontWeight: FontWeight.bold)),
              TextFormField(
                decoration: InputDecoration(
                  hintText: 'Enter Service ID',
                ),
              ),
              SizedBox(height: 10),
              Text('Delivered Item', style: TextStyle(fontWeight: FontWeight.bold)),
              TextFormField(
                decoration: InputDecoration(
                  hintText: 'Enter Delivered Item',
                ),
              ),
              SizedBox(height: 10),
              Text('Service Name', style: TextStyle(fontWeight: FontWeight.bold)),
              TextFormField(
                decoration: InputDecoration(
                  hintText: 'Enter Service Name',
                ),
              ),
              SizedBox(height: 10),
              Text('Delivery Address', style: TextStyle(fontWeight: FontWeight.bold)),
              TextFormField(
                decoration: InputDecoration(
                  hintText: 'Enter Delivery Address',
                ),
              ),
              SizedBox(height: 10),
              Text('Date & Time', style: TextStyle(fontWeight: FontWeight.bold)),
              TextFormField(
                decoration: InputDecoration(
                  hintText: 'Enter Date & Time',
                ),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Total Price: \$XXX'),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => PaymentPage()),
                      );
                    },
                    child: Text('PAY'),
                  ),
                ],
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  _showCancelConfirmationDialog(context);
                },
                child: Text('Cancel Service'),
                style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showCancelConfirmationDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Cancel Service'),
          content: Text('Are you sure you want to cancel the service?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                // Handle service cancellation logic here
                Navigator.of(context).pop(); // Close the dialog
              },
              child: Text('Confirm'),
            ),
          ],
        );
      },
    );
  }
}

class PaymentPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Payment Page'),
      ),
      body: Center(
        child: Text('Payment Processing...'),
      ),
    );
  }
}