function initUpdateNavbarOnScroll() {
  const banner = document.querySelector('.banner');
  const navbar = document.querySelector('.navbar-wagon');
  console.log(banner)
  console.log(navbar)
  if (banner) {
    if (navbar) {
      window.addEventListener('scroll', () => {
        if (window.scrollY > 10) {
          navbar.classList.add("navbar-wagon-white");
        } else {
          navbar.classList.remove('navbar-wagon-white');
        }
      });
    }
  } else {
    navbar.classList.add('navbar-wagon-white');
  }
}

export { initUpdateNavbarOnScroll };



