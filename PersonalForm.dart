import 'package:flutter/material.dart';
import 'ListData.dart';

class PersonalForm extends StatefulWidget {
  @override
  _PersonalFormState createState() => _PersonalFormState();
}

class _PersonalFormState extends State<PersonalForm> {
  TextEditingController fullNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController personalIdController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  DateTime? selectedDate;
  bool isPhoneNumberValid = false;
  bool agreeToTerms = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Text(
              'PERSONAL FORM',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.black),
            ),
            Spacer(),
            IconButton(
              icon: Icon(Icons.list, color: Colors.black),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ListData(fullName: '', email: '', address: '')),
                );
              },
            ),
          ],
        ),
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              buildTextField('Full Name', fullNameController, 'Enter your full name'),
              buildTextField('Email', emailController, 'Enter your email'),
              buildPhoneNumberField(),
              buildTextField('Personal ID Number', personalIdController, 'Value'),
              buildTextField('Address', addressController, 'Enter your text here'),
              SizedBox(height: 10),
              buildDateSelector(),
              SizedBox(height: 16.0),
              buildTermsCheckbox(),
              SizedBox(height: 30),
              buildSubmitButton(),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildTextField(String label, TextEditingController controller, String hintText) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            color: Colors.black,
            fontSize: 16.0,
          ),
        ),
        SizedBox(height: 8.0),
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.black),
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: TextField(
              controller: controller,
              decoration: InputDecoration(
                hintText: hintText,
                border: InputBorder.none,
              ),
            ),
          ),
        ),
        SizedBox(height: 16.0),
      ],
    );
  }

  Widget buildPhoneNumberField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Phone Number',
          style: TextStyle(
            color: Colors.black,
            fontSize: 16.0,
          ),
        ),
        SizedBox(height: 8.0),
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.black),
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: phoneNumberController,
                    decoration: InputDecoration(
                      hintText: 'Enter Phone Number',
                      border: InputBorder.none,
                    ),
                  ),
                ),
                SizedBox(width: 8.0),
                ElevatedButton(
                  onPressed: () {
                    showVerificationDialog();
                  },
                  child: Text('Verify', style: TextStyle(color: Color(0xff4a3de5))),
                ),
              ],
            ),
          ),
        ),
        SizedBox(height: 16.0),
      ],
    );
  }

  Widget buildVerificationCheckbox() {
    return SizedBox(
      height: 10,
    );
  }

  void showVerificationDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Verification'),
          content: Text('Verification Berhasil'),
          actions: <Widget>[
            TextButton(
              child: Text('Close'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
    // Assuming verification is successful, update the state
    setState(() {
      isPhoneNumberValid = true;
    });
  }

  Widget buildDateSelector() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Choose Date"),
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
            border: Border.all(color: Color(0xff2A2A2A)),
            borderRadius: BorderRadius.circular(8.0),
          ),
          padding: EdgeInsets.all(8.0),
          child: Row(
            children: <Widget>[
              Text(
                selectedDate != null
                    ? " ${selectedDate?.day}/${selectedDate?.month}/${selectedDate?.year}"
                    : 'Select date',
                style: TextStyle(fontSize: 18),
              ),
              Spacer(),
              IconButton(
                icon: Icon(Icons.calendar_today),
                onPressed: () => selectDate(context),
              ),
            ],
          ),
        ),
        SizedBox(height: 1.0),
      ],
    );
  }

  Widget buildTermsCheckbox() {
    return Row(
      children: <Widget>[
        Checkbox(
          value: agreeToTerms,
          onChanged: (bool? value) {
            setState(() {
              agreeToTerms = value ?? false;
            });
          },
        ),
        Expanded(
          child: Text(
            'In publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content.',
            style: TextStyle(fontSize: 14),
          ),
        ),
      ],
    );
  }

  Widget buildSubmitButton() {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {
          if (validateAndProceed()) {
            if (isPhoneNumberValid) {
              // Save the data and navigate to ListData page
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ListData(
                    fullName: fullNameController.text,
                    email: emailController.text,
                    address: addressController.text,
                  ),
                ),
              );
            } else {
              // Show a message that verification is required
              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: Text('Verification Required'),
                    content: Text('Please verify your phone number before submitting.'),
                  );
                },
              );
            }
          } else {
            // Show a message that all fields are required
            showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: Text('All Fields Required'),
                  content: Text('Please fill in all fields before submitting.'),
                );
              },
            );
          }
        },
        child: Text('Submit'),
      ),
    );
  }

  bool validateAndProceed() {
    if (agreeToTerms &&
        fullNameController.text.isNotEmpty &&
        emailController.text.isNotEmpty &&
        phoneNumberController.text.isNotEmpty &&
        personalIdController.text.isNotEmpty &&
        addressController.text.isNotEmpty &&
        selectedDate != null) {
      return true;
    } else {
      return false;
    }
  }

  void selectDate(BuildContext context) async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );

    if (pickedDate != null && pickedDate != selectedDate) {
      setState(() {
        selectedDate = pickedDate;
      });
    }
  }
}
