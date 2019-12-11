function getTag(name){
  var tag = new Array("china","america","england");
  //tag = {};//needed
//  var classStyle="tag";

  var str="";
  if(document.getElementById(name).innerHTML!=str){
    document.getElementById(name).innerHTML=str;
    return ;
  }
  str="";
  for (var i = 0; i < tag.length; i++) {
    str += '<input type="button" name="button" class="tag" onclick="changeColor(\''+tag[i%tag.length]+'-button\');"'+'id="'+tag[i%tag.length]+'-button"'+'value=\"'+tag[i%tag.length]+'\">';
  }
  document.getElementById(name).innerHTML=str;
  document.getElementById(name).style.height="auto";
}
function changeColor(tagId){
  var tag=document.getElementById(tagId);
  if(tag.style.backgroundColor=="#494e8f") tag.style.backgroundColor="#585eaa";
  else   tag.style.backgroundColor="#494e8f";
//  alert("//"+str+"//");
}

function overturnTag(str1,str2){
  var target=document.getElementById(str1);
  var button=document.getElementById(str2);
//  alert(str2);

  if(target.style.display=="block"){
    target.style.display="none";
    button.innerHTML="SHOWTAG";
  }
  else{
     target.style.display="block";
     button.innerHTML="HIDETAG";
  }
}
