class SliderModel {
  String imageAssetPath;
  String title;
  String desc;
  String buttonTitle;

  SliderModel({this.imageAssetPath, this.title, this.desc, this.buttonTitle});

  void setImageAssetPath(String getImageAssetPath) {
    imageAssetPath = getImageAssetPath;
  }

  void setTitle(String getTitle) {
    title = getTitle;
  }

  void setDesc(String getDesc) {
    desc = getDesc;
  }

  void setButtonTitle(String getButtonTitle) {
    buttonTitle = getButtonTitle;
  }

  String getImageAssetPath() {
    return imageAssetPath;
  }

  String getTitle() {
    return title;
  }

  String getDesc() {
    return desc;
  }

  String getButtonTitle() {
    return buttonTitle;
  }
}

List<SliderModel> getSlides() {
  List<SliderModel> slides = new List<SliderModel>();
  SliderModel sliderModel = new SliderModel();

  //1
  sliderModel.setDesc(
      "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut viverra sollicitudin commodo. ");
  sliderModel.setTitle("sliderTitle1");
  sliderModel.setImageAssetPath("assets/images/slider1.png");
  sliderModel.setButtonTitle('sliderButton1');
  slides.add(sliderModel);

  sliderModel = new SliderModel();

  //2
  sliderModel.setDesc(
      "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut viverra sollicitudin commodo. ");
  sliderModel.setTitle("sliderTitle2");
  sliderModel.setImageAssetPath("assets/images/slider2.png");
  sliderModel.setButtonTitle('sliderButton2');
  slides.add(sliderModel);

  sliderModel = new SliderModel();

  //3
  sliderModel.setDesc(
      "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut viverra sollicitudin commodo. ");
  sliderModel.setTitle("sliderTitle3");
  sliderModel.setImageAssetPath("assets/images/slider3.png");
  sliderModel.setButtonTitle('sliderButton3');
  slides.add(sliderModel);

  sliderModel = new SliderModel();

  //4
  sliderModel.setDesc(
      "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut viverra sollicitudin commodo. ");
  sliderModel.setTitle("sliderTitle4");
  sliderModel.setImageAssetPath("assets/images/slider4.png");
  sliderModel.setButtonTitle("sliderButton4");
  slides.add(sliderModel);

  sliderModel = new SliderModel();

  return slides;
}
