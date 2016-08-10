$(document).ready(function(){
	$(window).on('load resize', function(){
		$('.navbar-top-text').css({'left':$('.navbar-right').offset().left-10});
		$('#map').parents('.row').find('[class*="col-"]').height($(window).height() - $('header nav').height() - $('.search').height() - 40);
		$('.col-list-map ul').height($(window).height() - $('.col-list-map ul').offset().top);
	});

	$("#radio").slider();

	$('.col-list-map ul').on('load scroll', function(){
		if($(this).scrollTop() > 0){
			$(this).parent('.list-shadow').find('.list-shadow.top').addClass('active');
		}else{
			$(this).parent('.list-shadow').find('.list-shadow.top').removeClass('active');
		}
	});

	//scrollReveal
    window.scrollReveal = new scrollReveal({ reset: false });

    $("#banner").on('slide.bs.carousel', function (e) {
        $(".active", e.target).find('.carousel-text h2').animate({'opacity':'0'}, function(){
        	$(this).animate({'margin-top':'10px'});
        });

        $(".active", e.target).find('.carousel-text p').animate({'opacity':'0'}, function(){
        	$(this).animate({'margin-top':'10px'});
        });
    });

    $("#banner").on('slid.bs.carousel', function (e) {
    	$(".active", e.target).find('.carousel-text h2').animate({'margin-top':'0', 'opacity':'1'});
    	$(".active", e.target).find('.carousel-text p').animate({'margin-top':'0', 'opacity':'1'});
    });

});