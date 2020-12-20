import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:interiori/style/color.dart';

class RoundedButton extends StatelessWidget {
  final String text;
  final Function press;
  final Color color, textColor;
  const RoundedButton({
    Key key,
    this.text,
    this.press,
    this.color = primaryColor,
    this.textColor = Colors.white,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      width: size.width * 0.8,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(29),
        child: FlatButton(
          padding: EdgeInsets.symmetric(vertical: 20, horizontal: 40),
          color: color,
          onPressed: press,
          child: Text(
            text,
            style: TextStyle(color: textColor),
          ),
        ),
      ),
    );
  }
}

class RoundedInputField extends StatelessWidget {
  final String hintText;
  final IconData icon;
  final Color bgColor;
  final ValueChanged<String> onChanged;
  final TextEditingController controller;

  const RoundedInputField({
    Key key,
    this.hintText,
    this.icon = Icons.person,
    this.bgColor = primaryLightColor,
    this.onChanged,
    this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      width: size.width * 0.8,
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(29),
      ),
      child: TextField(
        onChanged: onChanged,
        cursorColor: primaryColor,
        controller: controller,
        decoration: InputDecoration(
          icon: Icon(
            icon,
            color: primaryColor,
          ),
          hintText: hintText,
          border: InputBorder.none,
        ),
      ),
    );
  }
}

class TextFieldContainer extends StatelessWidget {
  final Widget child;
  const TextFieldContainer({
    Key key,
    this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      width: size.width * 0.8,
      decoration: BoxDecoration(
        color: primaryLightColor,
        borderRadius: BorderRadius.circular(29),
      ),
      child: child,
    );
  }
}

class RoundedPasswordField extends StatelessWidget {
  final ValueChanged<String> onChanged;
  final Function onTap;
  final IconData icon;
  final Color iconColor;
  final bool obscureText;
  final TextEditingController controller;
  const RoundedPasswordField({
    Key key,
    this.onChanged,
    this.onTap,
    this.icon,
    this.iconColor,
    this.obscureText = true,
    this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextField(
        controller: controller,
        obscureText: obscureText,
        onChanged: onChanged,
        cursorColor: primaryColor,
        decoration: InputDecoration(
          hintText: "Password",
          icon: Icon(
            Icons.lock,
            color: primaryColor,
          ),
          suffixIcon: GestureDetector(
            onTap: onTap,
            child: Icon(
              icon,
              color: iconColor,
            ),
          ),
          border: InputBorder.none,
        ),
      ),
    );
  }
}

class MenuCard extends StatelessWidget {
  final String image;
  final String title;
  const MenuCard({
    Key key,
    this.image,
    this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.width * 0.40,
      width: MediaQuery.of(context).size.width * 0.4,
      padding: EdgeInsets.only(left: 23, right: 23, top: 24, bottom: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            offset: Offset(1, 1),
            blurRadius: 8,
            color: Colors.black.withOpacity(.2),
          ),
        ],
      ),
      child: Column(
        children: <Widget>[
          SizedBox(
            height: MediaQuery.of(context).size.width * 0.20,
            width: MediaQuery.of(context).size.width * 0.20,
            child: SvgPicture.asset(
              image,
            ),
          ),
          SizedBox(
            height: 16,
          ),
          Text(
            title,
            // textAlign: TextAlign.center,
            style: TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }
}
