import 'package:flutter/material.dart';
import 'package:restorant/getx/auth.dart';

class Signup extends StatefulWidget {
  double width;
  double height;
  Signup({Key key, this.width, this.height}) : super(key: key);

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  bool isHidden = true;
  bool isHidden2 = true;
  bool loading = false;
  final formKey = GlobalKey<FormState>();
  final fname = TextEditingController();
  final lname = TextEditingController();
  final email = TextEditingController();
  final pass = TextEditingController();
  final repass = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // loading = false;
    return SingleChildScrollView(
        child: Form(
            key: formKey,
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              Container(
                  width: widget.width - 70,
                  child: TextFormField(
                      decoration: InputDecoration(labelText: "First name"),
                      controller: fname,
                      validator: (value) {
                        if (value.isEmpty ||
                            !RegExp("[a-zA-Z]{3,30}").hasMatch(value))
                          return "Enter correct name!";
                      })),
              Container(
                  width: widget.width - 70,
                  child: TextFormField(
                      decoration: InputDecoration(labelText: "Last name"),
                      controller: lname,
                      validator: (value) {
                        if (value.isEmpty ||
                            !RegExp("[a-zA-Z]{3,30}").hasMatch(value))
                          return "Enter correct name!";
                      })),
              Container(
                  width: widget.width - 70,
                  child: TextFormField(
                      decoration: InputDecoration(labelText: "Email address"),
                      controller: email,
                      validator: (value) {
                        if (value.isEmpty ||
                            !RegExp(r"^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$")
                                .hasMatch(value)) {
                          return "Enter valid email!";
                        }
                      })),
              Container(
                  width: widget.width - 70,
                  child: TextFormField(
                      obscureText: isHidden ? true : false,
                      controller: pass,
                      validator: (value) {
                        if (value.length < 6)
                          return "Password at least 6 degit!";
                      },
                      decoration: InputDecoration(
                          labelText: "Password",
                          suffixIcon: IconButton(
                              icon: Icon(isHidden
                                  ? Icons.visibility_off_outlined
                                  : Icons.visibility_outlined),
                              onPressed: () {
                                setState(() {
                                  isHidden = !isHidden;
                                });
                              })))),
              Container(
                  width: widget.width - 70,
                  child: TextFormField(
                      obscureText: isHidden2 ? true : false,
                      controller: repass,
                      validator: (value) {
                        if (value != repass.text) return "Dismatch password";
                      },
                      decoration: InputDecoration(
                          labelText: "Repeat Password",
                          suffixIcon: IconButton(
                              icon: Icon(isHidden2
                                  ? Icons.visibility_off_outlined
                                  : Icons.visibility_outlined),
                              onPressed: () {
                                setState(() {
                                  isHidden2 = !isHidden2;
                                });
                              })))),
              const SizedBox(height: 15),
              Container(
                margin: const EdgeInsets.only(bottom: 20),
                width: widget.width - 70,
                height: 50,
                child: StatefulBuilder(
                  builder: (BuildContext context, setState) {
                    return ElevatedButton(
                        style: ButtonStyle(
                            shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30)))),
                        onPressed: () async {
                          if (formKey.currentState.validate()) {
                            setState(() {
                              loading = true;
                            });
                            await Auth().Signup(
                                email.text.toString(),
                                pass.text.toString(),
                                fname.text.toString(),
                                lname.text.toString(),
                                context);

                            setState(() {
                              loading = false;
                            });
                          }
                        },
                        child: loading
                            ? const CircularProgressIndicator(
                                color: Colors.white,
                              )
                            : const Text("Signup",
                                style: TextStyle(fontSize: 18)));
                  },
                ),
              )
            ])));
  }
}
