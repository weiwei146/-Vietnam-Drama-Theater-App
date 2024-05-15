import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:namer_app/screen/interface/Schedule.dart';
import 'dart:ui';
import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:namer_app/screen/schedule/ScheduleCard.dart';


final today = DateUtils.dateOnly(DateTime.now());


class CustomSearchBar extends StatefulWidget {
  final TextEditingController controller;

  const CustomSearchBar({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  _CustomSearchBarState createState() => _CustomSearchBarState();
}

class _CustomSearchBarState extends State<CustomSearchBar> {

  List<Schedule> allItems = [
    Schedule( title: 'Ngũ hổ tướng',
              released_on: DateTime(2024, 5, 4, 10, 0),
              place: 'Nhà hát Kịch Việt Nam',
              poster: 'https://file.hstatic.net/200000370191/article/bao_1_c241eded316e4c6ba88ff248f6927177.jpg',
              genres: 'Kịch hiện đại',
              backdrop: 'https://file.hstatic.net/200000370191/file/dsc06373_39cba29f62314b929afdb736ef2a2631_grande.jpg',
              classification: '',
              director: 'NSUT. Xuân Bắc',
              imdb_rating: 8,
              length: '120',
              overview: '“Ngũ hổ tướng” lấy bối cảnh một ngôi nhà chật chội giữa lòng thủ đô, với những khó khăn, thiếu thốn bủa vây xung quanh một gia đình có 5 người con trai. Năm chàng thanh niên - năm “cái tôi” với những sự đố kị, ẩn ức riêng tư, ghen ghét và mưu mô dục vọng … nhưng cũng tràn đầy sự chia sẻ, cảm thông và yêu thương nhau.Mâu thuẫn bắt đầu khi người anh cả cưới vợ (cô dâu Mỹ Xuân). Gia đình có thêm thành viên mới, cuộc sống vỗn dĩ cũng chẳng yên bình nay càng thêm xáo trộn. Những uẩn khúc, mâu thuẫn bùng nổ lên đến đỉnh điểm, điều gì sẽ xảy ra trong gia đình ấy?',
              cast: ['NSND. Anh Tú', 'NSUT. Xuân Bắc', 'Thu Phương'],

    ),

    Schedule(title: "Điều còn lại",
        released_on: DateTime(2024, 5, 4, 10, 0),
        place: 'Thái Nguyên',
        poster: 'https://file.hstatic.net/200000370191/article/bv_760c200ac2994f9f9f2388ab0c60d961.jpg',
        genres: 'Kịch hiện đại',
        backdrop: 'https://file.hstatic.net/200000370191/file/dsc01298_6d6fad25ff6c45fba85665c41a084a02_grande.jpg',
        classification: '',
        director: 'NSUT. Kiều Minh Hiếu',
        imdb_rating: 7,
        length: '120',
        overview: '“Điều còn lại” kể về câu chuyện “hậu chiến” của một gia đình làng quê Bắc Bộ, một trong vô vàn những câu chuyện đẫm nước mắt mà biết bao gia đình Việt Nam đã phải gánh chịu bởi hậu quả của chiến tranh. Nếu như ở ngoài mặt trận, sự tàn khốc của một cuộc chiến là bom rơi đạn nổ và sự hi sinh của người chiến sỹ, thì ở hậu phương, nỗi đau đớn mà chiến tranh để lại không phải tiếng súng và những cái chết, mà đó là những sự đau đớn về tinh thần khi vợ mất chồng, cha mẹ mất con, và ngay cả khi những đứa con còn sống trở về, người thì mất đi vài phần thân thể, người lại mắc chứng tâm thần….',
        cast: ['NSND. Anh Tú', 'NSUT. Xuân Bắc', 'Thu Phương'],
    ),

    Schedule(title: 'Thiên mệnh',
        released_on: DateTime(2024, 5, 4, 10, 0),
        place: 'Nhà hát Kịch Việt Nam',
        poster: 'https://file.hstatic.net/200000370191/article/b_4d9b0dc54ff84dad8fb008c1ca580558.jpg',
        genres: 'Kịch hiện đại',
        backdrop: 'https://file.hstatic.net/200000370191/file/dsc00200_da1a3acf1a2e4db291ea57aac39f2fa2_grande.jpg',
        classification: '',
        director: 'NSUT. Phạm Đỗ Kỳ',
        imdb_rating: 9,
        length: '120',
        overview: '“Thiên mệnh” - một vở kịch xoáy sâu vào vấn đề “dùng người” của Trần Thủ Độ, khẳng định tầm quan trọng của “nhân tài” đối với giang sơn, xã tắc… Chỉ với những điều trên, chúng ta có thể thấy tính thời sự của vở kịch, qua câu chuyện cách đây gần 800 năm, vẫn còn nguyên giá trị.“Sẽ không thể có vùng cấm cho bất cứ kẻ nào dám giẫm đạp lên kỷ cương phép nước. Đó cũng chính là con đường của muôn dân Đại Việt, hun đúc nên hào khí mãi ngàn năm..."',
        cast: ['NSND. Anh Tú', 'NSUT. Xuân Bắc', 'Thu Phương'],
    ),

    Schedule(title: 'Romeo và Juliet',
        released_on: DateTime(2024, 5, 4, 10, 0),
        place: 'Nhà hát Kịch Hà Nội',
        poster: 'https://file.hstatic.net/200000370191/article/backrop_2.7mx4mban_cuoib_1e394bbbe3d946c3a2a302ab5267e84d.jpg',
        genres: 'Kịch đương đại',
        backdrop: 'https://file.hstatic.net/200000370191/file/img_0933_cff4a48548af4bdc9dec1b93e17d8ce5_grande.jpg',
        classification: '',
        director: 'NSUT. Anh Tú',
        imdb_rating: 9,
        length: '120',
        overview: '“Romeo và Juliet” là câu chuyện diễn ra trong thành Verona của Italy, với hai dòng họ Montaghiu và Capulet vốn có mối thù hận lâu đời. Bi kịch bắt đầu từ khi con trai của dòng họ Montaghiu là Romeo trà trộn và dự tiệc hóa trang của nhà Capulet, chàng đã gặp nàng Juliet và hai người yêu nhau ngay từ cái nhìn đầu tiên.Câu chuyện Romeo và Juliet không chỉ ngợi ca tình yêu lãng mạn và trong sáng, mà nó còn gửi gắm thông điệp nhân văn. Tình yêu trong sáng, chân thành và đẹp đẽ có thể làm tan chảy những hận thù, định kiến.',
        cast: ['NSND. Anh Tú', 'NSUT. Xuân Bắc', 'Thu Phương'],
    ),
    Schedule( title: 'Ngũ hổ tướng',
      released_on: DateTime(2024, 5, 4, 10, 0),
      place: 'Nhà hát Kịch Việt Nam',
      poster: 'https://file.hstatic.net/200000370191/article/bao_1_c241eded316e4c6ba88ff248f6927177.jpg',
      genres: 'Kịch hiện đại',
      backdrop: 'https://file.hstatic.net/200000370191/file/dsc06373_39cba29f62314b929afdb736ef2a2631_grande.jpg',
      classification: '',
      director: 'NSUT. Xuân Bắc',
      imdb_rating: 8,
      length: '120',
      overview: '“Ngũ hổ tướng” lấy bối cảnh một ngôi nhà chật chội giữa lòng thủ đô, với những khó khăn, thiếu thốn bủa vây xung quanh một gia đình có 5 người con trai. Năm chàng thanh niên - năm “cái tôi” với những sự đố kị, ẩn ức riêng tư, ghen ghét và mưu mô dục vọng … nhưng cũng tràn đầy sự chia sẻ, cảm thông và yêu thương nhau.Mâu thuẫn bắt đầu khi người anh cả cưới vợ (cô dâu Mỹ Xuân). Gia đình có thêm thành viên mới, cuộc sống vỗn dĩ cũng chẳng yên bình nay càng thêm xáo trộn. Những uẩn khúc, mâu thuẫn bùng nổ lên đến đỉnh điểm, điều gì sẽ xảy ra trong gia đình ấy?',
      cast: ['NSND. Anh Tú', 'NSUT. Xuân Bắc', 'Thu Phương'],

    ),

    Schedule(title: "Điều còn lại",
      released_on: DateTime(2024, 5, 4, 10, 0),
      place: 'Thái Nguyên',
      poster: 'https://file.hstatic.net/200000370191/article/bv_760c200ac2994f9f9f2388ab0c60d961.jpg',
      genres: 'Kịch hiện đại',
      backdrop: 'https://file.hstatic.net/200000370191/file/dsc01298_6d6fad25ff6c45fba85665c41a084a02_grande.jpg',
      classification: '',
      director: 'NSUT. Kiều Minh Hiếu',
      imdb_rating: 7,
      length: '120',
      overview: '“Điều còn lại” kể về câu chuyện “hậu chiến” của một gia đình làng quê Bắc Bộ, một trong vô vàn những câu chuyện đẫm nước mắt mà biết bao gia đình Việt Nam đã phải gánh chịu bởi hậu quả của chiến tranh. Nếu như ở ngoài mặt trận, sự tàn khốc của một cuộc chiến là bom rơi đạn nổ và sự hi sinh của người chiến sỹ, thì ở hậu phương, nỗi đau đớn mà chiến tranh để lại không phải tiếng súng và những cái chết, mà đó là những sự đau đớn về tinh thần khi vợ mất chồng, cha mẹ mất con, và ngay cả khi những đứa con còn sống trở về, người thì mất đi vài phần thân thể, người lại mắc chứng tâm thần….',
      cast: ['NSND. Anh Tú', 'NSUT. Xuân Bắc', 'Thu Phương'],
    ),

    Schedule(title: 'Thiên mệnh',
      released_on: DateTime(2024, 5, 4, 10, 0),
      place: 'Nhà hát Kịch Việt Nam',
      poster: 'https://file.hstatic.net/200000370191/article/b_4d9b0dc54ff84dad8fb008c1ca580558.jpg',
      genres: 'Kịch hiện đại',
      backdrop: 'https://file.hstatic.net/200000370191/file/dsc00200_da1a3acf1a2e4db291ea57aac39f2fa2_grande.jpg',
      classification: '',
      director: 'NSUT. Phạm Đỗ Kỳ',
      imdb_rating: 9,
      length: '120',
      overview: '“Thiên mệnh” - một vở kịch xoáy sâu vào vấn đề “dùng người” của Trần Thủ Độ, khẳng định tầm quan trọng của “nhân tài” đối với giang sơn, xã tắc… Chỉ với những điều trên, chúng ta có thể thấy tính thời sự của vở kịch, qua câu chuyện cách đây gần 800 năm, vẫn còn nguyên giá trị.“Sẽ không thể có vùng cấm cho bất cứ kẻ nào dám giẫm đạp lên kỷ cương phép nước. Đó cũng chính là con đường của muôn dân Đại Việt, hun đúc nên hào khí mãi ngàn năm..."',
      cast: ['NSND. Anh Tú', 'NSUT. Xuân Bắc', 'Thu Phương'],
    ),

    Schedule(title: 'Romeo và Juliet',
      released_on: DateTime(2024, 5, 4, 10, 0),
      place: 'Nhà hát Kịch Hà Nội',
      poster: 'https://file.hstatic.net/200000370191/article/backrop_2.7mx4mban_cuoib_1e394bbbe3d946c3a2a302ab5267e84d.jpg',
      genres: 'Kịch đương đại',
      backdrop: 'https://file.hstatic.net/200000370191/file/img_0933_cff4a48548af4bdc9dec1b93e17d8ce5_grande.jpg',
      classification: '',
      director: 'NSUT. Anh Tú',
      imdb_rating: 9,
      length: '120',
      overview: '“Romeo và Juliet” là câu chuyện diễn ra trong thành Verona của Italy, với hai dòng họ Montaghiu và Capulet vốn có mối thù hận lâu đời. Bi kịch bắt đầu từ khi con trai của dòng họ Montaghiu là Romeo trà trộn và dự tiệc hóa trang của nhà Capulet, chàng đã gặp nàng Juliet và hai người yêu nhau ngay từ cái nhìn đầu tiên.Câu chuyện Romeo và Juliet không chỉ ngợi ca tình yêu lãng mạn và trong sáng, mà nó còn gửi gắm thông điệp nhân văn. Tình yêu trong sáng, chân thành và đẹp đẽ có thể làm tan chảy những hận thù, định kiến.',
      cast: ['NSND. Anh Tú', 'NSUT. Xuân Bắc', 'Thu Phương'],
    ),

    Schedule( title: 'Ngũ hổ tướng',
      released_on: DateTime(2024, 5, 4, 10, 0),
      place: 'Nhà hát Kịch Việt Nam',
      poster: 'https://file.hstatic.net/200000370191/article/bao_1_c241eded316e4c6ba88ff248f6927177.jpg',
      genres: 'Kịch hiện đại',
      backdrop: 'https://file.hstatic.net/200000370191/file/dsc06373_39cba29f62314b929afdb736ef2a2631_grande.jpg',
      classification: '',
      director: 'NSUT. Xuân Bắc',
      imdb_rating: 8,
      length: '120',
      overview: '“Ngũ hổ tướng” lấy bối cảnh một ngôi nhà chật chội giữa lòng thủ đô, với những khó khăn, thiếu thốn bủa vây xung quanh một gia đình có 5 người con trai. Năm chàng thanh niên - năm “cái tôi” với những sự đố kị, ẩn ức riêng tư, ghen ghét và mưu mô dục vọng … nhưng cũng tràn đầy sự chia sẻ, cảm thông và yêu thương nhau.Mâu thuẫn bắt đầu khi người anh cả cưới vợ (cô dâu Mỹ Xuân). Gia đình có thêm thành viên mới, cuộc sống vỗn dĩ cũng chẳng yên bình nay càng thêm xáo trộn. Những uẩn khúc, mâu thuẫn bùng nổ lên đến đỉnh điểm, điều gì sẽ xảy ra trong gia đình ấy?',
      cast: ['NSND. Anh Tú', 'NSUT. Xuân Bắc', 'Thu Phương'],

    ),

    Schedule(title: "Điều còn lại",
      released_on: DateTime(2024, 5, 4, 10, 0),
      place: 'Thái Nguyên',
      poster: 'https://file.hstatic.net/200000370191/article/bv_760c200ac2994f9f9f2388ab0c60d961.jpg',
      genres: 'Kịch hiện đại',
      backdrop: 'https://file.hstatic.net/200000370191/file/dsc01298_6d6fad25ff6c45fba85665c41a084a02_grande.jpg',
      classification: '',
      director: 'NSUT. Kiều Minh Hiếu',
      imdb_rating: 7,
      length: '120',
      overview: '“Điều còn lại” kể về câu chuyện “hậu chiến” của một gia đình làng quê Bắc Bộ, một trong vô vàn những câu chuyện đẫm nước mắt mà biết bao gia đình Việt Nam đã phải gánh chịu bởi hậu quả của chiến tranh. Nếu như ở ngoài mặt trận, sự tàn khốc của một cuộc chiến là bom rơi đạn nổ và sự hi sinh của người chiến sỹ, thì ở hậu phương, nỗi đau đớn mà chiến tranh để lại không phải tiếng súng và những cái chết, mà đó là những sự đau đớn về tinh thần khi vợ mất chồng, cha mẹ mất con, và ngay cả khi những đứa con còn sống trở về, người thì mất đi vài phần thân thể, người lại mắc chứng tâm thần….',
      cast: ['NSND. Anh Tú', 'NSUT. Xuân Bắc', 'Thu Phương'],
    ),

    Schedule(title: 'Thiên mệnh',
      released_on: DateTime(2024, 5, 4, 10, 0),
      place: 'Nhà hát Kịch Việt Nam',
      poster: 'https://file.hstatic.net/200000370191/article/b_4d9b0dc54ff84dad8fb008c1ca580558.jpg',
      genres: 'Kịch hiện đại',
      backdrop: 'https://file.hstatic.net/200000370191/file/dsc00200_da1a3acf1a2e4db291ea57aac39f2fa2_grande.jpg',
      classification: '',
      director: 'NSUT. Phạm Đỗ Kỳ',
      imdb_rating: 9,
      length: '120',
      overview: '“Thiên mệnh” - một vở kịch xoáy sâu vào vấn đề “dùng người” của Trần Thủ Độ, khẳng định tầm quan trọng của “nhân tài” đối với giang sơn, xã tắc… Chỉ với những điều trên, chúng ta có thể thấy tính thời sự của vở kịch, qua câu chuyện cách đây gần 800 năm, vẫn còn nguyên giá trị.“Sẽ không thể có vùng cấm cho bất cứ kẻ nào dám giẫm đạp lên kỷ cương phép nước. Đó cũng chính là con đường của muôn dân Đại Việt, hun đúc nên hào khí mãi ngàn năm..."',
      cast: ['NSND. Anh Tú', 'NSUT. Xuân Bắc', 'Thu Phương'],
    ),

    Schedule(title: 'Romeo và Juliet',
      released_on: DateTime(2024, 5, 4, 10, 0),
      place: 'Nhà hát Kịch Hà Nội',
      poster: 'https://file.hstatic.net/200000370191/article/backrop_2.7mx4mban_cuoib_1e394bbbe3d946c3a2a302ab5267e84d.jpg',
      genres: 'Kịch đương đại',
      backdrop: 'https://file.hstatic.net/200000370191/file/img_0933_cff4a48548af4bdc9dec1b93e17d8ce5_grande.jpg',
      classification: '',
      director: 'NSUT. Anh Tú',
      imdb_rating: 9,
      length: '120',
      overview: '“Romeo và Juliet” là câu chuyện diễn ra trong thành Verona của Italy, với hai dòng họ Montaghiu và Capulet vốn có mối thù hận lâu đời. Bi kịch bắt đầu từ khi con trai của dòng họ Montaghiu là Romeo trà trộn và dự tiệc hóa trang của nhà Capulet, chàng đã gặp nàng Juliet và hai người yêu nhau ngay từ cái nhìn đầu tiên.Câu chuyện Romeo và Juliet không chỉ ngợi ca tình yêu lãng mạn và trong sáng, mà nó còn gửi gắm thông điệp nhân văn. Tình yêu trong sáng, chân thành và đẹp đẽ có thể làm tan chảy những hận thù, định kiến.',
      cast: ['NSND. Anh Tú', 'NSUT. Xuân Bắc', 'Thu Phương'],
    ),

    Schedule( title: 'Ngũ hổ tướng',
      released_on: DateTime(2024, 5, 4, 10, 0),
      place: 'Nhà hát Kịch Việt Nam',
      poster: 'https://file.hstatic.net/200000370191/article/bao_1_c241eded316e4c6ba88ff248f6927177.jpg',
      genres: 'Kịch hiện đại',
      backdrop: 'https://file.hstatic.net/200000370191/file/dsc06373_39cba29f62314b929afdb736ef2a2631_grande.jpg',
      classification: '',
      director: 'NSUT. Xuân Bắc',
      imdb_rating: 8,
      length: '120',
      overview: '“Ngũ hổ tướng” lấy bối cảnh một ngôi nhà chật chội giữa lòng thủ đô, với những khó khăn, thiếu thốn bủa vây xung quanh một gia đình có 5 người con trai. Năm chàng thanh niên - năm “cái tôi” với những sự đố kị, ẩn ức riêng tư, ghen ghét và mưu mô dục vọng … nhưng cũng tràn đầy sự chia sẻ, cảm thông và yêu thương nhau.Mâu thuẫn bắt đầu khi người anh cả cưới vợ (cô dâu Mỹ Xuân). Gia đình có thêm thành viên mới, cuộc sống vỗn dĩ cũng chẳng yên bình nay càng thêm xáo trộn. Những uẩn khúc, mâu thuẫn bùng nổ lên đến đỉnh điểm, điều gì sẽ xảy ra trong gia đình ấy?',
      cast: ['NSND. Anh Tú', 'NSUT. Xuân Bắc', 'Thu Phương'],

    ),

    Schedule(title: "Điều còn lại",
      released_on: DateTime(2024, 5, 4, 10, 0),
      place: 'Thái Nguyên',
      poster: 'https://file.hstatic.net/200000370191/article/bv_760c200ac2994f9f9f2388ab0c60d961.jpg',
      genres: 'Kịch hiện đại',
      backdrop: 'https://file.hstatic.net/200000370191/file/dsc01298_6d6fad25ff6c45fba85665c41a084a02_grande.jpg',
      classification: '',
      director: 'NSUT. Kiều Minh Hiếu',
      imdb_rating: 7,
      length: '120',
      overview: '“Điều còn lại” kể về câu chuyện “hậu chiến” của một gia đình làng quê Bắc Bộ, một trong vô vàn những câu chuyện đẫm nước mắt mà biết bao gia đình Việt Nam đã phải gánh chịu bởi hậu quả của chiến tranh. Nếu như ở ngoài mặt trận, sự tàn khốc của một cuộc chiến là bom rơi đạn nổ và sự hi sinh của người chiến sỹ, thì ở hậu phương, nỗi đau đớn mà chiến tranh để lại không phải tiếng súng và những cái chết, mà đó là những sự đau đớn về tinh thần khi vợ mất chồng, cha mẹ mất con, và ngay cả khi những đứa con còn sống trở về, người thì mất đi vài phần thân thể, người lại mắc chứng tâm thần….',
      cast: ['NSND. Anh Tú', 'NSUT. Xuân Bắc', 'Thu Phương'],
    ),

    Schedule(title: 'Thiên mệnh',
      released_on: DateTime(2024, 5, 4, 10, 0),
      place: 'Nhà hát Kịch Việt Nam',
      poster: 'https://file.hstatic.net/200000370191/article/b_4d9b0dc54ff84dad8fb008c1ca580558.jpg',
      genres: 'Kịch hiện đại',
      backdrop: 'https://file.hstatic.net/200000370191/file/dsc00200_da1a3acf1a2e4db291ea57aac39f2fa2_grande.jpg',
      classification: '',
      director: 'NSUT. Phạm Đỗ Kỳ',
      imdb_rating: 9,
      length: '120',
      overview: '“Thiên mệnh” - một vở kịch xoáy sâu vào vấn đề “dùng người” của Trần Thủ Độ, khẳng định tầm quan trọng của “nhân tài” đối với giang sơn, xã tắc… Chỉ với những điều trên, chúng ta có thể thấy tính thời sự của vở kịch, qua câu chuyện cách đây gần 800 năm, vẫn còn nguyên giá trị.“Sẽ không thể có vùng cấm cho bất cứ kẻ nào dám giẫm đạp lên kỷ cương phép nước. Đó cũng chính là con đường của muôn dân Đại Việt, hun đúc nên hào khí mãi ngàn năm..."',
      cast: ['NSND. Anh Tú', 'NSUT. Xuân Bắc', 'Thu Phương'],
    ),

    Schedule(title: 'Romeo và Juliet',
      released_on: DateTime(2024, 5, 4, 10, 0),
      place: 'Nhà hát Kịch Hà Nội',
      poster: 'https://file.hstatic.net/200000370191/article/backrop_2.7mx4mban_cuoib_1e394bbbe3d946c3a2a302ab5267e84d.jpg',
      genres: 'Kịch đương đại',
      backdrop: 'https://file.hstatic.net/200000370191/file/img_0933_cff4a48548af4bdc9dec1b93e17d8ce5_grande.jpg',
      classification: '',
      director: 'NSUT. Anh Tú',
      imdb_rating: 9,
      length: '120',
      overview: '“Romeo và Juliet” là câu chuyện diễn ra trong thành Verona của Italy, với hai dòng họ Montaghiu và Capulet vốn có mối thù hận lâu đời. Bi kịch bắt đầu từ khi con trai của dòng họ Montaghiu là Romeo trà trộn và dự tiệc hóa trang của nhà Capulet, chàng đã gặp nàng Juliet và hai người yêu nhau ngay từ cái nhìn đầu tiên.Câu chuyện Romeo và Juliet không chỉ ngợi ca tình yêu lãng mạn và trong sáng, mà nó còn gửi gắm thông điệp nhân văn. Tình yêu trong sáng, chân thành và đẹp đẽ có thể làm tan chảy những hận thù, định kiến.',
      cast: ['NSND. Anh Tú', 'NSUT. Xuân Bắc', 'Thu Phương'],
    ),

  ];

  var items = [];
  var searchHistory = [];
  final TextEditingController searchController = TextEditingController();


  List<DateTime?> _dialogCalendarPickerValue = [
    DateTime(2021, 8, 10),
    DateTime(2021, 8, 13),
  ];
  List<DateTime?> _singleDatePickerValueWithDefaultValue = [
    DateTime.now().add(const Duration(days: 1)),
  ];
  List<DateTime?> _multiDatePickerValueWithDefaultValue = [
    DateTime(today.year, today.month, 1),
    DateTime(today.year, today.month, 5),
    DateTime(today.year, today.month, 14),
    DateTime(today.year, today.month, 17),
    DateTime(today.year, today.month, 25),
  ];
  List<DateTime?> _rangeDatePickerValueWithDefaultValue = [
    DateTime(1999, 5, 6),
    DateTime(1999, 5, 21),
  ];

  List<DateTime?> _rangeDatePickerWithActionButtonsWithValue = [
    DateTime.now(),
    DateTime.now().add(const Duration(days: 5)),
  ];

  @override
  void initState () {
    super.initState();
    searchController.addListener(queryListener);
    // loadSchedules();
  }

  @override
  void dispose() {
    searchController.removeListener(queryListener);
    searchController.dispose();
    super.dispose();
  }
  void queryListener() {
    search(searchController.text);
  }

  void search(String query) {
    if (query.isEmpty) {
      setState(() {
        items = allItems;
      });
    } else {
      setState(() {
        items = allItems.where((e) => e.title!.toLowerCase().contains(query.toLowerCase())).toList();
      });
    }
  }

  // void loadSchedules() async {
  //   List<Map<String, dynamic>> schedules = await Schedule.getListOfSchedules(); // Await the result
  //   setState(() {
  //     allItems = schedules;
  //     items = allItems;
  //   });
  // }




  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.network(
          'https://i.pinimg.com/564x/6b/66/51/6b6651cb9ca25ae29beea9502381f349.jpg', // Replace with your image URL
          fit: BoxFit.cover,
          width: double.infinity,
          height: double.infinity,
        ),
        Positioned.fill(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5), // Adjust blur intensity as needed
            child: Container(
              color: Colors.white.withOpacity(0.2), // Adjust opacity as needed
            ),
          ),
        ),

