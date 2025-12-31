enum OnboardingPagePosition { page1, page2, page3 }

extension OnboardingPagePositionExtension on OnboardingPagePosition {
  String onboardingpageimage() {
    switch (this) {
      case OnboardingPagePosition.page1:
        return 'asset/images/anh-con-cho-26.jpg';
      case OnboardingPagePosition.page2:
        return 'asset/images/anh-mo-ta.jpg';
      case OnboardingPagePosition.page3:
        return 'asset/images/Anh-Cho-Meme-2-1.jpg';
    }
  }

  String onboardingpagetitle() {
    switch (this) {
      case OnboardingPagePosition.page1:
        return 'Title for Page 1';
      case OnboardingPagePosition.page2:
        return 'Title for Page 2';
      case OnboardingPagePosition.page3:
        return 'Title for Page 3';
    }
  }

  String onboardingpagecontent() {
    switch (this) {
      case OnboardingPagePosition.page1:
        return 'Content for Page 1';
      case OnboardingPagePosition.page2:
        return 'Content for Page 2';
      case OnboardingPagePosition.page3:
        return 'Content for Page 3';
    }
  }
}
