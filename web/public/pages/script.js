let lastScrollY = window.scrollY;

window.addEventListener('scroll', () => {
  const currentScrollY = window.scrollY;

  if (currentScrollY > lastScrollY && currentScrollY > 100) {
    document.querySelector('nav').classList.add('hidden');
  } else {
    document.querySelector('nav').classList.remove('hidden');
  }

  lastScrollY = currentScrollY;
});