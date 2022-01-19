import 'package:flutter/material.dart';
import '../repository/repository_person.dart';

class UpdatePage extends StatefulWidget {
  const UpdatePage({Key? key}) : super(key: key);

  @override
  _UpdatePageState createState() => _UpdatePageState();
}

class _UpdatePageState extends State<UpdatePage> {
  RepositoryPerson repositoryPerson=RepositoryPerson();

  final firstNameController=TextEditingController();
  final lastNameController=TextEditingController();
  final messageController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    final args=ModalRoute.of(context)?.settings.arguments as List<dynamic>;
    if(args[1].isNotEmpty){
      firstNameController.text=args[1];
    }
    if(args[2].isNotEmpty){
      lastNameController.text=args[2];
    }
    if(args[3].isNotEmpty){
      messageController.text=args[3];
    }

    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.orange,title: Text('Update page'),),
      body: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            TextField(controller: firstNameController,decoration: InputDecoration(hintText: 'FirstName'),),
            SizedBox(height: 10,),
            TextField(controller: lastNameController,decoration: InputDecoration(hintText: 'LastName'),),
            SizedBox(height: 10,),
            TextField(controller: messageController,decoration: InputDecoration(hintText: 'Message'),),
            SizedBox(height: 10,),
            ElevatedButton(onPressed: ()async{
              bool response=await repositoryPerson.updateData(
                args[0],
                  firstNameController.text, lastNameController.text, messageController.text);
              if(response){
                Navigator.popAndPushNamed(context, 'home');
              }else{
                throw Exception('Failed to update  data');
              }
            }, child: Text('Update'))
          ],
        ),
      ),
    );
  }
}
