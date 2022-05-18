
window.addEventListener("scroll", function () {
  // navの格納
  const nav = document.querySelector("nav");
  // 700px以上スクロールしたらnavに「scroll-nav」クラスをつける
  // topとそれ以外のページの出し分け時に、navだとおそらく上手く出し分けられないため改修必要そう
  nav.classList.toggle("scroll-nav", window.scrollY > 700);
});

// import aos.js
import AOS from 'aos';
import 'aos/dist/aos.css';

document.addEventListener('DOMContentLoaded', function() {
  AOS.init({
    easing: 'ease',
    once: true
  });
});