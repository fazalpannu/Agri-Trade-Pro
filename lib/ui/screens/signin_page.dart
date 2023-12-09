import 'package:flutter/material.dart';
import 'package:flutter_onboarding/constants.dart';
import 'package:flutter_onboarding/ui/root_page.dart';
import 'package:flutter_onboarding/ui/screens/forgot_password.dart';
import 'package:flutter_onboarding/ui/screens/signup_page.dart';
import 'package:flutter_onboarding/ui/screens/widgets/custom_textfield.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/get_utils/src/get_utils/get_utils.dart';
import 'package:page_transition/page_transition.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  // Default mode is "Buyer"
  int selectedModeIndex = 0; // 0 for Buyer, 1 for Seller

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset('assets/images/signin.png'),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ToggleButtons(
                      selectedColor: Colors.green, // Color for selected buttons
                      isSelected: [
                        selectedModeIndex == 0,
                        selectedModeIndex == 1,
                      ],
                      onPressed: (int newIndex) {
                        setState(() {
                          selectedModeIndex = newIndex;
                        });
                      },
                      borderWidth:
                          0, // Set border width to 0 (removes the border)
                      children: [
                        Container(
                          padding:
                              EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                          child: Text(
                            'Buyer',
                            style: TextStyle(
                              fontSize: 15.0,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        Container(
                          padding:
                              EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                          child: Text(
                            'Seller',
                            style: TextStyle(
                              fontSize: 15.0,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
                const Text(
                  'Sign In',
                  style: TextStyle(
                    fontSize: 25.0,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                CustomTextfield(
                  controller: _emailController,
                  obscureText: false,
                  hintText: 'Enter Email',
                  icon: Icons.alternate_email,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your email';
                    } else if (!value.contains('@')) {
                      return 'Please enter a valid email';
                    } else if (!GetUtils.isEmail(value)) {
                      return 'Please enter a valid email';
                    }
                    // Add email validation logic if needed
                    return null;
                  },
                ),
                Obx(
                  () => TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    controller: _passwordController,
                    obscureText: authController.isLogin.value,
                    style: TextStyle(
                      color: Constants.blackColor,
                    ),
                    decoration: InputDecoration(
                      suffixIcon: IconButton(
                        icon: authController.isLogin.value
                            ? Icon(Icons.visibility_off)
                            : Icon(Icons.visibility),
                        onPressed: () {
                          authController.isLogin.value =
                              !authController.isLogin.value;
                        },
                      ),
                      border: InputBorder.none,
                      prefixIcon: Icon(
                        Icons.password_sharp,
                        color: Constants.blackColor.withOpacity(.3),
                      ),
                      hintText: 'Enter Password',
                    ),
                    cursorColor: Constants.blackColor.withOpacity(.5),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your password';
                      } else if (value.length < 6) {
                        return 'Password must be at least 6 characters long';
                      }

                      // Add password validation logic if needed
                      return null;
                    },
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                GestureDetector(
                  onTap: () {
                    if (_formKey.currentState!.validate()) {
                      authController.loginUser(
                          _emailController.text,
                          _passwordController.text,
                          selectedModeIndex); // Form is valid, you can proceed with sign-in logic
                      // Access email and password using _emailController.text and _passwordController.text
                    }
                  },
                  child: Container(
                    width: size.width,
                    decoration: BoxDecoration(
                      color: Constants.primaryColor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 13),
                    child: Center(
                      child: Obx(() => authController.loading.value == true
                          ? const CircularProgressIndicator(
                              color: Colors.white,
                            )
                          : const Text(
                              'Sign In',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                              ),
                            )),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pushReplacement(
                        context,
                        PageTransition(
                            child: const ForgotPassword(),
                            type: PageTransitionType.bottomToTop));
                  },
                  child: Center(
                    child: Text.rich(
                      TextSpan(children: [
                        TextSpan(
                          text: 'Forgot Password? ',
                          style: TextStyle(
                            color: Constants.blackColor,
                          ),
                        ),
                        TextSpan(
                          text: 'Reset Here',
                          style: TextStyle(
                            color: Constants.primaryColor,
                          ),
                        ),
                      ]),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  children: const [
                    Expanded(child: Divider()),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: Text('OR'),
                    ),
                    Expanded(child: Divider()),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                const SizedBox(
                  height: 5,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pushReplacement(
                        context,
                        PageTransition(
                            child: const SignUp(),
                            type: PageTransitionType.bottomToTop));
                  },
                  child: Center(
                    child: Text.rich(
                      TextSpan(children: [
                        TextSpan(
                          text: 'New to Planty? ',
                          style: TextStyle(
                            color: Constants.blackColor,
                          ),
                        ),
                        TextSpan(
                          text: 'Register',
                          style: TextStyle(
                            color: Constants.primaryColor,
                          ),
                        ),
                      ]),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
