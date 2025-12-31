import 'package:flutter/material.dart';
import 'package:tourn/Ui/login/login.dart';
import 'package:easy_localization/easy_localization.dart'; // Thêm gói easy_localization

class WelcomePage extends StatelessWidget {
  final bool isFirsTimeinstallApp; // Biến để kiểm tra lần đầu cài đặt ứng dụng

  const WelcomePage({super.key, required this.isFirsTimeinstallApp});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF121212),
      appBar: AppBar(
        backgroundColor: const Color(0xFF121212),
        automaticallyImplyLeading: false, // Tắt nút back mặc định
        leading: isFirsTimeinstallApp
            ? IconButton(
                // Chỉ hiển thị nút quay lại nếu là lần đầu cài đặt ứng dụng
                onPressed: () {
                  if (Navigator.canPop(context)) {
                    // Kiểm tra nếu có thể quay lại
                    Navigator.pop(context); // Thực hiện quay lại
                  }
                }, // Xử lý khi nhấn nút quay lại
                icon: const Icon(
                  Icons.arrow_back_ios_new_outlined,
                  size: 20,
                  color: Colors.white,
                ),
              )
            : null, // Nếu không phải lần đầu cài đặt, không hiển thị nút quay lại
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
        children: [_buildtitleanddesc(), _buildgetstartedbutton(context)],
      ),
    );
  }

  Widget _buildtitleanddesc() {
    return Container(
      alignment: Alignment.center,
      margin: const EdgeInsets.only(top: 110),
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            "welcome_title".tr(),
            style: const TextStyle(
              fontSize: 36,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
            maxLines: 2, // Giới hạn tối đa 2 dòng
            overflow: TextOverflow.visible, // Xử lý tràn văn bản nếu vượt quá
          ),
          const SizedBox(height: 20),
          Text(
            "welcome_desc".tr(),
            style: const TextStyle(fontSize: 18, color: Colors.white70),
            textAlign: TextAlign.center,
            maxLines: 2, // Giới hạn tối đa 2 dòng
            overflow: TextOverflow.visible, // Xử lý tràn văn bản nếu vượt quá
          ),
        ],
      ),
    );
  }

  Widget _buildgetstartedbutton(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 150),
      child: ElevatedButton(
        onPressed: () {
          // Xử lý khi nhấn nút Get Started
          _gotologinpage(context);
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF6200EE),
          padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
        child: Text(
          "getstarted".tr(),
          style: const TextStyle(fontSize: 20, color: Colors.white),
        ),
      ),
    );
  }

  void _gotologinpage(BuildContext context) {
    // Hàm chuyển đến trang chính của ứng dụng welcome_page.dart
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const loginpage()),
    );
  }
}
