import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  double width;
  double height;
  Login({Key key, this.width, this.height}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool isHidden = true;
  bool loading = false;
  final formKey = GlobalKey<FormState>();
  final email_ctl = TextEditingController();
  final pass_ctl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        key: formKey,
        child: Column(
          children: [
            Container(
              width: widget.width - 70,
              child: TextFormField(
                  controller: email_ctl,
                  decoration: InputDecoration(labelText: "Email address"),
                  validator: (value) {
                    if (value.isEmpty ||
                        !RegExp(r"^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$")
                            .hasMatch(value)) {
                      return "Enter valid email!";
                    }
                  }),
            ),
            Container(
              width: widget.width - 70,
              child: TextFormField(
                controller: pass_ctl,
                obscureText: isHidden ? true : false,
                validator: (value) {
                  if (value.length < 6) return "Password at least 6 degit!";
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
                      },
                    )),
              ),
            ),
            Row(children: [
              Padding(
                  padding: EdgeInsets.only(left: 35),
                  child: TextButton(
                      onPressed: () {}, child: Text("Forget password ?")))
            ]),
            SizedBox(
              height: widget.height - 300,
            ),
            Container(
                margin: EdgeInsets.only(bottom: 20),
                width: widget.width - 70,
                height: 50,
                child: ElevatedButton(
                    style: ButtonStyle(
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30)))),
                    onPressed: () {
                      if (formKey.currentState.validate()) {
                        setState(() {
                          loading = true;
                        });
                      }
                    },
                    child: loading
                        ? CircularProgressIndicator(
                            color: Colors.white,
                          )
                        : Text(
                            "Login",
                            style: TextStyle(fontSize: 18),
                          )))
          ],
        ),
      ),
    );
  }
}
