import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:task1/widgets/age_field.dart';
import 'package:task1/widgets/custom_button.dart';
import 'package:task1/widgets/custom_icon.dart';
import 'package:task1/widgets/custom_textfield.dart';

enum showList { yes, no }

class DetailsScreen extends StatefulWidget {
  DetailsScreen({Key? key}) : super(key: key);

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  int age = 18;

  FirebaseFirestore _firestore = FirebaseFirestore.instance;

  void saveData() {
    _firestore.collection("user_info").add({
      "name": "${nameController.text.trim()}",
      "mobile_number": "${phoneNumberController.text.trim()}",
      "age": age,
    });
  }

  showList _show = showList.yes;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Details',
        ),
        elevation: 2,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(

            children: [
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    const SizedBox(
                      height: 24,
                    ),
                    CustomTextField(
                      textEditingController: nameController,
                      hintText: 'Name',
                      maxLines: 1,
                    ),
                    const SizedBox(
                      height: 8.0,
                    ),
                    CustomTextField(
                      textEditingController: phoneNumberController,
                      hintText: 'Mobile Number',
                      maxLines: 1,
                    ),
                    const SizedBox(
                      height: 8.0,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Row(
                        children: [
                          Text(
                            'Age:',
                            style: TextStyle(
                              fontSize: 20
                            ),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          CustomIconButton(
                              iconData: Icons.remove,
                              onTap: () {
                                setState(() {
                                  if (age > 1) age--;
                                });
                              }),
                          SizedBox(
                            width: 10,
                          ),
                       AgeField(age: age, onTap: (){

                       }),
                          SizedBox(
                            width: 10,
                          ),
                          CustomIconButton(
                              iconData: Icons.add,
                              onTap: () {
                                setState(() {
                                  age++;
                                });
                              }),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 24.0,
              ),
              CustomButton(
                  text: 'Update Table',

                  onTap: () {
                    if (_formKey.currentState!.validate()) {
                      saveData();
                      nameController.clear();
                      phoneNumberController.clear();
                      setState(() {
                        age = 18;
                      });
                    }
                  }),
              const SizedBox(
                height: 20.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        _show = showList.yes;
                      });
                    },
                    child: const Text(
                      "Show Data",
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87),
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        _show = showList.no;
                      });
                    },
                    child: const Text(
                      "Hide Data",
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87),
                    ),
                  ),
                ],
              ),
              if (_show == showList.yes)
                Expanded(
                  child: SizedBox(
                    height: 200,
                    child: StreamBuilder<QuerySnapshot>(
                        stream: _firestore.collection("user_info").orderBy("name").snapshots(),
                        builder: (context, snapshots) {
                          if (snapshots.connectionState ==
                              ConnectionState.active) {
                            if (snapshots.hasData && snapshots.data != null) {
                              return ListView.builder(
                                itemCount: snapshots.data!.docs.length,
                                itemBuilder: (context, index) {
                                  Map<String, dynamic> listDetails =
                                      snapshots.data!.docs[index].data()
                                          as Map<String, dynamic>;
                                  return ListTile(
                                    title: Text(listDetails["name"]),
                                    subtitle:
                                        Text(listDetails["mobile_number"]),
                                    trailing: Text(
                                        'Age ' + listDetails["age"].toString()),
                                  );
                                },
                              );
                            } else {
                              return Text('No data found');
                            }
                          } else {
                            return Center(
                              child: CircularProgressIndicator(),
                            );
                          }
                        }),
                  ),
                ),
              SizedBox(
                height: 20,
              ),
              if (_show == showList.no)
                Text(
                  'Click Show Data',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                )
            ],
          ),
        ),
      ),
    );
  }
}
