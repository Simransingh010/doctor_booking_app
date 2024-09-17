import 'package:flutter/material.dart';

class InsuranceScreen extends StatefulWidget {
  const InsuranceScreen({Key? key}) : super(key: key);

  @override
  _InsuranceScreenState createState() => _InsuranceScreenState();
}

class _InsuranceScreenState extends State<InsuranceScreen> {
  final _formKey = GlobalKey<FormState>();
  bool _isLoading = false;
  bool _isSubmitted = false;

  final _nameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _addressController = TextEditingController();
  int _selectedFamilyMembers = 1;
  List<TextEditingController> _familyMemberControllers = [
    TextEditingController()
  ];

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _isLoading = true;
      });

      // Simulate form submission delay
      Future.delayed(const Duration(seconds: 2), () {
        setState(() {
          _isLoading = false;
          _isSubmitted = true;
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Insurance',
          style: TextStyle(
            color: Colors.white,
            fontSize: 24.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 41, 50, 140),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          padding: const EdgeInsets.all(16.0),
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Color.fromARGB(255, 41, 50, 140), Colors.blue],
            ),
          ),
          child: _isSubmitted
              ? Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.check_circle,
                      color: Colors.white,
                      size: 120.0,
                    ),
                    const SizedBox(height: 24.0),
                    const Text(
                      'Your appointment has been booked!',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24.0,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 16.0),
                    const Text(
                      'Our team will get in touch with you shortly.',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18.0,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                )
              : Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      TextFormField(
                        controller: _nameController,
                        decoration: InputDecoration(
                          labelText: 'Name',
                          labelStyle: const TextStyle(color: Colors.white),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: const BorderSide(color: Colors.white),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: const BorderSide(color: Colors.white),
                          ),
                        ),
                        style: const TextStyle(color: Colors.white),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your name';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 24.0),
                      TextFormField(
                        controller: _phoneController,
                        decoration: InputDecoration(
                          labelText: 'Phone',
                          labelStyle: const TextStyle(color: Colors.white),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: const BorderSide(color: Colors.white),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: const BorderSide(color: Colors.white),
                          ),
                        ),
                        style: const TextStyle(color: Colors.white),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your phone number';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 24.0),
                      TextFormField(
                        controller: _addressController,
                        maxLines: 3,
                        decoration: InputDecoration(
                          labelText: 'Address',
                          labelStyle: const TextStyle(color: Colors.white),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: const BorderSide(color: Colors.white),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: const BorderSide(color: Colors.white),
                          ),
                        ),
                        style: const TextStyle(color: Colors.white),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your address';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 24.0),
                      DropdownButtonFormField<int>(
                        value: _selectedFamilyMembers,
                        items: List.generate(5, (index) {
                          return DropdownMenuItem(
                            value: index + 1,
                            child: Text(
                              '${index + 1}',
                              style: const TextStyle(color: Colors.white),
                            ),
                          );
                        }),
                        onChanged: (value) {
                          setState(() {
                            _selectedFamilyMembers = value!;
                            _familyMemberControllers = List.generate(
                              _selectedFamilyMembers,
                              (index) => TextEditingController(),
                            );
                          });
                        },
                        decoration: InputDecoration(
                          labelText: 'Number of Family Members',
                          labelStyle: const TextStyle(color: Colors.white),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: const BorderSide(color: Colors.white),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: const BorderSide(color: Colors.white),
                          ),
                        ),
                        dropdownColor: const Color.fromARGB(255, 41, 50, 140),
                        style: const TextStyle(color: Colors.white),
                        iconEnabledColor: Colors.white,
                      ),
                      const SizedBox(height: 24.0),
                      if (_selectedFamilyMembers > 1)
                        Column(
                          children: List.generate(
                            _selectedFamilyMembers - 1,
                            (index) => Padding(
                              padding: const EdgeInsets.only(bottom: 16.0),
                              child: TextFormField(
                                controller: _familyMemberControllers[index + 1],
                                decoration: InputDecoration(
                                  labelText: 'Family Member ${index + 2} Name',
                                  labelStyle:
                                      const TextStyle(color: Colors.white),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                    borderSide:
                                        const BorderSide(color: Colors.white),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                    borderSide:
                                        const BorderSide(color: Colors.white),
                                  ),
                                ),
                                style: const TextStyle(color: Colors.white),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter family member name';
                                  }
                                  return null;
                                },
                              ),
                            ),
                          ),
                        ),
                      const SizedBox(height: 40.0),
                      Container(
                        height: 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25.0),
                          gradient: const LinearGradient(
                            colors: [Colors.blue, Colors.blueAccent],
                          ),
                        ),
                        child: ElevatedButton(
                          onPressed: _isLoading ? null : _submitForm,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.transparent,
                            shadowColor: Colors.transparent,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25.0),
                            ),
                          ),
                          child: _isLoading
                              ? const CircularProgressIndicator(
                                  valueColor: AlwaysStoppedAnimation<Color>(
                                      Colors.white),
                                )
                              : const Text(
                                  'Submit',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                        ),
                      ),
                    ],
                  ),
                ),
        ),
      ),
    );
  }
}
