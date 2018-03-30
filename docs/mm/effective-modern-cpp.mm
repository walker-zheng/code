<map version="1.0.1">
<!-- To view this file, download free mind mapping software FreeMind from http://freemind.sourceforge.net -->
<node CREATED="1469516758721" ID="ID_1230127025" MODIFIED="1521626646958" TEXT="effective-modern-cpp">
<node CREATED="1469516963609" FOLDED="true" ID="ID_1786782526" MODIFIED="1521626646436" POSITION="right" TEXT="&#x7b80;&#x4ecb;">
<node CREATED="1469516970009" FOLDED="true" ID="ID_126364485" MODIFIED="1521626646281" TEXT="&#x79fb;&#x52a8;&#x8bed;&#x4e49;(&#x53f3;&#x503c;)">
<node CREATED="1469517211511" ID="ID_1841938677" MODIFIED="1469517213203" TEXT="&#x53f3;&#x503c;&#x4ee3;&#x8868;&#x7740;&#x4f60;&#x53ef;&#x4ee5;&#x5f15;&#x7528;&#x7684; &#x4e34;&#x65f6;&#x5bf9;&#x8c61;&#xff0c;&#x4e0d;&#x7ba1;&#x662f;&#x901a;&#x8fc7;&#x53d8;&#x91cf;&#x540d;&#x8fd8;&#x662f;&#x901a;&#x8fc7;&#x4e00;&#x4e2a;&#x6307;&#x9488;&#x6216;&#x8005;&#x5de6;&#x503c;&#x5f15;&#x7528;"/>
<node CREATED="1469517251824" FOLDED="true" ID="ID_618950887" MODIFIED="1521626646124" TEXT="&#x5224;&#x65ad;&#x53f3;&#x503c;">
<node CREATED="1469517323367" ID="ID_1460841863" MODIFIED="1469517326610" TEXT="&#x662f;&#x5426;&#x53ef;&#x4ee5;&#x53d6;&#x5740;"/>
<node CREATED="1469517328350" ID="ID_724503149" MODIFIED="1469517348704" TEXT="&#x6240;&#x6709;&#x7684;&#x53c2;&#x6570;&#x90fd;&#x662f;&#x5de6;&#x503c;"/>
</node>
<node CREATED="1469517537981" FOLDED="true" ID="ID_1218858845" MODIFIED="1521626646124" TEXT="&#x5b8c;&#x7f8e;&#x8f6c;&#x53d1;">
<node CREATED="1469517543404" ID="ID_892699043" MODIFIED="1469517566385" TEXT="&#x56e0;&#x4e3a;&#x5f62;&#x53c2;&#x53ea;&#x80fd;&#x662f;&#x5de6;&#x503c;&#xff0c;&#x4f46;&#x662f;&#x7ed9;&#x4ed6;&#x4eec;&#x521d;&#x59cb;&#x5316;&#x7684;&#x5b9e;&#x53c2;&#x5373;&#x6709;&#x53ef;&#x80fd;&#x662f;&#x53f3;&#x503c;&#x4e5f;&#x6709;&#x53ef;&#x80fd;&#x662f;&#x5de6;&#x503c;"/>
<node CREATED="1469517579660" ID="ID_1954816035" MODIFIED="1469517581304" TEXT="&#x5728;&#x5b8c;&#x7f8e;&#x8f6c;&#x53d1;&#x4e2d;&#x4e00;&#x4e2a;&#x4f20;&#x9012;&#x7ed9;&#x4e00;&#x4e2a;&#x51fd;&#x6570;&#x7684;&#x5b9e;&#x53c2;&#x518d;&#x4f20;&#x9012;&#x7ed9;&#x7b2c;&#x4e8c;&#x4e2a;&#x51fd;&#x6570;&#xff0c;&#x4ee5;&#x6b64;&#x6765;&#x4fdd;&#x8bc1;&#x539f;&#x59cb;&#x7684;&#x53c2;&#x6570;&#x7684;&#x53f3; &#x503c;&#x7279;&#x6027;&#x6216;&#x8005;&#x5de6;&#x503c;&#x7279;&#x6027;&#x88ab;&#x4fdd;&#x7559;"/>
</node>
</node>
</node>
<node CREATED="1469516936443" FOLDED="true" ID="ID_878790193" MODIFIED="1522128730039" POSITION="right" TEXT="&#x7c7b;&#x578b;&#x63a8;&#x5bfc;">
<font NAME="&#x5fae;&#x8f6f;&#x96c5;&#x9ed1;" SIZE="12"/>
<node CREATED="1469518247513" FOLDED="true" ID="ID_206590288" MODIFIED="1521626646281">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      1. &#27169;&#26495;&#25512;&#23548;
    </p>
  </body>
</html></richcontent>
<node CREATED="1469518319455" FOLDED="true" ID="ID_223319055" MODIFIED="1521626646124" TEXT="&#x60c5;&#x51b5;1. ParamType &#x662f;&#x4e00;&#x4e2a;&#x6307;&#x9488;&#x6216;&#x5f15;&#x7528;&#x7c7b;&#x578b;&#xff0c;&#x4f46;&#x4e0d;&#x662f;&#x901a;&#x7528;&#x5f15;&#x7528;(&#x7edf;&#x4e00;&#x5f15;&#x7528;)">
<node CREATED="1469518439374" ID="ID_223184621" MODIFIED="1469518675395" TEXT="1. &#x5982;&#x679c;expr&#x662f;&#x5f15;&#x7528;&#xff0c;&#x5219;&#x5ffd;&#x7565;&#x5f15;&#x7528;&#x7684;&#x90e8;&#x5206;">
<font BOLD="true" NAME="&#x5fae;&#x8f6f;&#x96c5;&#x9ed1;" SIZE="12"/>
</node>
<node CREATED="1469518465975" ID="ID_267453114" MODIFIED="1469518500955" TEXT="2. &#x7136;&#x540e;&#x5229;&#x7528;exprt&#x7684;&#x7c7b;&#x578b;&#x548c;ParamType&#x5bf9;&#x6bd4;&#xff0c;&#x53bb;&#x5224;&#x65ad;T&#x7684;&#x7c7b;&#x578b;"/>
<node CREATED="1469518515622" FOLDED="true" ID="ID_623542691" MODIFIED="1521626645885">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      template&lt;typename T&gt;<br />void f(const T&amp; param); // ParamType &#26159; const T&amp;<br />int x = 27; // x&#26159;&#19968;&#20010;int
    </p>
    <p>
      const int cx = x; // cx&#26159;&#19968;&#20010;const int
    </p>
    <p>
      const int&amp; rx = x; // rx&#26159;const int&#30340;&#24341;&#29992;<br />f(x); // T&#26159;int&#65292;param&#30340;&#31867;&#22411;&#26102;int&amp;
    </p>
    <p>
      f(cx); // T&#26159;const int&#65292;param&#30340;&#31867;&#22411;&#26159;const int&amp;
    </p>
    <p>
      f(rx); // T&#26159;const int&#65292;&#160;param&#30340;&#31867;&#22411;&#26102;const int&amp;
    </p>
  </body>
</html></richcontent>
<node CREATED="1469518594325" ID="ID_1877771241" MODIFIED="1469518596114" TEXT="&#x5f53;&#x4f20;&#x9012;&#x4e00;&#x4e2a; const  &#x5bf9;&#x8c61;&#x7ed9;&#x4e00;&#x4e2a;&#x5f15;&#x7528;&#x53c2;&#x6570;&#xff0c;&#x4ed6;&#x4eec;&#x671f;&#x671b;&#x5bf9;&#x8c61;&#x4f1a;&#x4fdd;&#x7559;&#x5e38;&#x91cf;&#x7279; &#x6027;&#xff0c;&#x4e5f;&#x5c31;&#x662f;&#x8bf4;&#xff0c;&#x53c2;&#x6570;&#x53d8;&#x6210;&#x4e86; const  &#x7684;&#x5f15;&#x7528;"/>
<node CREATED="1469518617175" ID="ID_588812363" MODIFIED="1469518618522" TEXT="&#x7ed9;&#x4e00;&#x4e2a;&#x4ee5; T&amp;  &#x4e3a;&#x53c2;&#x6570;&#x7684;&#x6a21;&#x677f;&#x4f20;&#x9012;&#x4e00;&#x4e2a; const  &#x5bf9;&#x8c61;&#x662f;&#x5b89;&#x5168;&#x7684;"/>
</node>
</node>
<node CREATED="1469518319455" FOLDED="true" ID="ID_1574235521" MODIFIED="1521626646124" TEXT="&#x60c5;&#x51b5;2. ParamType &#x662f;&#x4e00;&#x4e2a;&#x901a;&#x7528;&#x5f15;&#x7528;(&#x6a21;&#x677f;&#x4e2d;&#x7684;&#x5f15;&#x7528;T&amp;&amp;)">
<node CREATED="1469518766445" FOLDED="true" ID="ID_644913453" MODIFIED="1521626645885" TEXT="1. &#x5982;&#x679c;expr&#x662f;&#x5de6;&#x503c;&#xff0c;T&#x548c;ParamType&#x4f1a;&#x88ab;&#x63a8;&#x5bfc;&#x6210;&#x5de6;&#x503c;&#x5f15;&#x7528;">
<font BOLD="true" NAME="&#x5fae;&#x8f6f;&#x96c5;&#x9ed1;" SIZE="12"/>
<node CREATED="1469518929005" ID="ID_1884054576" MODIFIED="1469518939812" TEXT="1. &#x8fd9;&#x662f;&#x6a21;&#x677f;&#x7c7b;&#x578b; T  &#x88ab;&#x63a8;&#x5bfc; &#x6210;&#x4e00;&#x4e2a;&#x5f15;&#x7528;&#x7684;&#x552f;&#x4e00;&#x60c5;&#x51b5;"/>
<node CREATED="1469518956725" ID="ID_752141660" MODIFIED="1469518961889" TEXT="2. &#x5c3d;&#x7ba1; ParamType  &#x5229;&#x7528;&#x53f3;&#x503c;&#x5f15;&#x7528;&#x7684;&#x8bed;&#x6cd5;&#x6765;&#x8fdb;&#x884c;&#x63a8;&#x5bfc;&#xff0c;&#x4f46;&#x662f;&#x4ed6;&#x6700;&#x7ec8;&#x63a8;&#x5bfc;&#x51fa;&#x6765;&#x7684;&#x7c7b;&#x578b;&#x662f;&#x5de6; &#x503c;&#x5f15;&#x7528;"/>
<node CREATED="1469519352741" ID="ID_139652926" MODIFIED="1469519359346" TEXT="&#x901a;&#x7528;&#x5f15;&#x7528;&#x7684;&#x7c7b;&#x578b;&#x63a8;&#x5bfc;&#x6cd5;&#x5219;&#x548c;&#x5de6;&#x503c;&#x5f15;&#x7528;&#x6216;&#x8005;&#x53f3;&#x503c;&#x5f15;&#x7528;&#x7684;&#x6cd5;&#x5219;&#x5927;&#x4e0d;&#x76f8; &#x540c;">
<font ITALIC="true" NAME="&#x5fae;&#x8f6f;&#x96c5;&#x9ed1;" SIZE="12"/>
</node>
</node>
<node CREATED="1469518971381" ID="ID_364131984" MODIFIED="1469519006902" TEXT=" 2. &#x5982;&#x679c; expr  &#x662f;&#x4e00;&#x4e2a;&#x53f3;&#x503c;&#xff0c;&#x90a3;&#x4e48;&#x5c31;&#x6267;&#x884c;&#x201c;&#x666e;&#x901a;&#x201d;&#x7684;&#x6cd5;&#x5219;(&#x60c5;&#x51b5;1)"/>
<node CREATED="1469519254749" ID="ID_1405345835" MODIFIED="1469519296462">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      template&lt;typename T&gt;
    </p>
    <p>
      void f(T&amp;&amp; param); // param&#29616;&#22312;&#26159;&#19968;&#20010;&#36890;&#29992;&#30340;&#24341;&#29992;
    </p>
    <p>
      int x = 27; // &#21644;&#20043;&#21069;&#19968;&#26679;
    </p>
    <p>
      const int cx = x; // &#21644;&#20043;&#21069;&#19968;&#26679;
    </p>
    <p>
      const int&amp; rx = x; // &#21644;&#20043;&#21069;&#19968;&#26679;
    </p>
    <p>
      f(x); // x&#26159;&#24038;&#20540;&#65292;&#25152;&#20197;T&#26159;int&amp;,&#160; param&#30340;&#31867;&#22411;&#20063;&#26159;int&amp;
    </p>
    <p>
      f(cx); // cx&#26159;&#24038;&#20540;&#65292;&#25152;&#20197;T&#26159;const int&amp;,&#160; param&#30340;&#31867;&#22411;&#20063;&#26159;const int&amp;
    </p>
    <p>
      f(rx); // rx&#26159;&#24038;&#20540;&#65292;&#25152;&#20197;T&#26159;const int&amp;,&#160; param&#30340;&#31867;&#22411;&#20063;&#26159;const int&amp;
    </p>
    <p>
      f(27); // 27&#26159;&#21491;&#20540;&#65292;&#25152;&#20197;T&#26159;int, param&#30340;&#31867;&#22411;&#26159;int&amp;&amp;
    </p>
  </body>
</html></richcontent>
</node>
</node>
<node CREATED="1469519594917" FOLDED="true" ID="ID_1983117807" MODIFIED="1521626646124">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      &#24773;&#20917;3. ParamType &#26082;&#19981;&#26159;&#25351;&#38024;&#20063;&#19981;&#26159;&#24341;&#29992;<br />(&#21363;&#20256;&#20540;&#65292;&#21442;&#25968;&#20026;&#26032;&#30340;&#25335;&#36125;&#23545;&#35937;)
    </p>
  </body>
</html></richcontent>
<node CREATED="1469518439374" ID="ID_309634401" MODIFIED="1469521062621" TEXT="1. &#x5982;&#x679c;expr&#x662f;&#x5f15;&#x7528;&#xff0c;&#x5219;&#x5ffd;&#x7565;&#x5f15;&#x7528;&#x7684;&#x90e8;&#x5206;">
<font NAME="&#x5fae;&#x8f6f;&#x96c5;&#x9ed1;" SIZE="12"/>
</node>
<node CREATED="1469519624157" FOLDED="true" ID="ID_1606755226" MODIFIED="1521626645885">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      2. &#24573;&#30053; expr&#160;&#160;&#30340;&#24341;&#29992;&#29305;&#24615;,<br />expr&#160;&#160;&#26159;&#20010; const&#160;&#160;&#30340;&#65292;&#20063;&#35201;&#24573;&#30053;&#25481; const&#160;;<br />&#22914;&#26524;&#26159; volatile&#160;&#160;&#65292;&#29031;&#26679;&#20063;&#35201;&#24573;&#30053;&#25481;
    </p>
  </body>
</html></richcontent>
<font BOLD="true" NAME="&#x5fae;&#x8f6f;&#x96c5;&#x9ed1;" SIZE="12"/>
<node CREATED="1469519758693" ID="ID_615958029" MODIFIED="1469519995230" TEXT=" expr  &#x4e0d;&#x80fd;&#x88ab;&#x4fee;&#x6539;&#x5e76;&#x4e0d;&#x610f;&#x5473;&#x7740;&#x5b83;&#x7684;&#x4e00;&#x4efd;&#x62f7;&#x8d1d;&#x4e0d;&#x80fd;&#x88ab;&#x4fee;&#x6539;">
<font ITALIC="true" NAME="&#x5fae;&#x8f6f;&#x96c5;&#x9ed1;" SIZE="12"/>
</node>
<node CREATED="1469519997693" ID="ID_192497994" MODIFIED="1469520000177" TEXT="&#x8003;&#x8651;&#x5230; expr  &#x662f;&#x4e00;&#x4e2a; const  &#x7684;&#x6307;&#x9488;&#x6307;&#x5411;&#x4e00;&#x4e2a; const  &#x5bf9; &#x8c61;&#xff0c;&#x800c;&#x4e14; expr  &#x88ab;&#x901a;&#x8fc7;&#x6309;&#x503c;&#x4f20;&#x9012;&#x4f20;&#x9012;&#x7ed9; param "/>
<node CREATED="1469520056900" ID="ID_1511509736" MODIFIED="1469520071309">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      template&lt;typename T&gt;
    </p>
    <p>
      void f(T param); // param&#20173;&#28982;&#26159;&#25353;&#20540;&#20256;&#36882;&#30340;&#65288;pass by value&#65289;
    </p>
    <p>
      const char* const ptr = // ptr&#26159;&#19968;&#20010;const&#25351;&#38024;&#65292;&#25351;&#21521;&#19968;&#20010;const&#23545;&#35937;&quot;Fun with pointers&quot;;
    </p>
    <p>
      f(ptr); // &#32473;&#21442;&#25968;&#20256;&#36882;&#30340;&#26159;&#19968;&#20010;const char * const&#31867;&#22411;
    </p>
  </body>
