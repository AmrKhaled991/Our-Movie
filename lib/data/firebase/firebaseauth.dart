
 import 'package:cloud_firestore/cloud_firestore.dart';

import '../../domain/model/whatchback.dart';
import 'firebasemodel/whatchback.dart';

 class FirebaseUtils{CollectionReference<whatchbackotp> getfirebasedata(){
  return  FirebaseFirestore.instance.collection('films').withConverter<whatchbackotp>(
      fromFirestore: (snapshot, options) => whatchbackotp.fromjeson(snapshot) ,
      toFirestore:(value, options) => value.firbse());
 }

 Future<List<watchback>> getfirbselist()async{
  var res=getfirebasedata();
   var get=await res.get();
   return get.docs.map((e) => e.data().watchback1()).toList();
 }
 Future<void> addfilm(watchback watch)async{
  var col= getfirebasedata();
  var film= watch.getotp();
  film.idfire=col.id;
  var get =await col.doc(film.title);
  get.set(film);
 }

 Future<void> delettask(watchback watch){
  var col= getfirebasedata();
  var film= watch.getotp();
  print(film.idfire);
  return col.doc(film.title).delete();
 }}