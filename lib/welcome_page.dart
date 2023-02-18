import 'package:flutter/material.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(40),

                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black
                  ),
                  child: Text(
                      'Sign Out',
                      style :TextStyle(
                        color : Colors.white,
                      )
                  ),

                ),
              ),
            ),
          ],
        )
    );
  }
}