</html></richcontent>
</node>
</node>
<node CREATED="1469519613380" ID="ID_53996267" MODIFIED="1469519622315">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      int x = 27; // &#21644;&#20043;&#21069;&#19968;&#26679;
    </p>
    <p>
      const int cx = x; // &#21644;&#20043;&#21069;&#19968;&#26679;
    </p>
    <p>
      const int&amp; rx = x; // &#21644;&#20043;&#21069;&#19968;&#26679;
    </p>
    <p>
      f(x); // T&#21644;param&#30340;&#31867;&#22411;&#37117;&#26159;int
    </p>
    <p>
      f(cx); // T&#21644;param&#30340;&#31867;&#22411;&#20063;&#37117;&#26159;int
    </p>
    <p>
      f(rx); // T&#21644;param&#30340;&#31867;&#22411;&#36824;&#37117;&#26159;int
    </p>
  </body>
</html></richcontent>
</node>
<node CREATED="1469520459061" FOLDED="true" ID="ID_863765950" MODIFIED="1521626645885" TEXT="&#x6570;&#x7ec4;&#x53c2;&#x6570;">
<node CREATED="1469520507133" FOLDED="true" ID="ID_938842227" MODIFIED="1521626645885">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      const char name[] = &quot;J. P. Briggs&quot;;<br />template&lt;typename T&gt;
    </p>
    <p>
      void f(T param); // &#27169;&#26495;&#25317;&#26377;&#19968;&#20010;&#25353;&#20540;&#20256;&#36882;&#30340;&#21442;&#25968;<br />f(name);
    </p>
  </body>
</html></richcontent>
<node CREATED="1469520527533" ID="ID_1978804031" MODIFIED="1469520547075" TEXT="T &#x88ab;&#x63a8;&#x5bfc;&#x6210; const char *"/>
</node>
<node CREATED="1469520497149" FOLDED="true" ID="ID_679924771" MODIFIED="1521626645885">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      const char name[] = &quot;J. P. Briggs&quot;;<br />template&lt;typename T&gt;
    </p>
    <p>
      void f(T&amp; param); // &#24341;&#29992;&#21442;&#25968;&#30340;&#27169;&#26495;<br />f(name)
    </p>
  </body>
</html></richcontent>
<node CREATED="1469520613540" ID="ID_973487988" MODIFIED="1469520660009" TEXT="&#x5c3d;&#x7ba1;&#x51fd;&#x6570;&#x4e0d;&#x80fd;&#x88ab;&#x771f;&#x6b63;&#x7684;&#x5b9a;&#x4e49;&#x6210;&#x53c2;&#x6570;&#x4e3a;&#x6570;&#x7ec4;&#xff0c;&#x4f46;&#x662f;&#x53ef;&#x4ee5;&#x58f0;&#x660e;&#x53c2;&#x6570;&#x662f;&#x6570;&#x7ec4;&#x7684;&#x5f15;&#x7528;"/>
<node CREATED="1469520711589" ID="ID_1901770385" MODIFIED="1469520712945" TEXT="&#x7c7b;&#x578b;&#x63a8;&#x5bfc;&#x5305;&#x62ec;&#x4e86;&#x6570;&#x7ec4;&#x7684;&#x957f;&#x5ea6;&#xff0c;&#x6240;&#x4ee5;&#x5728;&#x8fd9;&#x4e2a;&#x4f8b;&#x5b50;&#x91cc;&#x9762;&#xff0c; T  &#x88ab;&#x63a8;&#x5bfc;&#x6210;&#x4e86; const char [13]  &#xff0c;&#x51fd;&#x6570; f  &#x7684;&#x53c2;&#x6570;&#xff08;&#x6570;&#x7ec4;&#x7684;&#x5f15;&#x7528;&#xff09;&#x88ab;&#x63a8;&#x5bfc;&#x6210;&#x4e86; const char (&amp;)[13]"/>
<node CREATED="1469521050357" ID="ID_615830342" MODIFIED="1469521054641" TEXT="&#x6a21;&#x677f;&#x7c7b;&#x578b;&#x63a8;&#x5bfc;&#x7684;&#x65f6;&#x5019;&#xff0c;&#x53c2;&#x6570;&#x5982;&#x679c;&#x662f;&#x6570;&#x7ec4;&#x6216;&#x8005;&#x51fd;&#x6570;&#x540d;&#x79f0;&#xff0c;&#x4ed6;&#x4eec;&#x4f1a;&#x88ab;&#x9000;&#x5316;&#x6210;&#x6307;&#x9488;&#xff0c;&#x9664;&#x975e;&#x662f;&#x7528;&#x5728;&#x521d;&#x59cb;&#x5316;&#x5f15;&#x7528;&#x7c7b;&#x578b;">
<font BOLD="true" NAME="&#x5fae;&#x8f6f;&#x96c5;&#x9ed1;" SIZE="12"/>
</node>
<node CREATED="1469520806117" ID="ID_251723184" MODIFIED="1469520810414">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      // &#22312;&#32534;&#35793;&#30340;&#26102;&#20505;&#36820;&#22238;&#25968;&#32452;&#30340;&#38271;&#24230;&#65288;&#25968;&#32452;&#21442;&#25968;&#27809;&#26377;&#21517;&#23383;&#65292;
    </p>
    <p>
      // &#22240;&#20026;&#21482;&#20851;&#24515;&#25968;&#32452;&#21253;&#21547;&#30340;&#20803;&#32032;&#30340;&#20010;&#25968;&#65289;
    </p>
    <p>
      template&lt;typename T, std::size_t N&gt;
    </p>
    <p>
      constexpr std::size_t arraySize(T (&amp;)[N]) noexcept
    </p>
    <p>
      {
    </p>
    <p>
      return N; // constexpr&#21644;noexcept&#22312;&#38543;&#21518;&#30340;&#26465;&#27454;&#20013;&#20171;&#32461;
    </p>
    <p>
      }
    </p>
  </body>
</html></richcontent>
</node>
</node>
</node>
</node>
</node>
<node CREATED="1469521260740" FOLDED="true" ID="ID_1509830923" MODIFIED="1521626646281" TEXT="2. auto&#x63a8;&#x5bfc;">
<node CREATED="1469521269677" ID="ID_1294173356" MODIFIED="1469521354059" TEXT="&#x5f53;&#x4e00;&#x4e2a;&#x53d8;&#x91cf;&#x88ab;&#x58f0;&#x660e;&#x4e3a; auto  &#xff0c; auto  &#x76f8;&#x5f53;&#x4e8e;&#x6a21;&#x677f;&#x4e2d;&#x7684; T  &#xff0c;&#x800c;&#x5bf9;&#x53d8;&#x91cf;&#x505a;&#x7684;&#x76f8;&#x5173;&#x7684;&#x7c7b;&#x578b;&#x9650;&#x5b9a;&#x5c31;&#x50cf; ParamType"/>
<node CREATED="1469521531812" FOLDED="true" ID="ID_999061899" MODIFIED="1521626646124" TEXT="&#x7528; auto  &#x58f0;&#x660e;&#x7684;&#x53d8;&#x91cf;&#x4e0a;&#xff0c;&#x7c7b;&#x578b;&#x58f0;&#x660e;&#x4ee3;&#x66ff;&#x4e86; ParamType  &#x7684;&#x4f5c;&#x7528;&#xff0c;&#x6240;&#x4ee5;&#x4e5f;&#x6709;&#x4e09;&#x79cd;&#x60c5;&#x51b5;&#xff1a;">
<node CREATED="1469521538277" ID="ID_1338324051" MODIFIED="1469521558484">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      &#24773;&#20917;1&#65306;&#31867;&#22411;&#22768;&#26126;&#26159;&#19968;&#20010;&#25351;&#38024;&#25110;&#32773;&#26159;&#19968;&#20010;&#24341;&#29992;&#65292;&#20294;&#19981;&#26159;&#19968;&#20010;&#36890;&#29992;&#30340;&#24341;&#29992;
    </p>
  </body>
</html></richcontent>
</node>
<node CREATED="1469521558485" ID="ID_451004059" MODIFIED="1469521563787">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      &#24773;&#20917;2&#65306;&#31867;&#22411;&#22768;&#26126;&#26159;&#19968;&#20010;&#36890;&#29992;&#24341;&#29992;
    </p>
  </body>
</html></richcontent>
</node>
<node CREATED="1469521563788" ID="ID_1391714052" MODIFIED="1469521563790">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      &#24773;&#20917;3&#65306;&#31867;&#22411;&#22768;&#26126;&#26082;&#19981;&#26159;&#19968;&#20010;&#25351;&#38024;&#20063;&#19981;&#26159;&#19968;&#20010;&#24341;&#29992;
    </p>
  </body>
</html></richcontent>
</node>
<node CREATED="1469522039820" ID="ID_1004986215" MODIFIED="1469522051787">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      auto x = 27; // &#24773;&#20917;3&#65288;x&#26082;&#19981;&#26159;&#25351;&#38024;&#20063;&#19981;&#26159;&#24341;&#29992;&#65289;
    </p>
    <p>
      const auto cx = x; // &#24773;&#20917;3&#65288;cx&#20108;&#32773;&#37117;&#19981;&#26159;&#65289;
    </p>
    <p>
      const auto&amp; rx = x; // &#24773;&#20917;1&#65288;rx&#26159;&#19968;&#20010;&#38750;&#36890;&#29992;&#30340;&#24341;&#29992;&#65289;<br />auto&amp;&amp; uref1 = x; // x&#26159;int&#24182;&#19988;&#26159;&#24038;&#20540;
    </p>
    <p>
      // &#25152;&#20197;uref1&#30340;&#31867;&#22411;&#26159;int&amp;
    </p>
    <p>
      auto&amp;&amp; uref2 = cx; // cx&#26159;int&#24182;&#19988;&#26159;&#24038;&#20540;
    </p>
    <p>
      // &#25152;&#20197;uref2&#30340;&#31867;&#22411;&#26159;const int&amp;
    </p>
    <p>
      auto&amp;&amp; uref3 = 27; // 27&#26159;int&#24182;&#19988;&#26159;&#21491;&#20540;
    </p>
    <p>
      // &#25152;&#20197;uref3&#30340;&#31867;&#22411;&#26159;int&amp;&amp;
    </p>
  </body>
</html></richcontent>
</node>
</node>
<node CREATED="1469521740749" FOLDED="true" ID="ID_1138591789" MODIFIED="1521626646124" TEXT="&#x5728;&#x975e;&#x5f15;&#x7528;&#x7c7b;&#x578b;&#x58f0;&#x660e;&#x91cc;&#xff0c;&#x6570;&#x7ec4;&#x548c;&#x51fd;&#x6570;&#x540d;&#x79f0;&#x5982;&#x4f55;&#x9000;&#x5316;&#x6210;&#x6307;&#x9488;">
<node CREATED="1469521978925" ID="ID_1511477980" MODIFIED="1469522006274">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      const char name[] = // name&#30340;&#31867;&#22411;&#26159;const char[13]
    </p>
    <p>
      &quot;R. N. Briggs&quot;;
    </p>
    <p>
      auto arr1 = name; // arr1&#30340;&#31867;&#22411;&#26159;const char*
    </p>
    <p>
      auto&amp; arr2 = name; // arr2&#30340;&#31867;&#22411;&#26159;const char (&amp;)[13]
    </p>
    <p>
      void someFunc(int, double); // someFunc&#26159;&#19968;&#20010;&#20989;&#25968;&#65292;&#31867;&#22411;&#26159; void (*)(int, double)
    </p>
    <p>
      auto&amp; func2 = someFunc; // func1&#30340;&#31867;&#22411;&#26159;&#160; void (&amp;)(int, double)
    </p>
  </body>
</html></richcontent>
</node>
</node>
<node CREATED="1469521893652" FOLDED="true" ID="ID_993348852" MODIFIED="1521626646124">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      &#24403;&#20351;&#29992;&#19968;&#23545;&#33457;&#25324;&#21495;&#26469;&#21021;&#22987;&#21270;&#19968;&#20010; auto&#160;&#160;&#31867;&#22411;&#30340;&#21464;&#37327;&#30340;&#26102;&#20505;&#65292;<br />&#25512;&#23548;&#30340;&#31867;&#22411; &#26159; std::intializer_list&#160;&#160;
    </p>
  </body>
</html></richcontent>
<node CREATED="1469521852421" ID="ID_1841048571" MODIFIED="1469521915950" TEXT="&#x5934;&#x4e24;&#x4e2a;&#x7684;&#x786e;&#x662f;&#x4e00;&#x6837;&#x7684;&#xff0c;&#x58f0;&#x660e;&#x4e00;&#x4e2a;&#x521d;&#x59cb; &#x5316;&#x503c;&#x4e3a;27&#x7684; int  &#x3002;&#xa;&#x7136;&#x800c;&#x540e;&#x9762;&#x4e24;&#x4e2a;&#xff0c;&#x58f0;&#x660e;&#x4e86;&#x4e00;&#x4e2a;&#x7c7b;&#x578b;&#x4e3a; std::intializer_list&lt;int&gt;  &#x7684;&#x53d8;&#x91cf;&#xff0c;&#x8fd9;&#x4e2a;&#x53d8;&#x91cf;&#x5305;&#x542b;&#x4e86;&#x4e00;&#x4e2a;&#x5355;&#x4e00;&#x7684;&#x5143; &#x7d20;27"/>
<node CREATED="1469521833285" ID="ID_125303899" MODIFIED="1469521910591">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      auto x1 = 27;
    </p>
    <p>
      auto x2(27);
    </p>
    <p>
      auto x3 = {27};
    </p>
    <p>
      auto x4{ 27 };
    </p>
  </body>
</html></richcontent>
</node>
<node CREATED="1469522105261" ID="ID_2418897" MODIFIED="1469522133642">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      auto x5 = { 1, 2, 3.0 };//&#38169;&#35823;<br />&#31867;&#22411;&#25512;&#23548;&#22833;&#36133;&#26159;&#22240;&#20026;&#22312;&#33457;&#25324;&#21495;&#37324;&#38754;&#30340;&#25968;&#20540;&#24182;&#19981;&#26159; &#21333;&#19968;&#31867;&#22411;&#30340;
    </p>
  </body>
</html></richcontent>
</node>
</node>
<node CREATED="1469522241660" ID="ID_134520198" MODIFIED="1469522372273" TEXT="auto  &#x7c7b;&#x578b;&#x63a8;&#x5bfc;&#x901a;&#x5e38;&#x548c;&#x6a21;&#x677f;&#x7c7b;&#x578b;&#x63a8;&#x5bfc;&#x7c7b;&#x4f3c;&#xff0c;&#x4f46;&#x662f; auto  &#x7c7b;&#x578b;&#x63a8;&#x5bfc;&#x5047;&#x5b9a;&#x82b1;&#x62ec;&#x53f7;&#x521d;&#x59cb;&#x5316;&#x4ee3;&#x8868;&#x7684;&#x7c7b;&#x578b;&#xa;&#x662f; std::initializer_list  &#xff0c;&#x4f46;&#x662f;&#x6a21;&#x677f;&#x7c7b;&#x578b;&#x63a8;&#x5bfc;&#x5374;&#x4e0d;&#x662f;&#x8fd9;&#x6837;">
<font BOLD="true" NAME="&#x5fae;&#x8f6f;&#x96c5;&#x9ed1;" SIZE="12"/>
</node>
<node CREATED="1469522357469" ID="ID_1317488969" MODIFIED="1469522360757" TEXT="auto  &#x5728;&#x51fd;&#x6570;&#x8fd4;&#x56de;&#x503c;&#x6216;&#x8005;lambda&#x53c2;&#x6570;&#x91cc;&#x9762;&#x6267;&#x884c;&#x6a21;&#x677f;&#x7684;&#x7c7b;&#x578b;&#x63a8;&#x5bfc;&#xff0c;&#x800c;&#x4e0d;&#x662f;&#x901a;&#x5e38;&#x610f;&#x4e49;&#x7684; auto  &#x7c7b;&#x578b;&#x63a8;&#x5bfc;">
<font BOLD="true" NAME="&#x5fae;&#x8f6f;&#x96c5;&#x9ed1;" SIZE="12"/>
</node>
</node>
<node CREATED="1469522502988" FOLDED="true" ID="ID_1970138594" MODIFIED="1521626646281" TEXT="3. decltype">
<node CREATED="1469523777388" ID="ID_1128165098" MODIFIED="1469523779445" TEXT="decltype  &#x51e0;&#x4e4e;&#x603b;&#x662f;&#x5f97;&#x5230;&#x4e00;&#x4e2a;&#x53d8;&#x91cf;&#x6216;&#x8868;&#x8fbe;&#x5f0f;&#x7684;&#x7c7b;&#x578b;&#x800c;&#x4e0d;&#x9700;&#x8981;&#x4efb;&#x4f55;&#x4fee;&#x6539;">
<font BOLD="true" NAME="&#x5fae;&#x8f6f;&#x96c5;&#x9ed1;" SIZE="12"/>
</node>
<node CREATED="1469522720116" FOLDED="true" ID="ID_663744242" MODIFIED="1521626646124" TEXT="&#x5c3e;&#x968f;&#x8fd4;&#x56de;&#x7c7b;&#x578b;&#x7684;&#x4e00;&#x4e2a;&#x4f18;&#x52bf;&#x662f;&#x5728;&#x5b9a;&#x4e49;&#x8fd4;&#x56de;&#x503c;&#x7c7b;&#x578b;&#x7684;&#x65f6;&#x5019;&#x4f7f;&#x7528;&#x51fd;&#x6570;&#x53c2;&#x6570;&#xff0c;&#xa;&#x5373;&#x51fd;&#x6570;&#x7684;&#x8fd4; &#x56de;&#x503c;&#x7c7b;&#x578b;&#x5728;&#x51fd;&#x6570;&#x53c2;&#x6570;&#x4e4b;&#x540e;&#x58f0;&#x660e;(&#x201c;-&gt;&#x201d;&#x540e;&#x8fb9;)">
<node CREATED="1469522513476" ID="ID_163904576" MODIFIED="1469523942920">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      template&lt;typename Container, typename Index&gt; // C++14;
    </p>
    <p>
      auto authAndAccess(Container &amp;c, Index i) // not quite
    </p>
    <p>
      { // correct
    </p>
    <p>
      &#160;&#160;&#160;&#160;authenticateUser();
    </p>
    <p>
      &#160;&#160;&#160;&#160;return c[i];
    </p>
    <p>
      } // return type deduced from c[i]
    </p>
  </body>
