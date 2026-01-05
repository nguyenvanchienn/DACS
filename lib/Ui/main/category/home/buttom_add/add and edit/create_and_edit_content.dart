import 'package:flutter/material.dart';
import 'package:tourn/Ui/main/category/home/buttom_add/add%20and%20edit/next_page.dart';

class createandeditcontent extends StatefulWidget {
  const createandeditcontent({super.key});

  @override
  State<createandeditcontent> createState() => _createandeditcontentState();
}

class _createandeditcontentState extends State<createandeditcontent> {
  final TextEditingController _controller = TextEditingController();
  final FocusNode _focusNode = FocusNode();
  final DraggableScrollableController _draggableController =
      DraggableScrollableController();

  bool isTyping = false;

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(() {
      setState(() {
        isTyping = _focusNode.hasFocus;
      });
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    _focusNode.dispose();
    _draggableController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: GestureDetector(
          // Nút đóng ở góc trái
          onTap: () {
            _draggableController.animateTo(
              0.35,
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeOut,
            );
            Navigator.of(context).maybePop();
          },
          child: const Icon(Icons.close, color: Colors.white),
        ),
        centerTitle: true,
        title: GestureDetector(
          onTap: () {
            _draggableController.animateTo(
              0.35,
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeOut,
            );
          },
          child: const Text(
            'Tạo bài viết',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white,
              fontSize: 20,
            ),
          ),
        ),
        actions: [
          // Nút tiếp ở góc phải
          Padding(
            padding: const EdgeInsets.only(right: 12),
            child: GestureDetector(
              onTap: () {
                _draggableController.animateTo(
                  0.35,
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeOut,
                );
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const next()),
                );
              },
              child: const Text(
                'Tiếp',
                style: TextStyle(
                  color: Colors.blue,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ),
          ),
        ],
      ),

