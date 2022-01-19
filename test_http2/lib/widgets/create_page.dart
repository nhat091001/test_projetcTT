import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test_http2/repository/repository_person.dart';
class CreatePage extends StatefulWidget {
  const CreatePage({Key? key}) : super(key: key);

  @override
  _CreatePageState createState() => _CreatePageState();
}

class _CreatePageState extends State<CreatePage> {
  RepositoryPerson repositoryPerson=RepositoryPerson();

  final firstNameController=TextEditingController();
  final lastNameController=TextEditingController();
  final mesageController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Create page'),),
      body: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            TextField(controller: firstNameController,decoration: InputDecoration(hintText: 'FirstName'),),
            SizedBox(height: 10,),
            TextField(controller: lastNameController,decoration: InputDecoration(hintText: 'LastName'),),
            SizedBox(height: 10,),
            TextField(controller: mesageController,decoration: InputDecoration(hintText: 'Message'),),
            SizedBox(height: 10,),
            ElevatedButton(onPressed: ()async{
              bool response=await repositoryPerson.createData(firstNameController.text, lastNameController.text, mesageController.text);
              if(response){
                Navigator.popAndPushNamed(context, 'home');
              }else{
                throw Exception('Failed to create  data');
              }
              }, child: Text('Create'))
          ],
        ),
      ),
    );
  }
}
