$(function() {
  //.side__head__box__menu__iconがクリックされた時
  $('.side__head__box__menu__icon').click(function() {
      //クリックされた.side__head__box__menu__iconの次の要素の横幅を開いたり閉じたりする。
      $(this).next().slideToggle();
      //クリックされた.side__head__box__menu__iconの次の要素の横幅を閉じる。
      $('.side__head__box__menu__icon').not($(this)).slideToggle();
  });
});
