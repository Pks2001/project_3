import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:fluttertoast/fluttertoast.dart';


class MyLogin extends StatefulWidget {
  const MyLogin({Key? key}) : super(key: key);

  @override
  _MyLoginState createState() => _MyLoginState();
}

class _MyLoginState extends State<MyLogin> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            // Lets add some decorations
            Positioned(
                top: 100,
                right: -50,
                child: Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                  ),
                )
            ),
            Positioned(
                top: -50,
                left: -50,
                child: Container(
                  width: 200,
                  height: 200,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),

                  ),
                )
            ),
            Positioned(
              bottom: 60,
              left: 50,
              right: 50,
              child: Column(
                children: [
                  Container(
                    width: 200,
                    height: 200,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: AssetImage('assets/images/getslogin.png'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SizedBox(height: 30,),
                  Text("Log In",style: TextStyle(color: Colors.black,fontSize: 40, fontWeight: FontWeight.bold),),
                  SizedBox(height: 40,),
                  Container(
                      margin: EdgeInsets.symmetric(vertical: 10),
                      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                      width: MediaQuery.of(context).size.width*0.8,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),

                      ),

                      child: TextField(
                        controller: usernameController,
                        cursorColor: Colors.black,
                        decoration: InputDecoration(
                            icon: Icon(Icons.person, color: Colors.blue),
                            hintText: 'Enter the username',
                            border: InputBorder.none
                        ),
                      )
                  ),
                  SizedBox(height: 20),

                  Container(
                      margin: EdgeInsets.symmetric(vertical: 10),
                      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                      width: MediaQuery.of(context).size.width*0.8,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: Colors.white.withAlpha(50)
                      ),

                      child: TextField(
                        controller: passwordController,
                        cursorColor: Colors.black,
                        decoration: InputDecoration(
                            icon: Icon(Icons.lock, color: Colors.blue),
                            hintText: 'Enter the password',
                            border: InputBorder.none
                        ),
                      )
                  ),
                  SizedBox(height: 20,),
                  // Add button
                  TextButton(
                      onPressed: () async {
                        String user = usernameController.text.trim();
                        String pass = passwordController.text.trim();
                        String apiUrl = "https://r9n3k67qqg.execute-api.ap-south-1.amazonaws.com/Prod/v1/api/Token";
                        Map<String, String> headers = {"Content-type": "application/json"};
                        String json = '{"username": "$user", "password": "$pass"}';
                        http.Response response = await http.post(Uri.parse(apiUrl), headers: headers, body: json);
                        if (response.statusCode == 200) {
                          // User authenticated massage
                          Fluttertoast.showToast(
                              msg: "User Authenticated",
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.CENTER,
                              timeInSecForIosWeb: 1,
                              backgroundColor: Colors.grey,
                              textColor: Colors.white,
                              fontSize: 16.0
                          );
                        } else {
                          // massage of invalid tests
                          Fluttertoast.showToast(
                              msg: "Invalid user, please check again",
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.CENTER,
                              timeInSecForIosWeb: 1,
                              backgroundColor: Colors.grey,
                              textColor: Colors.white,
                              fontSize: 16.0
                          );
                        }
                      },
                      child:Container(
                        height: 50,
                        width: MediaQuery.of(context).size.width*0.8,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: Colors.blue,
                        ),
                        child: Center(
                          child: Text("Log In", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
                        ),
                      )
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}