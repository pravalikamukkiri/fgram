import 'package:ffff/items.dart';
import 'package:flutter/material.dart';
import 'package:ffff/screens/home.dart';
import 'package:ffff/screens/search.dart';
import 'package:ffff/main.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
class User_profile extends StatefulWidget {
  @override
  /*final  String user_is;
  final String bio;
  const User_profile(this.user_is,this.bio);*/
  _User_profileState createState() => _User_profileState();
}
String sname='sname';
String sbio='sbio';
class _User_profileState extends State<User_profile> {
  Map  data={};
  @override

  String sf1,sf2;
  int sf1i,sf2i;
  Widget build(BuildContext context) {
    /*data=ModalRoute.of(context).settings.arguments;
    print(data);
    //String xx=data['user_id'];
    //print(xx);
    //print(data['user_id']);
    setState(() {
      if(data!=Null) {
        setState(() {
          //search_user_uid=data['user_id'];
        });
        //print(data['user_id']);
      }
        //search_user_uid=data['user_id'];
    });*/
    Future getdata() async{
      String s1,s2;
      await Firestore.instance.collection('Users').document(search_user_uid).get().then((DocumentSnapshot ds){
        setState(() {
          sname=ds['name'];
          sbio=ds['bio'];
          sf1i=ds['followers'];
          sf2i=ds['following'];
          if(ds['followers'].toString()==null)
            sf1='0';
          else
            sf1=ds['followers'].toString();
          if(ds['following'].toString()==null)
            sf2='0';
          else
            sf2=ds['following'].toString();
        });
      });
    }
    getdata();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.fromLTRB(3, 10, 0, 0),
            child: Text(
              'User',
              style: TextStyle(
                color: Colors.black,
                fontSize: 30,
              ),
            ),
          ),
          Spacer(),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.more_horiz),
            color: Colors.black,
          ),
        ],
      ),
      body: ListView(
        physics: AlwaysScrollableScrollPhysics(),
        children: [
          Container(
            padding: EdgeInsets.all(10),
            height: 130,
            child: Row(
              children: [
                Column(
                  children: [
                    CircleAvatar(
                      child: Icon(Icons.account_circle),
                      radius: 25,
                    ),
                    SizedBox(height: 4,),
                    Text(sname),
                    Text(sbio),
                  ],
                ),
                Spacer(),
                Column(
                  children: [
                    SizedBox(height: 30,),
                    Text('${sf1}'),
                    Text('followers'),
                  ],
                ),
                Spacer(),
                Column(
                  children: [
                    SizedBox(height: 30,),
                    Text('${sf2}'),
                    Text('following'),
                  ],
                ),
                Spacer(),
              ],
            ),
          ),
          Row(
            children: [
              Spacer(),
              Container(
                  padding: EdgeInsets.symmetric(horizontal: 10,vertical: 5),
                  child: RaisedButton(
                    color: Colors.white70,
                    onPressed: () async{
                      //print(sf2i);
                      //print(uf2);
                      if(search_user_uid != ud){
                        print(ud);
                        print(search_user_uid);
                        await Firestore.instance.collection('Users').document(ud).updateData({'following': uf2+1});
                        await Firestore.instance.collection('Users').document(search_user_uid).updateData({'followers': sf1i+1});
                        setState(() {
                          uf2++;
                          sf1i++;
                          sf1=sf1i.toString();
                        });
                      }
                    },
                    child: Text('follow'),
                  )
              ),
              Spacer(flex: 1,),
              Container(
                  padding: EdgeInsets.symmetric(horizontal: 10,vertical: 5),
                  child: RaisedButton(
                    color: Colors.white70,
                    onPressed: (){},
                    child: Text('message'),
                  )
              ),
              Spacer(),
            ],
          )
        ],
      ),
      bottomNavigationBar: new BottomAppBar(
        child: new Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            IconButton(
              onPressed: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Home()),
                );
              },
              icon: Icon(Icons.home),
              iconSize: 32.0,
            ),
            IconButton(
              onPressed: (){},
              icon: Icon(Icons.search),
              iconSize: 32.0,
            ),
            IconButton(
              onPressed: (){},
              icon: Icon(Icons.add_circle_outline),
              iconSize: 32.0,
            ),
            IconButton(
              onPressed: (){},
              icon: Icon(Icons.favorite),
              iconSize: 32.0,
            ),
            IconButton(
              onPressed: (){
              },
              icon: Icon(Icons.account_circle),
              iconSize: 32.0,
            )
          ],
        ),
      ),
    );
  }
}
