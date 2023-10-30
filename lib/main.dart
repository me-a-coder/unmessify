import 'package:flutter/material.dart';

void main() {
  runApp(LoginApp());
}

class LoginApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Login'),
        ),
        body: Center(
          child: Container(
            color: Colors.yellow,
            child: LoginForm(),
          ),
        ),
      ),
    );
  }
}

class LoginForm extends StatefulWidget {
  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();
  String? name;
  String? block = 'Select your block'; // Default selection
  String? email;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Image.asset(
            'assets/images/meal.png',
            width: 160,
            height: 150,
            fit: BoxFit.fill,
          ),
          SizedBox(height: 20),
          Card(
            elevation: 5,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Container(
              padding: EdgeInsets.all(16),
              width: 250,
              child: Column(
                children: <Widget>[
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Name',
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your name';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      name = value;
                    },
                  ),
                  SizedBox(height: 10),
                  DropdownButtonFormField<String>(
                    value: block,
                    items:
                        ['Select your block', 'A', 'B', 'C', 'D'].map((block) {
                      return DropdownMenuItem<String>(
                        value: block,
                        child: Text(block),
                      );
                    }).toList(),
                    onChanged: (String? value) {
                      setState(() {
                        block = value;
                      });
                    },
                  ),
                  SizedBox(height: 10),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Email',
                    ),
                    validator: (value) {
                      if (value == null ||
                          value.isEmpty ||
                          !value.contains('@')) {
                        return 'Please enter a valid email';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      email = value;
                    },
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 20),
          InkWell(
            onTap: () {
              if (_formKey.currentState!.validate()) {
                _formKey.currentState!.save();
                if (block == 'A') {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => OptionScreenA()),
                  );
                } else if (block == 'B') {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => OptionScreenB()),
                  );
                } else if (block == 'C') {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => OptionScreenC()),
                  );
                } else if (block == 'D') {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => OptionScreenD()),
                  );
                }
              }
            },
            child: Container(
              width: 250,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30.0),
                color: Colors.blue,
              ),
              padding: EdgeInsets.symmetric(vertical: 12),
              child: Center(
                child: Text(
                  'Login',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class OptionScreenA extends StatefulWidget {
  @override
  _OptionScreenAState createState() => _OptionScreenAState();
}

class _OptionScreenAState extends State<OptionScreenA> {
  String? selectedMess;
  String? selectedMessType;

  final List<String> messNames = ['CRCL', 'Fusion'];
  final List<String> messTypes = ['Veg', 'Non-veg', 'Special'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Options for Block A'),
      ),
      body: Container(
        width: double.infinity, // Set width to match the screen width
        child: Center(
          child: Card(
            elevation: 5,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
            ),
            color: Colors.yellow,
            child: Container(
              width: 250,
              padding: EdgeInsets.all(16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Card(
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    color: Colors.white,
                    child: Container(
                      width: 250,
                      child: Column(
                        children: [
                          DropdownButton<String>(
                            value: selectedMess,
                            items: messNames.map((mess) {
                              return DropdownMenuItem<String>(
                                value: mess,
                                child: Text(mess),
                              );
                            }).toList(),
                            onChanged: (String? value) {
                              setState(() {
                                selectedMess = value;
                              });
                            },
                            hint: Text('Select Mess Name'),
                          ),
                          SizedBox(height: 1),
                          DropdownButton<String>(
                            value: selectedMessType,
                            items: messTypes.map((type) {
                              return DropdownMenuItem<String>(
                                value: type,
                                child: Text(type),
                              );
                            }).toList(),
                            onChanged: (String? value) {
                              setState(() {
                                selectedMessType = value;
                              });
                            },
                            hint: Text('Select Mess Type'),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: () {
                      print('Selected Mess: $selectedMess');
                      print('Selected Mess Type: $selectedMessType');
                    },
                    child: Text('Submit'),
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

class OptionScreenB extends StatefulWidget {
  @override
  _OptionScreenBState createState() => _OptionScreenBState();
}

class _OptionScreenBState extends State<OptionScreenB> {
  String? selectedMess;
  String? selectedMessType;

  final List<String> messNames = ['Shakti', 'ABFC'];
  final List<String> messTypes = ['Veg', 'Non-veg', 'Special'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Options for Block B'),
      ),
      body: Container(
        color: Colors.yellow,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              DropdownButton<String>(
                value: selectedMess,
                items: messNames.map((mess) {
                  return DropdownMenuItem<String>(
                    value: mess,
                    child: Text(mess),
                  );
                }).toList(),
                onChanged: (String? value) {
                  setState(() {
                    selectedMess = value;
                  });
                },
                hint: Text('Select Mess Name'),
              ),
              SizedBox(height: 20),
              DropdownButton<String>(
                value: selectedMessType,
                items: messTypes.map((type) {
                  return DropdownMenuItem<String>(
                    value: type,
                    child: Text(type),
                  );
                }).toList(),
                onChanged: (String? value) {
                  setState(() {
                    selectedMessType = value;
                  });
                },
                hint: Text('Select Mess Type'),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  print('Selected Mess Name: $selectedMess');
                  print('Selected Mess Type: $selectedMessType');
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

class OptionScreenC extends StatefulWidget {
  @override
  _OptionScreenCState createState() => _OptionScreenCState();
}

class _OptionScreenCState extends State<OptionScreenC> {
  String? selectedMess;
  String? selectedMessType;

  final List<String> messNames = ['Mess A', 'Mess B'];
  final List<String> messTypes = ['Veg', 'Non-veg', 'Special'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Options for Block C'),
      ),
      body: Container(
        color: Colors.yellow,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              DropdownButton<String>(
                value: selectedMess,
                items: messNames.map((mess) {
                  return DropdownMenuItem<String>(
                    value: mess,
                    child: Text(mess),
                  );
                }).toList(),
                onChanged: (String? value) {
                  setState(() {
                    selectedMess = value;
                  });
                },
                hint: Text('Select Mess Name'),
              ),
              SizedBox(height: 20),
              DropdownButton<String>(
                value: selectedMessType,
                items: messTypes.map((type) {
                  return DropdownMenuItem<String>(
                    value: type,
                    child: Text(type),
                  );
                }).toList(),
                onChanged: (String? value) {
                  setState(() {
                    selectedMessType = value;
                  });
                },
                hint: Text('Select Mess Type'),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  print('Selected Mess Name: $selectedMess');
                  print('Selected Mess Type: $selectedMessType');
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

class OptionScreenD extends StatefulWidget {
  @override
  _OptionScreenDState createState() => _OptionScreenDState();
}

class _OptionScreenDState extends State<OptionScreenD> {
  String? selectedMess;
  String? selectedMessType;

  final List<String> messNames = ['Mother', 'Poodle'];
  final List<String> messTypes = ['Veg', 'Non-veg', 'Special'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Options for Block D'),
      ),
      body: Container(
        color: Colors.yellow,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              DropdownButton<String>(
                value: selectedMess,
                items: messNames.map((mess) {
                  return DropdownMenuItem<String>(
                    value: mess,
                    child: Text(mess),
                  );
                }).toList(),
                onChanged: (String? value) {
                  setState(() {
                    selectedMess = value;
                  });
                },
                hint: Text('Select Mess Name'),
              ),
              SizedBox(height: 20),
              DropdownButton<String>(
                value: selectedMessType,
                items: messTypes.map((type) {
                  return DropdownMenuItem<String>(
                    value: type,
                    child: Text(type),
                  );
                }).toList(),
                onChanged: (String? value) {
                  setState(() {
                    selectedMessType = value;
                  });
                },
                hint: Text('Select Mess Type'),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  print('Selected Mess Name: $selectedMess');
                  print('Selected Mess Type: $selectedMessType');
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
