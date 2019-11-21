function checkPasswd(){
  if(document.getElementById("password").value == document.getElementById("password-confirm").value) {
    document.getElementById("password-confirm").style.border="";
    document.getElementById("repeatPasswdNotice").style.display="none";
    return 1;
  }
  //alert("wrong");
  document.getElementById("password-confirm").style.border="1px solid #ff0000";
  document.getElementById("password-confirm").value = "";
  document.getElementById("repeatPasswdNotice").style.display="block";
  return 0;
}
