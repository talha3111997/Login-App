import 'package:flutter/material.dart';
import 'calculation_view.dart';
// Define a custom Form widget.
class MyCustomForm extends StatefulWidget {
  @override
  MyCustomFormState createState() {
    return MyCustomFormState();
  }
}

// Define a corresponding State class.
// This class holds data related to the form.
class MyCustomFormState extends State<MyCustomForm> {
  // Create a global key that uniquely identifies the Form widget
  // and allows validation of the form.
  //
  // Note: This is a `GlobalKey<FormState>`,
  // not a GlobalKey<MyCustomFormState>.
  final _formKey = GlobalKey<FormState>();
  int firstNum ;
  int secondNum;
  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey created above.
    return Form(
      key: _formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          // Add TextFormFields and ElevatedButton here.

          TextFormField(
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
                labelText:"Enter the First number:",

                icon: Icon(Icons.calculate_outlined)
            ),
            validator: (value){
              if(value == null || value.isEmpty){
                return 'Text field cannot be empty';
              }
              firstNum = int.parse(value);
              return null;
            },
          ),

          TextFormField(
              keyboardType: TextInputType.number,

              decoration: InputDecoration(
                  labelText:"Enter the Second number:",

                  icon: Icon(Icons.calculate)
              ),
            validator: (value){
              if(value == null || value.isEmpty){
                return 'Text field cannot be empty';
              }
              secondNum = int.parse(value);
            },
          ),
          ElevatedButton(
            onPressed: () {
              // Validate returns true if the form is valid, or false otherwise.
              if (_formKey.currentState.validate()) {
                // If the form is valid, display a snackbar. In the real world,
                // you'd often call a server or save the information in a database.
                ScaffoldMessenger.of(context)
                    .showSnackBar(SnackBar(content: Text('Processing Data')));
             //   Navigator.push(context, MaterialPageRoute(builder: (context){ return Calculate(firstNum: firstNum, secondNum: secondNum,) ;},),);
              Navigator.push(
              context,
              MaterialPageRoute(
              builder: (context) => CalculationView(firstNum: firstNum, secondNum: secondNum,),),
              );
              }
            },
            child: Text('Proceed'),
          ),
        ],
      ),
    );
  }
}