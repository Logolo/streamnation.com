// Generated by CoffeeScript 1.4.0
(function(){$(document).ready(function(){var e,t,n,r,i,s,o,u,a,f,l;f=1;r=$(window);n=[];s=0;l=0;e=$(".reloading-gif");t=$(".site-header");u=t.height();o=$(".site-footer").offset().top;$(".hero-text").addClass("active");$(".hero-signup-button").addClass("active");(i=function(){n=$("body").children("section").map(function(){return{selector:$(this),top:$(this).offset().top,bottom:$(this).offset().top+$(this).height()}});l=r.height();return setTimeout(function(){return r.one("resize",i)},1e3)})();(a=function(){return setTimeout(function(){f=r.scrollTop();f>n[1].top-u?t.addClass("condensed"):f<=u&&t.removeClass("condensed");$.each(n,function(e,t){var r,i,u;r=((i=n[e+1])!=null?i.top:void 0)||o;if(t.top<=(u=f+l/2)&&u<r){t.selector.addClass("current");s=e}else t.selector.removeClass("current");return t.selector.find(".next-tab, .back-to-top").toggleClass("sticky",f+l>r)});e.each(function(){var e,t;t=$(this).data("src");e=$(this).data("delay")||0;if(!$(this).closest(".home-section").hasClass("current"))return $(this).hide().attr("src",null);if($(this).attr("src")==null)return $(this).delay(e).show(0).attr("src",t+"?"+Date.now())});return r.one("scroll",a)},100)})();return $("a",".page-nav").click(function(e){var t;e.preventDefault();switch($(this).attr("id")){case"prev-section":t=s-1;break;case"next-section":t=s+1;break;case"back-to-top":t=0}t<0&&(t=0);t>=n.length&&(t=n.length-1);return $("body").animate({scrollTop:n[t].top},function(){return s=t})})})}).call(this);