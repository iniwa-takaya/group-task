function post (){
  const password = document.getElementById("eye-login-btn");
  const form = document.getElementById("user_password")
  password.addEventListener("click", (e) => {
    if( form.type === 'password' ) {
      form.type = 'text';
      password.src = '/assets/eye-slash_icon.png';
    } else {
      form.type = 'password';
      password.src = '/assets/open-eye.png';
    };
  });
 };
 
 window.addEventListener('load', post);