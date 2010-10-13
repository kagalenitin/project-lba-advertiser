$(document).ready(function(){

    //When mouse rolls over for PROFILE
    $("li.menuProfile").mouseover(function(){
        $(this).stop().animate({height:'70px'},{queue:false, duration:600, easing: 'easeOutBounce'})
    });

    //When mouse is removed for PROFILE 
    $("li.menuProfile").mouseout(function(){
        $(this).stop().animate({height:'30px'},{queue:false, duration:600, easing: 'easeOutBounce'})
    });

    //When mouse rolls over for CONTRACT
    $("li.menuContract").mouseover(function(){
        $(this).stop().animate({height:'150px'},{queue:false, duration:600, easing: 'easeOutBounce'})
    });

    //When mouse is removed for CONTRACT
    $("li.menuContract").mouseout(function(){
        $(this).stop().animate({height:'30px'},{queue:false, duration:600, easing: 'easeOutBounce'})
    });

    //When mouse rolls over for Ad
    $("li.menuAd").mouseover(function(){
        $(this).stop().animate({height:'200px'},{queue:false, duration:600, easing: 'easeOutBounce'})
    });

    //When mouse is removed for Ad
    $("li.menuAd").mouseout(function(){
        $(this).stop().animate({height:'30px'},{queue:false, duration:600, easing: 'easeOutBounce'})
    });
    
    //When mouse rolls over for Signout
    $("li.menuProduct").mouseover(function(){
        $(this).stop().animate({height:'120px'},{queue:false, duration:600, easing: 'easeOutBounce'})
    });

    //When mouse is removed for Signout
    $("li.menuProduct").mouseout(function(){
        $(this).stop().animate({height:'30px'},{queue:false, duration:600, easing: 'easeOutBounce'})
    });


});