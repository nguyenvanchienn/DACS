import 'package:flutter/material.dart';
import 'package:tourn/Ui/welcome/welcome_page.dart';
import 'package:easy_localization/easy_localization.dart';

class menupage extends StatelessWidget {
  const menupage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false, // Tắt nút back tự động
        title: Text(
          "menu".tr(),
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        actions: [
          // Nút menu ở góc phải
          IconButton(
            onPressed: () {
              // Xử lý khi nhấn nút language
              final locale = context.locale;
              if (locale.languageCode == 'en') {
                context.setLocale(const Locale('vi'));
              } else {
                context.setLocale(const Locale('en'));
              }
            },
            icon: ClipOval(
              child: context.locale.languageCode == 'vi'
                  ? Image.asset(
                      "asset/icon/vietnam.webp",
                      width: 26,
                      height: 26,
                      fit: BoxFit.cover,
                    )
                  : Image.asset(
                      "asset/icon/english.png",
                      width: 26,
                      height: 26,
                      fit: BoxFit.cover,
                    ),
            ),
          ),
        ],
      ),

      body: Column(
        children: [_buildbuttomprofile(), _buildsignoutbutton(context)],
      ),
    );
  }

  Widget _buildbuttomprofile() {
    return Container();
  }

  Widget _buildsignoutbutton(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 150),
      child: ElevatedButton(
        onPressed: () {
          // Xử lý khi nhấn nút Get Started
          _gotosignoutpage(context);
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF6200EE),
          padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
        child: Text(
          "signout_buttom".tr(),
          style: TextStyle(fontSize: 20, color: Colors.white),
        ),
      ),
    );
  }

  void _gotosignoutpage(BuildContext context) {
    // Hàm chuyển đến trang chính của ứng dụng welcome_page.dart
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const WelcomePage(isFirsTimeinstallApp: false),
      ),
    );
  }
}