</html></richcontent>
</node>
</node>
<node CREATED="1469522913949" FOLDED="true" ID="ID_1066608741" MODIFIED="1521626646124">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      &#27492;&#22788;&#65292; d[5]&#160;&#160;&#36820;&#22238;&#30340;&#26159; int&amp;&#160;&#160;&#65292;&#20294;&#26159; authAndAccess&#160;&#160;&#30340; auto&#160;&#160;&#36820;&#22238;&#31867;&#22411;&#22768;&#26126;&#23558;&#20250;&#21093;&#31163;&#36825;&#20010;&#24341;&#29992;&#65292;&#20174;&#32780;&#24471;&#21040;&#30340;&#36820;&#22238;&#31867;&#22411;&#26159; int&#160;&#160;&#12290; int&#160;&#160;&#20316;&#20026;&#19968;&#20010;&#21491;&#20540;&#25104;&#20026;&#30495;&#27491;&#30340;&#20989;&#25968;&#36820;&#22238;&#31867;&#22411;&#12290;&#19978;&#38754;&#30340;&#20195;&#30721;&#23581;&#35797;&#32473;&#19968;&#20010;&#21491;&#20540; int&#160;&#160;&#36171;&#20540;&#20026;10
    </p>
  </body>
</html></richcontent>
<node CREATED="1469522941556" ID="ID_1405802163" MODIFIED="1469523949638">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      std::deque&lt;int&gt; d;
    </p>
    <p>
      ...
    </p>
    <p>
      authAndAccess(d, 5) = 10; // authenticate user, return d[5],
    </p>
    <p>
      // then assign 10 to it;
    </p>
    <p>
      // this won't compile!
    </p>
  </body>
</html></richcontent>
</node>
</node>
<node CREATED="1469523026117" FOLDED="true" ID="ID_348684480" MODIFIED="1521626646124" TEXT="C++14  &#x652f;&#x6301; decltype(auto)  &#xff0c;&#x5b83;&#x7684;&#x884c;&#x4e3a;&#x5c31;&#x50cf; auto  ,&#x4ece;&#x521d;&#x59cb;&#x5316;&#x64cd;&#x4f5c;&#x6765;&#x63a8;&#x5bfc;&#x7c7b;&#x578b;&#xff0c;&#xa;&#x4f46;&#x662f;&#x5b83;&#x63a8;&#x5bfc;&#x7c7b;&#x578b;&#x65f6;&#x4f7f;&#x7528; decltype  &#x7684;&#x89c4; &#x5219;">
<font BOLD="true" NAME="&#x5fae;&#x8f6f;&#x96c5;&#x9ed1;" SIZE="12"/>
<node CREATED="1469523519364" ID="ID_150973446" MODIFIED="1469523527890">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      template&lt;typename Container, typename Index&gt; // final
    </p>
    <p>
      auto // C++11
    </p>
    <p>
      authAndAccess(Container&amp;&amp; c, Index i) // version
    </p>
    <p>
      -&gt; decltype(std::forward&lt;Container&gt;(c)[i])
    </p>
    <p>
      {
    </p>
    <p>
      &#160;&#160;&#160;&#160;authenticateUser();
    </p>
    <p>
      &#160;&#160;&#160;&#160;return std::forward&lt;Container&gt;(c)[i];
    </p>
    <p>
      }
    </p>
  </body>
</html></richcontent>
</node>
<node CREATED="1469523447532" ID="ID_712265232" MODIFIED="1469523455242">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      template&lt;typename Container, typename Index&gt; // final
    </p>
    <p>
      decltype(auto) // C++14
    </p>
    <p>
      authAndAccess(Container&amp;&amp; c, Index i) // version
    </p>
    <p>
      {
    </p>
    <p>
      &#160;&#160;&#160;&#160;authenticateUser();
    </p>
    <p>
      &#160;&#160;&#160;&#160;return std::forward&lt;Container&gt;(c)[i];
    </p>
    <p>
      }
    </p>
  </body>
</html></richcontent>
</node>
</node>
<node CREATED="1469523790100" ID="ID_1123663804" MODIFIED="1469523792317" TEXT="&#x5bf9;&#x4e8e;&#x975e;&#x53d8;&#x91cf;&#x540d;&#x7684;&#x7c7b;&#x578b;&#x4e3a; T  &#x7684;&#x5de6;&#x503c;&#x8868;&#x8fbe;&#x5f0f;&#xff0c; decltype  &#x603b;&#x662f;&#x8fd4;&#x56de; T&amp;">
<font BOLD="true" NAME="&#x5fae;&#x8f6f;&#x96c5;&#x9ed1;" SIZE="12"/>
</node>
<node CREATED="1469523660940" FOLDED="true" ID="ID_1778771297" MODIFIED="1521626646124">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      &#23545;&#19968;&#20010;&#21464;&#37327;&#21517;&#20351;&#29992; decltype&#160;&#160;&#24471;&#21040;&#36825;&#20010;&#21464;&#37327;&#21517;&#30340;&#22768;&#26126;&#31867;&#22411;&#12290;&#21464;&#37327;&#21517;&#23646;&#20110;&#24038;&#20540;&#34920;&#36798;&#24335;&#65292;&#20294;&#36825;&#24182;&#19981;&#24433;&#21709; decltype&#160;&#160;&#30340;&#34892;&#20026;&#12290;<br />&#28982;&#32780;&#65292;&#23545;&#20110;&#19968;&#20010;&#27604;&#21464;&#37327;&#21517;&#26356;&#22797;&#26434;&#30340;&#24038;&#20540;&#34920;&#36798;&#24335;&#65292; decltype&#160;&#160;&#20445;&#35777;&#36820;&#22238;&#30340;&#31867;&#22411;&#26159;&#24038;&#20540;&#24341;&#29992;&#12290;<br />&#22240;&#27492;&#35828;&#65292;&#22914;&#26524;&#19968;&#20010;&#38750;&#21464;&#37327;&#21517;&#30340;&#31867;&#22411;&#20026; T&#160;&#160;&#30340;&#24038;&#20540;&#34920;&#36798;&#24335;&#65292; decltype&#160;&#160;&#25253;&#21578;&#30340;&#31867;&#22411;&#26159; T&amp;&#160;&#160;&#12290;
    </p>
  </body>
</html></richcontent>
<node CREATED="1469523708108" ID="ID_22497239" MODIFIED="1469523708108" TEXT=""/>
</node>
</node>
<node CREATED="1469524062460" FOLDED="true" ID="ID_479837751" MODIFIED="1521626646281" TEXT="4. &#x7f16;&#x8bd1;&#x5668;&#x8bca;&#x65ad;">
<node CREATED="1469524258004" FOLDED="true" ID="ID_306384910" MODIFIED="1521626646124" TEXT="&#x7f16;&#x8bd1;&#x671f;">
<node CREATED="1469524233614" ID="ID_1388011023" MODIFIED="1469524246797">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      template&lt;typename T&gt; // &#22768;&#26126;TD
    </p>
    <p>
      class TD; // TD == &quot;Type Displayer&quot;<br />TD&lt;decltype(x)&gt; xType; // &#24341;&#36215;&#30340;&#38169;&#35823;
    </p>
    <p>
      TD&lt;decltype(y)&gt; yType; // &#21253;&#21547;&#20102;x&#21644;y&#30340;&#31867;&#22411;
    </p>
  </body>
</html></richcontent>
</node>
</node>
<node CREATED="1469524274180" FOLDED="true" ID="ID_153667331" MODIFIED="1521626646124" TEXT="&#x8fd0;&#x884c;&#x65f6;&#x8f93;&#x51fa;">
<node CREATED="1469524365702" FOLDED="true" ID="ID_241934420" MODIFIED="1521626645932" TEXT="typeid  &#x548c; std::type_info::name">
<node CREATED="1469524586517" ID="ID_454745107" MODIFIED="1469524702413" TEXT="&#x4e0d;&#x51c6;&#x786e;">
<font BOLD="true" NAME="&#x5fae;&#x8f6f;&#x96c5;&#x9ed1;" SIZE="12"/>
</node>
<node CREATED="1469524288700" ID="ID_525383668" MODIFIED="1469524290528" TEXT="std::cout &lt;&lt; typeid(x).name() &lt;&lt; &apos;\n&apos;; // display types for"/>
<node CREATED="1469524492652" ID="ID_1832098559" MODIFIED="1469524493456" TEXT=" std::type_info::name  &#x7684;&#x7279;&#x5316;&#x6307;&#x5b9a;&#x4e86;&#x7c7b;&#x578b;&#x4f1a;&#x88ab;&#x5f53;&#x505a;&#x5b83;&#x4eec;&#x88ab;&#x4f20;&#x7ed9;&#x6a21; &#x677f;&#x51fd;&#x6570;&#x7684;&#x65f6;&#x5019;&#x7684;&#x6309;&#x503c;&#x4f20;&#x9012;&#x7684;&#x53c2;&#x6570;"/>
<node CREATED="1469524508988" ID="ID_1043750288" MODIFIED="1469524510388" TEXT="&#x8fd9;&#x5c31;&#x610f;&#x5473;&#x7740;&#x5982;&#x679c;&#x7c7b;&#x578b;&#x662f;&#x4e00;&#x4e2a;&#x5f15;&#x7528;&#xff0c;&#x4ed6;&#x7684;&#x5f15;&#x7528;&#x7279;&#x6027;&#x4f1a;&#x88ab;&#x5ffd;&#x7565;&#xff0c;&#x5982;&#x679c;&#x5728; &#x5ffd;&#x7565;&#x5f15;&#x7528;&#x4e4b;&#x540e;&#x5b58;&#x5728; const  &#xff08;&#x6216;&#x8005; volatile  &#xff09;&#xff0c;&#x5b83;&#x7684; const  &#x7279;&#x6027;&#xff08;&#x6216;&#x8005; volatile  &#x7279;&#x6027;&#xff09;&#x4f1a;&#x88ab;&#x5ffd;&#x7565;&#x3002;"/>
</node>
<node CREATED="1469524600028" FOLDED="true" ID="ID_922469747" MODIFIED="1521626645932" TEXT=" boost::typeindex::type_id_with_cvr">
<node CREATED="1469524611316" ID="ID_547196321" MODIFIED="1469524636586">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      #include &lt;boost/type_index.hpp&gt;
    </p>
    <p>
      template&lt;typename T&gt;
    </p>
    <p>
      void f(const T&amp; param)
    </p>
    <p>
      {
    </p>
    <p>
      using std::cout;
    </p>
    <p>
      using boost::typeindex::type_id_with_cvr;
    </p>
    <p>
      // show T
    </p>
    <p>
      cout &lt;&lt; &quot;T = &quot;
    </p>
    <p>
      &lt;&lt; type_id_with_cvr&lt;T&gt;().pretty_name()
    </p>
    <p>
      &lt;&lt; '\n';
    </p>
    <p>
      // show param's type
    </p>
    <p>
      cout &lt;&lt; &quot;param = &quot;
    </p>
    <p>
      &lt;&lt; type_id_with_cvr&lt;decltype(param)&gt;().pretty_name()
    </p>
    <p>
      &lt;&lt; '\n';
    </p>
    <p>
      &#8230;
    </p>
    <p>
      }
    </p>
  </body>
</html></richcontent>
</node>
</node>
</node>
<node CREATED="1469524744412" ID="ID_503609954" MODIFIED="1469524745402" TEXT="&#x7c7b;&#x578b;&#x63a8;&#x5bfc;&#x7684;&#x7ed3;&#x679c;&#x5e38;&#x5e38;&#x53ef;&#x4ee5;&#x901a;&#x8fc7;IDE&#x7684;&#x7f16;&#x8f91;&#x5668;&#xff0c;&#x7f16;&#x8bd1;&#x5668;&#x9519;&#x8bef;&#x8f93;&#x51fa;&#x4fe1;&#x606f;&#x548c;Boost TypeIndex&#x5e93;&#x7684;&#x7ed3;&#x679c;&#x4e2d;&#x5f97;&#x5230;"/>
<node CREATED="1469524726348" ID="ID_1524646524" MODIFIED="1469524727401" TEXT="&#x4e00;&#x4e9b;&#x5de5;&#x5177;&#x7684;&#x7ed3;&#x679c;&#x4e0d;&#x4e00;&#x5b9a;&#x6709;&#x5e2e;&#x52a9;&#x6027;&#x4e5f;&#x4e0d;&#x4e00;&#x5b9a;&#x51c6;&#x786e;&#xff0c;&#x6240;&#x4ee5;&#x5bf9;C++&#x6807;&#x51c6;&#x7684;&#x7c7b;&#x578b;&#x63a8;&#x5bfc;&#x6cd5;&#x5219;&#x52a0;&#x4ee5;&#x7406;&#x89e3;&#x662f;&#x5f88;&#x6709;&#x5fc5;&#x8981;&#x7684;"/>
</node>
</node>
<node CREATED="1469524789692" FOLDED="true" ID="ID_264230788" MODIFIED="1521626646436" POSITION="right" TEXT="auto">
<node CREATED="1469524794372" FOLDED="true" ID="ID_1968334942" MODIFIED="1521626646281" TEXT="5. &#x4f18;&#x5148;&#x4f7f;&#x7528;auto&#xff0c;&#x800c;&#x975e;&#x663e;&#x793a;&#x7c7b;&#x578b;&#x58f0;&#x660e;">
<node CREATED="1469524825556" ID="ID_511920312" MODIFIED="1469585234700">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      std::function&#160;&#160;&#26041;&#27861;&#36890;&#24120;&#20307;&#31215;&#27604; auto&#160;&#160;&#22823;&#65292;&#24182;&#19988;&#24930;&#65292;&#36824;&#26377;&#21487;&#33021;&#23548;&#33268;&#20869;&#23384;&#19981;&#36275;&#30340;&#24322;&#24120;&#12290;
    </p>
  </body>
