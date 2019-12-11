function checkPasswd(){
  if(document.getElementById("password").value == document.getElementById("password-confirm").value) {
    document.getElementById("password-confirm").style.border="";
    document.getElementById("repeat-passwd-notice").style.display="none";
    return 1;
  }
  //alert("wrong");
  document.getElementById("password-confirm").style.border="1px solid #ff0000";
  document.getElementById("password-confirm").value = "";
  document.getElementById("repeat-passwd-notice").style.display="block";
  return 0;
}
