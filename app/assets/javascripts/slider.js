$(function() {
  $('#slider').slick({
  infinite: true,
  slidesToShow: 1,
  slidesToScroll: 1,
  arrows: false,
  fade: true,
  asNavFor: '#slider__thumbnail'
  });
  $('#slider__thumbnail').slick({
  accessibility: true,
  autoplay: true,
  autoplaySpeed: 4000,
  speed: 400,
  arrows: false,
  infinite: true,
  slidesToShow: 3,
  slidesToScroll: 1,
  asNavFor: '#slider',
  focusOnSelect: true,
  });
  });
 