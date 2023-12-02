import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:smartclass/controller/signup_controller.dart';
import 'package:smartclass/responsive_login/mobile/mobile_home_page.dart';
import 'package:smartclass/utils/colors.dart';
import 'package:smartclass/utils/form_field.dart';

import '../../data/user_data.dart';
import '../../utils/data_input_formatter.dart';
import '../../utils/drop_down_custom.dart';
import '../../utils/telefone_input_formatter.dart';

class MobileSignUpPage extends StatefulWidget {
  const MobileSignUpPage({super.key});

  @override
  State<MobileSignUpPage> createState() => _MobileSignUpPageState();
}

class _MobileSignUpPageState extends State<MobileSignUpPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  // TextEditingController _emailController = TextEditingController();
  // TextEditingController _passController = TextEditingController();
  // TextEditingController _nameController = TextEditingController();
  // TextEditingController _birthController = TextEditingController();
  final _scaffoldkey = GlobalKey<ScaffoldState>();

  final FocusNode _nameFocus = FocusNode();

  final FocusNode _emailFocus = FocusNode();

  final FocusNode _passFocus = FocusNode();

  final FocusNode _confirmPassFocus = FocusNode();

  final FocusNode _birthdate = FocusNode();

  final FocusNode _phone = FocusNode();

  final FirebaseFirestore fireStore = FirebaseFirestore.instance;

  SignUpController signUpController = SignUpController();

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final _nameController = TextEditingController();
  final _birthDateController = TextEditingController();
  final _phoneController = TextEditingController();

  Future<void> signUp() async {
    if (_passwordController.text.trim() ==
        _confirmPasswordController.text.trim()) {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim(),
      );
    } else {}
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    _nameController.dispose();
    _birthDateController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldkey,
        body: SingleChildScrollView(
            child: Stack(children: [
          Container(
            height: MediaQuery.of(context).size.height,
            width: double.maxFinite,
            color: constLight,
          ),
          Container(
            height: 300,
            padding: const EdgeInsets.only(bottom: 120),
            width: double.maxFinite,
            color: primaryColor,
            child: const Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 24,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: 'Smart\n',
                          style: TextStyle(
                            fontSize: 26,
                            color: constLight,
                          ),
                        ),
                        TextSpan(
                          text: 'Class',
                          style: TextStyle(
                            fontSize: 36,
                            letterSpacing: 20,
                            color: constLight,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
              child: Container(
                  margin: const EdgeInsets.only(top: 150),
                  decoration: const BoxDecoration(
                    color: constLight,
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(60),
                    ),
                  ),
                  child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 24,
                      ),
                      child: Form(
                        key: _formKey,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: 30,
                            ),
                            const Text(
                              'Cadastro',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 24.0,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Montserrat',
                              ),
                            ),
                            SizedBox(
                              height: 19,
                            ),
                            SmartClassFormFieldCustom(
                              controller: _nameController,
                              title: 'Nome',
                              focusNode: _nameFocus,
                              // onChanged: signupController.setName,
                              // errorText:
                              //     signupController.nameErrorText.value,
                              onFieldSubmitted: (name) {
                                _nameFocus.unfocus();
                                FocusScope.of(context).requestFocus(_phone);
                              },
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            SmartClassFormFieldCustom(
                              controller: _phoneController,
                              title: 'Telefone',
                              focusNode: _phone,
                              // onChanged: signupController.setPhone,
                              onFieldSubmitted: (phone) {
                                _phone.unfocus();
                                FocusScope.of(context)
                                    .requestFocus(_emailFocus);
                              },
                              // errorText:
                              //     signupController.phoneErrorText.value,
                              keyboardType: TextInputType.phone,
                              inputFormatters: [
                                FilteringTextInputFormatter.digitsOnly,
                                TelefoneInputFormatter()
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            SmartClassFormFieldCustom(
                              controller: _emailController,
                              title: 'E-mail',
                              focusNode: _emailFocus,
                              textCapitalization: TextCapitalization.none,
                              // onChanged: signupController.setEmail,
                              keyboardType: TextInputType.emailAddress,
                              // errorText:
                              //     signupController.emailErrorText.value,
                              onFieldSubmitted: (email) {
                                _emailFocus.unfocus();
                                FocusScope.of(context).requestFocus(_birthdate);
                              },
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            SmartClassFormFieldCustom(
                              controller: _birthDateController,
                              title: 'Data de nascimento',
                              // onChanged: signupController.setBirth,
                              focusNode: _birthdate,
                              keyboardType:
                                  const TextInputType.numberWithOptions(
                                decimal: true,
                              ),
                              inputFormatters: [
                                FilteringTextInputFormatter.digitsOnly,
                                DataInputFormatter()
                              ],
                              onFieldSubmitted: (birth) {
                                _birthdate.unfocus();
                                FocusScope.of(context).requestFocus(_passFocus);
                              },
                              // errorText:
                              //     signupController.birthErrorText.value,
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            SmartClassFormFieldCustom(
                              controller: _passwordController,
                              title: 'Senha (mínimo 6 caracteres)',
                              // onChanged: signupController.setPass,
                              focusNode: _passFocus,
                              obscureText: true,
                              // errorText:
                              //     signupController.passErrorText.value,
                              onFieldSubmitted: (pass) {
                                _passFocus.unfocus();
                                FocusScope.of(context)
                                    .requestFocus(_confirmPassFocus);
                              },
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            SmartClassFormFieldCustom(
                              controller: _confirmPasswordController,
                              title: 'Repita a senha',
                              // onChanged: signupController.setPassConfirm,
                              focusNode: _confirmPassFocus,
                              obscureText: true,
                              // errorText: signupController
                              //     .passConfirmErrorText.value,
                              validator: (text) {},
                              onFieldSubmitted: (confirmPass) {
                                _confirmPassFocus.unfocus();
                              },
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            const SizedBox(
                              height: 40,
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.05,
                              width: MediaQuery.of(context).size.width * 0.4,
                              child: ElevatedButton(
                                style: ButtonStyle(
                                  shape: MaterialStateProperty.all(
                                    RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(26),
                                    ),
                                  ),
                                  backgroundColor:
                                      MaterialStateProperty.all<Color>(
                                    Theme.of(context).primaryColor,
                                  ),
                                ),
                                onPressed: () {
                                  signUp();
                                },
                                child: Text(
                                  'Criar Conta',
                                  style: TextStyle(
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            TextButton(
                              onPressed: () {},
                              child: Text(
                                'Já possui uma conta?',
                                style: TextStyle(
                                  color: Theme.of(context).primaryColor,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ))))
        ])));
  }
}
