
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
// import 'package:untitled/firebase_auth.dart';
// import 'package:untitled/signup.dart';


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
                        // Get the email and password from the text fields
                        String username = usernameController.text.trim();
                        String password = passwordController.text.trim();

                        // Send a POST request to the API endpoint with the email and password
                        String apiUrl = "https://r9n3k67qqg.execute-api.ap-south-1.amazonaws.com/Prod/v1/api/Token";
                        Map<String, String> headers = {"Content-type": "application/json"};
                        String json = '{"username": "$username", "password": "$password"}';
                        http.Response response = await http.post(Uri.parse(apiUrl), headers: headers, body: json);

                        // Check the response from the API
                        if (response.statusCode == 200) {
                          // The user is authenticated
                          print("User authenticated!");
                        } else {
                          // There was an error with the API
                          print("Error: ${response.reasonPhrase}");
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
