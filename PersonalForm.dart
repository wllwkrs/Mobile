import 'package:flutter/material.dart';
import 'package:helloworld/ui/ListData.dart';

void main() {
  runApp(PersonalForm());
}

class PersonalForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Personal Form',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            'Personal Form',
            style: TextStyle(color: Colors.black),
          ),
          backgroundColor: Colors.white,
          actions: [
            IconButton(
              onPressed: () {
                // Fungsi yang ingin Anda tambahkan saat ikon ditekan
              },
              icon: Icon(
                Icons.description,
                color: Colors.black,
              ),
            ),
          ],
        ),
        body: CardList(),
      ),
    );
  }
}

class CardList extends StatefulWidget {
  @override
  _CardListState createState() => _CardListState();
}

class _CardListState extends State<CardList> {
  String fullName = '';
  String email = '';
  String phoneNumber = '';
  String personalID = '';
  String address = '';

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        margin: EdgeInsets.all(16.0),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Text('Full Name'),
              ),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black, width: 1),
                  borderRadius: BorderRadius.circular(5.0),
                ),
                child: TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Enter FullName',
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.symmetric(horizontal: 8.0),
                  ),
                  onChanged: (value) {
                    setState(() {
                      fullName = value;
                    });
                  },
                ),
              ),
              SizedBox(height: 10.0),
              Align(
                alignment: Alignment.centerLeft,
                child: Text('Email'),
              ),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black, width: 1),
                  borderRadius: BorderRadius.circular(5.0),
                ),
                child: TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Enter your Email',
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.symmetric(horizontal: 8.0),
                  ),
                  onChanged: (value) {
                    setState(() {
                      email = value;
                    });
                  },
                ),
              ),
              SizedBox(height: 18.0),
              Align(
                alignment: Alignment.centerLeft,
                child: Text('Phone Number'),
              ),
              Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black, width: 1),
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      child: TextFormField(
                        decoration: InputDecoration(
                          labelText: 'Enter phone number',
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.symmetric(horizontal: 8.0),
                        ),
                        onChanged: (value) {
                          setState(() {
                            phoneNumber = value;
                          });
                        },
                      ),
                    ),
                  ),
                  SizedBox(width: 8.0),
                  Expanded(
                    flex: 1,
                    child: Container(
                      width: 100,
                      height: 50,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black, width: 1),
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      child: Center(
                        child: Text('Verify'),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10.0),
              Align(
                alignment: Alignment.centerLeft,
                child: Text('Personal ID Number'),
              ),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black, width: 1),
                  borderRadius: BorderRadius.circular(5.0),
                ),
                child: TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Value',
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.symmetric(horizontal: 8.0),
                  ),
                  onChanged: (value) {
                    setState(() {
                      personalID = value;
                    });
                  },
                ),
              ),
              SizedBox(height: 10.0),
              Align(
                alignment: Alignment.centerLeft,
                child: Text('Addres'),
              ),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black, width: 1),
                  borderRadius: BorderRadius.circular(5.0),
                ),
                child: TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Enter your text here',
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.symmetric(horizontal: 8.0),
                  ),
                  onChanged: (value) {
                    setState(() {
                      address = value;
                    });
                  },
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => ListData(
                      Fullname: fullName,
                      email: email,
                      phoneNumber: phoneNumber,
                      personalID: personalID,
                      address: address,
                    ),
                  ));
                },
                child: Text('Submit'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