</html></richcontent>
</node>
<node CREATED="1469585255162" ID="ID_384051441" MODIFIED="1469585275262" TEXT="auto  &#x7684;&#x4f18;&#x70b9;&#x9664;&#x4e86;&#x53ef;&#x4ee5;&#x907f;&#x514d;&#x672a;&#x521d;&#x59cb;&#x5316;&#x7684;&#x53d8;&#x91cf;&#xff0c;&#x53d8;&#x91cf;&#x58f0;&#x660e;&#x5f15;&#x8d77;&#x7684;&#x6b67;&#x4e49;&#xff0c;&#x76f4;&#x63a5;&#x6301;&#x6709;&#x5c01;&#x88c5;&#x4f53;&#x7684;&#x80fd;&#x529b;&#x3002;&#x8fd8;&#x6709;&#x4e00;&#x4e2a;&#x5c31;&#x662f;&#x53ef;&#x4ee5;&#x907f;&#x514d;&#x201c;&#x7c7b;&#x578b;&#x622a;&#x65ad;&#x201d;&#x95ee;&#x9898;"/>
<node CREATED="1469585590610" ID="ID_1760401908" MODIFIED="1469585592342" TEXT="&#x5728;&#x5e94;&#x8be5;&#x4f7f;&#x7528; std::vector&lt;int&gt;::size_type  &#x7684;&#x65f6;&#x5019;&#x4f7f;&#x7528; unsigned  &#x548c;&#x5728;&#x8be5;&#x4f7f;&#x7528; std::pair&lt;const std::sting, int&gt;  &#x7684;&#x5730;&#x65b9;&#x4f7f;&#x7528; std::pair&lt;std::string, int&gt;  &#x2014;&#x2014;&#x8bf4;&#x660e;&#x663e;&#x5f0f;&#x6307;&#x5b9a;&#x7684;&#x7c7b;&#x578b;&#x662f;&#x5982;&#x4f55;&#x5bfc;&#x81f4;&#x4f60;&#x4e07;&#x4e07;&#x6ca1;&#x60f3;&#x5230;&#x7684;&#x9690;&#x5f0f;&#x7684;&#x8f6c;&#x6362;&#x7684;"/>
<node CREATED="1469585837345" ID="ID_1501895785" MODIFIED="1469585839643" TEXT="auto  &#x53d8;&#x91cf;&#x4e00;&#x5b9a;&#x8981;&#x88ab;&#x521d;&#x59cb;&#x5316;&#xff0c;&#x5e76;&#x4e14;&#x5bf9;&#x7531;&#x4e8e;&#x7c7b;&#x578b;&#x4e0d;&#x5339;&#x914d;&#x5f15;&#x8d77;&#x7684;&#x517c;&#x5bb9;&#x548c;&#x6548;&#x7387;&#x95ee;&#x9898;&#x6709;&#x514d;&#x75ab;&#x529b;&#xff0c;&#x53ef;&#x4ee5;&#x7b80;&#x5355;&#x5316;&#x4ee3;&#x7801;&#x91cd;&#x6784;&#xff0c;&#x4e00;&#x822c; &#x4f1a;&#x6bd4;&#x663e;&#x5f0f;&#x7684;&#x58f0;&#x660e;&#x7c7b;&#x578b;&#x6572;&#x51fb;&#x66f4;&#x5c11;&#x7684;&#x952e;&#x76d8;">
<font BOLD="true" NAME="&#x5fae;&#x8f6f;&#x96c5;&#x9ed1;" SIZE="12"/>
</node>
<node CREATED="1469585846634" ID="ID_1653249327" MODIFIED="1469585848674" TEXT="auto  &#x7c7b;&#x578b;&#x7684;&#x53d8;&#x91cf;&#x4e5f;&#x53d7;&#x9650;&#x4e8e;&#x6761;&#x6b3e;2&#x548c;&#x6761;&#x6b3e;6&#x4e2d;&#x63cf;&#x8ff0;&#x7684;&#x9677;&#x9631;">
<font BOLD="true" NAME="&#x5fae;&#x8f6f;&#x96c5;&#x9ed1;" SIZE="12"/>
</node>
</node>
<node CREATED="1469586022369" FOLDED="true" ID="ID_427528486" MODIFIED="1521626646281" TEXT="6. auto&#x63a8;&#x5bfc;&#x975e;&#x9884;&#x671f;&#x65f6;&#xff0c;&#x4f7f;&#x7528;&#x663e;&#x793a;&#x7684;&#x7c7b;&#x578b;&#x521d;&#x59cb;&#x5316;">
<node CREATED="1469586024129" ID="ID_1114244654" MODIFIED="1469586038845" TEXT=" std::vector::operator[]  &#x5bf9;&#x6240;&#x6709;&#x7684;&#x7c7b;&#x578b;&#x90fd; &#x8fd4;&#x56de;&#x5f15;&#x7528;&#xff0c;&#x5c31;&#x662f;&#x9664;&#x4e86; bool&#x3002;&#xa;&#x4e8b;&#x5b9e;&#x4e0a;&#xff0c;&#x4ed6;&#x8fd4;&#x56de;&#x7684;&#x662f;&#x4e00;&#x4e2a; std::vector&lt;bool&gt;::reference  &#x5bf9;&#x8c61;&#xff08;&#x662f;&#x4e00;&#x4e2a; &#x5728; std::vector&lt;bool&gt;  &#x4e2d;&#x5185;&#x5d4c;&#x7684;class"/>
<node CREATED="1469586899185" ID="ID_687922207" MODIFIED="1469586901638" TEXT="&#x4f5c;&#x4e3a;&#x4e00;&#x4e2a;&#x901a;&#x7528;&#x7684;&#x6cd5;&#x5219;&#xff0c;&#x201c;&#x4e0d;&#x53ef;&#x89c1;&#x201d;&#x7684;&#x4ee3;&#x7406;&#x7c7b;&#x4e0d;&#x80fd;&#x548c; auto  &#x6109;&#x5feb;&#x7684;&#x73a9;&#x800d;&#x3002;&#x8fd9;&#x79cd;&#x7c7b;&#x5e38;&#x5e38;&#x5b83;&#x7684;&#x751f;&#x547d;&#x5468;&#x671f;&#x4e0d;&#x4f1a;&#x88ab;&#x8bbe;&#x8ba1;&#x6210;&#x8d85;&#x8fc7;&#x4e00;&#x4e2a;&#x5355;&#x4e2a; &#x7684;&#x8bed;&#x53e5;&#xff0c;&#x6240;&#x4ee5;&#x521b;&#x9020;&#x8fd9;&#x6837;&#x7684;&#x7c7b;&#x578b;&#x7684;&#x53d8;&#x91cf;&#x662f;&#x4f1a;&#x8fdd;&#x53cd;&#x5e93;&#x7684;&#x8bbe;&#x8ba1;&#x5047;&#x5b9a;&#x3002;&#x8fd9;&#x5c31;&#x662f; std::vector&lt;bool&gt;::reference  &#x7684;&#x60c5;&#x51b5;&#xff0c;&#x800c;&#x4e14;&#x6211;&#x4eec;&#x53ef; &#x4ee5;&#x770b;&#x5230;&#x8fd9;&#x79cd;&#x8fdd;&#x80cc;&#x7ea6;&#x5b9a;&#x7684;&#x505a;&#x6cd5;&#x4f1a;&#x5bfc;&#x81f4;&#x672a;&#x5b9a;&#x4e49;&#x7684;&#x884c;&#x4e3a;"/>
<node CREATED="1469587015858" FOLDED="true" ID="ID_794190967" MODIFIED="1521626646124" TEXT="&#x95ee;&#x9898;&#x5728;&#x4e8e; auto  &#x63a8;&#x5bfc;&#x7684;&#x7c7b;&#x578b;&#x4e0d;&#x662f;&#x6240;&#x60f3;&#x8ba9;&#x5b83;&#x63a8;&#x5bfc;&#x51fa;&#x6765;&#x7684;&#x7c7b;&#x578b;&#x3002;&#x89e3;&#x51b3;&#x65b9;&#x6848;&#x5c31;&#x662f;&#x5f3a;&#x5236;&#x4e00;&#x4e2a; &#x4e0d;&#x540c;&#x7684;&#x7c7b;&#x578b;&#x63a8;&#x5bfc;&#x3002;&#x6211;&#x628a;&#x8fd9;&#x79cd;&#x65b9;&#x6cd5;&#x53eb;&#x505a;&#x663e;&#x5f0f;&#x7684;&#x7c7b;&#x578b;&#x521d;&#x59cb;&#x5316;&#x539f;&#x5219;">
<node CREATED="1469587042808" ID="ID_769047534" MODIFIED="1469587044982" TEXT="auto highPriority = static_cast&lt;bool&gt;(features(w)[5]);"/>
</node>
</node>
</node>
<node CREATED="1469588041578" FOLDED="true" ID="ID_1340713190" MODIFIED="1521626646436" POSITION="right" TEXT="&#x73b0;&#x4ee3;C++">
<node CREATED="1469588048561" FOLDED="true" ID="ID_788090761" MODIFIED="1521626646281" TEXT="7. &#x521b;&#x5efa;&#x5bf9;&#x8c61;&#x65f6;()&#x548c;{}&#x7684;&#x533a;&#x522b;">
<node CREATED="1469588091234" ID="ID_887566898" MODIFIED="1469588332392">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      int x(0); //&#20351;&#29992;()&#36827;&#34892;&#21021;&#22987;&#21270;
    </p>
    <p>
      int y = 0; //&#20351;&#29992;=&#36827;&#34892;&#21021;&#22987;&#21270;
    </p>
    <p>
      int z{0}; //&#20351;&#29992;{}&#36827;&#34892;&#21021;&#22987;&#21270;
    </p>
    <p>
      int z = {0}; //&#20351;&#29992;{}&#21644;=&#36827;&#34892;&#21021;&#22987;&#21270;
    </p>
  </body>
</html></richcontent>
</node>
<node CREATED="1469588364856" ID="ID_1280265623" MODIFIED="1469588365741" TEXT="&#x521d;&#x59cb;&#x5316;&#x548c;&#x8d4b;&#x503c;&#x7684;&#x533a;&#x522b;&#x5f88;&#x91cd;&#x8981;&#xff0c;&#x56e0;&#x4e3a;&#x4e24;&#x8005;&#x8c03;&#x7528;&#x4e86;&#x4e0d;&#x540c;&#x7684;&#x51fd;&#x6570;"/>
<node CREATED="1469588335026" FOLDED="true" ID="ID_1800256519" MODIFIED="1521626646124" TEXT="&#x4f7f;&#x7528;&#x5927;&#x62ec;&#x53f7;&#xff0c;&#x6307;&#x5b9a;&#x5bb9;&#x5668;&#x521d;&#x59cb;&#x503c;&#x53d8;&#x5f97;&#x7b80;&#x5355;:">
<node CREATED="1469588332393" ID="ID_812468738" MODIFIED="1469588332394">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      td::vector&lt;int&gt; v{1,3,5};//v&#30340;&#21021;&#22987;&#20540;&#26159;1,3,5
    </p>
  </body>
</html></richcontent>
</node>
</node>
<node CREATED="1469588274497" FOLDED="true" ID="ID_1233039118" MODIFIED="1521626646124" TEXT="&#x5927;&#x62ec;&#x53f7;&#x4e5f;&#x53ef;&#x4ee5;&#x7528;&#x6765;&#x4e3a;&#x975e;&#x9759;&#x6001;&#x6570;&#x636e;&#x6210;&#x5458;&#x6307;&#x5b9a;&#x521d;&#x59cb;&#x7684;&#x9ed8;&#x8ba4;&#x503c;">
<node CREATED="1469590466776" ID="ID_982355320" MODIFIED="1469590470964">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      class Widget{
    </p>
    <p>
      ...
    </p>
    <p>
      private:
    </p>
    <p>
      int x{0}; //&#27491;&#30830;&#65292;x&#40664;&#35748;&#20540;&#20026;0
    </p>
    <p>
      int y = 0; //&#27491;&#30830;
    </p>
    <p>
      int z(0); //&#38169;&#35823;
    </p>
    <p>
      }
    </p>
  </body>
</html></richcontent>
</node>
</node>
<node CREATED="1469590446643" FOLDED="true" ID="ID_70122041" MODIFIED="1521626646139" TEXT="&#x975e;&#x62f7;&#x8d1d;&#x5bf9;&#x8c61;(std:atomics-&#x53c2;&#x8003;&#x7b2c;40&#x6761;)&#x53ef;&#x4ee5;&#x4f7f;&#x7528;&#x5927;&#x62ec;&#x53f7;&#x548c;&#x62ec;&#x53f7;&#x521d;&#x59cb;&#x5316;&#xff0c;&#x4f46;&#x662f;&quot;=&quot;&#x4e0d;&#x884c;:">
<node CREATED="1469588392985" ID="ID_34662693" MODIFIED="1469590474738">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      std::atomic&lt;int&gt; ai1{0}; //&#27491;&#30830;
    </p>
    <p>
      std::atomic&lt;int&gt; ai2(0); //&#27491;&#30830;
    </p>
    <p>
      std::atomic&lt;int&gt; ai3 = 0; //&#38169;&#35823;
    </p>
  </body>
</html></richcontent>
</node>
</node>
<node CREATED="1469588498969" ID="ID_1253926374" MODIFIED="1469588500013" TEXT="&#x62ec;&#x53f7;&#x521d;&#x59cb;&#x5316;&#x53e6;&#x5916;&#x4e00;&#x4e2a;&#x503c;&#x5f97;&#x4e00;&#x63d0;&#x7684;&#x7279;&#x70b9;&#x662f;&#x5b83;&#x6446;&#x8131;&#x4e86;C++&#x7684;&#x4ee4;&#x4eba;&#x5934;&#x75bc;&#x7684;&#x6b67;&#x4e49;&#x539f;&#x5219;&#x3002;C++&#x539f;&#x5219;&#x7684;&#x4e00;&#x4e2a;&#x526f;&#x4f5c;&#x7528;&#x662f;&#x4efb;&#x4f55;&#x7684;&#x53ef;&#x4ee5;&#x7528;&#x6765;&#x7533;&#x660e;&#x7684;&#x5fc5;&#x987b;&#x88ab;&#x89e3;&#x91ca;&#x6210;&#x552f;&#x4e00;&#x7684;&#xff0c;&#x7ecf;&#x5e38;&#x56f0;&#x6270;&#x5f00;&#x53d1;&#x8005;&#x7684;&#x4e00;&#x4e2a;&#x95ee;&#x9898;&#x662f;"/>
<node CREATED="1469590514385" FOLDED="true" ID="ID_272218329" MODIFIED="1521626646139" TEXT="&#x5728;&#x4e09;&#x79cd;&#x4e3a;C++&#x521d;&#x59cb;&#x5316;&#x8bbe;&#x8ba1;&#x7684;&#x8868;&#x8fbe;&#x5f0f;&#x4e2d;&#xff0c;&#x53ea;&#x6709;&#x62ec;&#x53f7;&#x53ef;&#x4ee5;&#x88ab;&#x7528;&#x5728;&#x4efb;&#x4f55;&#x5730;&#x65b9;&#x3002; &#xa;&#x62ec;&#x53f7;&#x521d; &#x59cb;&#x5316;&#x7684;&#x4e00;&#x4e2a;&#x65b0;&#x7684;&#x7279;&#x6027;&#x662f;&#x5b83;&#x7981;&#x6b62;&#x5728;&#x57fa;&#x672c;&#x7c7b;&#x578b;&#x4e2d;&#x4f7f;&#x7528;&#x9690;&#x5f0f;&#x7684;&#x6570;&#x503c;&#x8f6c;&#x6362;&#x3002;">
<node CREATED="1469590876186" ID="ID_1596639201" MODIFIED="1469591027759">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      double x,y,z;
    </p>
    <p>
      ...
    </p>
    <p>
      int sum1{x + y + z}; //&#38169;&#35823;&#65292;&#21452;&#31934;&#24230;&#31867;&#22411;&#25968;&#20540;&#30456;&#21152;&#26080;&#27861;&#34920;&#36798;&#20026;&#25972;&#24418;
    </p>
    <p>
      //&#20351;&#29992;&#25324;&#21495;&#21644;&#31561;&#21495;&#36827;&#34892;&#21021;&#22987;&#21270;&#26102;&#19981;&#20250;&#36827;&#34892;&#25968;&#20540;&#36716;&#25442;&#65292;&#22240;&#20026;&#36825;&#26679;&#20250;&#20943;&#23569;&#24456;&#22810;&#20887;&#20313;&#30340;&#20195;&#30721;:<br />int sum2(x + y + z); //&#27491;&#30830;&#65292;&#34920;&#36798;&#24335;&#30340;&#20540;&#20026;&#36716;&#25442;&#25104;&#25972;&#24418; int sum3 = x + y + z; //&#22914;&#19978;<br />Widget w1(10); //&#35843;&#29992;Widget&#30340;&#26500;&#36896;&#20989;&#25968;&#24182;&#20256;&#36882;&#21442;&#25968;10<br />Widget w2(); //&#38750;&#24120;&#30340;&#27495;&#20041;&#65292;&#23450;&#20041;&#20102;&#19968;&#20010;&#36820;&#22238;Widget&#23545;&#35937;&#30340;w2&#20989;&#25968;<br />Widget w3{}; //&#35843;&#29992;Widget&#26080;&#21442;&#26500;&#36896;&#20989;&#25968;
    </p>
  </body>
</html></richcontent>
</node>
<node CREATED="1469591064313" ID="ID_1767519277" MODIFIED="1469591111363">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      class Widget{<br />public:<br />Widget(int i,bool b); //&#26500;&#36896;&#20989;&#25968;&#27809;&#26377;&#22768;&#26126;&#20026;std::initializer_list&#30340;&#21442;&#25968;<br />Widget(int i,double d);
    </p>
    <p>
      }&#65307;<br />Widget w1(10,true); //&#35843;&#29992;&#31532;&#19968;&#20010;&#26500;&#36896;&#20989;&#25968; Widget w2(10,true); //&#21516;&#26679;&#35843;&#29992;&#31532;&#19968;&#20010;&#26500;&#36896;&#20989;&#25968;<br />Widget w3(10,50); //&#35843;&#29992;&#31532;&#20108;&#20010;&#26500;&#36896;&#20989;&#25968; Widget w4(10,50); //&#21516;&#26679;&#35843;&#29992;&#31532;&#20108;&#20010;&#26500;&#36896;&#20989;&#25968;
    </p>
  </body>
