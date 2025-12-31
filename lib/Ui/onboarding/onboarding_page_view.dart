// class cha: quản lý các page con. di chuyển qua lại
import 'package:flutter/material.dart';
import 'package:tourn/Ui/onboarding/onboarding_child_page.dart';
import 'package:tourn/Ui/welcome/welcome_page.dart';
import 'package:tourn/ultils.enums/onboarding_page_position.dart';
import 'package:shared_preferences/shared_preferences.dart';

class onboardingpageview extends StatefulWidget {
  const onboardingpageview({super.key});

  @override
  State<onboardingpageview> createState() => _onboardingpageviewState();
}

class _onboardingpageviewState extends State<onboardingpageview> {
  final PageController _pagecontroller =
      PageController(); // Điều khiển trang hiện tại
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        // Sử dụng PageView để quản lý các trang con
        controller: _pagecontroller, // Thêm controller để điều khiển PageView
        physics:
            const NeverScrollableScrollPhysics(), // Vô hiệu hóa cuộn bằng tay
        children: [
          // Thêm các trang con ở đây
          // onboarding_child_page(),
          onboardingchildpage(
            onboardingpageposition: OnboardingPagePosition
                .page1, // Trang con 1 dùng enum để xác định vị trí trang
            nextonpress: () {
              makeonboardingcompleted();
              _pagecontroller.jumpToPage(1); // Chuyển đến trang 2 khi nhấn nút
            },
            backonpress: () {
              // Không làm gì vì đây là trang đầu tiên
            },
            skiponpress: () {
              makeonboardingcompleted();
              _gotowelcomepage();
            },
          ),
          onboardingchildpage(
            onboardingpageposition: OnboardingPagePosition
                .page2, // Trang con 2 dùng enum để xác định vị trí trang
            nextonpress: () {
              makeonboardingcompleted();
              _pagecontroller.jumpToPage(2); // Chuyển đến trang 3 khi nhấn nút
            },
            backonpress: () {
              _pagecontroller.jumpToPage(
                0,
              ); // Quay lại trang 1 khi nhấn nút quay lại
            },
            skiponpress: () {
              makeonboardingcompleted();
              _gotowelcomepage(); // Đi đến trang chính của ứng dụng
            },
          ),
          onboardingchildpage(
            onboardingpageposition: OnboardingPagePosition
                .page3, // Trang con 3 dùng enum để xác định vị trí trang
            nextonpress: () {
              makeonboardingcompleted(); // Đánh dấu hoàn thành onboarding khi nhấn nút tiếp theo
              _gotowelcomepage(); // Đi đến trang chính của ứng dụng
            },
            backonpress: () {
              _pagecontroller.jumpToPage(
                1,
              ); // Quay lại trang 2 khi nhấn nút quay lại
            },
            skiponpress: () {
              makeonboardingcompleted(); // Đánh dấu hoàn thành onboarding khi nhấn nút bỏ qua
              _gotowelcomepage(); // Đi đến trang chính của ứng dụng
            },
          ),
        ],
      ),
    );
  }

  void _gotowelcomepage() {
    // Hàm chuyển đến trang chính của ứng dụng welcome_page.dart
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const WelcomePage(isFirsTimeinstallApp: true),
      ), // Truyền tham số isFirsTimeinstallApp là true
    );
  }

  Future<void> makeonboardingcompleted() async {
    // Hàm đánh dấu hoàn thành onboarding
    try {
      // Giả lập việc lấy trạng thái từ bộ nhớ hoặc cơ sở dữ liệu
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setBool('konboardingcompleted', true);
    } catch (e) {
      print('e');
      return;
    }
  }
}
