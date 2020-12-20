import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:interiori/controller/login_controller.dart';
import 'package:interiori/style/color.dart';
import 'package:interiori/style/component.dart';
import 'package:interiori/utils/shared_preferences_manager.dart';
import 'package:interiori/view/login_page.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  SharedPreferencesManager prefs = SharedPreferencesManager();
  LoginController loginController = Get.put(LoginController());

  TextEditingController fullnameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  List<DropdownMenuItem<ListItem>> buildDropDownMenuItems(List listItems) {
    List<DropdownMenuItem<ListItem>> items = List();
    for (ListItem listItem in listItems) {
      items.add(
        DropdownMenuItem(
          child: Text(listItem.name),
          value: listItem,
        ),
      );
    }
    return items;
  }

  List<DropdownMenuItem<ListItem>> _dropdownMenuItems;
  ListItem _selectedItem;
  List<ListItem> _dropdownItems = [];

  void initState() {
    super.initState();

    _dropdownItems.add(new ListItem(1, 'User'));
    _dropdownItems.add(new ListItem(2, 'Designer'));

    _dropdownMenuItems = buildDropDownMenuItems(_dropdownItems);
    // _selectedItem = _dropdownMenuItems[0].value;
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle(
          systemNavigationBarColor: Color(0xFF000000),
          systemNavigationBarDividerColor: null,
          statusBarColor: Color(0x00000000),
          systemNavigationBarIconBrightness: Brightness.light,
          statusBarIconBrightness: Brightness.dark,
          statusBarBrightness: Brightness.light,
        ),
        child: Scaffold(
          body: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 36,
                  ),
                  Center(
                      child: Text(
                    'SIGNUP',
                    style: TextStyle(fontSize: 17),
                  )),
                  SizedBox(
                    height: 40,
                  ),
                  Center(child: Image.asset('assets/images/signup.png')),
                  SizedBox(
                    height: 51,
                  ),
                  RoundedInputField(
                    controller: fullnameController,
                    hintText: "Fullname",
                    icon: Icons.face,
                    onChanged: (value) {},
                  ),
                  RoundedInputField(
                    controller: usernameController,
                    hintText: "Username",
                    icon: Icons.account_circle_rounded,
                    onChanged: (value) {},
                  ),
                  RoundedInputField(
                    controller: emailController,
                    hintText: "Email",
                    onChanged: (value) {},
                  ),
                  Obx(() {
                    return RoundedPasswordField(
                        controller: passwordController,
                        onTap: () {
                          loginController.togglePasswordVisibility();
                        },
                        iconColor: loginController.isHidePassword.value
                            ? Colors.grey
                            : primaryColor,
                        icon: loginController.isHidePassword.value
                            ? Icons.visibility_off
                            : Icons.visibility,
                        onChanged: (value) {},
                        obscureText: loginController.isHidePassword.value);
                  }),
                  TextFieldContainer(
                    child: DropdownButton<ListItem>(
                        hint: Text('Choose your role'),
                        value: _selectedItem,
                        items: _dropdownMenuItems,
                        isExpanded: true,
                        icon: Icon(Icons.arrow_drop_down_rounded),
                        underline: SizedBox(),
                        onChanged: (newValue) {
                          loginController.role.value = newValue.value;
                          setState(() {
                            _selectedItem = newValue;
                          });
                        }),
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Obx(() {
                    return Visibility(
                      visible: loginController.isLoading.value,
                      child: Column(
                        children: [
                          Center(
                            child: CircularProgressIndicator(),
                          ),
                          SizedBox(
                            height: 12,
                          ),
                        ],
                      ),
                    );
                  }),
                  RoundedButton(
                    text: "SIGNUP",
                    press: () {
                      String fullname = fullnameController.text;
                      String username = usernameController.text;
                      String email = emailController.text;
                      String pass = passwordController.text;
                      String role = _selectedItem.name.toLowerCase();

                      if (fullname != '' &&
                          username != '' &&
                          email != '' &&
                          pass != '' &&
                          role != '') {
                        loginController.postSignup(
                            fullname, username, email, pass, role);
                      } else {
                        Get.snackbar('Oops', 'All fields are required',
                            snackPosition: SnackPosition.BOTTOM,
                            margin: EdgeInsets.only(bottom: 5));
                      }
                    },
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.off(LoginPage());
                    },
                    child: Text(
                      'Already have an Account ? Login',
                      style: TextStyle(color: primaryColor),
                    ),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}

class ListItem {
  int value;
  String name;

  ListItem(this.value, this.name);
}
