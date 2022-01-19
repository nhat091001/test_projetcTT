import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:test_http2/models/person.dart';
class RepositoryPerson{
String url='https://61e58e1bc14c7a0017124d36.mockapi.io/Person';

Future getData()async{

  try{
    final response=await http.get(Uri.parse(url));
    if(response.statusCode==200){
      Iterable it=jsonDecode(response.body);
      List<Person> person=it.map((e) => Person.fromJson(e)).toList();
      return person;
    }else{
      throw Exception('Failded to load data');
    }
  }catch(e){
    return e.toString();
  }
}

Future createData(String firstName,String lastName,String message)async{


  try{
    final response =await http.post(Uri.parse(url),body: {
      'first_name':firstName,
      'last_name':lastName,
      'message':message
    });

    if(response.statusCode==201){
      return true;
    }else{
      return false;
    }
  }catch (e){
    return e.toString();
  }
}

Future updateData(String id, String firstName,String lastName,String message)async{

  try{
    final response=await http.put(Uri.parse('$url/$id'),body: {
      'first_name':firstName,
      'last_name':lastName,
      'mesage':message
    });
    if(response.statusCode==200){
      return true;
    }else{
      return false;
    }
  }catch (e){
    return e.toString();
  }
}

Future deleteData(String id)async{

  try{
    final response=await http.delete(Uri.parse('$url/$id'));

    if(response.statusCode==200){
      return true;
    }else{
      return false;
    }
  }catch (e){
    return e.toString();

  }
}

}