</html></richcontent>
</node>
</node>
<node CREATED="1469591165265" FOLDED="true" ID="ID_638607959" MODIFIED="1521626646139">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      &#20351;&#29992;&#22823;&#25324;&#21495;&#36827;&#34892;&#21021;&#22987;&#21270;&#36824;&#26377;&#24456;&#22810;&#20540;&#24471;&#19968;&#25552;&#30340;&#22320;&#26041;&#12290;&#23427;&#30340;&#35821;&#27861;&#21487;&#20197;&#29992;&#20110;&#24191;&#27867;&#30340;&#19978;&#19979;&#25991;&#35821;&#22659;&#20043;&#20013;&#65292;&#23427;&#21487;&#20197;&#38450;&#27490;&#38544;&#24335;&#20540;&#36716;&#25442;&#65292;&#32780;&#19988;&#19981;&#20250;&#20986;&#29616;C++&#30340;&#20108;&#20041;&#24615;&#12290;<br />
    </p>
    <p>
      &#22823;&#25324;&#21495;&#30340;&#21021;&#22987;&#21270;&#30340;&#32570;&#28857;&#26159;&#23427;&#24102;&#26469;&#30340;&#19968;&#20123;&#20196;&#20154;&#24847;&#22806;&#30340;&#34892;&#20026;&#12290;&#36825;&#20123;&#34892;&#20026;&#26469;&#33258;&#20351;&#29992;&#22823;&#25324;&#21495;&#21021;&#22987;&#21270; std::initializer_lists&#21644;&#37325;&#36733;&#26500;&#36896;&#20989;&#25968;&#30340;&#24322;&#24120;&#32416;&#32467;&#30340;&#20851;&#31995;&#20013;&#12290;&#23427;&#20204;&#20043;&#38388;&#30340;&#30456;&#20114;&#20851;&#31995;&#20351;&#24471;&#20195;&#30721;&#30475;&#36215;&#26469;&#20570;&#20102;&#19968;&#26679;&#30340;&#20107;&#65292;&#23454;&#38469;&#19978;&#24182;&#19981;&#26159;&#12290;<br />
    </p>
    <p>
      &#22312;&#26500;&#36896;&#20989;&#25968;&#35843;&#29992;&#20013;&#65292;&#21482;&#35201;&#19981;&#21253;&#21547;std::initializer_list&#21442;&#25968;&#21015;&#34920;&#65292;&#22823;&#25324;&#21495;&#21644;&#25324;&#21495;&#24847;&#20041;&#26159;&#19968;&#26679;
    </p>
  </body>
</html></richcontent>
<node CREATED="1469591298745" ID="ID_1602568293" MODIFIED="1469591343607">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      &#20294;&#26159;&#65292;&#22914;&#26524;&#26377;&#19968;&#20010;&#25110;&#22810;&#20010;&#26500;&#36896;&#20989;&#25968;&#30340;&#21442;&#25968;&#31867;&#22411;&#26159;std::initializer_list&#65292;&#20351;&#29992;&#22823;&#25324;&#21495;&#21021;&#22987;&#21270;&#35821;&#27861;&#20250;&#20248;&#20808;&#35843;&#29992;&#20351;&#29992;&#20102;&#21442;&#25968;&#31867;&#22411;std::initializer_list&#30340;&#26500;&#36896;&#20989;&#25968;&#12290;&#26356;&#26126;&#30830;&#30340;&#19968;&#28857;&#26159;&#65292;&#21482;&#35201;&#32534;&#35793;&#22120;&#19968;&#26086;&#21487;&#20197;&#25226;&#19968;&#20010;&#20351;&#29992;&#22823;&#25324;&#21495;&#21021;&#22987;&#21270;&#35299;&#37322;&#25104;&#35843;&#29992;&#20855;&#26377;std::initializer_list&#21442;&#25968;&#30340;&#27807;&#36890;&#20989;&#25968;&#65292;&#23427;&#19968;&#23450;&#20250;&#36825;&#20040;&#20570;&#12290;&#22914;&#26524;&#19978;&#38754;&#30340;Widget&#31867;&#20855;&#26377;&#19968;&#20010;&#24102;&#26377;std::initializer_list&lt;long double&gt;&#21442;&#25968;&#30340;&#26500;&#36896;&#20989;&#25968;&#65292;&#22914;&#19979;&#65306;
    </p>
    <p>
      class Widget{
    </p>
    <p>
      public:
    </p>
    <p>
      Widget(int i,bool b); //&#21644;&#19978;&#38754;&#19968;&#26679;
    </p>
    <p>
      Widget(int i,double d); //&#21644;&#19978;&#38754;&#19968;&#26679;
    </p>
    <p>
      Widget(std::initializer_list&lt;long double&gt; il); //&#26032;&#21152;&#30340;&#26500;&#36896;&#20989;&#25968;
    </p>
    <p>
      ...
    </p>
    <p>
      };<br />Widget w1(10,true); //&#20351;&#29992;&#25324;&#21495;&#26500;&#36896;&#20989;&#25968;
    </p>
    <p>
      Widget w2{10,true}; //&#20351;&#29992;&#22823;&#25324;&#21495;&#26500;&#36896;&#20989;&#25968;,&#35843;&#29992;std::initializer_list&#21442;&#25968;&#65292;10&#21644;true&#34987;&#36716;&#25442;&#25104;long dobule&#22411;
    </p>
    <p>
      Widget w3(10,5,0); //&#20351;&#29992;&#25324;&#21495;&#26500;&#36896;&#20989;&#25968;
    </p>
    <p>
      Widget w4{10,5.0}; //&#20351;&#29992;&#22823;&#25324;&#21495;&#65292;&#35843;&#29992;std::initializer_list&#21442;&#25968;&#65292;10&#21644;5.0&#34987;&#36716;&#25442;&#20026;long double
    </p>
  </body>
</html></richcontent>
</node>
<node CREATED="1469591442065" ID="ID_410096844" MODIFIED="1469591447631">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      class Widget{
    </p>
    <p>
      public:
    </p>
    <p>
      Widget(int i,bool b); //&#21516;&#19978;
    </p>
    <p>
      Widget(int i,double d); //&#21516;&#19978;
    </p>
    <p>
      Widget(std::initializer_list&lt;long double&gt; il); //&#21516;&#19978;
    </p>
    <p>
      operator float() const; //&#36716;&#25442;&#25104;float&#22411;
    </p>
    <p>
      ...
    </p>
    <p>
      };
    </p>
    <p>
      Widget w5(w4); //&#20351;&#29992;&#25324;&#21495;&#65292;&#35843;&#29992;&#25335;&#36125;&#26500;&#36896;&#20989;&#25968;
    </p>
    <p>
      Widget w6(w4); //&#20351;&#29992;&#22823;&#25324;&#21495;&#65292;&#35843;&#29992;std::initializer_list&#21442;&#25968;&#31867;&#22411;&#26500;&#36896;&#20989;&#25968;,w4&#34987;&#36716;&#25442;&#25104;float&#65292;&#28982;&#21518;&#20877;&#36716;&#25442;&#25104;long double
    </p>
    <p>
      Widget w7(std::move(w4)); //&#20351;&#29992;&#25324;&#21495;&#65292;&#35843;&#29992;move&#26500;&#36896;&#20989;&#25968;
    </p>
    <p>
      Widget w8{std::move(w4)}; //&#20351;&#29992;&#22823;&#25324;&#21495;&#65292;&#35843;&#29992;std::initializer_list&#26500;&#36896;&#20989;&#25968;&#65292;&#21644;w6&#21407;&#22240;&#19968;&#26679;
    </p>
  </body>
</html></richcontent>
</node>
</node>
<node CREATED="1469591580002" FOLDED="true" ID="ID_854486166" MODIFIED="1521626646139">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      &#22914;&#26524;&#20320;&#24819;&#20351;&#29992;&#31354;&#30340;initializer_list&#21442;&#25968;&#26469;&#35843;&#29992;std::initializer_list&#21442;&#25968;&#30340;&#26500;&#36896;&#20989;&#25968;&#65292;<br />&#20320;&#21487;&#20197;&#20351;&#29992;&#31354;&#30340;&#22823;&#25324;&#21495;&#20316;&#20026;&#21442;&#25968;--&#25226;&#31354;&#30340;&#22823;&#25324;&#21495;&#25918;&#22312;&#23567;&#25324;&#21495;&#20043;&#20013;&#26469;&#26631;&#23450;&#20320;&#20256;&#36882;&#30340;&#20869;&#23481;
    </p>
  </body>
</html></richcontent>
<node CREATED="1469591608289" ID="ID_279620783" MODIFIED="1469591615558">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      Widget w4({}); //&#20351;&#29992;&#31354;&#21015;&#34920;&#20316;&#20026;&#21442;&#25968;&#35843;&#29992;std::initializer_list&#22411;&#30340;&#26500;&#36896;&#20989;&#25968;
    </p>
  </body>
</html></richcontent>
</node>
</node>
<node CREATED="1469591648441" FOLDED="true" ID="ID_1048124147" MODIFIED="1521626646139" TEXT="vector">
<node CREATED="1469591652562" ID="ID_1213376482" MODIFIED="1469591657871">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      std::vector&lt;int&gt; v1(10,20) //&#20351;&#29992;&#38750;std::initializer_list&#21442;&#25968;&#30340;&#26500;&#36896;&#20989;&#25968;&#65292;&#32467;&#26524;&#26500;&#36896;&#20102;10&#20010;&#20803;&#32032;&#30340;std::vector&#23545;&#35937;&#65292;&#27599;&#20010;&#23545;&#35937;&#30340;&#20540;&#37117;&#26159;20
    </p>
    <p>
      std::vector&lt;int&gt; v2{10,20} //&#20351;&#29992;std::initializer_list&#21442;&#25968;&#30340;&#26500;&#36896;&#20989;&#25968;&#65292;&#32467;&#26524;&#26500;&#36896;&#20102;2&#20010;&#20803;&#32032;&#30340;std::vector&#23545;&#35937;&#65292;&#20004;&#20010;&#20803;&#32032;&#20998;&#21035;&#26159;10&#21644;20
    </p>
  </body>
</html></richcontent>
</node>
</node>
</node>
<node CREATED="1469597201712" FOLDED="true" ID="ID_1715649583" MODIFIED="1521626646281" TEXT="8. &#x4f18;&#x5148;&#x4f7f;&#x7528;nullptr&#x800c;&#x4e0d;&#x662f;0&#x6216;NULL">
<node CREATED="1469597623817" ID="ID_1676861489" MODIFIED="1469597655696" TEXT=" std::nullptr_t  &#x53ef;&#x4ee5;&#x9690;&#x5f0f;&#x8f6c;&#x6362;&#x4e3a;&#x4efb;&#x4f55;&#x7c7b;&#x578b;&#x7684;&#x6307;&#x9488;">
<font BOLD="true" NAME="&#x5fae;&#x8f6f;&#x96c5;&#x9ed1;" SIZE="12"/>
</node>
<node CREATED="1469597652008" ID="ID_268153235" MODIFIED="1469597654553" TEXT="&#x907f;&#x514d;&#x6574;&#x6570;&#x7c7b;&#x578b;&#x548c;&#x6307;&#x9488;&#x7c7b;&#x578b;&#x4e4b;&#x95f4;&#x7684;&#x91cd;&#x8f7d;">
<font BOLD="true" NAME="&#x5fae;&#x8f6f;&#x96c5;&#x9ed1;" SIZE="12"/>
</node>
</node>
<node CREATED="1469597683368" FOLDED="true" ID="ID_1150423881" MODIFIED="1521626646281" TEXT="9. &#x4f18;&#x5148;&#x4f7f;&#x7528;&#x58f0;&#x660e;&#x522b;&#x540d;&#x800c;&#x4e0d;&#x662f; typedef">
<node CREATED="1469597693184" ID="ID_822261601" MODIFIED="1469597757550">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      typedef void (*FP)(int, const std::string&amp;); // typedef
    </p>
    <p>
      using FP = void (*)(int, const std::string&amp;); // &#22768;&#26126;&#21035;&#21517;
    </p>
  </body>
</html></richcontent>
</node>
<node CREATED="1469597787256" FOLDED="true" ID="ID_1558542313" MODIFIED="1521626646139" TEXT="typedef  &#x4e0d;&#x652f;&#x6301;&#x6a21;&#x677f;&#x5316;&#xff0c;&#x4f46;&#x662f;&#x522b;&#x540d;&#x58f0;&#x660e;&#x652f;&#x6301;">
<font BOLD="true" NAME="&#x5fae;&#x8f6f;&#x96c5;&#x9ed1;" SIZE="12"/>
<node CREATED="1469597817352" ID="ID_1997426458" MODIFIED="1469597850111">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      template&lt;typname T&gt; // MyAllocList&lt;T&gt;
    </p>
    <p>
      using MyAllocList = std::list&lt;T, MyAlloc&lt;T&gt;&gt;; // &#31561;&#21516;&#20110;
    </p>
    <p>
      MyAllocList&lt;Widget&gt; lw; // &#32456;&#31471;&#20195;&#30721;
    </p>
  </body>
</html></richcontent>
</node>
<node CREATED="1469597872319" ID="ID_339506597" MODIFIED="1469597982446">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      template&lt;typname T&gt;
    </p>
    <p>
      using MyAllocList = std::list&lt;T, MyAlloc&lt;T&gt;&gt;; // &#21644;&#20197;&#21069;&#19968;&#26679;
    </p>
    <p>
      template&lt;typename T&gt;
    </p>
    <p>
      class Widget {
    </p>
    <p>
      &#160;&#160;&#160;&#160;private:
    </p>
    <p>
      &#160;&#160;&#160;&#160;MyAllocList&lt;T&gt; list; // &#27809;&#26377;typename
    </p>
    <p>
      ... // &#27809;&#26377;::type
    </p>
    <p>
      };
    </p>
  </body>
