function initUpdateNavbarOnScroll() {
  console.log("hey")
  const banner = document.querySelector('.banner');
  const navbar = document.querySelector('.navbar-wagon');
  if (banner) {
    if (navbar) {
      window.addEventListener('scroll', () => {
        if (window.scrollY > 360) {
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