      body: Stack(
        children: [
          Column(
            children: [
              _buildHeader(),
              Expanded(child: _buildTextField()),
            ],
          ),
          // GestureDetector chỉ phủ vùng phía trên panel
          Positioned(
            left: 0,
            right: 0,
            top: 0,
            bottom:
                MediaQuery.of(context).size.height *
                0.35, // hoặc dùng controller để lấy chiều cao panel hiện tại
            child: GestureDetector(
              behavior: HitTestBehavior.translucent,
              onTap: () {
                _draggableController.animateTo(
                  0.35,
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeOut,
                );
              },
              child: Container(),
            ),
          ),
          DraggableScrollableSheet(
            controller: _draggableController,
            initialChildSize: 0.35,
            minChildSize: 0.2,
            maxChildSize: 0.9,
            builder: (context, scrollController) {
              return Container(
                decoration: const BoxDecoration(
                  color: Color(0xFF2A2A2A),
                  borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const SizedBox(height: 8),
                    Container(
                      width: 36,
                      height: 4,
                      decoration: BoxDecoration(
                        color: Colors.white70,
                        borderRadius: BorderRadius.circular(2),
                      ),
                    ),
                    const SizedBox(height: 12),
                    Expanded(
                      child: ListView(
                        controller: scrollController,
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        children: const [
                          _OptionTile(Icons.image, Colors.green, 'Ảnh/video'),
                          _OptionTile(
                            Icons.person_add,
                            Colors.blue,
                            'Gắn thẻ người khác',
                          ),
                          _OptionTile(
                            Icons.emoji_emotions,
                            Colors.orange,
                            'Cảm xúc/hoạt động',
                          ),
                          _OptionTile(
                            Icons.location_on,
                            Colors.red,
                            'Check in',
                          ),
                          _OptionTile(
                            Icons.videocam,
                            Colors.pink,
                            'Video trực tiếp',
                          ),
                          _OptionTile(
                            Icons.text_fields,
                            Colors.cyan,
                            'Màu nền',
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
          const CircleAvatar(radius: 20),
          const SizedBox(width: 12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Nguyễn Chiến',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 4),
              Wrap(
                spacing: 8,
                runSpacing: 6,
                children: [
                  _pill('Công khai'),
                  _pill('+ Album'),
                  _pill('Tắt'),
                  _pill('+ Nhãn AI đang tắt'),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _pill(String text) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: Colors.blueGrey.shade800,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        text,
        style: const TextStyle(color: Colors.white, fontSize: 12),
      ),
    );
  }

  Widget _buildTextField() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: TextField(
        controller: _controller,
        focusNode: _focusNode,
        maxLines: null,
        style: const TextStyle(fontSize: 20, color: Colors.white),
        decoration: const InputDecoration(
          hintText: 'Bạn đang nghĩ gì?',
          hintStyle: TextStyle(color: Colors.grey),
          border: InputBorder.none,
        ),
      ),
    );
  }

  Widget _buildOptionPanel() {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 250),
      curve: Curves.easeOut,
      height: isTyping ? 220 : 320,
      decoration: const BoxDecoration(
        color: Color(0xFF2A2A2A),
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      child: isTyping ? _typingOptions() : _defaultOptions(),
    );
  }

  Widget _defaultOptions() {
    return ListView(
      padding: const EdgeInsets.symmetric(vertical: 12),
      children: const [
        _OptionTile(Icons.image, Colors.green, 'Ảnh/video'),
        _OptionTile(Icons.person_add, Colors.blue, 'Gắn thẻ người khác'),
        _OptionTile(Icons.emoji_emotions, Colors.orange, 'Cảm xúc/hoạt động'),
        _OptionTile(Icons.location_on, Colors.red, 'Check in'),
        _OptionTile(Icons.videocam, Colors.pink, 'Video trực tiếp'),
        _OptionTile(Icons.text_fields, Colors.cyan, 'Màu nền'),
        _OptionTile(Icons.image, Colors.green, 'Ảnh/video'),
        _OptionTile(Icons.person_add, Colors.blue, 'Gắn thẻ người khác'),
        _OptionTile(Icons.emoji_emotions, Colors.orange, 'Cảm xúc/hoạt động'),
        _OptionTile(Icons.location_on, Colors.red, 'Check in'),
        _OptionTile(Icons.videocam, Colors.pink, 'Video trực tiếp'),
        _OptionTile(Icons.text_fields, Colors.cyan, 'Màu nền'),
        _OptionTile(Icons.image, Colors.green, 'Ảnh/video'),
        _OptionTile(Icons.person_add, Colors.blue, 'Gắn thẻ người khác'),
        _OptionTile(Icons.emoji_emotions, Colors.orange, 'Cảm xúc/hoạt động'),
        _OptionTile(Icons.location_on, Colors.red, 'Check in'),
        _OptionTile(Icons.videocam, Colors.pink, 'Video trực tiếp'),
        _OptionTile(Icons.text_fields, Colors.cyan, 'Màu nền'),
      ],
    );
  }

  Widget _typingOptions() {
    final icons = const [
      [Icons.image, Colors.green],
      [Icons.person_add, Colors.blue],
      [Icons.emoji_emotions, Colors.orange],
      [Icons.location_on, Colors.red],
      [Icons.videocam, Colors.pink],
      [Icons.image, Colors.green],
      [Icons.person_add, Colors.blue],
      [Icons.emoji_emotions, Colors.orange],
      [Icons.location_on, Colors.red],
      [Icons.videocam, Colors.pink],
    ];
    return Column(
      children: [
        const SizedBox(height: 8),
        Container(
          width: 36,
          height: 4,
          decoration: BoxDecoration(
            color: Colors.white70,
            borderRadius: BorderRadius.circular(2),
          ),
        ),
        const SizedBox(height: 12),
        _buildColorPicker(),
        const SizedBox(height: 2), // giảm khoảng cách phía dưới color picker
        SizedBox(
          height: 44,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 12),
            itemBuilder: (context, index) => _OptionIcon(
              icons[index][0] as IconData,
              icons[index][1] as Color,
            ),
            separatorBuilder: (_, __) => const SizedBox(width: 10),
            itemCount: icons.length,
          ),
        ),
      ],
    );
  }

  Widget _buildColorPicker() {
    final colors = [
      Colors.white,
      Colors.blue,
      Colors.cyan,
      Colors.purple,
      Colors.red,
      Colors.orange,
      Colors.black,
      Colors.white,
      Colors.blue,
      Colors.cyan,
      Colors.purple,
      Colors.red,
      Colors.orange,
      Colors.black,
      Colors.white,
      Colors.blue,
      Colors.cyan,
      Colors.purple,
      Colors.red,
      Colors.orange,
      Colors.black,
    ];

    return SizedBox(
      height: 36,
      child: ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        scrollDirection: Axis.horizontal,
        itemBuilder: (_, i) => Container(
          width: 36,
          height: 36,
          decoration: BoxDecoration(
            color: colors[i],
            borderRadius: BorderRadius.circular(6),
            border: Border.all(color: Colors.white24),
          ),
        ),
        separatorBuilder: (_, __) => const SizedBox(width: 8),
        itemCount: colors.length,
      ),
    );
  }
}

class _OptionTile extends StatelessWidget {
  final IconData icon;
  final Color color;
  final String title;

  const _OptionTile(this.icon, this.color, this.title);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon, color: color),
      title: Text(
        title,
        style: const TextStyle(color: Colors.white, fontSize: 16),
      ),
      onTap: () {},
    );
  }
}

class _OptionIcon extends StatelessWidget {
  final IconData icon;
  final Color color;

  const _OptionIcon(this.icon, this.color);

  @override
  Widget build(BuildContext context) {
    return Icon(icon, color: color, size: 28);
  }
}