</html></richcontent>
</node>
</node>
<node CREATED="1469756152845" ID="ID_1338589029" MODIFIED="1469756154988" TEXT="&#x6a21;&#x677f;&#x522b;&#x540d;&#x907f;&#x514d;&#x4e86; ::type  &#x540e;&#x7f00;&#xff0c;&#x5728;&#x6a21;&#x677f;&#x4e2d;&#xff0c; typedef  &#x8fd8;&#x7ecf;&#x5e38;&#x8981;&#x6c42;&#x4f7f;&#x7528; typename  &#x524d;&#x7f00;">
<font BOLD="true" NAME="&#x5fae;&#x8f6f;&#x96c5;&#x9ed1;" SIZE="12"/>
</node>
<node CREATED="1469756165891" ID="ID_909835921" MODIFIED="1469756167917" TEXT="C++14  &#x4e3a; C++11  &#x4e2d;&#x7684;&#x7c7b;&#x578b;&#x7279;&#x5f81;&#x8f6c;&#x6362;&#x63d0;&#x4f9b;&#x4e86;&#x6a21;&#x677f;&#x522b;&#x540d;">
<font BOLD="true" NAME="&#x5fae;&#x8f6f;&#x96c5;&#x9ed1;" SIZE="12"/>
</node>
</node>
<node CREATED="1469756674668" FOLDED="true" ID="ID_313390859" MODIFIED="1521626646281" TEXT="10. &#x6709;&#x4f5c;&#x7528;&#x57df;&#x7684;enum">
<node CREATED="1469756696132" ID="ID_1421182312" MODIFIED="1469756699317" TEXT="C++98  &#x98ce;&#x683c;&#x7684; enum  &#x662f;&#x6ca1;&#x6709;&#x4f5c;&#x7528;&#x57df;&#x7684; enum">
<font BOLD="true" NAME="&#x5fae;&#x8f6f;&#x96c5;&#x9ed1;" SIZE="12"/>
</node>
<node CREATED="1469756747220" ID="ID_716987218" MODIFIED="1469756750169" TEXT="&#x6709;&#x4f5c;&#x7528;&#x57df;&#x7684;&#x679a;&#x4e3e;&#x4f53;&#x7684;&#x679a;&#x4e3e;&#x5143;&#x7d20;&#x4ec5;&#x4ec5;&#x5bf9;&#x679a;&#x4e3e;&#x4f53;&#x5185;&#x90e8;&#x53ef;&#x89c1;&#x3002;&#x53ea;&#x80fd;&#x901a;&#x8fc7;&#x7c7b;&#x578b;&#x8f6c;&#x6362;&#xff08; cast  &#xff09;&#x8f6c;&#x6362;&#x4e3a;&#x5176;&#x4ed6;&#x7c7b;&#x578b;">
<font BOLD="true" NAME="&#x5fae;&#x8f6f;&#x96c5;&#x9ed1;" SIZE="12"/>
</node>
<node CREATED="1469756765989" ID="ID_1371351148" MODIFIED="1469756767897" TEXT="&#x6709;&#x4f5c;&#x7528;&#x57df;&#x548c;&#x6ca1;&#x6709;&#x4f5c;&#x7528;&#x57df;&#x7684; enum  &#x90fd;&#x652f;&#x6301;&#x6307;&#x5b9a;&#x6f5c;&#x5728;&#x7c7b;&#x578b;&#x3002;&#x6709;&#x4f5c;&#x7528;&#x57df;&#x7684; enum  &#x7684;&#x9ed8;&#x8ba4;&#x6f5c;&#x5728;&#x7c7b;&#x578b;&#x662f; int  &#x3002;&#x6ca1;&#x6709;&#x4f5c;&#x7528;&#x57df; &#x7684; enum  &#x6ca1;&#x6709;&#x9ed8;&#x8ba4;&#x7684;&#x6f5c;&#x5728;&#x7c7b;&#x578b;&#x3002;">
<font BOLD="true" NAME="&#x5fae;&#x8f6f;&#x96c5;&#x9ed1;" SIZE="12"/>
</node>
<node CREATED="1469756777324" ID="ID_11630658" MODIFIED="1469756781932" TEXT="&#x6709;&#x4f5c;&#x7528;&#x57df;&#x7684; enum  &#x603b;&#x662f;&#x53ef;&#x4ee5;&#x524d;&#x7f6e;&#x58f0;&#x660e;&#x7684;&#x3002;&#x6ca1;&#x6709;&#x4f5c;&#x7528;&#x57df;&#x7684; enum  &#x53ea;&#x6709;&#x5f53;&#x6307;&#x5b9a;&#x6f5c;&#x5728;&#x7c7b;&#x578b;&#x65f6;&#x624d;&#x53ef;&#x4ee5;&#x524d;&#x7f6e;&#x58f0;&#x660e;&#x3002;">
<font BOLD="true" NAME="&#x5fae;&#x8f6f;&#x96c5;&#x9ed1;" SIZE="12"/>
</node>
</node>
<node CREATED="1469756867301" FOLDED="true" ID="ID_271269444" MODIFIED="1521626646281" TEXT="11. &#x4f18;&#x5148;delete&#x800c;&#x4e0d;&#x662f;private&#x53c8;&#x4e0d;&#x5b9e;&#x73b0;&#x51fd;&#x6570;">
<node CREATED="1469756918373" ID="ID_274133201" MODIFIED="1469763447532" TEXT="&#x4f18;&#x5148;&#x4f7f;&#x7528;&#x5220;&#x9664;&#x51fd;&#x6570;&#x800c;&#x4e0d;&#x662f;&#x79c1;&#x6709;&#x800c;&#x4e0d;&#x5b9a;&#x4e49;&#x7684;&#x51fd;&#x6570;">
<font BOLD="true" NAME="&#x5fae;&#x8f6f;&#x96c5;&#x9ed1;" SIZE="12"/>
</node>
<node CREATED="1469763448362" ID="ID_689449615" MODIFIED="1469763457625" TEXT="&#x4efb;&#x4f55;&#x51fd;&#x6570;&#x90fd;&#x53ef;&#x4ee5;&#x88ab;&#x58f0;&#x660e;&#x4e3a;&#x5220;&#x9664;&#xff0c;&#x5305;&#x62ec;&#x975e;&#x6210;&#x5458;&#x51fd;&#x6570;&#x548c;&#x6a21;&#x677f;&#x5b9e;&#x73b0;">
<font BOLD="true" NAME="&#x5fae;&#x8f6f;&#x96c5;&#x9ed1;" SIZE="12"/>
</node>
</node>
<node CREATED="1469763469322" FOLDED="true" ID="ID_1255396953" MODIFIED="1521626646281" TEXT="12. override&#x58f0;&#x660e;&#x8986;&#x76d6;&#x7684;&#x51fd;&#x6570;">
<node CREATED="1469777712425" FOLDED="true" ID="ID_392141940" MODIFIED="1521626646139">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      &#20351;&#29992;&#35206;&#30422;&#30340;&#20989;&#25968;&#24517;&#39035;&#28385;&#36275;&#65306;
    </p>
  </body>
</html></richcontent>
<node CREATED="1469777750062" ID="ID_1383319645" MODIFIED="1469777755244">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      &#22522;&#31867;&#20013;&#30340;&#20989;&#25968;&#34987;&#22768;&#26126;&#20026;&#34394;&#30340;&#12290;
    </p>
  </body>
</html></richcontent>
</node>
<node CREATED="1469777755245" ID="ID_1887803090" MODIFIED="1469777760485">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      &#22522;&#31867;&#20013;&#21644;&#27966;&#29983;&#20986;&#30340;&#20989;&#25968;&#24517;&#39035;&#26159;&#23436;&#20840;&#19968;&#26679;&#30340;&#65288;&#20986;&#20102;&#34394;&#26512;&#26500;&#20989;&#25968;&#65289;&#12290;
    </p>
  </body>
</html></richcontent>
</node>
<node CREATED="1469777760487" ID="ID_157882634" MODIFIED="1469777766013">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      &#22522;&#31867;&#20013;&#21644;&#27966;&#29983;&#20986;&#30340;&#20989;&#25968;&#30340;&#21442;&#25968;&#31867;&#22411;&#24517;&#39035;&#23436;&#20840;&#19968;&#26679;&#12290;
    </p>
  </body>
</html></richcontent>
</node>
<node CREATED="1469777766014" ID="ID_1447446246" MODIFIED="1469777774379">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      &#22522;&#31867;&#20013;&#21644;&#27966;&#29983;&#20986;&#30340;&#20989;&#25968;&#30340;&#24120;&#37327;&#29305;&#24615;&#24517;&#39035;&#23436;&#20840;&#19968;&#26679;&#12290;
    </p>
  </body>
</html></richcontent>
</node>
<node CREATED="1469777774381" ID="ID_1845133271" MODIFIED="1469777782020">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      &#22522;&#31867;&#20013;&#21644;&#27966;&#29983;&#20986;&#30340;&#20989;&#25968;&#30340;&#36820;&#22238;&#20540;&#31867;&#22411;&#21644;&#24322;&#24120;&#22768;&#26126;&#24517;&#39035;&#20351;&#20860;&#23481;&#30340;&#12290;
    </p>
  </body>
</html></richcontent>
</node>
<node CREATED="1469777782021" ID="ID_749872537" MODIFIED="1469777817836">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      C++11&#20013;&#65292;&#20989;&#25968;&#30340;&#24341;&#29992;&#20462;&#39280;&#31526;&#24517;&#39035;&#23436;&#20840;&#19968;&#26679;&#12290;&#36825;&#20123;&#20462;&#39280;&#31526;&#20351;&#24471;&#23558;&#36825;&#20123;&#20989;&#25968;&#21482;&#33021;&#34987;&#24038;&#20540;&#25110;&#32773;&#21491;&#20540;&#20351;&#29992;&#25104;&#20026;&#21487;&#33021;&#12290;
    </p>
  </body>
</html></richcontent>
</node>
</node>
</node>
<node CREATED="1469777845773" FOLDED="true" ID="ID_1964495335" MODIFIED="1521626646281" TEXT="13. &#x4f18;&#x5148;&#x4f7f;&#x7528;const_iterator&#x800c;&#x4e0d;&#x662f;iterator">
<node CREATED="1469777849766" ID="ID_117808492" MODIFIED="1470020307314" TEXT="C++11&#x4e2d; const_iterator  &#x65e2;&#x5bb9;&#x6613;&#x83b7;&#x5f97;&#x4e5f;&#x5bb9;&#x6613;&#x4f7f;&#x7528;&#x3002;&#x5bb9;&#x5668;&#x4e2d;&#x6210;&#x5458;&#x51fd;&#x6570; cbegin  &#x548c; cend  &#x53ef;&#x4ee5; &#x4ea7;&#x751f; const_iterator  &#xff0c;&#x751a;&#x81f3;&#x975e; const  &#x7684;&#x5bb9;&#x5668;&#x4e5f;&#x53ef;&#x4ee5;&#x8fd9;&#x6837;&#x505a;&#xff0c;STL&#x6210;&#x5458;&#x51fd;&#x6570;&#x901a;&#x5e38;&#x4f7f;&#x7528; const_iterator  &#x6765;&#x8fdb;&#x884c;&#x5b9a;&#x4f4d;&#xff08;&#x4e5f;&#x5c31;&#x662f; &#x8bf4;&#xff0c;&#x63d2;&#x5165;&#x548c;&#x5220;&#x9664;insert and erase&#xff09;"/>
</node>
<node CREATED="1470020332589" FOLDED="true" ID="ID_266841120" MODIFIED="1521626646281" TEXT="14. noexcept&#x4e0d;&#x60f3;&#x629b;&#x51fa;&#x5f02;&#x5e38;&#x7684;&#x51fd;&#x6570;">
<node CREATED="1470020375038" ID="ID_1870939144" MODIFIED="1470020375038" TEXT=""/>
</node>
<node CREATED="1470020389237" ID="ID_1040871179" MODIFIED="1470020397434" TEXT="15. constexpr"/>
<node CREATED="1470020407277" ID="ID_867720150" MODIFIED="1470020429570" TEXT="16. &#x4fdd;&#x8bc1;const&#x6210;&#x5458;&#x51fd;&#x6570;&#x7ebf;&#x7a0b;&#x5b89;&#x5168;"/>
<node CREATED="1470117010602" FOLDED="true" ID="ID_615806385" MODIFIED="1521626646281" TEXT="41. &#x8003;&#x8651;&#x5bf9;&#x62f7;&#x8d1d;&#x53c2;&#x6570;&#x6309;&#x503c;&#x4f20;&#x9012;&#x79fb;&#x52a8;&#x5ec9;&#x4ef7;&#xff0c;&#x90a3;&#x5c31;&#x5c3d;&#x91cf;&#x62f7; &#x8d1d;">
<node CREATED="1470289944302" ID="ID_799954328" MODIFIED="1470290144795">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      class Widget {
    </p>
    <p>
      public: // overload for&#160;
    </p>
    <p>
      void setName(const std::string&amp; newName) // lvalues and
    </p>
    <p>
      { name = newName; } // rvalues&#160;
    </p>
    <p>
      void setName(std::string&amp;&amp; newName)
    </p>
    <p>
      { name = std::move(newName); }
    </p>
    <p>
      private:
    </p>
    <p>
      std::string name;
    </p>
    <p>
      };
    </p>
  </body>
</html></richcontent>
</node>
<node CREATED="1470290144796" ID="ID_1014577861" MODIFIED="1470290149337">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      class Widget {
    </p>
    <p>
      public: // use universal
    </p>
    <p>
      template&lt;typename T&gt; // reference
    </p>
    <p>
      void setName(T&amp;&amp; newName)
    </p>
    <p>
      { name = std::forward&lt;T&gt;(newName); }
    </p>
    <p>
      };
    </p>
  </body>
</html></richcontent>
</node>
<node CREATED="1470290149338" ID="ID_562262197" MODIFIED="1470290149341">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      class Widget {
    </p>
    <p>
      public: // pass by value
    </p>
    <p>
      void setName(std::string newName)
    </p>
    <p>
      { name = std::move(newName); }
    </p>
    <p>
      };
    </p>
  </body>
</html></richcontent>
</node>
<node CREATED="1470290230388" ID="ID_1808189384" MODIFIED="1470290241473" TEXT="std::string widgetID(&quot;Bart&quot;); &#xa;w.setName(widgetID);           // pass lvalue  &#xa;w.setName(widgetID + &quot;Jenne&quot;); // pass rvalue"/>
<node CREATED="1470377260283" ID="ID_106930588" MODIFIED="1470377363218">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      &#23545;&#20110;&#26080;&#26465;&#20214;&#22320;&#22797;&#21046;&#30340;&#24265;&#20215;&#31227;&#21160;&#21442;&#25968;&#65292;&#36890;&#36807;&#20540;&#20256;&#36882;&#36319;&#36890;&#36807;&#24341;&#29992;&#20256;&#36882;&#20960;&#20046;&#19968;&#26679;&#26377;&#25928;&#12289; &#32780;&#19988;&#23481;&#26131;&#23454;&#29616;&#65292;&#21487;&#20197;&#29983;&#25104;&#26356;&#23569;&#30340;&#23545;&#35937;&#20195;&#30721;&#12290;
    </p>
  </body>
</html></richcontent>
<font BOLD="true" NAME="&#x5fae;&#x8f6f;&#x96c5;&#x9ed1;" SIZE="12"/>
</node>
<node CREATED="1470377266881" ID="ID_181149265" MODIFIED="1470377420681">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      &#36890;&#36807;&#20540;&#20256;&#36882;&#26159;&#23545;&#35937;&#20999;&#29255;&#30340;&#38382;&#39064;&#65292;&#25152;&#20197;&#23427;&#36890;&#24120;&#19981;&#36866;&#21512;&#22522;&#31867;&#21442;&#25968;&#31867;&#22411;
    </p>
  </body>
</html></richcontent>
<font BOLD="true" NAME="&#x5fae;&#x8f6f;&#x96c5;&#x9ed1;" SIZE="12"/>
</node>
</node>
<node CREATED="1470117013881" ID="ID_1463435344" MODIFIED="1470118049094" TEXT="42. &#x8003;&#x8651;&#x4f7f;&#x7528;emplace&#x4ee3;&#x66ff;insert">
<font NAME="&#x5fae;&#x8f6f;&#x96c5;&#x9ed1;" SIZE="12"/>
</node>
<node CREATED="1470020447646" ID="ID_679122343" MODIFIED="1470117247027" TEXT="17. &#x7406;&#x89e3;&#x7279;&#x6b8a;&#x6210;&#x5458;&#x51fd;&#x6570;&#x7684;&#x751f;&#x6210;"/>
</node>
<node CREATED="1470030783501" FOLDED="true" ID="ID_925759501" MODIFIED="1521626646436" POSITION="right" TEXT="&#x667a;&#x80fd;&#x6307;&#x9488;">
<node CREATED="1470021141925" FOLDED="true" ID="ID_1509825530" MODIFIED="1521626646281" TEXT="18. std::unique_ptr&#x72ec;&#x5360;">
<node CREATED="1470021177221" ID="ID_1598444229" MODIFIED="1470023001622">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      std::unique_ptr&#160;&#160;&#26159;&#19968;&#20010;&#20855;&#26377;&#24320;&#38144;&#23567;&#65292;&#36895;&#24230;&#24555;&#65292; move-only&#160;&#160;&#29305;&#23450;&#30340;&#26234;&#33021;&#25351;&#38024;&#65292;&#20351;&#29992;&#29420;&#21344;&#25317;&#26377;&#26041;&#24335;&#26469;&#31649;&#29702;&#36164;&#28304;&#12290;
    </p>
  </body>
