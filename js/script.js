// Generated by CoffeeScript 1.4.0
(function(){$(document).ready(function(){var e,t,n,r,i,s,o,u,a,f,l;f=1;i=$(window);n=[];o=0;l=0;e=$(".reloading-gif");t=$(".site-header");u=t.height();r=$(".signup-footer");$(".hero-text").addClass("active");$(".hero-signup-button").addClass("active");(s=function(){n=$("body").children("section").map(function(){return{selector:$(this),top:$(this).offset().top}});l=i.height();return setTimeout(function(){return i.one("resize",s)},1e3)})();(a=function(){return setTimeout(function(){f=i.scrollTop();f>n[1].top-u?t.addClass("condensed"):f<=u&&t.removeClass("condensed");r.toggleClass("bottom",f>20);$.each(n,function(e,t){var r,i,s;r=((i=n[e+1])!=null?i.top:void 0)||99999;if(t.top<=(s=f+l/2)&&s<r){t.selector.addClass("current");return o=e}return t.selector.removeClass("current")});e.each(function(){var e,t;t=$(this).data("src");e=$(this).data("delay")||0;if(!$(this).closest(".home-section").hasClass("current"))return $(this).hide().attr("src",null);if($(this).attr("src")==null)return $(this).delay(e).show(0).attr("src",t+"?"+Date.now())});return i.one("scroll",a)},100)})();return $("a",".page-nav").click(function(e){var t;e.preventDefault();switch($(this).attr("id")){case"prev-section":t=o-1;break;case"next-section":t=o+1;break;case"back-to-top":t=0}t<0&&(t=0);t>=n.length&&(t=n.length-1);return $("body").animate({scrollTop:n[t].top},function(){return o=t})})})}).call(this);