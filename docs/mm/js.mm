<map version="1.0.1">
<!-- To view this file, download free mind mapping software FreeMind from http://freemind.sourceforge.net -->
<node CREATED="1425038185782" ID="ID_880640221" MODIFIED="1425038233356" TEXT="js">
<node CREATED="1425038234951" ID="ID_1646094771" MODIFIED="1425038348198" POSITION="right" TEXT="ECMAScript">
<node CREATED="1425038348067" ID="ID_459958127" MODIFIED="1425038361652" TEXT="&#x95ed;&#x5305;&#xff0c;&#x6307;&#x7684;&#x662f;&#x8bcd;&#x6cd5;&#x8868;&#x793a;&#x5305;&#x62ec;&#x4e0d;&#x88ab;&#x8ba1;&#x7b97;&#x7684;&#x53d8;&#x91cf;&#x7684;&#x51fd;&#x6570;&#xff0c;&#x4e5f;&#x5c31;&#x662f;&#x8bf4;&#xff0c;&#x51fd;&#x6570;&#x53ef;&#x4ee5;&#x4f7f;&#x7528;&#x51fd;&#x6570;&#x4e4b;&#x5916;&#x5b9a;&#x4e49;&#x7684;&#x53d8;&#x91cf;&#x3002;"/>
<node CREATED="1425038391041" ID="ID_717408373" MODIFIED="1425038393769" TEXT="OO">
<node CREATED="1425039108809" ID="ID_554647576" MODIFIED="1425132331665" TEXT="&#x5b9a;&#x4e49;&#x7c7b;&#x6216;&#x5bf9;&#x8c61;">
<node CREATED="1425039117853" FOLDED="true" ID="ID_1822180642" MODIFIED="1425132386978" TEXT="&#x6784;&#x9020;&#x51fd;&#x6570;&#x65b9;&#x5f0f;">
<node CREATED="1425039134809" ID="ID_1640282392" MODIFIED="1425039135758" TEXT="&#x6784;&#x9020;&#x51fd;&#x6570;&#x4f1a;&#x91cd;&#x590d;&#x751f;&#x6210;&#x51fd;&#x6570;&#xff0c;&#x4e3a;&#x6bcf;&#x4e2a;&#x5bf9;&#x8c61;&#x90fd;&#x521b;&#x5efa;&#x72ec;&#x7acb;&#x7684;&#x51fd;&#x6570;&#x7248;&#x672c;"/>
<node CREATED="1425039152139" ID="ID_287936325" MODIFIED="1425039166553" TEXT="function Car(sColor,iDoors,iMpg) {&#xa;  this.color = sColor;&#xa;  this.doors = iDoors;&#xa;  this.mpg = iMpg;&#xa;  this.showColor = function() {&#xa;    alert(this.color);&#xa;  };&#xa;}&#xa;var oCar1 = new Car(&quot;red&quot;,4,23);&#xa;var oCar2 = new Car(&quot;blue&quot;,3,25);"/>
</node>
<node CREATED="1425039175924" FOLDED="true" ID="ID_689895289" MODIFIED="1425132383507" TEXT="&#x539f;&#x578b;&#x65b9;&#x5f0f;">
<node CREATED="1425039177449" ID="ID_1057395282" MODIFIED="1425039325574" TEXT="&#x4e0d;&#x80fd;&#x901a;&#x8fc7;&#x7ed9;&#x6784;&#x9020;&#x51fd;&#x6570;&#x4f20;&#x9012;&#x53c2;&#x6570;&#x6765;&#x521d;&#x59cb;&#x5316;&#x5c5e;&#x6027;&#x7684;&#x503c;"/>
<node CREATED="1425039449767" ID="ID_874322870" MODIFIED="1425039458662" TEXT="&#x5bf9;&#x8c61;&#x88ab;&#x591a;&#x4e2a;&#x5b9e;&#x4f8b;&#x5171;&#x4eab;"/>
<node CREATED="1425039200654" ID="ID_303145934" MODIFIED="1425039535060" TEXT="function Car() {&#xa;}&#xa;Car.prototype.color = &quot;blue&quot;;&#xa;Car.prototype.doors = 4;&#xa;Car.prototype.mpg = 25;&#xa;Car.prototype.drivers = new Array(&quot;Mike&quot;,&quot;John&quot;);&#xa;Car.prototype.showColor = function() {&#xa;  alert(this.color);&#xa;};&#xa;var oCar1 = new Car();&#xa;var oCar2 = new Car();&#xa;&#xa;oCar1.drivers.push(&quot;Bill&quot;);&#xa;alert(oCar1.drivers);&#x9;//&#x8f93;&#x51fa; &quot;Mike,John,Bill&quot;"/>
</node>
<node CREATED="1425039481577" FOLDED="true" ID="ID_931642112" MODIFIED="1425132333193" TEXT="&#x6df7;&#x5408;&#x7684;&#x6784;&#x9020;&#x51fd;&#x6570;/&#x539f;&#x578b;&#x65b9;&#x5f0f;">
<node CREATED="1425039484039" ID="ID_908779180" MODIFIED="1425039797714">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      &#29992;&#26500;&#36896;&#20989;&#25968;&#23450;&#20041;&#23545;&#35937;&#30340;&#25152;&#26377;&#38750;&#20989;&#25968;&#23646;&#24615;&#65292;&#29992;&#21407;&#22411;&#26041;&#24335;&#23450;&#20041;&#23545;&#35937;&#30340;&#20989;&#25968;&#23646;&#24615;&#65288;&#26041;&#27861;&#65289;
    </p>
    <p>
      &#25152;&#26377;&#20989;&#25968;&#37117;&#21482;&#21019;&#24314;&#19968;&#27425;&#65292;&#32780;&#27599;&#20010;&#23545;&#35937;&#37117;&#20855;&#26377;&#33258;&#24049;&#30340;&#23545;&#35937;&#23646;&#24615;&#23454;&#20363;
    </p>
  </body>
