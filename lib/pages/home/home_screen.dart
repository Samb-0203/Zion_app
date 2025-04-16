import 'package:flutter/material.dart';

class ZionHomeScreen extends StatefulWidget {
  const ZionHomeScreen({super.key});

  @override
  State<ZionHomeScreen> createState() => _ZionHomeScreenState();
}

class _ZionHomeScreenState extends State<ZionHomeScreen> {
  @override
  Widget build(BuildContext context) {
    final deviceHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/bg3.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.black.withOpacity(0.6),
          ),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(height: deviceHeight * 0.15),
                  Text(
                    'Today\'s Word for You',
                    style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 25),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 20.0),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      '“For I know the plans I have for you,” declares the Lord, '
                      '“plans to prosper you and not to harm you, plans to give you hope and a future.”',
                      style:
                          Theme.of(context).textTheme.headlineSmall?.copyWith(
                                color: Colors.white,
                              ),
                      textAlign: TextAlign.justify,
                    ),
                  ),
                  const SizedBox(height: 9.0),
                  Text(
                    '— Jeremiah 29:11',
                    style: Theme.of(context).textTheme.headlineSmall,
                    textAlign: TextAlign.right,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
