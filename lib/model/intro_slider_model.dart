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
  sliderModel.setTitle("QR and Instant Payments");
  sliderModel.setImageAssetPath("assets/images/slider1.png");
  sliderModel.setButtonTitle('Get Started');
  slides.add(sliderModel);

  sliderModel = new SliderModel();

  //2
  sliderModel.setDesc(
      "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut viverra sollicitudin commodo. ");
  sliderModel.setTitle("Bill Payments");
  sliderModel.setImageAssetPath("assets/images/slider2.png");
  sliderModel.setButtonTitle('Start Paying Bills');
  slides.add(sliderModel);

  sliderModel = new SliderModel();

  //3
  sliderModel.setDesc(
      "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut viverra sollicitudin commodo. ");
  sliderModel.setTitle("Security");
  sliderModel.setImageAssetPath("assets/images/slider3.png");
  sliderModel.setButtonTitle('Cool!');
  slides.add(sliderModel);

  sliderModel = new SliderModel();

  //4
  sliderModel.setDesc(
      "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut viverra sollicitudin commodo. ");
  sliderModel.setTitle("Withdraw Funds");
  sliderModel.setImageAssetPath("assets/images/slider4.png");
  sliderModel.setButtonTitle("Let's begin");
  slides.add(sliderModel);

  sliderModel = new SliderModel();

  return slides;
}