</html></richcontent>
</node>
<node CREATED="1425039546708" ID="ID_830532207" MODIFIED="1425039553969" TEXT="function Car(sColor,iDoors,iMpg) {&#xa;  this.color = sColor;&#xa;  this.doors = iDoors;&#xa;  this.mpg = iMpg;&#xa;  this.drivers = new Array(&quot;Mike&quot;,&quot;John&quot;);&#xa;}&#xa;&#xa;Car.prototype.showColor = function() {&#xa;  alert(this.color);&#xa;};&#xa;&#xa;var oCar1 = new Car(&quot;red&quot;,4,23);&#xa;var oCar2 = new Car(&quot;blue&quot;,3,25);&#xa;&#xa;oCar1.drivers.push(&quot;Bill&quot;);&#xa;&#xa;alert(oCar1.drivers);&#x9;//&#x8f93;&#x51fa; &quot;Mike,John,Bill&quot;&#xa;alert(oCar2.drivers);&#x9;//&#x8f93;&#x51fa; &quot;Mike,John&quot;"/>
</node>
<node CREATED="1425039821725" FOLDED="true" ID="ID_785037435" MODIFIED="1425132340857" TEXT="&#x52a8;&#x6001;&#x539f;&#x578b;&#x65b9;&#x6cd5;">
<node CREATED="1425039823532" ID="ID_1875561923" MODIFIED="1425039896127" TEXT="&#x5728;&#x6784;&#x9020;&#x51fd;&#x6570;&#x5185;&#x5b9a;&#x4e49;&#x975e;&#x51fd;&#x6570;&#x5c5e;&#x6027;&#xff0c;&#x800c;&#x51fd;&#x6570;&#x5c5e;&#x6027;&#x5219;&#x5229;&#x7528;&#x539f;&#x578b;&#x5c5e;&#x6027;&#x5b9a;&#x4e49;"/>
<node CREATED="1425039862949" ID="ID_1062088115" MODIFIED="1425039868073" TEXT="function Car(sColor,iDoors,iMpg) {&#xa;  this.color = sColor;&#xa;  this.doors = iDoors;&#xa;  this.mpg = iMpg;&#xa;  this.drivers = new Array(&quot;Mike&quot;,&quot;John&quot;);&#xa;  &#xa;  if (typeof Car._initialized == &quot;undefined&quot;) {&#xa;    Car.prototype.showColor = function() {&#xa;      alert(this.color);&#xa;    };&#xa;&#x9;&#xa;    Car._initialized = true;&#xa;  }&#xa;}&#xa;"/>
<node CREATED="1425040225037" ID="ID_964868098" MODIFIED="1425041591686" TEXT="function StringBuffer () {&#xa;    this._strings_ = new Array();&#xa;    if (typeof StringBuffer._init == &quot;undefined&quot;) {&#xa;&#xa;        StringBuffer.prototype.append = function(str) {&#xa;            this._strings_.push(str);&#xa;        };&#xa;&#xa;        StringBuffer.prototype.toString = function() {&#xa;            return this._strings_.join(&quot;&quot;);&#xa;        };&#xa;        StringBuffer._init = true;&#xa;    }&#xa;}"/>
</node>
</node>
<node CREATED="1425038394603" ID="ID_488608077" MODIFIED="1425038412512" TEXT="&#x4e00;&#x79cd;&#x9762;&#x5411;&#x5bf9;&#x8c61;&#x8bed;&#x8a00;&#x9700;&#x8981;&#x5411;&#x5f00;&#x53d1;&#x8005;&#x63d0;&#x4f9b;&#x56db;&#x79cd;&#x57fa;&#x672c;&#x80fd;&#x529b;&#xff1a; &#xa;&#x5c01;&#x88c5; - &#x628a;&#x76f8;&#x5173;&#x7684;&#x4fe1;&#x606f;&#xff08;&#x65e0;&#x8bba;&#x6570;&#x636e;&#x6216;&#x65b9;&#x6cd5;&#xff09;&#x5b58;&#x50a8;&#x5728;&#x5bf9;&#x8c61;&#x4e2d;&#x7684;&#x80fd;&#x529b;&#xa;&#x805a;&#x96c6; - &#x628a;&#x4e00;&#x4e2a;&#x5bf9;&#x8c61;&#x5b58;&#x50a8;&#x5728;&#x53e6;&#x4e00;&#x4e2a;&#x5bf9;&#x8c61;&#x5185;&#x7684;&#x80fd;&#x529b;&#xa;&#x7ee7;&#x627f; - &#x7531;&#x53e6;&#x4e00;&#x4e2a;&#x7c7b;&#xff08;&#x6216;&#x591a;&#x4e2a;&#x7c7b;&#xff09;&#x5f97;&#x6765;&#x7c7b;&#x7684;&#x5c5e;&#x6027;&#x548c;&#x65b9;&#x6cd5;&#x7684;&#x80fd;&#x529b;&#xa;&#x591a;&#x6001; - &#x7f16;&#x5199;&#x80fd;&#x4ee5;&#x591a;&#x79cd;&#x65b9;&#x6cd5;&#x8fd0;&#x884c;&#x7684;&#x51fd;&#x6570;&#x6216;&#x65b9;&#x6cd5;&#x7684;&#x80fd;&#x529b;"/>
</node>
</node>
</node>
</map>
