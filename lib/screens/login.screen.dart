import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoapp/providers/auth.provider.dart';
import 'package:todoapp/screens/register.screen.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);

    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage('images/login.png'), fit: BoxFit.cover),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
          children: [
            Container(
              padding: const EdgeInsets.only(left: 35, top: 100),
              child: const Text(
                'JS Engine\nTodo App',
                style: TextStyle(color: Colors.white, fontSize: 30),
              ),
            ),
            SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.45,
                  left: 35,
                  right: 35,
                ),
                child: Column(
                  children: [
                    TextField(
                      controller: emailController,
                      decoration: InputDecoration(
                        hintText: 'Email / Phone',
                        fillColor: Colors.grey.shade100,
                        filled: true,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextField(
                      controller: passwordController,
                      obscureText: true,
                      decoration: InputDecoration(
                        hintText: 'Password',
                        fillColor: Colors.grey.shade100,
                        filled: true,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Sign In',
                          style: TextStyle(
                            color: Color(0xff4c505b),
                            fontSize: 27,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        CircleAvatar(
                          radius: 30,
                          backgroundColor: const Color(0xff4c505b),
                          child: authProvider.loading
                              ? const CircularProgressIndicator(
                                  color: Colors.white,
                                )
                              : IconButton(
                                  color: Colors.white,
                                  icon: const Icon(Icons.arrow_forward),
                                  onPressed: () async {
                                    // Navigator.of(context).push(MaterialPageRoute(
                                    //     builder: (context) => RootPage()));
                                    // Navigator.pushNamed(context, 'home');
                                    var response = await authProvider.login(
                                      emailController.text.toString(),
                                      passwordController.text.toString(),
                                    );
                                    if (response == true) {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(const SnackBar(
                                        content: Text("Logged In"),
                                        duration: Duration(milliseconds: 3000),
                                      ));
                                      Navigator.pushNamed(context, 'home');
                                    } else {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(const SnackBar(
                                        content: Text("Login Error"),
                                        duration: Duration(milliseconds: 3000),
                                      ));
                                    }
                                  },
                                ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        InkWell(
                          onTap: () {
                            // Navigator.pushNamed(context, 'register');
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => const RegisterPage()));
                          },
                          child: const Text(
                            'Register',
                            style: TextStyle(
                              color: Color(0xff4c505b),
                              fontSize: 20,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
