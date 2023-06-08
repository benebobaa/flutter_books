class Review {
  String? review;
  String? user;
  String? rate;

  Review({this.review, this.user});

  Review.fromJson(Map<String, dynamic> json) {
    review = json['review'];
    user = json['user'];
    rate = json['rate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['review'] = review;
    data['user'] = user;
    data['rate'] = rate;
    return data;
  }
}