        Padding(
          padding: const EdgeInsets.only(left: 16.0, right: 16.0),
          child: Column(
            children: <Widget>[
              const SizedBox(height: 64.0),
              SearchBar(
                controller: searchController,
                leading: IconButton(
                  onPressed: () {
                    // Handle leading icon button press
                  },
                  icon: Icon(Icons.search),
                ),
                hintText: 'Tìm kiếm lịch diễn ...',
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(width: 2,),
                  Text(
                    'Danh sách lịch diễn',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: Colors.white,
                    ),
                  ),
                  _buildCalendarDialogButton(),
                ],
              ),
              Expanded(
                child: ListView.builder(
                    itemCount: items.isEmpty ? allItems.length : items.length,
                    itemBuilder: (context, index) {
                      final item = items.isEmpty ? allItems[index] : items[index];
                      return ScheduleCard(schedule: item);
                }),
              )
            ],
          ),
        ),
      ]
    );
  }

  String _getValueText(
      CalendarDatePicker2Type datePickerType,
      List<DateTime?> values,
      ) {
    values =
        values.map((e) => e != null ? DateUtils.dateOnly(e) : null).toList();
    var valueText = (values.isNotEmpty ? values[0] : null)
        .toString()
        .replaceAll('00:00:00.000', '');

    if (datePickerType == CalendarDatePicker2Type.multi) {
      valueText = values.isNotEmpty
          ? values
          .map((v) => v.toString().replaceAll('00:00:00.000', ''))
          .join(', ')
          : 'null';
    } else if (datePickerType == CalendarDatePicker2Type.range) {
      if (values.isNotEmpty) {
        final startDate = values[0].toString().replaceAll('00:00:00.000', '');
        final endDate = values.length > 1
            ? values[1].toString().replaceAll('00:00:00.000', '')
            : 'null';
        valueText = '$startDate to $endDate';
      } else {
        return 'null';
      }
    }

    return valueText;
  }

  _buildCalendarDialogButton() {
    const dayTextStyle =
    TextStyle(color: Colors.black, fontWeight: FontWeight.w700);
    final weekendTextStyle =
    TextStyle(color: Colors.grey[500], fontWeight: FontWeight.w600);
    final anniversaryTextStyle = TextStyle(
      color: Colors.red[400],
      fontWeight: FontWeight.w700,
      decoration: TextDecoration.underline,
    );
    final config = CalendarDatePicker2WithActionButtonsConfig(
      calendarViewScrollPhysics: const NeverScrollableScrollPhysics(),
      dayTextStyle: dayTextStyle,
      calendarType: CalendarDatePicker2Type.range,
      selectedDayHighlightColor: Colors.purple[800],
      closeDialogOnCancelTapped: true,
      firstDayOfWeek: 1,
      weekdayLabelTextStyle: const TextStyle(
        color: Colors.black87,
        fontWeight: FontWeight.bold,
      ),
      controlsTextStyle: const TextStyle(
        color: Colors.black,
        fontSize: 15,
        fontWeight: FontWeight.bold,
      ),
      centerAlignModePicker: true,
      customModePickerIcon: const SizedBox(),
      selectedDayTextStyle: dayTextStyle.copyWith(color: Colors.white),
      dayTextStylePredicate: ({required date}) {
        TextStyle? textStyle;
        if (date.weekday == DateTime.saturday ||
            date.weekday == DateTime.sunday) {
          textStyle = weekendTextStyle;
        }
        if (DateUtils.isSameDay(date, DateTime(2021, 1, 25))) {
          textStyle = anniversaryTextStyle;
        }
        return textStyle;
      },
      dayBuilder: ({
        required date,
        textStyle,
        decoration,
        isSelected,
        isDisabled,
        isToday,
      }) {
        Widget? dayWidget;
        if (date.day % 3 == 0 && date.day % 9 != 0) {
          dayWidget = Container(
            decoration: decoration,
            child: Center(
              child: Stack(
                alignment: AlignmentDirectional.center,
                children: [
                  Text(
                    MaterialLocalizations.of(context).formatDecimal(date.day),
                    style: textStyle,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 27.5),
                    child: Container(
                      height: 4,
                      width: 4,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: isSelected == true
                            ? Colors.white
                            : Colors.grey[500],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        }
        return dayWidget;
      },
      yearBuilder: ({
        required year,
        decoration,
        isCurrentYear,
        isDisabled,
        isSelected,
        textStyle,
      }) {
        return Center(
          child: Container(
            decoration: decoration,
            height: 36,
            width: 72,
            child: Center(
              child: Semantics(
                selected: isSelected,
                button: true,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      year.toString(),
                      style: textStyle,
                    ),
                    if (isCurrentYear == true)
                      Container(
                        padding: const EdgeInsets.all(5),
                        margin: const EdgeInsets.only(left: 5),
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.redAccent,
                        ),
                      ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            onPressed: () async {
              final values = await showCalendarDatePicker2Dialog(
                context: context,
                config: config,
                dialogSize: const Size(325, 400),
                borderRadius: BorderRadius.circular(15),
                value: _dialogCalendarPickerValue,
                dialogBackgroundColor: Colors.white,
              );
              if (values != null) {
                // ignore: avoid_print
                print(_getValueText(
                  config.calendarType,
                  values,
                ));
                setState(() {
                  _dialogCalendarPickerValue = values;
                });
              }
            },
            child: const Text('Chọn ngày'),
          ),
        ],
      ),
    );
  }
}
