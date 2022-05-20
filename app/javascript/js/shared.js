
window.addEventListener("scroll", function () {
  const nav = document.querySelector('nav');
  const navSearch = document.querySelector('#js-search-form')
  
  nav.classList.toggle("scroll-nav", window.scrollY > 700);
  navSearch.classList.toggle("d-inline", window.scrollY > 700);
  navSearch.classList.toggle("d-none", window.scrollY < 710);
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