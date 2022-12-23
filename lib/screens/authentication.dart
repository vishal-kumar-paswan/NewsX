import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_feed/constants.dart';
import 'package:news_feed/screens/news_feed.dart';
import 'package:tab_indicator_styler/tab_indicator_styler.dart';

class AuthenticationScreen extends StatefulWidget {
  const AuthenticationScreen({super.key});

  @override
  State<AuthenticationScreen> createState() => _AuthenticationScreenState();
}

class _AuthenticationScreenState extends State<AuthenticationScreen>
    with SingleTickerProviderStateMixin {
  TabController? tabController;

  TextStyle tabIsSelected =
      TextStyle(fontSize: 18, color: Colors.grey.shade800);
  TextStyle tabIsNotSelected =
      const TextStyle(fontSize: 18, color: Colors.white70);

  bool isChecked = false;

  @override
  void initState() {
    tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // using size to define the containers height / width
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      extendBodyBehindAppBar: true,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text(
          'NewsX',
          style: TextStyle(fontSize: 23),
        ),
        backgroundColor: Colors.redAccent,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(25),
          ),
        ),
        elevation: 0.0,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(55),
          child: Container(
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(25),
                bottomRight: Radius.circular(25),
              ),
              color: Colors.white,
            ),
            child: TabBar(
              controller: tabController,
              tabs: [
                Tab(
                  child: Text(
                    'Login',
                    style: Constants.tabBarTextStyle,
                  ),
                ),
                Tab(
                  child: Text(
                    'Sign up',
                    style: Constants.tabBarTextStyle,
                  ),
                ),
              ],
              indicator: RectangularIndicator(
                color: Colors.redAccent,
                topLeftRadius: 0.0,
                topRightRadius: 0.0,
                bottomLeftRadius: 25,
                bottomRightRadius: 25,
                paintingStyle: PaintingStyle.fill,
              ),
            ),
          ),
        ),
      ),
      body: TabBarView(
        controller: tabController,
        children: [
          loginBody(size),
          signupBody(size),
        ],
      ),
    );
  }

  Widget loginBody(Size size) => Container(
        color: Colors.grey.shade300,
        height: double.infinity,
        width: double.infinity,
        child: Stack(
          fit: StackFit.expand,
          children: [
            Align(
              alignment: const Alignment(0, 0.28),
              child: Container(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(18),
                  ),
                  color: Colors.white,
                ),
                height: size.height * 0.68,
                width: size.width * 0.90,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 25.0,
                    vertical: 25.0,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const Text(
                        'Sign in\ninto your account',
                        style: TextStyle(
                          color: Colors.redAccent,
                          fontSize: 30,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      TextField(
                        decoration: const InputDecoration(
                          labelText: 'Email',
                          suffixIcon: Icon(
                            CupertinoIcons.mail_solid,
                            color: Colors.redAccent,
                            size: 22,
                          ),
                          labelStyle: TextStyle(
                            color: Colors.redAccent,
                            fontSize: 18,
                          ),
                        ),
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.grey.shade900,
                        ),
                      ),
                      TextField(
                        obscureText: true,
                        decoration: const InputDecoration(
                          labelText: 'Password',
                          suffixIcon: Icon(
                            CupertinoIcons.lock_fill,
                            color: Colors.redAccent,
                            size: 22,
                          ),
                          labelStyle: TextStyle(
                            color: Colors.redAccent,
                            fontSize: 18,
                          ),
                        ),
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.grey.shade900,
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: TextButton(
                          onPressed: () {},
                          child: const Text(
                            'Forgot Password?',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.redAccent,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      const Align(
                        alignment: Alignment.center,
                        child: Text(
                          'Login with',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          InkWell(
                            child: Container(
                              decoration: BoxDecoration(
                                border: Border.all(
                                  width: 0.6,
                                ),
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: Image.asset(
                                'assets/icons/google.png',
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 15,
                          ),
                          InkWell(
                            child: Container(
                              decoration: BoxDecoration(
                                border: Border.all(
                                  width: 0.6,
                                ),
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: Image.asset(
                                'assets/icons/facebook.png',
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'Don\'t have an account?',
                            style: TextStyle(fontSize: 16),
                          ),
                          TextButton(
                            onPressed: () {},
                            child: const Text(
                              'Register Now',
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.redAccent,
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
            Align(
              alignment: const Alignment(0, 1),
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.redAccent,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(25),
                    topRight: Radius.circular(25),
                  ),
                ),
                height: size.height * 0.08,
                width: double.infinity,
                child: InkWell(
                  onTap: (() {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const NewsFeed()),
                    );
                  }),
                  child: const Center(
                      child: Text(
                    'LOGIN',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                    ),
                  )),
                ),
              ),
            )
          ],
        ),
      );

  Widget signupBody(Size size) => Container(
        color: Colors.grey.shade300,
        height: double.infinity,
        width: double.infinity,
        child: Stack(
          fit: StackFit.expand,
          children: [
            Align(
              alignment: const Alignment(0, 0.28),
              child: Container(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(18),
                  ),
                  color: Colors.white,
                ),
                height: size.height * 0.68,
                width: size.width * 0.90,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 25.0,
                    vertical: 25.0,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const Text(
                        'Create\nan account',
                        style: TextStyle(
                          color: Colors.redAccent,
                          fontSize: 30,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      TextField(
                        decoration: const InputDecoration(
                          labelText: 'Name',
                          suffixIcon: Icon(
                            CupertinoIcons.person_solid,
                            color: Colors.redAccent,
                            size: 22,
                          ),
                          labelStyle: TextStyle(
                            color: Colors.redAccent,
                            fontSize: 18,
                          ),
                        ),
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.grey.shade900,
                        ),
                      ),
                      TextField(
                        keyboardType: TextInputType.emailAddress,
                        decoration: const InputDecoration(
                          labelText: 'Email',
                          suffixIcon: Icon(
                            CupertinoIcons.mail_solid,
                            color: Colors.redAccent,
                            size: 22,
                          ),
                          labelStyle: TextStyle(
                            color: Colors.redAccent,
                            fontSize: 18,
                          ),
                        ),
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.grey.shade900,
                        ),
                      ),
                      TextField(
                        keyboardType: TextInputType.phone,
                        decoration: const InputDecoration(
                          labelText: 'Contact number',
                          suffixIcon: Icon(
                            CupertinoIcons.phone_solid,
                            color: Colors.redAccent,
                            size: 22,
                          ),
                          labelStyle: TextStyle(
                            color: Colors.redAccent,
                            fontSize: 18,
                          ),
                        ),
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.grey.shade900,
                        ),
                      ),
                      TextField(
                        decoration: const InputDecoration(
                          labelText: 'Password',
                          suffixIcon: Icon(
                            CupertinoIcons.lock_fill,
                            color: Colors.redAccent,
                            size: 22,
                          ),
                          labelStyle: TextStyle(
                            color: Colors.redAccent,
                            fontSize: 18,
                          ),
                        ),
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.grey.shade900,
                        ),
                        obscureText: true,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Checkbox(
                            activeColor: Colors.redAccent,
                            value: isChecked,
                            onChanged: (newValue) {
                              setState(() {
                                isChecked = newValue!;
                              });
                            },
                          ),
                          const Text(
                            'I agree with',
                            style: TextStyle(fontSize: 16),
                          ),
                          TextButton(
                            onPressed: () {},
                            child: const Text(
                              'terms and conditions',
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.redAccent,
                                decoration: TextDecoration.underline,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'Already have an account?',
                            style: TextStyle(fontSize: 17),
                          ),
                          TextButton(
                            onPressed: () {},
                            child: const Text(
                              'Sign In',
                              style: TextStyle(
                                fontSize: 17,
                                color: Colors.redAccent,
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
            Align(
              alignment: const Alignment(0, 1),
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.redAccent,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(25),
                    topRight: Radius.circular(25),
                  ),
                ),
                height: size.height * 0.08,
                width: double.infinity,
                child: InkWell(
                  onTap: (() {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const NewsFeed()),
                    );
                  }),
                  child: const Center(
                      child: Text(
                    'REGISTER',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                    ),
                  )),
                ),
              ),
            )
          ],
        ),
      );
}
