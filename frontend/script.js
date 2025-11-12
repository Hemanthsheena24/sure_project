// ----------------------
// Banner Slider
// ----------------------
let currentIndex = 0;
const slides = document.querySelectorAll(".hero img");

function showSlide(index) {
  slides.forEach((slide, i) => {
    slide.classList.toggle("active", i === index);
  });
}

function nextSlide() {
  currentIndex = (currentIndex + 1) % slides.length;
  showSlide(currentIndex);
}

setInterval(nextSlide, 3000);
showSlide(currentIndex);

// ----------------------
// Login System Connection
// ----------------------
const username = localStorage.getItem("username");
const loginLink = document.getElementById("loginLink");
const logoutLink = document.getElementById("logoutLink");

// If user is logged in
if (username) {
  loginLink.textContent = `Welcome, ${username}`;
  loginLink.removeAttribute("href");
  logoutLink.style.display = "inline";
}

// Logout functionality
logoutLink.addEventListener("click", () => {
  localStorage.removeItem("username");
  window.location.href = "abc.html";
});
