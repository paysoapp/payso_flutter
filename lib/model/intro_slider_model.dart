class SliderModel {
  String imageAssetPath;
  String title;
  String desc;

  SliderModel({this.imageAssetPath, this.title, this.desc});

  void setImageAssetPath(String getImageAssetPath) {
    imageAssetPath = getImageAssetPath;
  }

  void setTitle(String getTitle) {
    title = getTitle;
  }

  void setDesc(String getDesc) {
    desc = getDesc;
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
}

List<SliderModel> getSlides() {
  List<SliderModel> slides = new List<SliderModel>();
  SliderModel sliderModel = new SliderModel();

  //1
  sliderModel.setDesc(
      "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut viverra sollicitudin commodo. ");
  sliderModel.setTitle("QR and Instant Payments");
  sliderModel.setImageAssetPath("assets/images/slider1.png");
  slides.add(sliderModel);

  sliderModel = new SliderModel();

  //2
  sliderModel.setDesc(
      "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut viverra sollicitudin commodo. ");
  sliderModel.setTitle("Bill Payments");
  sliderModel.setImageAssetPath("assets/images/slider2.png");
  slides.add(sliderModel);

  sliderModel = new SliderModel();

  //3
  sliderModel.setDesc(
      "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut viverra sollicitudin commodo. ");
  sliderModel.setTitle("Security");
  sliderModel.setImageAssetPath("assets/images/slider3.png");
  slides.add(sliderModel);

  sliderModel = new SliderModel();

  //4
  sliderModel.setDesc(
      "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut viverra sollicitudin commodo. ");
  sliderModel.setTitle("Withdraw Funds");
  sliderModel.setImageAssetPath("assets/images/slider4.png");
  slides.add(sliderModel);

  sliderModel = new SliderModel();

  return slides;
}
