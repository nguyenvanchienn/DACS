import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tourn/Ui/onboarding/onboarding_page_view.dart';
import 'package:tourn/Ui/welcome/welcome_page.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  Future<void> checkappstatus(BuildContext context) async {
    // Hàm giả lập kiểm tra trạng thái ứng dụng
    final iscomplete = await isonboardingcompleted();
    if (iscomplete) {
      // Nếu đã hoàn thành onboarding, chuyển đến trang chào mừng
      if (!context.mounted) return; // Kiểm tra xem context còn hợp lệ không
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => WelcomePage(isFirsTimeinstallApp: false),
        ), // Truyền tham số isFirsTimeinstallApp là false
      );
    } else {
      // Nếu chưa hoàn thành onboarding, chuyển đến trang onboarding
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => onboardingpageview()),
      );
    }
  }

  Future<bool> isonboardingcompleted() async {
    // Hàm giả lập khởi tạo ứng dụng
    try {
      // Giả lập việc lấy trạng thái từ bộ nhớ hoặc cơ sở dữ liệu
      final SharedPreferences prefs =
          await SharedPreferences.getInstance(); // Lấy instance của SharedPreferences
      final result = prefs.getBool(
        'konboardingcompleted',
      ); // Lấy trạng thái hoàn thành onboarding
      return result ?? false; // Trả về kết quả
    } catch (e) {
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    checkappstatus(context);
    // Kiểm tra trạng thái ứng dụng khi xây dựng giao diện
    return Scaffold(
      backgroundColor: const Color(0xFF121212),
      body: SafeArea(
        // SafeArea để tránh các khu vực không an toàn trên
        child: _buildbodypage(), // Gọi phương thức xây dựng nội dung chính
      ),
    );
  }

  Widget _buildbodypage() {
    return Center(
      child: Container(
        color: const Color.fromARGB(255, 27, 40, 129),
        child: Column(
          mainAxisSize: MainAxisSize.min, // Cột chỉ chiếm không gian cần thiết
          children: [
            _buildiconpage(), // Gọi phương thức xây dựng hình ảnh logo
            const SizedBox(height: 20), // Khoảng cách giữa hình ảnh và văn bản
            _buildtextpage(), // Gọi phương thức xây dựng văn bản chào mừng
          ],
        ),
      ),
    );
  }

  Widget _buildiconpage() {
    return Image.asset(
      'asset/images/Group 151.png',
      width: 95,
      height: 80,
      fit: BoxFit.cover, // Đảm bảo hình ảnh được bao phủ đúng cách
    );
  }

  Widget _buildtextpage() {
    return Text(
      'Welcome to Tourn!',
      style: TextStyle(
        fontSize: 40,
        color: Colors.white,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
