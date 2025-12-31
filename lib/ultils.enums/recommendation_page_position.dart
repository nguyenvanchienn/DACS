enum RecommendationPagePosition { page1, page2, page3 }

extension RecommendationPagePositionExtension on RecommendationPagePosition {
  String recommendationpageimage() {
    switch (this) {
      case RecommendationPagePosition.page1:
        return 'asset/images/anh-con-cho-26.jpg';
      case RecommendationPagePosition.page2:
        return 'asset/images/anh-mo-ta.jpg';
      case RecommendationPagePosition.page3:
        return 'asset/images/Anh-Cho-Meme-2-1.jpg';
    }
  }

  String recommendationpagetitle() {
    switch (this) {
      case RecommendationPagePosition.page1:
        return 'Title for Page 1';
      case RecommendationPagePosition.page2:
        return 'Title for Page 2';
      case RecommendationPagePosition.page3:
        return 'Title for Page 3';
    }
  }

  String recommendationpagecontent() {
    switch (this) {
      case RecommendationPagePosition.page1:
        return 'Content for Page 1';
      case RecommendationPagePosition.page2:
        return 'Content for Page 2';
      case RecommendationPagePosition.page3:
        return 'Content for Page 3';
    }
  }
}