</html></richcontent>
<font BOLD="true" NAME="&#x5fae;&#x8f6f;&#x96c5;&#x9ed1;" SIZE="12"/>
</node>
<node CREATED="1470021195973" ID="ID_235285584" MODIFIED="1470023002303" TEXT="&#x9ed8;&#x8ba4;&#x60c5;&#x51b5;&#x4e0b;&#xff0c;&#x91ca;&#x653e;&#x8d44;&#x6e90;&#x7531;delete&#x6765;&#x5b8c;&#x6210;&#xff0c;&#x4e5f;&#x53ef;&#x4ee5;&#x6307;&#x5b9a;&#x81ea;&#x5b9a;&#x4e49;&#x7684;&#x6790;&#x6784;&#x51fd;&#x6570;&#x6765;&#x66ff;&#x4ee3;&#x3002;&#x4f46;&#x662f;&#x5177;&#x6709;&#x4e30;&#x5bcc;&#x72b6;&#x6001;&#x7684;deleters&#x548c;&#x4ee5; &#x51fd;&#x6570;&#x6307;&#x9488;&#x4f5c;&#x4e3a;deleters&#x589e;&#x5927;&#x4e86; std::unique_ptr  &#x7684;&#x5b58;&#x50a8;&#x5f00;&#x9500;">
<font BOLD="true" NAME="&#x5fae;&#x8f6f;&#x96c5;&#x9ed1;" SIZE="12"/>
</node>
<node CREATED="1470021204758" ID="ID_280971182" MODIFIED="1470023002959" TEXT="&#x5f88;&#x5bb9;&#x6613;&#x5c06;&#x4e00;&#x4e2a; std::unique_ptr  &#x8f6c;&#x5316;&#x4e3a; std::shared_ptr">
<font BOLD="true" NAME="&#x5fae;&#x8f6f;&#x96c5;&#x9ed1;" SIZE="12"/>
</node>
</node>
<node CREATED="1470021164765" FOLDED="true" ID="ID_1840765508" MODIFIED="1521626646281" TEXT="19. std::shared_ptr&#x5171;&#x4eab;">
<node CREATED="1470021337638" ID="ID_150085970" MODIFIED="1470021339897" TEXT="&#x4e00;&#x4e2a; std::shared_ptr  &#x53ef;&#x4ee5;&#x901a;&#x8fc7;&#x67e5;&#x8be2;&#x8d44;&#x6e90;&#x7684;&#x5f15;&#x7528;&#x8ba1;&#x6570;(reference count)&#x6765;&#x786e;&#x5b9a;&#x5b83;&#x662f;&#x4e0d;&#x662f;&#x6700;&#x540e;&#x4e00;&#x4e2a;&#x6307;&#x5411;&#x8be5;&#x8d44;&#x6e90;&#x7684;&#x6307;&#x9488;&#xff0c;&#x5f15;&#x7528; &#x8ba1;&#x6570;&#x662f;&#x4e00;&#x4e2a;&#x4f34;&#x968f;&#x5728;&#x8d44;&#x6e90;&#x65c1;&#x7684;&#x4e00;&#x4e2a;&#x503c;&#xff0c;&#x5b83;&#x8bb0;&#x5f55;&#x7740;&#x6709;&#x591a;&#x5c11;&#x4e2a; std::shared_ptr  &#x6307;&#x5411;&#x4e86;&#x8be5;&#x8d44;&#x6e90;&#x3002;"/>
<node CREATED="1470022293062" ID="ID_687475964" MODIFIED="1470022295778" TEXT="&#x907f;&#x514d;&#x7ed9;std::shared_ptr&#x6784;&#x9020;&#x51fd;&#x6570;&#x4f20;&#x9012;&#x539f;&#x751f;&#x6307;&#x9488;"/>
<node CREATED="1470022686630" ID="ID_1054024939" MODIFIED="1470022688434" TEXT="std::enable_shared_from_this  &#x5b9a;&#x4e49;&#x4e86;&#x4e00;&#x4e2a;&#x6210;&#x5458;&#x51fd;&#x6570;&#x6765;&#x521b;&#x5efa;&#x6307;&#x5411;&#x5f53;&#x524d;&#x5bf9;&#x8c61;&#x7684; std::shared_ptr  ,&#x4f46;&#x662f;&#x5b83;&#x5e76;&#x4e0d;&#x91cd;&#x590d;&#x521b;&#x5efa;&#x63a7;&#x5236;&#x5757;&#x3002; &#x8fd9;&#x4e2a;&#x6210;&#x5458;&#x51fd;&#x6570;&#x7684;&#x540d;&#x5b57;&#x662f; shared_from_this  ,&#x5f53;&#x4f60;&#x5b9e;&#x73b0;&#x4e00;&#x4e2a;&#x6210;&#x5458;&#x51fd;&#x6570;&#xff0c;&#x7528;&#x6765;&#x521b;&#x5efa;&#x4e00;&#x4e2a; std::shared_ptr  &#x6765;&#x6307;&#x5411;this&#x6307;&#x9488;&#x6307;&#x5411;&#x7684; &#x5bf9;&#x8c61;,&#x53ef;&#x4ee5;&#x5728;&#x5176;&#x4e2d;&#x4f7f;&#x7528; shared_from_this  "/>
<node CREATED="1470022996182" ID="ID_381156936" MODIFIED="1470022999082" TEXT="std::shared_ptr  &#x4e3a;&#x4e86;&#x7ba1;&#x7406;&#x4efb;&#x610f;&#x8d44;&#x6e90;&#x7684;&#x5171;&#x4eab;&#x5f0f;&#x5185;&#x5b58;&#x7ba1;&#x7406;&#x63d0;&#x4f9b;&#x4e86;&#x81ea;&#x52a8;&#x5783;&#x573e;&#x56de;&#x6536;&#x7684;&#x4fbf;&#x5229;">
<font BOLD="true" NAME="&#x5fae;&#x8f6f;&#x96c5;&#x9ed1;" SIZE="12"/>
</node>
<node CREATED="1470023006927" ID="ID_1397179269" MODIFIED="1470023020406" TEXT="std::shared_ptr  &#x662f; std::unique_ptr  &#x7684;&#x4e24;&#x500d;&#x5927;&#xff0c;&#x9664;&#x4e86;&#x63a7;&#x5236;&#x5757;&#xff0c;&#x8fd8;&#x6709;&#x9700;&#x8981;&#x539f;&#x5b50;&#x5f15;&#x7528;&#x8ba1;&#x6570;&#x64cd;&#x4f5c;&#x5f15;&#x8d77;&#x7684;&#x5f00;&#x9500;">
<font BOLD="true" NAME="&#x5fae;&#x8f6f;&#x96c5;&#x9ed1;" SIZE="12"/>
</node>
<node CREATED="1470023056638" ID="ID_1596082308" MODIFIED="1470023059463" TEXT="&#x8d44;&#x6e90;&#x7684;&#x9ed8;&#x8ba4;&#x6790;&#x6784;&#x4e00;&#x822c;&#x901a;&#x8fc7;delete&#x6765;&#x8fdb;&#x884c;&#xff0c;&#x4f46;&#x662f;&#x81ea;&#x5b9a;&#x4e49;&#x7684;deleter&#x4e5f;&#x662f;&#x652f;&#x6301;&#x7684;&#x3002;deleter&#x7684;&#x7c7b;&#x578b;&#x5bf9;&#x4e8e; std::shared_ptr  &#x7684; &#x7c7b;&#x578b;&#x4e0d;&#x4f1a;&#x4ea7;&#x751f;&#x5f71;&#x54cd;">
<font BOLD="true" NAME="&#x5fae;&#x8f6f;&#x96c5;&#x9ed1;" SIZE="12"/>
</node>
<node CREATED="1470023064815" ID="ID_403312110" MODIFIED="1470023066599" TEXT="&#x907f;&#x514d;&#x4ece;&#x539f;&#x751f;&#x6307;&#x9488;&#x7c7b;&#x578b;&#x53d8;&#x91cf;&#x521b;&#x5efa; std::shared_ptr">
<font BOLD="true" NAME="&#x5fae;&#x8f6f;&#x96c5;&#x9ed1;" SIZE="12"/>
</node>
</node>
<node CREATED="1470023181918" FOLDED="true" ID="ID_906974877" MODIFIED="1521626646281" TEXT="20. std::unique_ptr&#x53ef;&#x80fd;&#x60ac;&#x6302;&#x65f6;&#xff0c;&#x7528; std::weak_ptr">
<node CREATED="1470023280694" ID="ID_1268283574" MODIFIED="1470023281866" TEXT=" std::weak_ptr  &#x901a;&#x5e38;&#x7531;&#x4e00;&#x4e2a; std::shared_ptr  &#x6765;&#x521b;&#x5efa;&#xff0c;&#x5b83;&#x4eec;&#x6307;&#x5411;&#x76f8;&#x540c;&#x7684;&#x5730;&#x65b9;&#xff0c; std::shared_ptr  &#x6765;&#x521d;&#x59cb; &#x5316;&#x5b83;&#x4eec;&#xff0c;&#x4f46;&#x662f; std::weak_ptr  &#x4e0d;&#x4f1a;&#x5f71;&#x54cd;&#x5230;&#x5b83;&#x6240;&#x6307;&#x5411;&#x5bf9;&#x8c61;&#x7684;&#x5f15;&#x7528;&#x8ba1;&#x6570;"/>
<node CREATED="1470029349701" ID="ID_309935934" MODIFIED="1470029350777" TEXT="&#x8fd9;&#x5c31;&#x610f; &#x5473;&#x7740;&#x5de5;&#x5382;&#x51fd;&#x6570;&#x7684;&#x8fd4;&#x56de;&#x7c7b;&#x578b;&#x5e94;&#x8be5;&#x662f; std::shared_ptr  ,&#x56e0;&#x4e3a;&#x53ea;&#x6709;&#x5f53;&#x4e00;&#x4e2a;&#x5bf9;&#x8c61;&#x7684;&#x751f;&#x547d;&#x5468;&#x671f;&#x88ab; std::shared_ptr  &#x6240;&#x7ba1;&#x7406; &#x65f6;&#xff0c; std::weak_ptr  &#x624d;&#x80fd;&#x68c0;&#x6d4b;&#x5b83;&#x81ea;&#x8eab;&#x662f;&#x5426;&#x5904;&#x4e8e;&#x60ac;&#x6302;&#x72b6;&#x6001;"/>
<node CREATED="1470030460693" ID="ID_1880218680" MODIFIED="1470030463421" TEXT="std::weak_ptr  &#x7528;&#x6765;&#x6a21;&#x4eff;&#x7c7b;&#x4f3c;std::shared_ptr&#x7684;&#x53ef;&#x60ac;&#x6302;&#x6307;&#x9488;">
<font BOLD="true" NAME="&#x5fae;&#x8f6f;&#x96c5;&#x9ed1;" SIZE="12"/>
</node>
<node CREATED="1470030470429" ID="ID_1279736423" MODIFIED="1470030472485" TEXT="&#x6f5c;&#x5728;&#x7684;&#x4f7f;&#x7528; std::weak_ptr  &#x7684;&#x573a;&#x666f;&#x5305;&#x62ec;&#x7f13;&#x5b58;&#xff0c;&#x89c2;&#x5bdf;&#x8005;&#x5217;&#x8868;&#xff0c;&#x4ee5;&#x53ca;&#x963b;&#x6b62; std::shared_ptr  &#x5f62;&#x6210;&#x7684;&#x73af;">
<font BOLD="true" NAME="&#x5fae;&#x8f6f;&#x96c5;&#x9ed1;" SIZE="12"/>
</node>
</node>
<node CREATED="1470030818565" FOLDED="true" ID="ID_1550695581" MODIFIED="1521626646281" TEXT="21. &#x4f18;&#x5148;&#x4f7f;&#x7528;std::make_unique&#x548c;std::make_shared">
<node CREATED="1470032500757" ID="ID_100839090" MODIFIED="1470032508854" TEXT="&#x548c;&#x76f4;&#x63a5;&#x4f7f;&#x7528;new&#x76f8;&#x6bd4;&#xff0c;&#x4f7f;&#x7528;make&#x51fd;&#x6570;&#x51cf;&#x5c11;&#x4e86;&#x4ee3;&#x7801;&#x7684;&#x91cd;&#x590d;&#x91cf;&#xff0c;&#x63d0;&#x5347;&#x4e86;&#x5f02;&#x5e38;&#x5b89;&#x5168;&#x5ea6;&#xff0c;&#x5e76;&#x4e14;&#xff0c;&#x5bf9;&#x4e8e;std::make_shared&#x4ee5; &#x53ca;std::allocate_shared&#x6765;&#x8bf4;&#xff0c;&#x4ea7;&#x751f;&#x7684;&#x4ee3;&#x7801;&#x66f4;&#x52a0;&#x7b80;&#x6d01;&#x5feb;&#x901f;">
<font BOLD="true" NAME="&#x5fae;&#x8f6f;&#x96c5;&#x9ed1;" SIZE="12"/>
</node>
<node CREATED="1470032523734" ID="ID_1029149873" MODIFIED="1470032525822" TEXT="&#x4e5f;&#x4f1a;&#x5b58;&#x5728;&#x4f7f;&#x7528;make&#x51fd;&#x6570;&#x4e0d;&#x5408;&#x9002;&#x7684;&#x573a;&#x666f;&#xff1a;&#x5305;&#x542b;&#x6307;&#x5b9a;&#x81ea;&#x5b9a;&#x4e49;&#x7684;deleter,&#x4ee5;&#x53ca;&#x4f20;&#x9012;&#x5927;&#x62ec;&#x53f7;initializer&#x7684;&#x9700;&#x8981;">
<font BOLD="true" NAME="&#x5fae;&#x8f6f;&#x96c5;&#x9ed1;" SIZE="12"/>
</node>
<node CREATED="1470032533366" ID="ID_1023903699" MODIFIED="1470032535133" TEXT="&#x5bf9;&#x4e8e;std::shared_ptr&#x6765;&#x8bf4;&#xff0c;&#x4f7f;&#x7528;make&#x51fd;&#x6570;&#x7684;&#x989d;&#x5916;&#x7684;&#x4e0d;&#x4f7f;&#x7528;&#x573a;&#x666f;&#x8fd8;&#x5305;&#x542b;(1)&#x5e26;&#x6709;&#x81ea;&#x5b9a;&#x4e49;&#x5185;&#x5b58;&#x7ba1;&#x7406;&#x7684;class(2)&#x5185;&#x5b58;&#x975e;&#x5e38; &#x7d27;&#x4fcf;&#x7684;&#x7cfb;&#x7edf;&#xff0c;&#x975e;&#x5e38;&#x5927;&#x7684;&#x5bf9;&#x8c61;&#x4ee5;&#x53ca;&#x6bd4;&#x5bf9;&#x5e94;&#x7684;std::shared_ptr&#x6d3b;&#x7684;&#x8fd8;&#x8981;&#x957f;&#x7684;std::weak_ptr">
<font BOLD="true" NAME="&#x5fae;&#x8f6f;&#x96c5;&#x9ed1;" SIZE="12"/>
</node>
</node>
<node CREATED="1470032775446" FOLDED="true" ID="ID_861723780" MODIFIED="1521626646281" TEXT="22. &#x4f7f;&#x7528;Pimpl&#x65f6;&#x5019;&#xff0c;&#x5728;&#x5b9e;&#x73b0;&#x6587;&#x4ef6;&#x4e2d;&#x5b9a;&#x4e49;&#x7279;&#x6b8a;&#x51fd;&#x6570;">
<node CREATED="1470035635820" ID="ID_783345325" MODIFIED="1470035638320" TEXT="Pimpl&#x505a;&#x6cd5;&#x901a;&#x8fc7;&#x51cf;&#x5c11;&#x7c7b;&#x7684;&#x5b9e;&#x73b0;&#x548c;&#x7c7b;&#x7684;&#x4f7f;&#x7528;&#x4e4b;&#x95f4;&#x7684;&#x7f16;&#x8bd1;&#x4f9d;&#x8d56;&#x51cf;&#x5c11;&#x4e86;build&#x6b21;&#x6570;">
<font BOLD="true" NAME="&#x5fae;&#x8f6f;&#x96c5;&#x9ed1;" SIZE="12"/>
</node>
<node CREATED="1470035644543" ID="ID_1806416701" MODIFIED="1470035647519" TEXT="&#x5bf9;&#x4e8e; std::unique_ptr  pImpl&#x6307;&#x9488;&#xff0c;&#x5728;class&#x7684;&#x5934;&#x6587;&#x4ef6;&#x4e2d;&#x58f0;&#x660e;&#x8fd9;&#x4e9b;&#x7279;&#x6b8a;&#x7684;&#x6210;&#x5458;&#x51fd;&#x6570;&#xff0c;&#x5728;class&#x7684;&#x5b9e;&#x73b0;&#x6587;&#x4ef6;&#x4e2d;&#x5b9a;&#x4e49;&#x5b83;&#x4eec;&#x3002; &#x5373;&#x4f7f;&#x9ed8;&#x8ba4;&#x7684;&#x5b9e;&#x73b0;&#x65b9;&#x5f0f;(&#x7f16;&#x8bd1;&#x5668;&#x751f;&#x6210;&#x7684;&#x65b9;&#x5f0f;)&#x53ef;&#x4ee5;&#x80dc;&#x4efb;&#x4e5f;&#x8981;&#x8fd9;&#x4e48;&#x505a;">
<font BOLD="true" NAME="&#x5fae;&#x8f6f;&#x96c5;&#x9ed1;" SIZE="12"/>
</node>
</node>
</node>
<node CREATED="1470039566384" FOLDED="true" ID="ID_1493721696" MODIFIED="1521626646436" POSITION="right" TEXT="&#x53f3;&#x503c;&#x5f15;&#x7528;&#x3001;move()&#x3001;&#x5b8c;&#x7f8e;&#x8f6c;&#x53d1;">
<node CREATED="1470039528199" FOLDED="true" ID="ID_1809817127" MODIFIED="1521626646281" TEXT="23. std::move&#x548c;std::forward">
<node CREATED="1470040048319" ID="ID_1211053475" MODIFIED="1470040060476" TEXT="std::move&#x9664;&#x4e86;&#x5c06;&#x5b83;&#x7684;&#x53c2;&#x6570;&#x8f6c;&#x6362;&#x6210;&#x53f3;&#x503c;&#x5916;&#x4ec0;&#x4e48;&#x90fd;&#x4e0d;&#x505a;&#xff0c;&#x5b83;&#x53ea;&#x4f5c;&#x8f6c;&#x6362;&#xff0c;&#x4e0d;&#x505a; move"/>
<node CREATED="1470040322839" ID="ID_74517116" MODIFIED="1470040323979" TEXT="&#x5982;&#x679c;&#x4f60;&#x60f3;&#x5bf9;&#x8fd9;&#x4e9b;&#x5bf9;&#x8c61;&#x6267;&#x884c;move&#x64cd;&#x4f5c;&#xff0c;&#x5c31;&#x4e0d;&#x8981;&#x628a;&#x5b83;&#x4eec;&#x58f0;&#x660e;&#x4e3a;const.&#x5bf9;const&#x5bf9;&#x8c61;&#x7684;move &#x8bf7;&#x6c42;&#x901a;&#x5e38;&#x4f1a;&#x6084;&#x6084;&#x7684;&#x6267;&#x884c;&#x5230;copy&#x64cd;&#x4f5c;&#x4e0a;"/>
<node CREATED="1470040671559" ID="ID_1787685981" MODIFIED="1470040673419" TEXT="std::move&#x548c;std::forward&#x90fd;&#x53ef;&#x4ee5;&#x5f52;&#x4e4b;&#x4e3a;cast.&#x552f;&#x4e00;&#x7684;&#x4e00;&#x70b9;&#x4e0d;&#x540c;&#x662f;&#xff0c;std::move&#x603b;&#x662f;&#x5728;&#x6267;&#x884c;casts&#xff0c;&#x800c;std::forward&#x662f;&#x5728;&#x67d0;&#x4e9b;&#x6761; &#x4ef6;&#x6ee1;&#x8db3;&#x65f6;&#x624d;&#x505a;&#x3002;&#x4f60;&#x53ef;&#x80fd;&#x89c9;&#x5f97;&#x6211;&#x4eec;&#x4e0d;&#x7528;std::move,&#x53ea;&#x4f7f;&#x7528;std::forward&#x4f1a;&#x4e0d;&#x4f1a;&#x597d;&#x4e00;&#x4e9b;&#x3002;"/>
<node CREATED="1470115362259" ID="ID_620390484" MODIFIED="1470115364562" TEXT="std::move&#x6267;&#x884c;&#x4e00;&#x4e2a;&#x65e0;&#x6761;&#x4ef6;&#x7684;&#x5bf9;rvalue&#x7684;&#x8f6c;&#x5316;&#x3002;&#x5bf9;&#x4e8e;&#x5b83;&#x81ea;&#x5df1;&#x672c;&#x8eab;&#x6765;&#x8bf4;&#xff0c;&#x5b83;&#x4e0d;&#x4f1a;move&#x4efb;&#x4f55;&#x4e1c;&#x897f;">
<font BOLD="true" NAME="&#x5fae;&#x8f6f;&#x96c5;&#x9ed1;" SIZE="12"/>
</node>
<node CREATED="1470115371105" ID="ID_1279564177" MODIFIED="1470115373913" TEXT="std::forward&#x5728;&#x53c2;&#x6570;&#x88ab;&#x7ed1;&#x5b9a;&#x4e3a;rvalue&#x7684;&#x60c5;&#x51b5;&#x4e0b;&#x624d;&#x4f1a;&#x5c06;&#x5b83;&#x8f6c;&#x5316;&#x4e3a;rvalue">
<font BOLD="true" NAME="&#x5fae;&#x8f6f;&#x96c5;&#x9ed1;" SIZE="12"/>
</node>
<node CREATED="1470115382729" ID="ID_518084390" MODIFIED="1470115384449" TEXT="std::move&#x548c;std::forward&#x5728;runtime&#x65f6;&#x5565;&#x90fd;&#x4e0d;&#x505a;">
<font BOLD="true" NAME="&#x5fae;&#x8f6f;&#x96c5;&#x9ed1;" SIZE="12"/>
</node>
</node>
<node CREATED="1470115517713" FOLDED="true" ID="ID_151019337" MODIFIED="1521626646281" TEXT="24. &#x533a;&#x5206;&#x901a;&#x7528;&#x5f15;&#x7528;&#x548c;&#x53f3;&#x503c;&#x5f15;&#x7528;">
<node CREATED="1470115537441" FOLDED="true" ID="ID_855482603" MODIFIED="1521626646139" TEXT="T&amp;&amp;&#x7684;&#x542b;&#x4e49;">
<node CREATED="1470115566642" FOLDED="true" ID="ID_553552629" MODIFIED="1521626645979" TEXT="&#x53f3;&#x503c;&#x5f15;&#x7528;">
<node CREATED="1470115590265" ID="ID_1081043720" MODIFIED="1470115591485" TEXT="&#x53ea;&#x548c;rvalue&#x505a; &#x7ed1;&#x5b9a;&#xff0c;&#x5b83;&#x4eec;&#x5b58;&#x5728;&#x7684;&#x610f;&#x4e49;&#x5c31;&#x662f;&#x8868;&#x793a;&#x51fa;&#x53ef;&#x4ee5;&#x4ece;&#x4e2d;move from&#x7684;&#x5bf9;&#x8c61;"/>
<node CREATED="1470115767561" ID="ID_792836334" MODIFIED="1470115873175">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      template&lt;typename T&gt;
    </p>
    <p>
      void f(T&amp;&amp; param); //param is a universal reference<br />auto&amp;&amp; var2 = var1; //var2 is a universal reference<br />Widget w;
    </p>
    <p>
      f(w); //lvalue passed to f;param's type is Widget&amp;(i.e., an lvalue reference)
    </p>
    <p>
      f(std::move(w)); //rvalue passed to f;param's type is Widget&amp;&amp;(i.e., an rvalue reference)
    </p>
  </body>
