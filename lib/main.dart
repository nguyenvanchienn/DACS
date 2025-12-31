import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:tourn/Ui/splash/splash.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); // Đảm bảo các binding của Flutter được khởi tạo
  await EasyLocalization.ensureInitialized(); // Khởi tạo EasyLocalization trước khi chạy ứng dụng

  runApp(
    EasyLocalization(
      supportedLocales: [
        Locale('en'), // Hỗ trợ ngôn ngữ tiếng Anh
        Locale('vi'), // Hỗ trợ ngôn ngữ tiếng Việt
      ],
      path: "asset/language", // Đường dẫn đến thư mục chứa file ngôn ngữ
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Nguyễn Chiến',
      theme: ThemeData(
        // Định nghĩa chủ đề cho ứng dụng
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepPurple,
        ), // Màu chủ đề được tạo từ màu hạt giống
        useMaterial3: true, // Sử dụng Material Design 3
      ),
      // ngôn ngữ hỗ trợ
      localizationsDelegates: context
          .localizationDelegates, // Thiết lập các delegate cho localization
      locale: context.locale,
      supportedLocales: context.supportedLocales,
      home: SplashScreen(), // Trang chính của ứng dụng
    );
  }
}
