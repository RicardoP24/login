import 'package:amazon_clone/common/widgets/custom_button.dart';
import 'package:amazon_clone/common/widgets/custom_textfield.dart';
import 'package:amazon_clone/constants/global_variables.dart';
import 'package:amazon_clone/features/auth/services/auth_service.dart';
import 'package:flutter/material.dart';

class AuthScreen extends StatefulWidget {
  static const String routeName="/auth_screen";
  const AuthScreen({Key? key}) : super(key: key);

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}
enum Auth{
  signin,
  signup
}
class _AuthScreenState extends State<AuthScreen> {
Auth _auth=Auth.signup;
final _signInFormKey=GlobalKey<FormState>();
final _signUpFormKey=GlobalKey<FormState>();
final AuthService authService= AuthService();
final TextEditingController _nameController=TextEditingController();
final TextEditingController _emailController=TextEditingController();
final TextEditingController _passwordController=TextEditingController();


@override
  void dispose() {
  super.dispose();
  _emailController.dispose();
  _nameController.dispose();
  _passwordController.dispose();

  }

  void signUpUser(){
    authService.signUpUser(context: context, email: _emailController.text, password: _passwordController.text, name: _nameController.text);
  }

void signInUser(){
  authService.signInUser(context: context, email: _emailController.text, password: _passwordController.text);
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
         body:  SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                   Text("Welcome",
                       style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500)),

                  ListTile(
                    title: const Text('create account',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    leading: Radio(
                      activeColor: GlobalVariables.secondaryColor,
                      value: Auth.signup,
                      groupValue: _auth,
                      onChanged: (Auth? value) {
                        setState(() {
                          _auth=value!;
                        });
                      },

                    ),
                  ),

                  if (_auth==Auth.signup) Container(
                    padding: const EdgeInsets.all(8),
                    color: GlobalVariables.backgroundColor,
                    child: Form(
                        key: _signUpFormKey,
                        child:
                        Column(
                          children: [
                            CustomTextField(controller: _nameController,hintText: "Nome"),
                            SizedBox(height: 10,),
                            CustomTextField(controller: _emailController,hintText: "Email"),
                            SizedBox(height: 10,),
                            CustomTextField(controller: _passwordController,hintText: "Password"),
                            SizedBox(height: 10,),

                            CustomButton(text: "Sign up",onTap: (){
                              if(_signUpFormKey.currentState!.validate()){
                                signUpUser();
                              }
                            })
                          ],
                        )
                    ),
                  )  else
                    Container(
                      padding: const EdgeInsets.all(8),
                      color: GlobalVariables.backgroundColor,
                      child: Form(
                          key: _signInFormKey,
                          child:
                          Column(
                            children: [
                              CustomTextField(controller: _emailController,hintText: "Email"),
                              SizedBox(height: 10,),
                              CustomTextField(controller: _passwordController,hintText: "Password"),
                              SizedBox(height: 10,),
                              CustomButton(text: "Sign in",onTap: (){
                                  if(_signInFormKey.currentState!.validate()){
                                      signInUser();
                                  }
                              })

                            ],
                          )
                      ),
                    ),

                  ListTile(
                    title: const Text('Login',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    leading: Radio(
                      activeColor: GlobalVariables.secondaryColor,
                      value: Auth.signin,
                      groupValue: _auth,
                      onChanged: (Auth? value) {
                        setState(() {
                          _auth=value!;
                        });
                      },

                    ),
                  )

                ],
              ),
            ))
    );
  }
}
