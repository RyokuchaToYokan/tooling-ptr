$(document).on('turbolinks:load', function() {
  $(function() {
    //.side__head__box__menu__iconがクリックされた時
    $('.side__head__box__menu__icon').click(function() {
        //クリックされた.side__head__box__menu__iconの次の要素の横幅を開いたり閉じたりする。
        $(this).next().slideToggle();
        //クリックされた.side__head__box__menu__iconの次の要素の横幅を閉じる。
        $('.side__head__box__menu__icon').not($(this)).slideToggle();
    });
  });

  $(function () {
    // ナビの範囲外のどこかをクリックしたときに発動
    $(".main").on('click', function () {
        if ($('.side__head__box__menu__inner').is(':visible')) {
            // ナビが表示されていたらcloseを実行
            $('.side__head__box__menu__icon').trigger('click');
        } else {
            // ナビが非表示の場合は起動しない
            event.stopPropagation();
        }
    });
  });
});