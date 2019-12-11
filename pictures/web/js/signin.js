function checkPasswd(){
  var inputPw = document.getElementById("password").value;
  var inputId = document.getElementById("name").value;
  if(checkNamePw(inputId,inputPw)) {
    document.getElementById("password-confirm").style.border="";
    document.getElementById("passwd-notice").style.display="none";
    return 1;
  }
  //alert("wrong");
  document.getElementById("password-confirm").style.border="1px solid #ff0000";
  document.getElementById("password-confirm").value = "";
  document.getElementById("passwd-notice").style.display="block";
  return 0;
}
function checkNamePw(name,pw){
  //interface needed
}
