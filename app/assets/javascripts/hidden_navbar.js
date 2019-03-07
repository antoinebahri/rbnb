;(function (){
    var previousScroll = 0;
    var navbar = document.getElementById('navbar-home'),
        navClasses = navbar.classList; // classList doesn't work <IE10

    window.addEventListener('scroll', function(e){
       var currentScroll = window.scrollY;
       var isDown = currentScroll > previousScroll;

       if ( isDown && !navClasses.contains('scrolled') ){
          // scrolling down, didn't add class yet
          navClasses.add('scrolled'); // we hide the navbar
       } else if ( !isDown ){
          // scrolling up
          navClasses.remove('scrolled'); // won't error if no class found
       }

       // always update position
       previousScroll = currentScroll;
    });
}());
