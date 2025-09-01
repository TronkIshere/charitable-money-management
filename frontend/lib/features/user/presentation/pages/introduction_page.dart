import 'package:flutter/material.dart';
import 'package:frontend/core/theme/theme.dart';
import 'package:google_fonts/google_fonts.dart';

class OnBoarding {
  final String title;
  final String description;
  final IconData icon;

  OnBoarding({required this.title, required this.description, required this.icon});
}

final List<OnBoarding> onboardingList = [
  OnBoarding(
    title: 'Kết nối trái tim yêu thương',
    description: 'Chúng tôi tạo cầu nối giữa những người cần giúp đỡ và các mạnh thường quân trên khắp đất nước.',
    icon: Icons.favorite,
  ),
  OnBoarding(
    title: 'Minh bạch và tin cậy',
    description: 'Mọi khoản đóng góp được theo dõi minh bạch, đảm bảo đến đúng người, đúng nơi cần trợ giúp.',
    icon: Icons.verified,
  ),
  OnBoarding(
    title: 'Lan tỏa yêu thương',
    description: 'Tham gia cùng chúng tôi để tạo nên một cộng đồng nhân ái và sẻ chia.',
    icon: Icons.group,
  ),
];

class IntroductionPage extends StatefulWidget {
  const IntroductionPage({super.key});

  @override
  State<IntroductionPage> createState() => _IntroductionPageState();
}

class _IntroductionPageState extends State<IntroductionPage> {
  final PageController _pageController = PageController();
  int _currentIndex = 0;

  void _nextPage() {
    if (_currentIndex == onboardingList.length - 1) {
      Navigator.pushReplacementNamed(context, '/home');
    } else {
      _pageController.nextPage(duration: const Duration(milliseconds: 400), curve: Curves.easeInOut);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: DefaultColors.background,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              flex: 6,
              child: PageView.builder(
                controller: _pageController,
                itemCount: onboardingList.length,
                onPageChanged: (index) {
                  setState(() {
                    _currentIndex = index;
                  });
                },
                itemBuilder: (context, index) {
                  final item = onboardingList[index];
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(item.icon, size: 120, color: DefaultColors.primaryGreen),
                      const SizedBox(height: 30),
                      Text(
                        item.title,
                        textAlign: TextAlign.center,
                        style: GoogleFonts.plusJakartaSans(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: DefaultColors.darkText,
                        ),
                      ),
                      const SizedBox(height: 16),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 24),
                        child: Text(
                          item.description,
                          textAlign: TextAlign.center,
                          style: GoogleFonts.plusJakartaSans(fontSize: 16, color: DefaultColors.greyText),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
            const SizedBox(height: 20),
            // Indicator
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                onboardingList.length,
                (index) => Container(
                  margin: const EdgeInsets.symmetric(horizontal: 4),
                  height: 8,
                  width: _currentIndex == index ? 24 : 8,
                  decoration: BoxDecoration(
                    color: _currentIndex == index ? DefaultColors.primaryGreen : DefaultColors.lightGreen,
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 40),
            // Button
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: DefaultColors.buttonColor,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                  minimumSize: const Size(double.infinity, 50),
                ),
                onPressed: _nextPage,
                child: Text(
                  _currentIndex == onboardingList.length - 1 ? 'Bắt đầu ngay' : 'Tiếp tục',
                  style: GoogleFonts.plusJakartaSans(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: DefaultColors.white,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
