var currentpage=1;
var pagecount=1;
var count; //row count

function search(start,num,txt,flag){


$.post('ajax.php',{txt:txt, flag:flag, num:num, start:start  },function(resp)
{
    console.log(resp);
    var data=JSON.parse(resp);
    if(data=="no results") {
        $("#target").html("<td colspan="+5+"><h3>No results were found</h3></td>");
        $("#pages").html("");
        return;}
  //console.log(data);
    if(flag!=2) count=data[0].co;
    var array=data[0].arr;
    //console.log(array);
    var len=array.length;
    var content="";
    for(var i =0 ; i<len;i++){
        var cname=array[i].cname;
        var cdesc=array[i].cdesc;
        var pname=array[i].pname;
        var dname=array[i].dname;
        content+="<tr>"+
        "<th scope="+"row>"+""+(i+1)+"</th>"+
        "<td>"+cname+"</td>"+
        "<td>"+cdesc+"</td>"+
        "<td>"+pname+"</td>"+
        "<td>"+dname+"</td>"+
        +"</tr>";
      }

  var pages="";
  pages+= "<a href="+"javascript:pagechange("+(-1)+");"+">&laquo;</a>"
  currentpage=Math.ceil(start/num);
  pagecount=Math.ceil(count/num);
  var mrk="";
  for(var i =0 ; i< pagecount;i++){
      if(currentpage==i) mrk=" class= active" ;else mrk="";
      pages+="<a href="+"javascript:pagechange("+(i+1)+");"+ mrk +">"+(i+1)+"</a>";
    }
  pages+=  "<a href="+"javascript:pagechange("+(-2)+");"+" >&raquo;</a>"
$("#target").html(content);
$("#pages").html(pages);

  }
);

}


function pagechange(val){
if(val==-1)val=Math.max(currentpage,1);
if(val==-2)val=Math.min(currentpage+2,pagecount);
  var num=5;
  var start=(val-1)*num;
  //console.log(start);
  txt=$("#mainsearch").val();
  var flag=2;
  search(start,num,txt,flag);
}


$(document).ready(function(){
  var num=5;
  var start=0;
  txt="";
  var flag=1;
  search(start,num,txt,flag);
});
$("#start").click(function(){
  var num=5;
  var start=0;
  txt=$("#mainsearch").val();
  var flag=1;
   search(start,num,txt,flag);
});
$("#mainsearch").keyup(function(){
  var num=5;
  var start=0;
  var flag=1;
  txt=$("#mainsearch").val();
  if(txt.length > 2) search(start,num,txt,flag);
});
