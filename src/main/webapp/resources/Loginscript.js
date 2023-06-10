const wrapper = document.querySelector(".wrapper");
const loginLink = document.querySelector(".login-link");
const registerLink = document.querySelector(".register-link");
const msgBtn = document.querySelector(".msgBtn");
const msgClose = document.querySelector("#msgClose");

registerLink.addEventListener("click", () => {
  wrapper.classList.remove("active");
  registerLink.style.color = "red";
  loginLink.style.color = "white";
});

loginLink.addEventListener("click", () => {
  wrapper.classList.add("active");
  loginLink.style.color = "red";
  registerLink.style.color = "white";
});

msgBtn.addEventListener("click", () => {
  wrapper.style.display = "block";
});

msgClose.addEventListener("click", () => {
  wrapper.style.display = "none";
});
