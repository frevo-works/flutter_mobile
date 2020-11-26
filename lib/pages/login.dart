import '../common/importer.dart';
import 'dart:convert';

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> {
  final items = List<String>.generate(8, (i) => "まとめ");

  // Future getData() async{ //Future xxx async{} という記法
  //   http.Response response = await http.get(WEB_HOME);
  // }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.white,
      ),
      home: Scaffold(
        body:Container(
          width: double.infinity,
          height:double.infinity,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end:Alignment.bottomCenter,
              stops: [0.3, 0.5, 0.7,0.95],
              colors: [
                Color.fromARGB(100,155,200,73),
                Color.fromARGB(100,182,228,150),
                Color.fromARGB(100,200,255,188),
                Color.fromARGB(100,239,255,255),
              ],
            ),
          ),
          child:Column(
            children: <Widget>[
              Container(
                height:150,
              ),
              Image(image: AssetImage('assets/images/sheep.png')),
              SizedBox(height:50.0),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Center(
                    child:Text(
                    "Sheep",
                    style:TextStyle(
                      fontSize: 50,
                      fontFamily: 'OpenSans',
                      color: Colors.white,

                    )
                  ),
                  ),
                  SizedBox(height: 10.0),
                  Container(
                    alignment: Alignment.centerLeft,
                    // decoration: kBoxDecorationStyle,
                    child:
                      Column(
                        children: <Widget>[
                          Row(
                            children:<Widget>[
                              SizedBox(
                                width:15
                              ),
                              Text(
                                "ID/メールアドレス",
                                style:TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'OpenSans',
                                ),
                              ),
                            ]
                          ),
                          TextField(
                            keyboardType: TextInputType.emailAddress,
                            style:TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'OpenSans',
                            ),
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.only(top: 14.0),
                              prefixIcon: Icon(
                                Icons.email,
                                color: Colors.white,
                              ),
                              hintText: 'IDかメールアドレスを入力してください',
                              hintStyle: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'OpenSans',
                              ),
                            ),
                          ),
                        ],
                      )
                    ),
                  ],
              ),
              Expanded(
                  child: Column(
                    children: <Widget>[
                      RaisedButton(
                          child: const Text('ログイン'),
                          color: Colors.yellow,
                          shape: BeveledRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          onPressed: (){
                            Navigator.pop(context);
                          },
                      )
                    ],
                  )
              ),
            ],
          )
        ),
      )
    );
  }
}