</html></richcontent>
</node>
<node CREATED="1470116026993" ID="ID_258829637" MODIFIED="1470116028574" TEXT="&#x5982;&#x679c;&#x4f60;&#x5728;&#x4e00;&#x4e2a;template&#x91cc;&#x9762;&#xff0c;&#x5e76;&#x4e14;&#x770b;&#x5230;&#x4e86;T&amp;&amp;&#x8fd9;&#x6837;&#x7684;&#x683c;&#x5f0f;&#xff0c;&#x4f60;&#x53ef;&#x80fd;&#x5c31;&#x4f1a;&#x5047;&#x8bbe;&#x5b83;&#x5c31;&#x662f;&#x4e00;&#x4e2a;universal reference.&#x4f46;&#x662f;&#x5e76;&#x975e;&#x5982; &#x6b64;&#xff0c;&#x56e0;&#x4e3a;&#x8fd8;&#x5dee;&#x4e00;&#x4e2a;&#x5fc5;&#x8981;&#x7684;&#x6761;&#x4ef6;&#xff1a;type deduction."/>
<node CREATED="1470116093304" ID="ID_1221276695" MODIFIED="1470116167656">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      template&lt;class T, class Allocator = allocator&lt;T&gt;&gt;
    </p>
    <p>
      class vector{
    </p>
    <p>
      public:
    </p>
    <p>
      &#160;&#160;&#160;&#160;void push_back(T&amp;&amp; x);&#160;&#160;// &#27809;&#26377;&#31867;&#22411;&#25512;&#23548;&#65292;&#21491;&#20540;&#24341;&#29992;
    </p>
    <p>
      &#160;&#160;&#160;&#160;template &lt;class... Args&gt;
    </p>
    <p>
      &#160;&#160;&#160;&#160;void emplace_back(Args&amp;&amp;... args); // &#36890;&#29992;&#24341;&#29992;
    </p>
    <p>
      }
    </p>
  </body>
</html></richcontent>
</node>
</node>
<node CREATED="1470115607721" FOLDED="true" ID="ID_510456224" MODIFIED="1521626645979" TEXT="&#x65e2;&#x53f3;&#x503c;&#x5f15;&#x7528;&#xff0c;&#x53c8;&#x5de6;&#x503c;&#x5f15;&#x7528;">
<node CREATED="1470115638361" ID="ID_995385077" MODIFIED="1470115662998" TEXT="&#x65e2;&#x53ef;&#x4ee5;&#x7ed1;&#x5b9a;&#x5728;rvalues(like rvalue references)&#x4e5f;&#x53ef;&#x4ee5;&#x7ed1;&#x5b9a;&#x5728;lvalues(like lvalue references)&#x4e0a;&#x3002;&#x8fdb;&#x4e00;&#x6b65;&#x6765;&#x8bf4;&#xff0c;&#x5b83;&#x4eec; &#x53ef;&#x4ee5;&#x7ed1;&#x5b9a;&#x5230;const&#x6216;&#x8005;non-const,volatile&#x6216;&#x8005;non-volatile&#xff0c;&#x751a;&#x81f3;&#x662f;const + volatile&#x5bf9;&#x8c61;&#x4e0a;&#x9762;&#x3002;&#x5b83;&#x4eec;&#x51e0;&#x4e4e;&#x53ef;&#x4ee5;&#x7ed1;&#x5b9a;&#x5230;&#x4efb;&#x4f55; &#x4e1c;&#x897f;&#x4e0a;&#x9762;&#x3002;&#x4e3a;&#x4e86;&#x5bf9;&#x5f97;&#x8d77;&#x5b83;&#x7684;&#x5168;&#x80fd;&#xff0c;&#x6211;&#x51b3;&#x5b9a;&#x7ed9;&#x5b83;&#x4eec;&#x8d77;&#x4e2a;&#x540d;&#x5b57;&#xff1a;universal reference"/>
<node CREATED="1470115695449" ID="ID_12054779" MODIFIED="1470115696165" TEXT="C++&#x59d4;&#x5458;&#x4f1a;&#x7684;&#x4e00;&#x4e9b;&#x4eba;&#x5f00;&#x59cb;&#x5c06;universal references&#x79f0;&#x4e4b;&#x4e3a; forward references"/>
<node CREATED="1470115795073" ID="ID_896599355" MODIFIED="1470115801039">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      void f(Widget&amp;&amp; param); //no type deduction
    </p>
    <p>
      //param is an rvalue reference
    </p>
    <p>
      Widget&amp;&amp; var1 = Widget(); //no type deduction
    </p>
    <p>
      //var1 is an rvalue reference
    </p>
  </body>
</html></richcontent>
</node>
</node>
</node>
<node CREATED="1470116394818" ID="ID_83456614" MODIFIED="1470116396578" TEXT="&#x5982;&#x679c;&#x4e00;&#x4e2a;&#x51fd;&#x6570;&#x7684;template parameter&#x6709;&#x7740;T&amp;&amp;&#x7684;&#x683c;&#x5f0f;&#xff0c;&#x4e14;&#x6709;&#x4e00;&#x4e2a;deduce type T.&#x6216;&#x8005;&#x4e00;&#x4e2a;&#x5bf9;&#x8c61;&#x88ab;&#x751f;&#x547d;&#x4e3a;auto&amp;&amp;,&#x90a3;&#x4e48; &#x8fd9;&#x4e2a;parameter&#x6216;&#x8005;object&#x5c31;&#x662f;&#x4e00;&#x4e2a;universal reference.">
<font BOLD="true" NAME="&#x5fae;&#x8f6f;&#x96c5;&#x9ed1;" SIZE="12"/>
</node>
<node CREATED="1470116420785" ID="ID_244230694" MODIFIED="1470116422642" TEXT="&#x5982;&#x679c;type&#x7684;&#x58f0;&#x660e;&#x7684;&#x683c;&#x5f0f;&#x4e0d;&#x5b8c;&#x5168;&#x662f;type&amp;&amp;,&#x6216;&#x8005;type deduction&#x6ca1;&#x6709;&#x53d1;&#x751f;&#xff0c;&#x90a3;&#x4e48;type&amp;&amp;&#x8868;&#x793a;&#x7684;&#x662f;&#x4e00;&#x4e2a;rvalue reference.">
<font BOLD="true" NAME="&#x5fae;&#x8f6f;&#x96c5;&#x9ed1;" SIZE="12"/>
</node>
<node CREATED="1470116430177" ID="ID_916415579" MODIFIED="1470116431401" TEXT="universal reference&#x5982;&#x679c;&#x88ab;rvalue&#x521d;&#x59cb;&#x5316;&#xff0c;&#x5b83;&#x5c31;&#x662f;rvalue reference.&#x5982;&#x679c;&#x88ab;lvalue&#x521d;&#x59cb;&#x5316;&#xff0c;&#x4ed6;&#x5c31;&#x662f;lvaue reference">
<font BOLD="true" NAME="&#x5fae;&#x8f6f;&#x96c5;&#x9ed1;" SIZE="12"/>
</node>
</node>
<node CREATED="1470116452449" ID="ID_1024989729" MODIFIED="1470118049094" TEXT="25. &#x5728;&#x53f3;&#x503c;&#x5f15;&#x7528;&#x4e0a;&#x4f7f;&#x7528;std::move&#xff0c;&#x5728;&#x901a;&#x7528;&#x5f15;&#x7528;&#x4e0a;&#x4f7f;&#x7528;std::forward"/>
<node CREATED="1470116496018" ID="ID_500158008" MODIFIED="1470118049094" TEXT="26. &#x907f;&#x514d;&#x5728;&#x901a;&#x7528;&#x5f15;&#x7528;&#x4e0a;&#x91cd;&#x5b9a;&#x4e49;&#x51fd;&#x6570;"/>
<node CREATED="1470116549954" ID="ID_23936143" MODIFIED="1470116586014" TEXT="27. &#x719f;&#x6089;&#x901a;&#x7528;&#x5f15;&#x7528;&#x4e0a;&#x91cd;&#x65b0;&#x5b9a;&#x4e49;&#x51fd;&#x6570;&#x7684;&#x5176;&#x4ed6;&#x9009;&#x62e9;"/>
<node CREATED="1470116593858" ID="ID_1537955431" MODIFIED="1470116602782" TEXT="28. &#x7406;&#x89e3;&#x5f15;&#x7528;&#x6298;&#x53e0;"/>
<node CREATED="1470116612449" ID="ID_1416626841" MODIFIED="1470116642414" TEXT="29. &#x5982;&#x679c;std::move&#x4e0d;&#x5b58;&#x5728;&#xff0c;&#x4e0d;&#x5ec9;&#x4ef7;&#xff0c;&#x4e0d;&#x4f7f;&#x7528;"/>
<node CREATED="1470116647929" ID="ID_698809474" MODIFIED="1470116663758" TEXT="30. &#x719f;&#x6089;&#x5b8c;&#x7f8e;&#x8f6c;&#x53d1;&#x548c;&#x5931;&#x8d25;&#x7684;&#x60c5;&#x51b5;"/>
</node>
<node CREATED="1470116712474" FOLDED="true" ID="ID_274247641" MODIFIED="1521626646436" POSITION="right" TEXT="lambda&#x8868;&#x8fbe;&#x5f0f;">
<node CREATED="1470116756249" ID="ID_1207562748" MODIFIED="1470116770430" TEXT="31. &#x907f;&#x514d;&#x9ed8;&#x8ba4;&#x7684;&#x53c2;&#x6570;&#x6355;&#x6349;"/>
<node CREATED="1470116777521" ID="ID_590873205" MODIFIED="1470116814518" TEXT="32.  &#x4f7f;&#x7528;init&#x6355;&#x6349;&#x79fb;&#x52a8;&#x5bf9;&#x8c61;&#x5230;&#x95ed;&#x5305;"/>
<node CREATED="1470116816049" ID="ID_900282576" MODIFIED="1470116879638" TEXT="33. &#x5728;auto&amp;&amp;&#x53c2;&#x6570;&#x4e0a;&#x4f7f;&#x7528;decltype&#xff0c;&#x5f53;std::forward auto&amp;&amp;&#x53c2;&#x6570;"/>
<node CREATED="1470116900257" ID="ID_1035986258" MODIFIED="1470116910334" TEXT="34. &#x4f18;&#x5148;&#x4f7f;&#x7528;lambda&#x800c;&#x4e0d;&#x662f;std::bind"/>
</node>
<node CREATED="1470116925673" ID="ID_1811475511" MODIFIED="1522128825905" POSITION="right" TEXT="&#x5e76;&#x53d1;API">
<node CREATED="1470116918369" ID="ID_1872728976" MODIFIED="1470116932099" TEXT="35. &#x4f18;&#x5148;&#x4f7f;&#x7528;task-based&#x800c;&#x4e0d;&#x662f;thread-based"/>
<node CREATED="1470116942594" ID="ID_1193665385" MODIFIED="1470116945102" TEXT="36. &#x5f53;&#x5f02;&#x6b65;&#x662f;&#x5fc5;&#x8981;&#x7684;&#x65f6;&#x58f0;&#x660e;std::launch::async"/>
<node CREATED="1470116954441" ID="ID_732282642" MODIFIED="1470116960518" TEXT="37. &#x4f7f;&#x5f97;std::thread&#x5728;&#x6240;&#x6709;&#x7684;&#x8def;&#x5f84;&#x4e0b;&#x65e0;&#x6cd5;join"/>
<node CREATED="1470116973610" ID="ID_244444414" MODIFIED="1470116975654" TEXT="38. &#x6ce8;&#x610f;&#x7ebf;&#x7a0b;&#x53e5;&#x67c4;&#x6790;&#x6784;&#x7684;&#x884c;&#x4e3a;"/>
<node CREATED="1470116976889" ID="ID_1987416724" MODIFIED="1470116987578" TEXT="39. &#x8003;&#x8651;&#x5728;&#x4e00;&#x6b21;&#x6027;&#x4e8b;&#x4ef6;&#x901a;&#x4fe1;&#x4e0a;void&#x7684;&#x7279;&#x6027;"/>
<node CREATED="1470116994626" ID="ID_1728937422" MODIFIED="1470116997533" TEXT="40. &#x5728;&#x5e76;&#x53d1;&#x65f6;&#x4f7f;&#x7528;std::atomic &#x5728;&#x7279;&#x6b8a;&#x5185;&#x5b58;&#x4e0a;&#x4f7f;&#x7528; volatile"/>
</node>
</node>
</map>
