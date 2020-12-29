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
                  padding: EdgeInsets.only(right: 20, top: 10),
                  child: Text(
                    "تسجيل الدخول ",
                    style: TextStyle(
                        fontSize: 35,
                        color: const Color(0xff1341a7),
                        fontWeight: FontWeight.w900),
                  )),
              Padding(
                  padding: EdgeInsets.only(right: 20, top: 1, left: 280),
                  child: Container(
                    width: 2,
                    height: 3,
                    color: Colors.yellowAccent,
                  )),
              Padding(
                  padding:
                      EdgeInsets.only(top: 10, bottom: 10, right: 20, left: 30),
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
                          suffixIcon: Icon(Icons.create,
                              color: const Color(0xff1341a7)),
                          prefixIcon: Icon(Icons.confirmation_num_outlined),
                          labelStyle: textStyle,
                          errorStyle:
                              TextStyle(color: Colors.red, fontSize: 15.0),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0))))),
              Padding(
                  padding:
                      EdgeInsets.only(top: 10, bottom: 10, right: 20, left: 30),
                  child: TextFormField(
                      keyboardType: TextInputType.visiblePassword,
                      controller: passwordController,
                      style: textStyle,
                      onSaved: (val) => _password = val,
                      obscureText: _obscureText,
                      validator: (String value) {
                        if (value.isEmpty && value.length < 6) {
                          return 'ادخل كلمة المرور    ';
                        }
                      },
                      decoration: InputDecoration(
                          suffixIcon: GestureDetector(
                            child: Icon(Icons.remove_red_eye_sharp,
                                color: const Color(0xff1341a7)),
                            onTap: () {
                              _toggle();
                            },
                          ),
                          prefixIcon: Icon(Icons.lock_outline),
                          labelText: 'كلمة المرور  ',
                          labelStyle: textStyle,
                          errorStyle:
                              TextStyle(color: Colors.red, fontSize: 15.0),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0))))),
              Padding(
                padding:
                    EdgeInsets.only(top: 10, bottom: 10, right: 20, left: 30),
                child: Row(
                  children: [
                    GestureDetector(
                      child: Text(
                        "نسيت كلمة المرور؟",
                        style: TextStyle(
                            fontSize: 20,
                            color: const Color(0xff1341a7),
                            fontWeight: FontWeight.w200),
                      ),
                      onTap: () {
                        debugPrint("نسيت كلمة المرور ");
                      },
                    ),
                    Container(width: 80,),
                    GestureDetector(
                      child: Text(
                        "ليس لديك حساب ؟",
                        style: TextStyle(
                            fontSize: 20,
                            color: const Color(0xff1341a7),
                            fontWeight: FontWeight.w200),
                      ),
                      onTap: () {
                        debugPrint("ليس لديك حساب ");
                      },
                    )
                  ],
                ),
              ),
              Padding(padding:EdgeInsets.only( right: 280, left: 30) ,child:RotationTransition(  turns: new AlwaysStoppedAnimation(180 / 360),

                child : FloatingActionButton(
                  onPressed: () {
                    debugPrint('FAB clicked');

                  },

                  child: Icon(Icons.login_rounded,color:Colors.white,),
                  backgroundColor: Colors.yellow,


                ),
              ))

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
        image: DecorationImage(
            fit: BoxFit.fill, image: AssetImage('images/header.png'))),
    child: Center(
      child: Container(
        child: image,
        width: 150,
        height: 110,
      ),
    ),
  );
}

Widget usingImg(String loction, double w, double h) {
  AssetImage assetImage = AssetImage(loction);
  Image image = Image(image: assetImage);
  return Container(
    child: image,
    width: w,
    height: h,
  );
}
