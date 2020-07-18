$(document).on('turbolinks:load', function (){
         $('.slick2').slick({
            arrows: true,
            autoplay: false,
            dots: false,
            appendArrows: $('.transform'),
            prevArrow: '<span class="prev-arrow"></span>',
            nextArrow: '<div class="next-kage">カゲを変える！</div>',
          });
      });
      
      