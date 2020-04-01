var _w=window;
var _d=_w.document;
var _b=_d.documentElement||_d.body;    //这三行是用短字母代写，这是非常好的习惯，尤其在代码量很大的时候，可以简写很多。

var _rq=_d.getElementById("rq");
var _rqh=_d.getElementById("rq_hid");

var imgsrc=new Array();

var nowImgId=0;

var hd;

imgsrc[0]='products/dazhaxie1.png';
imgsrc[1]='products/geli01.png';
imgsrc[2]='products/ssx1.png';
imgsrc[3]='products/youyu3.png';

var brn_rq=_d.createElement('div');
brn_rq.setAttribute("id","btn_rq");
brn_rq.style.cssText='position:absolute;bottom:10px;right:0px;';
_rq.appendChild(brn_rq);

btn_rq=_d.getElementById("brn_rq");

var imgObj=new Array();

for(var i=0;i<imgsrc.length;i++){
    var tem_img=_d.createElement("div");
    tem_img.className='img';
    tem_img.id='img_'+i;
    tem_img.style.cssText='width:950px;height:300px;';
    tem_img.innerHTML='<img src="'+imgsrc[i]+'">';
    _rqh.appendChild(tem_img);
    imgObj[i]=_d.getElementById("img_"+i);
    var tem_btn=_d.createElement("a");
    tem_btn.innerHTML=i+1;
    tem_btn.setAttribute("id","btn_"+i);
    tem_btn.style.cssText='color:#fff;background-color:#f00;padding:10px;margin-left:1px;cursor:pointer;';
    brn_rq.appendChild(tem_btn);
}
for(var i=0;i<imgsrc.length;i++){
    var tem_btnc=_d.getElementById("btn_"+i);
    tem_btnc.onmouseover=function(){
        var tem_idStr=this.getAttribute("id").split("_");
        var id=parseInt(tem_idStr[1]);    
        clearInterval(hd);
        nowImgId=id;
        _rqh.style.left=-950*nowImgId+'px';    
    }
    tem_btnc.onmouseout=function(){
        h();
    }

}

_rqh.style.width=imgsrc.length*950+'px';

for(var i=0;i<imgsrc.length;i++){
    imgObj[i].onmouseover=function(){
        clearInterval(hd);
    }
    imgObj[i].onmouseout=function(){
        h();
    }
}
function h(){
    hd=setInterval(function(){
    if((nowImgId+1)==imgsrc.length){
        nowImgId=-1;

    }
    _rqh.style.left=-950*(nowImgId+1)+'px';
    nowImgId++;
    },1000);
}
h();