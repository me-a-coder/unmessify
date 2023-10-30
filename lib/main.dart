import 'package:flutter/material.dart';

void main() {
  runApp(const LoginApp());
}

class LoginApp extends StatelessWidget {
  const LoginApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Login'),
        ),
        body: Center(
          child: Container(
            color: Colors.yellow,
            child: const LoginForm(),
          ),
        ),
      ),
    );
  }
}

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

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
          const SizedBox(height: 20),
          Card(
            elevation: 5,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Container(
              padding: const EdgeInsets.all(16),
              width: 250,
              child: Column(
                children: <Widget>[
                  TextFormField(
                    decoration: const InputDecoration(
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
                  const SizedBox(height: 10),
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
                  const SizedBox(height: 10),
                  TextFormField(
                    decoration: const InputDecoration(
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
          const SizedBox(height: 20),
          InkWell(
            onTap: () {
              if (_formKey.currentState!.validate()) {
                _formKey.currentState!.save();
                if (block == 'A') {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const OptionScreenA()),
                  );
                } else if (block == 'B') {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const OptionScreenB()),
                  );
                } else if (block == 'C') {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const OptionScreenC()),
                  );
                } else if (block == 'D') {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const OptionScreenD()),
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
              padding: const EdgeInsets.symmetric(vertical: 12),
              child: const Center(
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
  const OptionScreenA({super.key});

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
        title: const Text('Options for Block A'),
      ),
      body: SizedBox(
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
              padding: const EdgeInsets.all(16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Card(
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    color: Colors.white,
                    child: SizedBox(
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
                            hint: const Text('Select Mess Name'),
                          ),
                          const SizedBox(height: 1),
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
                            hint: const Text('Select Mess Type'),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: () {
                      print('Selected Mess: $selectedMess');
                      print('Selected Mess Type: $selectedMessType');
                    },
                    child: const Text('Submit'),
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
  const OptionScreenB({super.key});

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
        title: const Text('Options for Block B'),
      ),
      body: SizedBox(
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
              padding: const EdgeInsets.all(16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Card(
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    color: Colors.white,
                    child: SizedBox(
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
                            hint: const Text('Select Mess Name'),
                          ),
                          const SizedBox(height: 1),
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
                            hint: const Text('Select Mess Type'),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: () {
                      print('Selected Mess: $selectedMess');
                      print('Selected Mess Type: $selectedMessType');
                    },
                    child: const Text('Submit'),
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

class OptionScreenC extends StatefulWidget {
  const OptionScreenC({super.key});

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
        title: const Text('Options for Block C'),
      ),
      body: SizedBox(
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
              padding: const EdgeInsets.all(16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Card(
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    color: Colors.white,
                    child: SizedBox(
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
                            hint: const Text('Select Mess Name'),
                          ),
                          const SizedBox(height: 1),
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
                            hint: const Text('Select Mess Type'),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: () {
                      print('Selected Mess: $selectedMess');
                      print('Selected Mess Type: $selectedMessType');
                    },
                    child: const Text('Submit'),
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

class OptionScreenD extends StatefulWidget {
  const OptionScreenD({super.key});

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
        title: const Text('Options for Block D'),
      ),
      body: SizedBox(
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
              padding: const EdgeInsets.all(16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Card(
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    color: Colors.white,
                    child: SizedBox(
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
                            hint: const Text('Select Mess Name'),
                          ),
                          const SizedBox(height: 1),
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
                            hint: const Text('Select Mess Type'),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: () {
                      print('Selected Mess: $selectedMess');
                      print('Selected Mess Type: $selectedMessType');
                    },
                    child: const Text('Submit'),
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
