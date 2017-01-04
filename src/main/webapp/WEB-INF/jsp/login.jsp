<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<title>Login Form</title>
<script src="https://apis.google.com/js/platform.js" async defer></script>
<meta name="google-signin-client_id" content="1006649864845-iborip4tjnfg7pu6ub53dmln4dkqgutl.apps.googleusercontent.com">
<script>
 function signOut() {
   var auth2 = gapi.auth2.getAuthInstance();
   auth2.signOut().then(function () {
     console.log('User signed out.');
     window.location.replace('/creditapp/login');
   });

 }
</script>
</head>
<body>
   <h2>${message}</h2>
   <html>
   <body>
   <h2>Войдите в Google</h2>
   <p>
       <c:if test="${signed == true}">
           <img src="${image}">
           <a href="#" onclick="signOut();">Выйти</a>
       </c:if>
   </p>

   <div class="g-signin2" data-onsuccess="onSignIn"></div>

    <script>
    function onSignIn(googleUser) {
      var profile = googleUser.getBasicProfile();
      console.log('ID: ' + profile.getId()); // Do not send to your backend! Use an ID token instead.
      console.log('Name: ' + profile.getName());
      console.log('Image URL: ' + profile.getImageUrl());
      console.log('Email: ' + profile.getEmail());
      <c:if test="${signed != true}">
      window.location.replace('/creditapp/vk_auth?id='+ profile.getId()+'&name='+profile.getName()+'&url='+profile.getImageUrl());
      </c:if>
    }
    </script>

   </body>
   </html>
</body>
</html>