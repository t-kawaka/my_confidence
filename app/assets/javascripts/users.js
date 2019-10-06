$(function() {
  $('.tab li').click(function() {

    $('.tab li').removeClass('select');

    $(this).addClass('select');

    $('.content li').addClass('hide');
    // 何番目の子要素か調べる
    let index = $('.tab li').index($(this));
    // ↑で取得したindex値から該当するコンテンツを取得
    $('.content li').eq(index).removeClass('hide');
  });
});
