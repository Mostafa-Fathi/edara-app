import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'Flutter Demo',
    home: Scaffold(
      body: MyHomePage(),
    ),
  ));
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool _obscureText = true;

  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }
  var _formKey = GlobalKey<FormState>();
  TextEditingController userNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    TextStyle textStyle = Theme.of(context).textTheme.title;
    MediaQueryData queryData;
    queryData = MediaQuery.of(context);
    double s = queryData.size.width;
    debugPrint("$s");
    String _password;


    return Form(

      key: _formKey,
        child: Directionality(
          textDirection: TextDirection.rtl,

          child: ListView(
            children: [
              logo(s),
              Padding(
                  padding: EdgeInsets.only(right: 30, top: 20),
                  child: Text(
                    "تسجيل الدخول ",
                    style: TextStyle(
                        fontSize: 35,
                        color: const Color(0xff1341a7),
                        fontWeight: FontWeight.w900),
                  )),
            usingImg("images/line.png", 20, 5),

              Padding(
                  padding: EdgeInsets.only(
                      top: 10, bottom: 10 ,right: 30,left: 30),
                  child: TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      controller: userNameController,
                      style: textStyle,
                      validator: (String value) {
                        if (value.isEmpty) {
                          return 'ادخل اسم المستخدم ';
                        }
                      },
                      decoration: InputDecoration(
                          labelText: 'اسم المستخدم ',
                          labelStyle: textStyle,
                          errorStyle:
                          TextStyle(color: Colors.red, fontSize: 15.0),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0))))),
              Padding(
                  padding: EdgeInsets.only(
                      top: 10, bottom: 10 ,right: 30,left: 30),
                  child: TextFormField(
                      keyboardType: TextInputType.visiblePassword,
                      controller: passwordController,
                      style: textStyle,
                      onSaved: (val) => _password = val,
                      obscureText: _obscureText,
                      validator: (String value) {
                        if (value.isEmpty&&value.length<6) {
                          return 'كلمة المرور ضعيفه   ';
                        }
                      },
                      decoration: InputDecoration(
                          icon: const Padding(
                              padding: const EdgeInsets.only(top: 15.0),
                              child: const Icon(Icons.lock)),
                          labelText: 'كلمة المرور  ',
                          labelStyle: textStyle,
                          errorStyle:
                          TextStyle(color: Colors.red, fontSize: 15.0),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0))))),
              new FlatButton(
                  onPressed: _toggle,
                  child: new Text(_obscureText ? "Show" : "Hide")),

            ],
          ),
        ));
  }
}

Widget logo(double c) {
  AssetImage assetImage = AssetImage('images/brand.png');
  Image image = Image(image: assetImage);
  return Container(
    height: 250,
    width: c,
    decoration: BoxDecoration(
        image: DecorationImage(image: AssetImage('images/header.png'))),
    child: Center(
      child: Container(
        child: image,
        width: 150,
        height: 110,
      ),
    ),
  );
}
Widget usingImg(String loction ,double w,double h) {
  AssetImage assetImage = AssetImage(loction);
  Image image = Image(image: assetImage);
  return Container(
    child: image,
    width: w,
    height: h,
  );
}