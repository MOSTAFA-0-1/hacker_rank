import 'package:flutter/material.dart';
import 'package:hacker_rank/core/enums/textfield_enum.dart';
import 'package:hacker_rank/core/sizes/screen_size.dart';
import 'package:hacker_rank/modules/sign%20in%20&%20up/widgets/drop_down_button.dart';
import 'package:hacker_rank/modules/sign%20in%20&%20up/widgets/light_text_field.dart';
import 'package:hacker_rank/modules/sign%20in%20&%20up/widgets/radius_button.dart';

class SignUp extends StatelessWidget {
  SignUp({Key? key}) : super(key: key);

  List<TextEditingController> controllers =
      List.generate(5, (index) => TextEditingController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
          child: Column(
        children: [
          const SizedBox(
            height: 50,
          ),
          SizedBox(
            width: 180,
            height: 180,
            child: Image.asset("assets/images/logo.jpg"),
          ),
          LightTextField(
              hintText: "Username",
              icon: Icons.person_add_alt_rounded,
              textFieldStates: TextFieldStates.normal,
              textEditingController: controllers[0]),
          LightTextField(
              hintText: "Email",
              icon: Icons.email_outlined,
              textFieldStates: TextFieldStates.normal,
              textEditingController: controllers[1]),
          LightTextField(
              hintText: "Password",
              icon: Icons.lock_open,
              textFieldStates: TextFieldStates.normal,
              textEditingController: controllers[2]),
          LightTextField(
              hintText: "Faculty",
              icon: Icons.book_online,
              textFieldStates: TextFieldStates.normal,
              textEditingController: controllers[3]),
          LightTextField(
              hintText: "your year",
              icon: Icons.view_column,
              textFieldStates: TextFieldStates.normal,
              textEditingController: controllers[4]),
          MyDropDownButton(),
          Container(
            width: ScreenSize.width * .8,
            margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 30),
            child: RadiusButton(text: "SIGN UP",radius: 18,function: (){},backgroundColor: Colors.green,),
          )
        ],
      )),
    );
  }
}
