import 'package:chat_try_34/components/methods.dart';
import 'package:chat_try_34/screens/create_account.dart';
import 'package:chat_try_34/screens/home_screen.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: isLoading
          ? Center(
              child: Container(
                height: size.height / 20,
                width: size.height / 20,
                child: CircularProgressIndicator(),
              ),
            )
          : SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: size.height / 15,
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    width: size.width / 1.2,
                    child: IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.arrow_back_ios),
                    ),
                  ),
                  SizedBox(height: size.height / 50),
                  Container(
                    width: size.width / 1.2,
                    child: Text(
                      'Welcome',
                      style: TextStyle(
                        fontSize: 34,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Container(
                    width: size.width / 1.2,
                    child: Text(
                      'Sign In to contiue!',
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 25,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  SizedBox(height: size.height / 10),
                  Container(
                    width: size.width,
                    alignment: Alignment.center,
                    child: field(size, "Email", Icons.account_box, _email),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 18),
                    child: Container(
                      width: size.width,
                      alignment: Alignment.center,
                      child: field(size, 'Password', Icons.lock, _password),
                    ),
                  ),
                  SizedBox(height: size.height / 10),
                  CustomButton(size),
                  SizedBox(height: size.height / 40),
                  GestureDetector(
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: ((context) => CreateAccount()),
                      ),
                    ),
                    child: Text(
                      'Create an account',
                      style: TextStyle(
                        color: Colors.blue,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  )
                ],
              ),
            ),
    );
  }

  Widget CustomButton(Size size) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: () {
          if (_email.text.isNotEmpty && _password.text.isNotEmpty) {
            setState(() {
              isLoading = true;
            });
            login(_email.text, _password.text).then((user) {
              if (user != null) {
                print("Login Succesfull");
                setState(() {
                  isLoading = false;
                });
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: ((context) => HomeScreen()),
                  ),
                );
              } else {
                print("Login Failed");
                setState(() {
                  isLoading = false;
                });
              }
            });
          } else {
            print("Please fill form correctly");
          }
        },
        child: Container(
          height: size.height / 14,
          width: size.width / 1.2,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.blue,
          ),
          child: Text(
            "Login",
            style: TextStyle(
              color: Colors.white,
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }

  Widget field(Size size, String hintText, IconData icon,
      TextEditingController controller) {
    return Container(
      height: size.height / 14,
      width: size.width / 1.2,
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          prefixIcon: Icon(icon),
          hintText: hintText,
          hintStyle: TextStyle(color: Colors.grey),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    );
  }
}
