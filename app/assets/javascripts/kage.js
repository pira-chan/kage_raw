$(document).on('turbolinks:load', function (){
         $('.slick2').slick({
            arrows: true,
            autoplay: true,
            pauseOnHover: false,
            dots: false,
            appendArrows: $('.transform'),
            prevArrow: '<img src="https://kage-raw.s3-ap-northeast-1.amazonaws.com/left-arrow.png" class="prev-arrow" >',
            // nextArrow: '<div class="next-kage">カゲを変える！</div>',
            nextArrow: '<img src="https://kage-raw.s3-ap-northeast-1.amazonaws.com/right-arrow.png" class="next-arrow">',
          });
      });
      
      