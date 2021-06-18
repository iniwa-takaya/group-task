function post (){

  if (document.getElementById("session-eye")) {
      
    const password = document.getElementById("session-eye");
    const form = document.getElementById("password");
    const confirmation = document.getElementById("password-confirmation")
    password.addEventListener("click", (e) => {
      if( form.type === 'password' ) {
        form.type = 'text';
        confirmation.type = 'text';
        password.src = '/assets/eye-slash_icon.png';
      } else {
        form.type = 'password';
        confirmation.type = 'password';
        password.src = '/assets/open-eye.png';
      };
    });

  }

 };
 
 window.addEventListener('load', post);