import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

class signuppage extends StatelessWidget {
  const signuppage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF121212),
      appBar: AppBar(
        backgroundColor: const Color(0xFF121212),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          }, // Xử lý khi nhấn nút quay lại
          icon: const Icon(
            Icons.arrow_back_ios_new_outlined,
            size: 20,
            color: Colors.white,
          ),
        ),
      ),

      body: SingleChildScrollView(
        // Cho phép cuộn nếu nội dung vượt quá
        child: Column(
          children: [
            _buildpagetitle(),
            _buildformsignup(),
            _buildloginbutton(),
            _buildorsplitoivider(),
            _buildsocialsignup(),
            _buildalreadyhaveaccount(context),
          ],
        ),
      ),
    );
  }

  Widget _buildpagetitle() {
    return Container(
      alignment: Alignment.center,
      margin: const EdgeInsets.only(top: 90),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            "signin_title".tr(),
            style: TextStyle(
              fontSize: 40,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildformsignup() {
    return Form(
      child: Container(
        margin: const EdgeInsets.only(top: 50, left: 20, right: 20),
        alignment: Alignment.centerLeft,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildusernamefield(),
            const SizedBox(height: 20),
            _buildpasswordfield(),
            const SizedBox(height: 20),
            _buildconfirmpasswordfield(),
          ],
        ),
      ),
    );
  }

  Column _buildusernamefield() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "signin_username".tr(),
          style: TextStyle(fontSize: 20, color: Colors.white),
        ),
        Container(
          margin: const EdgeInsets.only(top: 10),
          child: TextFormField(
            decoration: InputDecoration(
              hintText: "signin_username_desc".tr(), // Văn bản gợi ý
              hintStyle: TextStyle(color: Colors.white54),
              border: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.white),
              ),
            ),
            style: TextStyle(color: Colors.white),
          ),
        ),
      ],
    );
  }

  Column _buildpasswordfield() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "signin_password".tr(),
          style: TextStyle(fontSize: 20, color: Colors.white),
        ),
        Container(
          margin: const EdgeInsets.only(top: 10),
          child: TextFormField(
            decoration: InputDecoration(
              hintText: '*********', // Văn bản gợi ý
              hintStyle: TextStyle(color: Colors.white54),
              border: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.white),
              ),
            ),
            style: TextStyle(color: Colors.white),
            obscureText: true, // Ẩn văn bản nhập vào
          ),
        ),
      ],
    );
  }

  Column _buildconfirmpasswordfield() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "signin_confirm_password".tr(),
          style: TextStyle(fontSize: 20, color: Colors.white),
        ),
        Container(
          margin: const EdgeInsets.only(top: 10),
          child: TextFormField(
            decoration: InputDecoration(
              hintText: '*********', // Văn bản gợi ý
              hintStyle: TextStyle(color: Colors.white54),
              border: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.white),
              ),
            ),
            style: TextStyle(color: Colors.white),
            obscureText: true, // Ẩn văn bản nhập vào
          ),
        ),
      ],
    );
  }

  Widget _buildloginbutton() {
    return Container(
      margin: const EdgeInsets.only(top: 30),
      child: ElevatedButton(
        onPressed: () {}, // Xử lý khi nhấn nút Login , muốn disable thì để null
        style: ElevatedButton.styleFrom(
          backgroundColor: Color.fromARGB(255, 27, 40, 129),
          padding: const EdgeInsets.symmetric(horizontal: 152, vertical: 15),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          disabledBackgroundColor: Color.fromARGB(255, 48, 54, 94),
        ),
        child: Text(
          "signin_buttom".tr(),
          style: TextStyle(fontSize: 20, color: Colors.white),
        ),
      ),
    );
  }

  Widget _buildorsplitoivider() {
    return Container(
      margin: const EdgeInsets.only(top: 30),
      child: Row(
        children: [
          Expanded(
            // Mở rộng để chiếm không gian còn lại
            child: Divider(
              // Đường chia mở rộng
              color: Colors.white54,
              thickness: 1, // Độ dày của đường chia
              indent: 20, // Khoảng cách từ đầu đến đường chia
              endIndent: 10, // Khoảng cách từ đường chia đến cuối
            ),
          ),
          Text("login_desc".tr(), style: TextStyle(color: Colors.white54)),
          Expanded(
            child: Divider(
              // Đường chia mở rộng
              color: Colors.white54,
              thickness: 1, // Độ dày của đường chia
              indent: 10, // Khoảng cách từ đầu đến đường chia
              endIndent: 20, // Khoảng cách từ đường chia đến cuối
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildsocialsignup() {
    return Container(
      margin: const EdgeInsets.only(top: 30),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Nút đăng nhập với Google
          _buildbuttomgoogle(),
          SizedBox(width: 40), // Khoảng cách giữa hai nút
          // Nút đăng nhập với Facebook
          _buildbuttomfacebook(),
        ],
      ),
    );
  }

  Widget _buildbuttomfacebook() {
    return Container(
      width: double.infinity,
      height: 48,
      margin: const EdgeInsets.symmetric(vertical: 15),
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: ElevatedButton(
        onPressed: () {
          // Xử lý đăng nhập với Facebook
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF4267B2),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              'asset/icon/Facebook_Logo_(2019).png',
              width: 24,
              height: 24,
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                "signin_register_facebook".tr(),
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildbuttomgoogle() {
    return Container(
      width: double.infinity,
      height: 48,
      margin: const EdgeInsets.symmetric(vertical: 10),
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: ElevatedButton(
        onPressed: () {
          // Xử lý đăng nhập với Google
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF4267B2),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset('asset/icon/google.png', width: 24, height: 24),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                "signin_register_google".tr(),
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildalreadyhaveaccount(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 20, bottom: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "signin_desc1".tr(),
            style: TextStyle(fontSize: 16, color: Colors.white54),
          ),
          GestureDetector(
            // Thêm khả năng nhấn vào văn bản
            onTap: () {
              // Xử lý khi nhấn vào "Sign Up"
              Navigator.pop(context);
            },
            child: Text(
              "signin_buttom1".tr(),
              style: TextStyle(
                fontSize: 16,
                color: Colors.blueAccent, // Màu chữ xanh
                decoration: TextDecoration.underline, // Gạch chân
                decorationColor: Colors.white, // Màu gạch chân trắng
              ),
            ),
          ),
        ],
      ),
    );
  }
}
