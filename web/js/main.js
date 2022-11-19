(function ($) {
    "use strict";
    /*---------------------------
     Commons Variables
     ------------------------------ */
    var $window = $(window),
            $body = $("body");

    /*---------------------------
     Menu Fixed On Scroll Active
     ------------------------------ */
    $(window).on("scroll", function (e) {
        var window_top = $(window).scrollTop() + 1;
        if (window_top > 250) {
            $(".sticky-nav").addClass("menu_fixed animated fadeInDown");
        } else {
            $(".sticky-nav").removeClass("menu_fixed animated fadeInDown");
        }
    });

    /*----------------------------------------
     Bootstrap dropdown               
     -------------------------------------------*/

    $('.dropdown').on('show.bs.dropdown', function () {
        $(this).find('.dropdown-menu').first().stop(true, true).slideDown();
    });
    // Add slideDown animation to Bootstrap dropdown when expanding.

    $('.dropdown').on('show.bs.dropdown', function () {
        $(this).find('.dropdown-menu').first().stop(true, true).slideDown();
    });
    // Add slideUp animation to Bootstrap dropdown when collapsing.
    $('.dropdown').on('hide.bs.dropdown', function () {
        $(this).find('.dropdown-menu').first().stop(true, true).slideUp();
    });


    /*---------------------
     Home Slider
     ---------------------- */

    var homeSlider = new Swiper('.home-swiper', {
        loop: true,
        speed: 1000,
        effect: "fade",
        autoplay: {
            delay: 4000,
            disableOnInteraction: false,
        },

        pagination: {
            el: '.swiper-pagination',
            clickable: true
        },

        navigation: {
            nextEl: '.swiper-button-next',
            prevEl: '.swiper-button-prev',
        },
    });

    /*-------------------------------
     Feature Product Slider
     -------------------------------- */

    var productSlider = new Swiper('.feature-product-slider.swiper-container', {
        slidesPerView: 2,
        spaceBetween: 30,
        speed: 1500,
        loop: true,

        // Navigation arrows

        navigation: {
            nextEl: ".swiper-button-next",
            prevEl: ".swiper-button-prev",
        },

        breakpoints: {
            0: {
                slidesPerView: 1,
            },
            478: {
                slidesPerView: 1,
            },
            576: {
                slidesPerView: 1,
            },
            768: {
                slidesPerView: 1,
            },
            992: {
                slidesPerView: 2,
            },
            1200: {
                slidesPerView: 2,
            },
        },
    });

    /*---------------------------
     Product Details Slider 
     ------------------------------ */

    var imagesSlider = new Swiper(".images-slider", {
        spaceBetween: 15,
        slidesPerView: 3,
        watchSlidesVisibility: true,
        watchSlidesProgress: true,
        loop: true,
    });
    var topImageSlider = new Swiper(".slider-top", {
        spaceBetween: 0,
        slidesPerView: 1,
        effect: 'fade',
        loop: true,
        fadeEffect: {
            crossFade: true,
        },
        navigation: {
            nextEl: ".swiper-button-next",
            prevEl: ".swiper-button-prev",
        },
        thumbs: {
            swiper: imagesSlider,
        },
    });

    var productSlider = new Swiper('.related-product-slider', {
        slidesPerView: 4,
        spaceBetween: 30,
        speed: 1000,
        loop: true,

        // Navigation arrows

        navigation: {
            nextEl: ".swiper-button-next",
            prevEl: ".swiper-button-prev",
        },

        breakpoints: {
            0: {
                slidesPerView: 1,
            },
            478: {
                slidesPerView: 1,
            },
            576: {
                slidesPerView: 2,
            },
            768: {
                slidesPerView: 2,
            },
            992: {
                slidesPerView: 3,
            },
            1200: {
                slidesPerView: 4,
            },
        },
    });

    /*----------------------------
     Cart Plus Minus Button
     ------------------------------ */
    $(".qtybutton").on("click", function () {
        var $button = $(this);
        var oldValue = $button.parent().find("input").val();
        if ($button.text() === "+") {
            var newVal = parseFloat(oldValue) + 1;
        } else {
            // Don't allow decrementing below zero
            if (oldValue > 1) {
                var newVal = parseFloat(oldValue) - 1;
            } else {
                newVal = 1;
            }
        }
        $button.parent().find("input").val(newVal);
    });

})(jQuery);
