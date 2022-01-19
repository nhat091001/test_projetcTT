import 'package:flutter/material.dart';
import 'package:test_http2/repository/repository_person.dart';

import '../models/person.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  RepositoryPerson repositoryPerson = RepositoryPerson();
  List<Person> listPerson = [];

  getData() async {
    listPerson = await repositoryPerson.getData();
    setState(() {});
  }

  @override
  void initState() {
    // TODO: implement initState
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('testHttp'),
      ),
      body: Container(
        child: ListView.builder(
            itemCount: listPerson.length,
            itemBuilder: (context, index) {
              Person person = listPerson[index];
              return InkWell(
                onTap: () {
                  Navigator.popAndPushNamed(context, 'update', arguments: [
                    person.id,
                    person.firstName,
                    person.lastName,
                    person.message
                  ]);
                },
                child: Dismissible(
                  key: Key('${person.id}'),
                  confirmDismiss: (director) {
                    return showDialog(
                        context: (context),
                        builder: (context) {
                          return AlertDialog(
                            title: Text('Delete Data'),
                            content: Text('Are you sure to delete data ?'),
                            actions: [
                              TextButton(
                                  onPressed: () async {
                                    bool response = await repositoryPerson
                                        .deleteData('${person.id}');

                                    if (response) {
                                      Navigator.pop(context, true);
                                    } else {
                                      Navigator.pop(context, false);
                                    }
                                  },
                                  child: Text('Yes')),
                              TextButton(
                                  onPressed: () {
                                    Navigator.pop(context, false);
                                  },
                                  child: Text('No')),
                            ],
                          );
                        });
                  },
                  child: ListTile(
                    leading: Container(
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            image: AssetImage('assets/images/logo.jpg'),
                            fit: BoxFit.cover),
                      ),
                    ),
                    title: Text('${person.firstName} ${person.lastName}'),
                    subtitle: Text(
                      '${person.message}',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ),
              );
            }),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.popAndPushNamed(context, 'create');
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
