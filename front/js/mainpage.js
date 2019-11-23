
function getTag(name){
  var tag = new Array("china","america","england");
  //tag = {};//needed
//  var classStyle="tag";

  var str="";
  if(document.getElementById(name).innerHTML!=str){
    document.getElementById(name).innerHTML=str;
    return ;
  }
  str="<br><br>";
  for (var i = 0; i < tag.length; i++) {
    str += '<button type="button" name="button" class="tag" onclick="changeColor(\''+tag[i%tag.length]+'-button\');"'+'id="'+tag[i%tag.length]+'-button"'+'>'+tag[i%tag.length]+'</button>';
  }
  document.getElementById(name).innerHTML=str;
//  document.getElementById('countryBox').style.height="auto";
  var faBox=name+"Box";
  document.getElementById(faBox).style.height="auto";
}
function changeColor(tagId){
  var tag=document.getElementById(tagId);
  if(tag.style.backgroundColor=="blue") tag.style.backgroundColor="rgba(100,100,100,100.7)";
  else   tag.style.backgroundColor="blue";
//  alert("//"+str+"//");
}
