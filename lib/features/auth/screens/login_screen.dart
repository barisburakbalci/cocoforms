import 'package:cocoforms/features/auth/widgets/login_button.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: const Color.fromRGBO(44, 56, 77, 1),
        child: const Stack(
          children: [
            Positioned(
              top: -140,
              left: -100,
              child: RotatedBox(
                quarterTurns: 1,
                child: Image(
                  image: AssetImage('assets/logo.jpeg'),
                  width: 300,
                ),
              ),
            ),
            Positioned(
              top: -140,
              right: -100,
              child: RotatedBox(
                quarterTurns: 1,
                child: Image(
                  image: AssetImage('assets/logo.jpeg'),
                  width: 300,
                ),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                Stack(
                  alignment: Alignment.center,
                  children: [
                    Image(
                      image: AssetImage('assets/logo.jpeg'),
                      width: 150,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Tic',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 45,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                        Text('form',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 45,
                              fontWeight: FontWeight.w300,
                            )),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 25),
                LoginButton(),
              ],
            ),
            Positioned(
              bottom: -140,
              left: -100,
              child: RotatedBox(
                quarterTurns: 3,
                child: Image(
                  image: AssetImage('assets/logo.jpeg'),
                  width: 300,
                ),
              ),
            ),
            Positioned(
              bottom: -140,
              right: -100,
              child: RotatedBox(
                quarterTurns: 3,
                child: Image(
                  image: AssetImage('assets/logo.jpeg'),
                  width: 300,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
