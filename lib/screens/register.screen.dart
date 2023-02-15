import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoapp/providers/auth.provider.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage('images/register.png'), fit: BoxFit.cover),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
          children: [
            Container(
              padding: const EdgeInsets.only(left: 35, top: 100),
              child: const Text(
                'Register\nTodo App JSE',
                style: TextStyle(color: Colors.white, fontSize: 30),
              ),
            ),
            SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.35,
                  left: 35,
                  right: 35,
                ),
                child: Column(
                  children: [
                    TextField(
                      controller: nameController,
                      decoration: InputDecoration(
                        hintText: 'Name',
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
                      controller: emailController,
                      decoration: InputDecoration(
                        hintText: 'Email',
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
                          'Register',
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
                                    // Navigator.pushNamed(context, 'home');
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
                              Navigator.of(context).pop();
                            },
                            child: Row(
                              children: const [
                                Icon(
                                  Icons.arrow_back,
                                  size: 25,
                                  color: Color(0xff4c505b),
                                ),
                                Text(
                                  'Back To Login',
                                  style: TextStyle(
                                    color: Color(0xff4c505b),
                                    fontSize: 20,
                                    fontWeight: FontWeight.w700,
                                  ),
                                )
                              ],
                            )
                            // child: const Text(
                            //   'Back To Login',
                            //   style: TextStyle(
                            //     color: Color(0xff4c505b),
                            //     fontSize: 20,
                            //     fontWeight: FontWeight.w700,
                            //   ),
                            // ),
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
