import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:cimaraites/src/pages/login/login_controller.dart';
import 'package:cimaraites/src/utils/colors.dart' as utils;

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  LoginController _con = new LoginController();

  @override
  void initState(){
    super.initState();
    print('INIT STATE');
    SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
      _con.init(context);
    });
  }
  @override
  Widget build(BuildContext context) {
    print('METODO BUILD');
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            _bannerApp(),
            _textDescription(),
            _textLogin(),
            SizedBox(height: MediaQuery.of(context).size.height * 0.17),
            _textFieldEmail(),
            _textFieldPassword(),
            _buttonLogin(),
            _textDontHaveAccount()
          ],
        ),
      ),
    );
  }

  Widget _textDontHaveAccount() {
    return GestureDetector(
      onTap: _con.goToRegisterPage,
      child: Container(
        margin: EdgeInsets.only(bottom: 50),
        child: Text(
          '¿No tienes cuentas?',
          style: TextStyle(
              fontSize: 15,
              color: Colors.grey
          ),
        ),
      ),
    );
  }

  Widget _buttonLogin() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 30, vertical: 25),
      child: ButtonApp(
        onPressed: _con.login,
        text: 'Iniciar sesion',
        color: utils.Colors.cimaraites,
        textColor: Colors.white,
      ),
    );
  }

  Widget _textFieldEmail() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 30),
      child: TextField(
        controller: _con.emailController,
        decoration: InputDecoration(
            hintText: 'correo@gmail.com',
            labelText: 'Correo electronico',
            suffixIcon: Icon(
              Icons.email_outlined,
              color: utils.Colors.cimaraites,
            )
        ),
      ),
    );
  }

  Widget _textFieldPassword() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
      child: TextField(
        obscureText: true,
        controller: _con.passwordController,
        decoration: InputDecoration(
            labelText: 'Contraseña',
            suffixIcon: Icon(
              Icons.lock_open_outlined,
              color: utils.Colors.cimaraites,
            )
        ),
      ),
    );
  }

  Widget _textDescription() {
    return Container(
      alignment: Alignment.centerLeft,
      margin: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
      child: Text(
        'Continua con tu',
        style: TextStyle(
            color: Colors.black,
            fontSize: 24,
            fontFamily: 'NimbusSans'
        ),
      ),
    );
  }

  Widget _textLogin() {
    return Container(
      alignment: Alignment.centerLeft,
      margin: EdgeInsets.symmetric(horizontal: 30),
      child: Text(
        'Login',
        style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 28
        ),
      ),
    );
  }

  Widget _bannerApp() {
    return ClipPath(
      clipper: WaveClipperTwo(),
      child: Container(
        color: utils.Colors.cimaraites,
        height: MediaQuery
            .of(context)
            .size
            .height * 0.22,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset(
              'assets/img/logo_app.png',
              width: 150,
              height: 100,
            ),
            Text(
              'Facil y Rapido',
              style: TextStyle(
                  fontFamily: 'Pacifico',
                  fontSize: 22,
                  color: Colors.white,
                  fontWeight: FontWeight.bold
              ),
            )
          ],
        ),
      ),
    );
  }
}