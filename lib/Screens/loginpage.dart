import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loginpage/Utilities/routes.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {


  String name="";
  bool changed =false;
  final _formkey = GlobalKey<FormState>();

  void moveToHome(BuildContext context) async
  {
    if(_formkey.currentState!.validate()) {
      setState(() {
        changed = true;
      });
      await Future.delayed(Duration(seconds: 1));
      await Navigator.pushNamed(context, MyRoutes.Home);
      setState(() {
        changed = false;
      });
    }
  }
  @override
  void initState() {

  }
  @override
  Widget build(BuildContext context) {

    return SafeArea(
      child: MaterialApp(
        color: Colors.white,
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          body: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 30,
                ),
                Center(
                  child: Text(
                    "Welcome $name",
                    style: TextStyle(
                      fontSize: 24.0,
                      fontFamily: GoogleFonts.alatsi().fontFamily,
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Image.asset("images/login_page.png", fit: BoxFit.fill),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Form(
                    key: _formkey,
                    child: Column(
                      children: [
                        TextFormField(
                          onTap: (){

                          },
                          validator: (value){
                            if(value!.isEmpty)
                              {
                                return "Username cannot be Empty";
                              }
                            else
                              {
                                return null;
                              }
                          },
                          decoration: InputDecoration(
                            labelText: "$name",
                            hintText: "Enter Username",

                          ),
                          onChanged: (value){
                            setState((){
                              name=value;
                            });
                          },
                        ),
                        SizedBox(
                          height: 30.0,
                        ),
                        TextFormField(
                          obscureText: true,
                          validator: (value){
                            if(value!.isEmpty)
                              {
                                return "Password cannot be empty";
                              }
                            if(value.length<8)
                              {
                                return "Password length should be atleast 8";
                              }
                            else
                              {
                                return null;
                              }
                          },
                          decoration: InputDecoration(
                            hintText: "Enter Password",
                          ),
                        ),
                        SizedBox(
                          height: 40.0,
                        ),
                        InkWell(
                          onTap: () => moveToHome(context),
                          child: AnimatedContainer(
                            duration: Duration(seconds: 1),
                            height:   35 ,
                            width: changed? 35 :120,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: Colors.blue,
                              borderRadius: BorderRadius.circular(changed ? 50
                                  :10)
                            ),
                            child: changed ? Icon(Icons.check, color: Colors.white,)
                                :Text("Login",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                              fontSize: 20.0,
                                color: Colors.white,
                                fontWeight: FontWeight.bold
                            ),),
                            ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }


}
