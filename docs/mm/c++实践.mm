<map version="1.0.1">
<!-- To view this file, download free mind mapping software FreeMind from http://freemind.sourceforge.net -->
<node CREATED="1522137092518" ID="ID_325030372" MODIFIED="1523448439400" TEXT="c++">
<font NAME="&#x5fae;&#x8f6f;&#x96c5;&#x9ed1;" SIZE="12"/>
<node CREATED="1522150384605" FOLDED="true" ID="ID_1847716029" MODIFIED="1523956848645" POSITION="right" TEXT="c++&#x5b9e;&#x8df5;">
<node CREATED="1522150576364" ID="ID_1593196844" MODIFIED="1522150588221" TEXT="abi&#x517c;&#x5bb9;">
<node CREATED="1522150591093" ID="ID_1374129" MODIFIED="1522150603071" TEXT="&#x9759;&#x6001;&#x94fe;&#x63a5;"/>
<node CREATED="1522150603620" ID="ID_1479563435" MODIFIED="1522150612845" TEXT="&#x52a8;&#x6001;&#x5e93;&#x7248;&#x672c;&#x7ba1;&#x7406;"/>
<node CREATED="1522150614197" ID="ID_1429468931" MODIFIED="1522150629006" TEXT="pimpl&#xff0c;&#x7f16;&#x8bd1;&#x5668;&#x9632;&#x706b;&#x5899;">
<node CREATED="1522150642823" ID="ID_1805202426" MODIFIED="1522150647328" TEXT="&#x5728;&#x5934;&#x6587;&#x4ef6;&#x4e2d;&#x53ea;&#x66b4;&#x9732; non-virtual &#x63a5;&#x53e3;&#xff0c;&#x5e76;&#x4e14; class &#x7684;&#x5927;&#x5c0f;&#x56fa;&#x5b9a;&#x4e3a; sizeof(Impl*)&#xff0c;&#xa;&#x8fd9;&#x6837;&#x53ef;&#x4ee5;&#x968f;&#x610f;&#x66f4;&#x65b0;&#x5e93;&#x6587;&#x4ef6;&#x800c;&#x4e0d;&#x5f71;&#x54cd;&#x53ef;&#x6267;&#x884c;&#x6587;&#x4ef6;&#x3002;"/>
</node>
</node>
<node CREATED="1522150693868" ID="ID_1979991884" MODIFIED="1522150706313" TEXT="&#x907f;&#x514d;&#x865a;&#x51fd;&#x6570;&#x4f5c;&#x4e3a;&#x5e93;&#x7684;&#x63a5;&#x53e3;"/>
<node CREATED="1522137127268" ID="ID_1477103563" MODIFIED="1522141198088" TEXT="&#x52a8;&#x6001;&#x5e93;&#x63a5;&#x53e3;&#x7684;&#x63a8;&#x8350;&#x505a;&#x6cd5;">
<font NAME="&#x5fae;&#x8f6f;&#x96c5;&#x9ed1;" SIZE="12"/>
<node CREATED="1522137143890" ID="ID_269820847" MODIFIED="1522158847067" TEXT="&#x63a8;&#x8350; pimpl &#x6280;&#x6cd5;">
<font NAME="&#x5fae;&#x8f6f;&#x96c5;&#x9ed1;" SIZE="12"/>
<node CREATED="1522137260678" ID="ID_124475600" MODIFIED="1522141198084" TEXT="1. &#x66b4;&#x9732;&#x7684;&#x63a5;&#x53e3;&#x91cc;&#x8fb9;&#x4e0d;&#x8981;&#x6709;&#x865a;&#x51fd;&#x6570;&#xff0c;&#x800c;&#x4e14; sizeof(Graphics) == sizeof(Graphics::Impl*)">
<font NAME="&#x5fae;&#x8f6f;&#x96c5;&#x9ed1;" SIZE="12"/>
</node>
<node CREATED="1522137305748" ID="ID_1369773611" MODIFIED="1522141198078" TEXT="2. &#x5728;&#x5e93;&#x7684;&#x5b9e;&#x73b0;&#x4e2d;&#x628a;&#x8c03;&#x7528;&#x8f6c;&#x53d1; (forward) &#x7ed9;&#x5b9e;&#x73b0; Graphics::Impl &#xff0c;&#x8fd9;&#x90e8;&#x5206;&#x4ee3;&#x7801;&#x4f4d;&#x4e8e; .so/.dll &#x4e2d;&#xff0c;&#x968f;&#x5e93;&#x7684;&#x5347;&#x7ea7;&#x4e00;&#x8d77;&#x53d8;&#x5316;">
<font NAME="&#x5fae;&#x8f6f;&#x96c5;&#x9ed1;" SIZE="12"/>
</node>
<node CREATED="1522137338347" ID="ID_1068083778" MODIFIED="1522141198072" TEXT="3. &#x5982;&#x679c;&#x8981;&#x52a0;&#x5165;&#x65b0;&#x7684;&#x529f;&#x80fd;&#xff0c;&#x4e0d;&#x5fc5;&#x901a;&#x8fc7;&#x7ee7;&#x627f;&#x6765;&#x6269;&#x5c55;&#xff0c;&#x53ef;&#x4ee5;&#x539f;&#x5730;&#x4fee;&#x6539;&#xff0c;&#x4e14;&#x5f88;&#x5bb9;&#x6613;&#x4fdd;&#x6301; &#x4e8c;&#x8fdb;&#x5236;&#x517c;&#x5bb9;&#x6027;&#x3002;">
<font NAME="&#x5fae;&#x8f6f;&#x96c5;&#x9ed1;" SIZE="12"/>
</node>
</node>
<node CREATED="1522137405682" ID="ID_1805707861" MODIFIED="1522141690161" TEXT="free function(non-member non-friend function)">
<font NAME="&#x5fae;&#x8f6f;&#x96c5;&#x9ed1;" SIZE="12"/>
<node CREATED="1522137376218" ID="ID_1101463286" MODIFIED="1522141198058" TEXT=" virtual function &#x662f; bind- by-vtable-offset&#xff0c;&#x800c; non-virtual function &#x662f; bind-by-name&#x3002;&#x52a0;&#x8f7d;&#x5668; (loader) &#x4f1a;&#x5728;&#x7a0b; &#x5e8f;&#x542f;&#x52a8;&#x65f6;&#x505a;&#x51b3;&#x8bae; (resolution)&#xff0c;&#x901a;&#x8fc7; mangled name &#x628a;&#x53ef;&#x6267;&#x884c;&#x6587;&#x4ef6;&#x548c;&#x52a8;&#x6001;&#x5e93;&#x94fe;&#x63a5;&#x5230;&#x4e00; &#x8d77;&#x3002;&#x5c31;&#x50cf;&#x4f7f;&#x7528; Internet &#x57df;&#x540d;&#x6bd4;&#x4f7f;&#x7528; IP &#x5730;&#x5740;&#x66f4;&#x80fd;&#x9002;&#x5e94;&#x53d8;&#x5316;&#x4e00;&#x6837;">
<font NAME="&#x5fae;&#x8f6f;&#x96c5;&#x9ed1;" SIZE="12"/>
</node>
</node>
</node>
<node CREATED="1522151006485" ID="ID_382321601" MODIFIED="1522151313598" TEXT="mock&#x548c;&#x5355;&#x5143;&#x6d4b;&#x8bd5;">
<node CREATED="1522151042268" ID="ID_1212584068" MODIFIED="1522151051767" TEXT="&#x7cfb;&#x7edf;&#x51fd;&#x6570;&#x4f9d;&#x8d56;&#x6ce8;&#x5165;">
<node CREATED="1522151052831" ID="ID_396889269" MODIFIED="1522151070483" TEXT="&#x9762;&#x5411;&#x5bf9;&#x8c61;&#x7684;&#x624b;&#x6cd5;&#xff0c;&#x501f;&#x52a9;&#x8fd0;&#x884c;&#x671f;&#x7684;&#x8fdf;&#x7ed1;&#x5b9a;&#x5b9e;&#x73b0;&#x6ce8;&#x5165;&#x4e0e;&#x66ff;&#x6362;"/>
<node CREATED="1522151131213" ID="ID_967321126" MODIFIED="1522151230054" TEXT="&#x91c7;&#x7528;&#x7f16;&#x8bd1;&#x671f;&#x6216;&#x94fe;&#x63a5;&#x671f;&#x7684;&#x8fdf;&#x7ed1;&#x5b9a;">
<node CREATED="1522151230054" ID="ID_1861917209" MODIFIED="1522151233376" TEXT="&#x8f6c;&#x53d1;">
<node CREATED="1522151281710" ID="ID_54978489" MODIFIED="1522151289734" TEXT="int sockets::connect(int sockfd, const struct sockaddr_in&amp; addr)&#xa;{&#xa;   return ::connect(sockfd, sockaddr_cast(&amp;addr), sizeof addr);&#xa;}"/>
<node CREATED="1522151157925" ID="ID_454775549" MODIFIED="1522151159069" TEXT="&#x58f0;&#x660e; read() &#x548c; write() &#x7b49;&#x666e; &#x901a;&#x51fd;&#x6570;&#xff0c;&#x7136;&#x540e;&#x5728;.cc &#x6587;&#x4ef6;&#x91cc;&#x8f6c;&#x53d1;&#x7ed9;&#x5bf9;&#x5e94;&#x7cfb;&#x7edf;&#x7684;&#x7cfb;&#x7edf;&#x51fd;&#x6570;::read() &#x548c;::write() &#x7b49;"/>
</node>
<node CREATED="1522151011518" ID="ID_1621782209" MODIFIED="1522151025186" TEXT="&#x94fe;&#x63a5;&#x671f;&#x57ab;&#x7247; link seam">
<node CREATED="1522151261397" ID="ID_1977267899" MODIFIED="1522151272122" TEXT="connect_func_t connect_func = dlsym(RTDL_NEXT, &#x201d;connect&#x201d;);"/>
<node CREATED="1522151026653" ID="ID_1874886733" MODIFIED="1522151028873" TEXT="&#x5728;&#x5355;&#x5143;&#x6d4b;&#x8bd5;&#x7a0b;&#x5e8f;&#x91cc;&#x5b9e;&#x73b0;&#x4e00;&#x4e2a;&#x81ea;&#x5df1;&#x7684; connect() &#x51fd;&#x6570;&#xff0c;&#x5b83;&#x906e;&#x76d6;&#x4e86;&#x540c;&#x540d;&#x7684;&#x7cfb;&#x7edf;&#x51fd;&#x6570;&#x3002;&#x5728;&#x94fe;&#x63a5;&#x7684;&#x65f6;&#x5019;&#xff0c;linker &#x4f1a;&#x4f18;&#x5148;&#x91c7;&#x7528;&#x6211; &#x4eec;&#x81ea;&#x5df1;&#x5b9a;&#x4e49;&#x7684;&#x51fd;&#x6570;&#x3002;&#xff08;&#x8fd9;&#x5bf9;&#x52a8;&#x6001;&#x94fe;&#x63a5;&#x662f;&#x6210;&#x7acb;&#x7684;&#xff0c;&#x5982;&#x679c;&#x662f;&#x9759;&#x6001;&#x94fe;&#x63a5;&#xff0c;&#x4f1a;&#x62a5; multiple definition &#x9519;&#x8bef;&#x3002;&#x597d;&#x5728;&#x7edd;&#x5927;&#x591a;&#x6570;&#x60c5;&#x51b5;&#x4e0b; libc &#x662f;&#x52a8;&#x6001;&#x94fe;&#x63a5;&#x7684;&#x3002;&#xff09;"/>
</node>
</node>
<node CREATED="1522151332542" ID="ID_643552691" MODIFIED="1522151333527" TEXT=" ld &#x7684; &#x2013;wrap"/>
</node>
</node>
<node CREATED="1522151600854" ID="ID_1976520151" MODIFIED="1522151603409" TEXT="&#x7b97;&#x6cd5;">
<node CREATED="1522151604206" ID="ID_747315723" MODIFIED="1522151607501" TEXT="&#x5168;&#x6392;&#x5217;">
<node CREATED="1522151608358" ID="ID_974705464" MODIFIED="1522152203085" TEXT="next_permutation/prev_permutation"/>
</node>
<node CREATED="1522151669895" ID="ID_361202467" MODIFIED="1522151670630" TEXT="&#x591a;&#x8def;&#x5f52;&#x5e76;">
<node CREATED="1522151684288" ID="ID_1064123137" MODIFIED="1522152195956" TEXT="make_heap/push_heap/pop_heap"/>
</node>
<node CREATED="1522151698447" ID="ID_1406069173" MODIFIED="1522152237335" TEXT="&#x53bb;&#x8fde;&#x7eed;&#x7a7a;&#x767d;">
<node CREATED="1522151701470" ID="ID_1217162766" MODIFIED="1522152205398" TEXT="unique"/>
</node>
<node CREATED="1522151739974" ID="ID_1270830984" MODIFIED="1522151743150" TEXT="&#x5206;&#x5757;">
<node CREATED="1522151743983" ID="ID_1381554965" MODIFIED="1522152207586" TEXT="partition"/>
</node>
<node CREATED="1522152122343" ID="ID_333680893" MODIFIED="1522152143486" TEXT="&#x8303;&#x56f4;&#x641c;&#x7d22;">
<node CREATED="1522152144303" ID="ID_1339846609" MODIFIED="1522152212466" TEXT="lower_bound/upper_bound"/>
</node>
</node>
</node>
<node CREATED="1523936668940" FOLDED="true" ID="ID_334295972" MODIFIED="1523956849973" POSITION="right" TEXT="STL&#x7684;&#x7f3a;&#x70b9;">
<node CREATED="1523936732450" ID="ID_387448829" MODIFIED="1523950487681" TEXT="&#x4f5c;&#x8005;&#xff1a;&#x59da;&#x51ac;&#xa;&#x94fe;&#x63a5;&#xff1a;https://www.zhihu.com/question/20201972/answer/41324520&#xa;1. &#x4ee3;&#x7801;&#x81a8;&#x80c0;&#x95ee;&#x9898;&#xa;&#x6bcf;&#x4e00;&#x4e2a;&#x5b9e;&#x4f8b;&#x5316;&#x8fc7;&#x7684;&#x6a21;&#x677f;&#x7c7b;&#xff0c;&#x90fd;&#x4f1a;&#x81a8;&#x80c0;&#x51fa;&#x4e00;&#x4efd;&#x72ec;&#x7acb;&#x7684;&#x4ee3;&#x7801;&#xff0c;&#x6bd4;&#x5982;std::vector&lt;std::string&gt;, std::vector&lt;int&gt;&#xff0c;&#x7f16;&#x8bd1;&#x540e;&#x4f1a;&#x4ea7;&#x751f;&#x4e24;&#x4efd;&#x4ee3;&#x7801;&#xff0c;&#x5728;VC2008&#x4e0b;&#xff0c;&#x6bcf;&#x4efd;&#x4ee3;&#x7801;&#x5927;&#x7ea6;&#x662f;3-4kb&#xff0c;&#x8fd9;&#x662f;&#x56e0;&#x4e3a;vector&#x6bd4;&#x8f83;&#x7b80;&#x5355;&#x4ee3;&#x7801;&#x5c11;&#xff0c;&#x5982;&#x679c;&#x662f;map&#x5219;&#x4f1a;&#x4ea7;&#x751f;30-50kb&#x7684;&#x4ee3;&#x7801;&#xff0c;&#x56e0;&#x4e3a;map&#x91cc;&#x6709;&#x4e2a;&#x590d;&#x6742;&#x7684;&#x7ea2;&#x9ed1;&#x6811;&#x3002;&#x5bf9;&#x4e8e;&#x6570;&#x636e;&#x5904;&#x7406;&#x7c7b;&#x7684;&#x4ee3;&#x7801;&#x91cc;&#x4e00;&#x822c;&#x4f1a;&#x5b9a;&#x4e49;&#x5f88;&#x591a;&#x79cd;&#x4e0d;&#x540c;&#x7684;&#x7ed3;&#x6784;&#x4f53;&#xff0c;&#x4e0d;&#x540c;&#x7684;&#x7ed3;&#x6784;&#x4f53;&#x653e;&#x5230;&#x4e0d;&#x540c;&#x7684;&#x5bb9;&#x5668;&#x91cc;&#xff0c;&#x5c31;&#x4f1a;&#x5b9e;&#x4f8b;&#x5316;&#x51fa;&#x5f88;&#x591a;&#x4e2a;&#x7c7b;&#x7684;&#x4ee3;&#x7801;&#xff0c;&#x6211;&#x89c1;&#x8fc7;&#x4e00;&#x4e2a;&#x9879;&#x76ee;&#x91cc;&#xff0c;&#x8fd9;&#x6837;&#x7684;vector&#x5c31;&#x6709;&#x6570;&#x767e;&#x4e2a;&#x3002;&#xa;2. &#x5185;&#x5b58;&#x4f7f;&#x7528;&#x6548;&#x7387;&#x95ee;&#x9898;&#xa; &#xff08;&#x4ee5;vc++2008&#x4e3a;&#x4f8b;&#xff09;stl&#x5728;&#x5185;&#x5b58;&#x4f7f;&#x7528;&#x6548;&#x7387;&#x4e0a;&#x662f;&#x6bd4;&#x8f83;&#x4f4e;&#x6548;&#x7684;&#xff0c;&#x6bd4;&#x5982;std::string&#xff0c;&#x5b83;&#x7684;sizeof&#x5927;&#x6982;&#x662f;28&#xff0c;&#x56e0;&#x4e3a;&#x5b83;&#x6709;&#x4e00;&#x4e2a;&#x5185;&#x7f6e;&#x7684;16&#x5b57;&#x8282;&#x6570;&#x7ec4;&#xff0c;&#x7528;&#x6765;&#x505a;&#x5c0f;&#x5b57;&#x7b26;&#x4e32;&#x4f18;&#x5316;&#x7684;&#xff0c;&#x5c31;&#x662f;&#x8bf4;&#x4f4e;&#x4e8e;16&#x5b57;&#x8282;&#x7684;&#x5b57;&#x7b26;&#x4e32;&#x90fd;&#x4f1a;&#x81f3;&#x5c11;&#x5360;&#x7528;28&#x5b57;&#x8282;&#x5185;&#x5b58;&#xff0c;&#x5982;&#x679c;&#x521a;&#x597d;17&#x5b57;&#x8282;&#x5b57;&#x7b26;&#x4e32;&#xff0c;&#x5219;&#x4f1a;&#x5360;&#x7528;28&#x5b57;&#x8282;+&#x989d;&#x5916;&#x5206;&#x914d;&#x7684;&#x5b57;&#x7b26;&#x4e32;&#x5185;&#x5b58;&#xff0c;&#x989d;&#x5916;&#x5206;&#x914d;&#x7684;&#x5185;&#x5b58;&#x662f;&#x4e00;&#x4e2a;&#x5806;&#x5757;&#xff0c;&#x53c8;&#x6709;&#x5f88;&#x591a;&#x6d6a;&#x8d39;&#xff0c;&#x76f8;&#x6bd4;&#x7528;&#x4e00;&#x4e2a;char *&#x5b58;&#x50a8;&#x5b57;&#x7b26;&#x4e32;&#x5927;&#x7ea6;&#x591a;&#x5360;&#x7528;&#x4e86;&#x4e00;&#x500d;&#x5185;&#x5b58;&#x3002;&#x8fd8;&#x6709;map&lt;&gt;&#xff0c;&#x6bcf;&#x4e00;&#x4e2a;map&#x7684;node&#x90fd;&#x662f;&#x4e00;&#x5757;&#x72ec;&#x7acb;&#x5206;&#x914d;&#x7684;&#x5185;&#x5b58;&#xff0c;&#x5982;&#x679c;&#x662f; map&lt;int, int&gt;&#x5462;&#xff0c;&#x90a3;&#x5c31;&#x5f88;&#x60b2;&#x5267;&#x4e86;&#xff0c;&#x4e3a;&#x4e86;&#x5b58;&#x4e00;&#x4e2a;int&#x8981;&#x6d88;&#x8017;&#x51e0;&#x5341;&#x4e2a;&#x5b57;&#x8282;&#xff0c;&#x5f88;&#x6d6a;&#x8d39;&#x7684;&#x3002;&#x5982;&#x679c;&#x5143;&#x7d20;&#x6570;&#x91cf;&#x6709;&#x767e;&#x4e07;&#x7ea7;&#xff0c;&#x90a3;&#x4e48;&#x5185;&#x5b58;&#x5360;&#x7528;&#x5c31;&#x5f88;&#x53ef;&#x89c2;&#x4e86;&#xff0c;&#x8fd9;&#x79cd;&#x60c5;&#x51b5;&#x4e0b;&#x5efa;&#x8bae;&#x81ea;&#x5df1;&#x5b9e;&#x73b0;allocator&#xff0c;&#x505a;&#x5185;&#x5b58;&#x6c60;&#x3002;&#xa;3. deep copy&#x95ee;&#x9898;&#xa;&#x8ba9;&#x4e24;&#x4e2a;&#x5bb9;&#x5668;&#x7684;&#x5b9e;&#x4f8b;&#x505a;&#x8d4b;&#x503c;&#x64cd;&#x4f5c;&#xff0c;&#x770b;&#x8d77;&#x6765;&#x5c31;&#x4e00;&#x6761;&#x8bed;&#x53e5;&#xff0c;&#x5b9e;&#x9645;&#x4e0a;&#x5bb9;&#x5668;&#x91cc;&#x7684;&#x6bcf;&#x4e2a;&#x5143;&#x7d20;&#x90fd;&#x6267;&#x884c;&#x4e86;&#x4e00;&#x6b21;&#x8d4b;&#x503c;&#x64cd;&#x4f5c;&#x3002;&#x5982;&#x679c;&#x5bb9;&#x5668;&#x91cc;&#x6709;&#x767e;&#x4e07;&#x7ea7;&#x7684;&#x6570;&#x636e;&#xff0c;&#x90a3;&#x4e48;&#x4e00;&#x4e2a;&#x7b49;&#x53f7;&#x5c31;&#x4ea7;&#x751f;&#x4e86;&#x51e0;&#x767e;&#x4e07;&#x6b21;&#x7684;&#x6784;&#x9020;&#x548c;&#x6790;&#x6784;&#x3002;&#x4f20;&#x9012;&#x53c2;&#x6570;&#x7684;&#x65f6;&#x5019;&#x4e00;&#x5b9a;&#x8981;&#x7528; const &#x5f15;&#x7528;&#xff0c;&#x8d4b;&#x503c;&#x53ef;&#x4ee5;&#x7528; swap&#x4ee3;&#x66ff;&#x3002;&#xa;4. &#x9690;&#x5f0f;&#x7c7b;&#x578b;&#x8f6c;&#x6362;&#xa;&#x6bd4;&#x5982; &#x6709;&#x4e2a;&#x51fd;&#x6570;void doSomething(const std::string &amp;str);&#x8c03;&#x7528;&#x7684;&#x65f6;&#x5019;   doSomething(&quot;hello&quot;);&#x80fd;&#x7f16;&#x8bd1;&#x6267;&#x884c;&#xff0c;&#x4f46;&#x662f;&#x4f1a;&#x4ea7;&#x751f;&#x4e00;&#x4e2a;&#x4e34;&#x65f6;&#x7684;&#x533f;&#x540d;&#x7684;std::string&#x5b9e;&#x4f8b;&#xff0c;&#x628a;&quot;hello&quot;&#x590d;&#x5236;&#x4e00;&#x904d;&#xff0c;&#x7136;&#x540e;&#x5728;&#x8c03;&#x7528;&#x5b8c;&#x6210;&#x540e;&#x6790;&#x6784;&#x6389;&#x3002;&#x5982;&#x679c;&#x8fd9;&#x4e2a;&#x53d1;&#x751f;&#x5728;&#x5faa;&#x73af;&#x4f53;&#x5185;&#x90e8;&#x6709;&#x53ef;&#x80fd;&#x5f71;&#x54cd;&#x6027;&#x80fd;&#x3002;&#xa;&#x4ee5;&#x4e0a;&#x8fd9;&#x4e9b;&#x95ee;&#x9898;&#xff0c;&#x5728;&#x5c0f;&#x7a0b;&#x5e8f;&#x91cc;&#x6216;&#x8005;&#x6570;&#x636e;&#x89c4;&#x6a21;&#x4e0d;&#x5927;&#x7684;&#x65f6;&#x5019;&#xff0c;&#x6bd4;&#x5982;&#x5bb9;&#x5668;&#x5185;&#x5143;&#x7d20;&#x53ea;&#x6709;&#x51e0;&#x5343;&#x8fd9;&#x4e2a;&#x89c4;&#x6a21;&#xff0c;&#x90fd;&#x4e0d;&#x662f;&#x4ec0;&#x4e48;&#x5927;&#x95ee;&#x9898;&#xff0c;&#x90a3;&#x65f6;&#x5f00;&#x53d1;&#x6548;&#x7387;&#x624d;&#x662f;&#x91cd;&#x70b9;&#xff0c;&#x4f46;&#x662f;&#x4e00;&#x65e6;&#x6709;&#x5927;&#x6570;&#x636e;stl&#x5bb9;&#x5668;&#x4f1a;&#x6210;&#x4e3a;&#x6027;&#x80fd;&#x74f6;&#x9888;&#x7684;&#x3002;&#xa;&#x6211;&#x5e76;&#x4e0d;&#x662f;&#x4e3b;&#x5f20;&#x4e0d;&#x7528;STL&#xff0c;&#x800c;&#x662f;&#x8981;&#x5145;&#x5206;&#x4e86;&#x89e3;STL&#x7684;&#x4f18;&#x7f3a;&#x70b9;&#xff0c;&#x6839;&#x636e;&#x5e94;&#x7528;&#x573a;&#x666f;&#x505a;&#x9009;&#x62e9;&#x3002;"/>
</node>
<node CREATED="1522158142131" FOLDED="true" ID="ID_1136023688" MODIFIED="1523956851076" POSITION="right" TEXT="best practice">
<font BOLD="true" NAME="&#x5fae;&#x8f6f;&#x96c5;&#x9ed1;" SIZE="12"/>
<node CREATED="1522158149075" FOLDED="true" ID="ID_154378821" MODIFIED="1523936666354" TEXT="copy-and-swap idiom">
<font BOLD="true" NAME="&#x5fae;&#x8f6f;&#x96c5;&#x9ed1;" SIZE="12"/>
<node CREATED="1522158169963" ID="ID_1826220099" MODIFIED="1522158175160" TEXT="struct X&#xa;{&#xa;    X();&#xa;    X(X const&amp;);&#xa;    void swap(X&amp;) noexcept;&#xa;&#xa;    X(X&amp;&amp; b)&#xa;        : X() // delegate to the default constructor&#xa;    {&#xa;        b.swap(*this);&#xa;    }&#xa;&#xa;    // Note that this operator implements both copy and move assignments.&#xa;    // It accepts its argument by value, which invokes the appropriate (copy or move) constructor.&#xa;    X&amp; operator=(X b) {&#xa;        b.swap(*this);&#xa;        return *this;&#xa;    }&#xa;};"/>
</node>
<node CREATED="1522158323132" FOLDED="true" ID="ID_1955749180" MODIFIED="1522200641827" TEXT="singleton">
<font BOLD="true" NAME="&#x5fae;&#x8f6f;&#x96c5;&#x9ed1;" SIZE="12"/>
<node CREATED="1522158330195" ID="ID_836702110" MODIFIED="1522158335100" TEXT="class S&#xa;{&#xa;    public:&#xa;        static S&amp; getInstance()&#xa;        {&#xa;            static S    instance; // Guaranteed to be destroyed.&#xa;                                  // Instantiated on first use.&#xa;            return instance;&#xa;        }&#xa;    private:&#xa;        S() {}                    // Constructor? (the {} brackets) are needed here.&#xa;&#xa;        // C++ 03&#xa;        // ========&#xa;        // Don&apos;t forget to declare these two. You want to make sure they&#xa;        // are unacceptable otherwise you may accidentally get copies of&#xa;        // your singleton appearing.&#xa;        S(S const&amp;);              // Don&apos;t Implement&#xa;        void operator=(S const&amp;); // Don&apos;t implement&#xa;&#xa;        // C++ 11&#xa;        // =======&#xa;        // We can use the better technique of deleting the methods&#xa;        // we don&apos;t want.&#xa;    public:&#xa;        S(S const&amp;)               = delete;&#xa;        void operator=(S const&amp;)  = delete;&#xa;&#xa;        // Note: Scott Meyers mentions in his Effective Modern&#xa;        //       C++ book, that deleted functions should generally&#xa;        //       be public as it results in better error messages&#xa;        //       due to the compilers behavior to check accessibility&#xa;        //       before deleted status&#xa;};"/>
</node>
<node CREATED="1522149344379" FOLDED="true" ID="ID_1726007860" MODIFIED="1522200626951" TEXT="trim">
<font BOLD="true" NAME="&#x5fae;&#x8f6f;&#x96c5;&#x9ed1;" SIZE="12"/>
<node CREATED="1522149352746" ID="ID_1786628848" MODIFIED="1522149357818" TEXT="// trim from start (in place)&#xa;static inline void ltrim(std::string &amp;s) {&#xa;    s.erase(s.begin(), std::find_if(s.begin(), s.end(), [](int ch) {&#xa;        return !std::isspace(ch);&#xa;    }));&#xa;}&#xa;&#xa;// trim from end (in place)&#xa;static inline void rtrim(std::string &amp;s) {&#xa;    s.erase(std::find_if(s.rbegin(), s.rend(), [](int ch) {&#xa;        return !std::isspace(ch);&#xa;    }).base(), s.end());&#xa;}"/>
</node>
<node CREATED="1522158766300" FOLDED="true" ID="ID_230329438" MODIFIED="1522200610714" TEXT="pimpl">
<font BOLD="true" NAME="&#x5fae;&#x8f6f;&#x96c5;&#x9ed1;" SIZE="12"/>
<node CREATED="1522159140412" ID="ID_816751628" MODIFIED="1522159288334" TEXT="class Parser {&#xa;public:&#xa;    Parser(const char *params);&#xa;    ~Parser();    &#xa;    Parser(Parser &amp;&amp; op) noexcept;              // movable and noncopyable&#xa;    Parser&amp; operator=(Parser &amp;&amp; op) noexcept;   //&#xa;    void parse(const char *input);&#xa;private:&#xa;    class Impl;                     // Forward declaration of the implementation class&#xa;    std::unique_ptr&lt;Impl&gt; impl_;    // PIMPL&#xa;};&#xa;"/>
</node>
<node CREATED="1522159337677" FOLDED="true" ID="ID_135131214" MODIFIED="1522200665580" TEXT="the rule of zero">
<font BOLD="true" NAME="&#x5fae;&#x8f6f;&#x96c5;&#x9ed1;" SIZE="12"/>
<node CREATED="1522159343325" ID="ID_363132110" MODIFIED="1522159355938" TEXT="class Parser {&#xa;public:&#xa;    Parser(const char *params);&#xa;    // Destructor, move constructor and move assignment are compiler-generated.&#xa;    // Copy constructor and copy assignment are implicitly deleted.&#xa;    void parse(const char *input);    &#xa;private:&#xa;    class Impl;&#xa;    spimpl::unique_impl_ptr&lt;Impl&gt; impl_;  // Movable Smart PIMPL&#xa;};"/>
</node>
<node CREATED="1522160100206" FOLDED="true" ID="ID_1013081715" MODIFIED="1522200599048" TEXT="RAII">
<font BOLD="true" NAME="&#x5fae;&#x8f6f;&#x96c5;&#x9ed1;" SIZE="12"/>
<node CREATED="1522160108349" ID="ID_488405102" MODIFIED="1522160108349" TEXT=""/>
</node>
<node CREATED="1522160341222" FOLDED="true" ID="ID_1624745365" MODIFIED="1522200596266" TEXT="thread pool">
<font BOLD="true" NAME="&#x5fae;&#x8f6f;&#x96c5;&#x9ed1;" SIZE="12"/>
<node CREATED="1522160344989" ID="ID_809123836" MODIFIED="1522160359589" TEXT="class ThreadPool&#xa;{&#xa;public:&#xa;    explicit ThreadPool(size_t);&#xa;    template&lt;class F, class... Args&gt;&#xa;    auto enqueue(F&amp;&amp; f, Args&amp;&amp;... args)&#xa;    -&gt; std::future&lt;typename std::result_of&lt;F(Args...)&gt;::type&gt;;&#xa;    ~ThreadPool();&#xa;private:&#xa;    // need to keep track of threads so we can join them&#xa;    std::vector&lt; std::thread &gt; workers;&#xa;    // the task queue&#xa;    std::queue&lt; std::function&lt;void()&gt;&gt; tasks;&#xa;&#xa;    // synchronization&#xa;    std::mutex queue_mutex;&#xa;    std::condition_variable condition;&#xa;    bool stop;&#xa;};&#xa;&#xa;// the constructor just launches some amount of workers&#xa;inline ThreadPool::ThreadPool(size_t threads)&#xa;    : stop(false)&#xa;{&#xa;    for (size_t i = 0; i &lt; threads; ++i)&#xa;        workers.emplace_back(&#xa;            [this]&#xa;    {&#xa;        for (;;)&#xa;        {&#xa;            std::function&lt;void()&gt; task;&#xa;            {&#xa;                std::unique_lock&lt;std::mutex&gt; lock(this-&gt;queue_mutex);&#xa;                this-&gt;condition.wait(lock,&#xa;                [this] { return this-&gt;stop || !this-&gt;tasks.empty(); });&#xa;&#xa;                if (this-&gt;stop &amp;&amp; this-&gt;tasks.empty())&#xa;                { return; }&#xa;&#xa;                task = std::move(this-&gt;tasks.front());&#xa;                this-&gt;tasks.pop();&#xa;            }&#xa;            task();&#xa;        }&#xa;    });&#xa;}&#xa;&#xa;// add new work item to the pool&#xa;template&lt;class F, class... Args&gt;&#xa;auto ThreadPool::enqueue(F&amp;&amp; f, Args&amp;&amp;... args)&#xa;-&gt; std::future&lt;typename std::result_of&lt;F(Args...)&gt;::type&gt;&#xa;{&#xa;    using return_type = typename std::result_of&lt;F(Args...)&gt;::type;&#xa;&#xa;    auto task = std::make_shared&lt; std::packaged_task&lt;return_type()&gt;&gt;(&#xa;        std::bind(std::forward&lt;F&gt;(f), std::forward&lt;Args&gt;(args)...));&#xa;&#xa;    std::future&lt;return_type&gt; res = task-&gt;get_future();&#xa;    {&#xa;        std::unique_lock&lt;std::mutex&gt; lock(queue_mutex);&#xa;&#xa;        // don&apos;t allow enqueueing after stopping the pool&#xa;        if (stop)&#xa;        { throw std::runtime_error(&quot;enqueue on stopped ThreadPool&quot;); }&#xa;&#xa;        tasks.emplace([task]() { (*task)(); });&#xa;    }&#xa;    condition.notify_one();&#xa;    return res;&#xa;}&#xa;&#xa;// the destructor joins all threads&#xa;inline ThreadPool::~ThreadPool()&#xa;{&#xa;    {&#xa;        std::unique_lock&lt;std::mutex&gt; lock(queue_mutex);&#xa;        stop = true;&#xa;    }&#xa;    condition.notify_all();&#xa;&#xa;    for (std::thread &amp;worker : workers)&#xa;    { worker.join(); }&#xa;}"/>
</node>
</node>
<node CREATED="1522158624190" FOLDED="true" ID="ID_378040273" MODIFIED="1523956853178" POSITION="right" TEXT="stackoverflow">
<node CREATED="1522140336782" ID="ID_1967332804" MODIFIED="1522229939656" STYLE="fork" TEXT="Future and Promise are the two separate &#xa;sides of an asynchronous operation">
<font BOLD="true" NAME="&#x5fae;&#x8f6f;&#x96c5;&#x9ed1;" SIZE="12"/>
<node CREATED="1522140344879" ID="ID_1506984012" MODIFIED="1522229938024" TEXT="std::promise is used by the &quot;producer/writer&quot; of the asynchronous operation">
<font NAME="&#x5fae;&#x8f6f;&#x96c5;&#x9ed1;" SIZE="12"/>
</node>
<node CREATED="1522140351703" ID="ID_162804169" MODIFIED="1522229938025" TEXT="std::future is used by the &quot;consumer/reader&quot; of the asynchronous operation">
<font NAME="&#x5fae;&#x8f6f;&#x96c5;&#x9ed1;" SIZE="12"/>
</node>
<node CREATED="1522140359007" ID="ID_1134812566" MODIFIED="1522229938025" TEXT="auto promise = std::promise&lt;std::string&gt;(); &#xa;auto producer = std::thread([&amp;]{&#xa0;&#xa0;&#xa0;&#xa0;promise.set_value(&quot;Hello World&quot;);}); &#xa;auto future = promise.get_future(); &#xa;auto consumer = std::thread([&amp;]{&#xa0;&#xa0;&#xa0;&#xa0;std::cout &lt;&lt; future.get();}); &#xa;producer.join();consumer.join();&#xa0;">
<font NAME="&#x5fae;&#x8f6f;&#x96c5;&#x9ed1;" SIZE="12"/>
</node>
<node CREATED="1522140445279" ID="ID_1702448871" MODIFIED="1522229938030" TEXT="template&lt;typename F&gt; &#xa;auto async(F&amp;&amp; func) -&gt; std::future&lt;decltype(func())&gt; &#xa;{ &#xa;&#xa0;&#xa0;&#xa0;&#xa0;auto task&#xa0;&#xa0;&#xa0;= std::packaged_task&lt;decltype(func())()&gt;(std::forward&lt;F&gt;(func)); &#xa;&#xa0;&#xa0;&#xa0;&#xa0;auto future = task.get_future(); &#xa;&#xa0;&#xa0;&#xa0;&#xa0;std::thread(std::move(task)).detach(); &#xa;&#xa0;&#xa0;&#xa0;&#xa0;return std::move(future); &#xa;}">
<font NAME="&#x5fae;&#x8f6f;&#x96c5;&#x9ed1;" SIZE="12"/>
</node>
</node>
<node CREATED="1522140851480" FOLDED="true" ID="ID_1733180344" MODIFIED="1522200712030" TEXT="pointer vs reference">
<font BOLD="true" NAME="&#x5fae;&#x8f6f;&#x96c5;&#x9ed1;" SIZE="12"/>
<node CREATED="1522140863150" ID="ID_1399359920" MODIFIED="1522141702864" TEXT="1. A pointer can be re-assigned&#xa; &#xa0;&#xa0;&#xa0;&#xa0;A reference cannot, and must be assigned at initialization&#xa0;">
<font NAME="&#x5fae;&#x8f6f;&#x96c5;&#x9ed1;" SIZE="12"/>
</node>
<node CREATED="1522141130840" ID="ID_84866578" MODIFIED="1522141596194" TEXT="2. A pointer has its own memory address and size&#xa0; &#xa; &#xa0;&#xa0;&#xa0;&#xa0;there is a real address of a reference that the compiler will not tell you">
<font NAME="&#x5fae;&#x8f6f;&#x96c5;&#x9ed1;" SIZE="12"/>
</node>
<node CREATED="1522141116256" ID="ID_1341731049" MODIFIED="1522141714261" TEXT="3. You can have pointers to pointers to pointers offering extra levels of indirection. &#xa;    Whereas references only offer one level of indirection">
<font NAME="&#x5fae;&#x8f6f;&#x96c5;&#x9ed1;" SIZE="12"/>
</node>
<node CREATED="1522141227855" ID="ID_1308540518" MODIFIED="1522141837988" TEXT="4. Pointer can be assigned nullptr directly, whereas reference cannot">
<font NAME="&#x5fae;&#x8f6f;&#x96c5;&#x9ed1;" SIZE="12"/>
</node>
<node CREATED="1522141850290" ID="ID_1284365766" MODIFIED="1522141852796" TEXT="5. Pointers can iterate over an array, you can use ++ to go to the next item that a pointer is pointing to, and + 4 to go to the 5th element. This is no matter what size the object is that the pointer points to.  "/>
<node CREATED="1522141894361" ID="ID_446698264" MODIFIED="1522142123786" TEXT="6. A pointer needs to be dereferenced with * to access the memory location it points to, whereas a reference can be used directly. A pointer to a class/struct uses -&gt; to access it&apos;s members whereas a reference uses a ."/>
<node CREATED="1522141991408" ID="ID_1953632277" MODIFIED="1522141994452" TEXT="7. A pointer is a variable that holds a memory address. Regardless of how a reference is implemented, a reference has the same memory address as the item it references"/>
<node CREATED="1522142000585" ID="ID_1886508115" MODIFIED="1522142002261" TEXT="8. References cannot be stuffed into an array, whereas pointers can be "/>
<node CREATED="1522142011481" ID="ID_752334641" MODIFIED="1522142014129" TEXT="9. Const references can be bound to temporaries. Pointers cannot"/>
</node>
<node CREATED="1522142642939" FOLDED="true" ID="ID_1311599290" MODIFIED="1522158694396" TEXT="cast">
<node CREATED="1522142824050" ID="ID_338283629" MODIFIED="1522142844530" TEXT="Use dynamic_cast for converting pointers/references within an inheritance hierarchy.  "/>
<node CREATED="1522142844531" ID="ID_858790268" MODIFIED="1522142861124" TEXT="Use static_cast for ordinary type conversions.  "/>
<node CREATED="1522142848038" ID="ID_1769794015" MODIFIED="1522142858005" TEXT="Use reinterpret_cast for low-level reinterpreting of bit patterns. Use with extreme caution.  "/>
<node CREATED="1522142851497" ID="ID_144157054" MODIFIED="1522142855255" TEXT="Use const_cast for casting away const/volatile. Avoid this unless you are stuck using a const-incorrect API.  "/>
</node>
<node CREATED="1522143065786" FOLDED="true" ID="ID_1863719264" MODIFIED="1522158756945" TEXT="operator overloading">
<font BOLD="true" NAME="&#x5fae;&#x8f6f;&#x96c5;&#x9ed1;" SIZE="12"/>
<node CREATED="1522143175628" ID="ID_273648780" MODIFIED="1522143178595" TEXT="Assignment ">
<node CREATED="1522143084593" ID="ID_1878975929" MODIFIED="1522143102952" TEXT="X&amp; X::operator=(X rhs)&#xa;{&#xa;  swap(rhs);&#xa;  return *this;&#xa;}"/>
</node>
<node CREATED="1522143151911" ID="ID_738197446" MODIFIED="1522143170363" TEXT="Bitshift ">
<node CREATED="1522143136298" ID="ID_338001369" MODIFIED="1522143147706" TEXT="std::ostream&amp; operator&lt;&lt;(std::ostream&amp; os, const T&amp; obj)&#xa;{&#xa;  // write obj to stream&#xa;  return os;&#xa;}&#xa;std::istream&amp; operator&gt;&gt;(std::istream&amp; is, T&amp; obj)&#xa;{&#xa;  // read obj from stream&#xa;  if( /* no valid object of T found in stream */ )&#xa;    is.setstate(std::ios::failbit);&#xa;  return is;&#xa;}&#xa;"/>
</node>
<node CREATED="1522143190593" ID="ID_951615130" MODIFIED="1522143195006" TEXT="Function call">
<node CREATED="1522143203635" ID="ID_1757926995" MODIFIED="1522143208927" TEXT="class foo {&#xa;public:&#xa;    // Overloaded call operator&#xa;    int operator()(const std::string&amp; y) {&#xa;        // ...&#xa;    }&#xa;};&#xa;"/>
</node>
<node CREATED="1522143251746" ID="ID_601377237" MODIFIED="1522143252430" TEXT="Comparison ">
<node CREATED="1522143254041" ID="ID_929028675" MODIFIED="1522143266142" TEXT="inline bool operator==(const X&amp; lhs, const X&amp; rhs){ /* do actual comparison */ }&#xa;inline bool operator!=(const X&amp; lhs, const X&amp; rhs){return !operator==(lhs,rhs);}&#xa;inline bool operator&lt; (const X&amp; lhs, const X&amp; rhs){ /* do actual comparison */ }&#xa;inline bool operator&gt; (const X&amp; lhs, const X&amp; rhs){return  operator&lt; (rhs,lhs);}&#xa;inline bool operator&lt;=(const X&amp; lhs, const X&amp; rhs){return !operator&gt; (lhs,rhs);}&#xa;inline bool operator&gt;=(const X&amp; lhs, const X&amp; rhs){return !operator&lt; (lhs,rhs);}&#xa;"/>
</node>
<node CREATED="1522143313170" FOLDED="true" ID="ID_1128031854" MODIFIED="1522158754943" TEXT="Arithmetic ">
<node CREATED="1522143324171" ID="ID_1895554559" MODIFIED="1522143362638" TEXT="Unary ">
<node CREATED="1522143337857" ID="ID_1660085664" MODIFIED="1522143349621" TEXT="class X {&#xa;  X&amp; operator++()&#xa;  {&#xa;    // do actual increment&#xa;    return *this;&#xa;  }&#xa;  X operator++(int)&#xa;  {&#xa;    X tmp(*this);&#xa;    operator++();&#xa;    return tmp;&#xa;  }&#xa;};"/>
</node>
<node CREATED="1522143363722" ID="ID_1015606175" MODIFIED="1522143364702" TEXT="Binary ">
<node CREATED="1522143374763" ID="ID_806056517" MODIFIED="1522143379838" TEXT="class X {&#xa;  X&amp; operator+=(const X&amp; rhs)&#xa;  {&#xa;    // actual addition of rhs to *this&#xa;    return *this;&#xa;  }&#xa;};&#xa;inline X operator+(X lhs, const X&amp; rhs)&#xa;{&#xa;  lhs += rhs;&#xa;  return lhs;&#xa;}"/>
</node>
</node>
<node CREATED="1522143483241" ID="ID_861073837" MODIFIED="1522143485171" TEXT="Array Subscripting">
<node CREATED="1522143490481" ID="ID_1337235646" MODIFIED="1522143498451" TEXT="class X {&#xa;        value_type&amp; operator[](index_type idx);&#xa;  const value_type&amp; operator[](index_type idx) const;&#xa;  // ...&#xa;};"/>
</node>
<node CREATED="1522143514570" ID="ID_898482011" MODIFIED="1522143516391" TEXT="Pointer-like Types">
<node CREATED="1522143517394" ID="ID_46883522" MODIFIED="1522143526658" TEXT="class my_ptr {&#xa;        value_type&amp; operator*();&#xa;  const value_type&amp; operator*() const;&#xa;        value_type* operator-&gt;();&#xa;  const value_type* operator-&gt;() const;&#xa;};"/>
</node>
</node>
<node CREATED="1522143602579" FOLDED="true" ID="ID_1011129785" MODIFIED="1522159401524" TEXT="The Rule of Three">
<node CREATED="1522144096570" ID="ID_516576366" MODIFIED="1522144123270" TEXT="Sometimes you need to implement a class that manages a resource. (Never manage multiple resources in a single class, this will only lead to pain.) In that case, remember the rule of three:&#xa;If you need to explicitly declare either the destructor, copy constructor or copy assignment operator yourself, you probably need to explicitly declare all three of them."/>
<node CREATED="1522143701387" ID="ID_1288073871" MODIFIED="1522144151468" TEXT="Since we declared neither the copy constructor nor the assignment operator (nor the destructor) ourselves, these are implicitly defined for us."/>
<node CREATED="1522143915027" ID="ID_539218942" MODIFIED="1522143922831" TEXT="example">
<node CREATED="1522143923595" ID="ID_1287623882" MODIFIED="1522143933409" TEXT="class person&#xa;{&#xa;    std::string name;&#xa;    int age;&#xa;public:&#xa;    person(const std::string&amp; name, int age) : name(name), age(age)&#xa;    {&#xa;    }&#xa;};&#xa;int main()&#xa;{&#xa;    person a(&quot;Bjarne Stroustrup&quot;, 60);&#xa;    person b(a);   // What happens here?&#xa;    b = a;         // And here?&#xa;}"/>
</node>
<node CREATED="1522143716610" ID="ID_1844592206" MODIFIED="1522143717990" TEXT="Implicit definitions">
<node CREATED="1522143719178" ID="ID_1523709960" MODIFIED="1522143733412" TEXT="// 1. copy constructor&#xa;person(const person&amp; that) : name(that.name), age(that.age)&#xa;{&#xa;}&#xa;// 2. copy assignment operator&#xa;person&amp; operator=(const person&amp; that)&#xa;{&#xa;    name = that.name;&#xa;    age = that.age;&#xa;    return *this;&#xa;}&#xa;// 3. destructor&#xa;~person()&#xa;{&#xa;}"/>
</node>
<node CREATED="1522143756451" ID="ID_1684637717" MODIFIED="1522143757446" TEXT="Managing resources">
<node CREATED="1522143779644" ID="ID_1309252998" MODIFIED="1522143790928" TEXT="class person&#xa;{&#xa;    char* name;&#xa;    int age;&#xa;public:&#xa;    // the constructor acquires a resource:&#xa;    // in this case, dynamic memory obtained via new[]&#xa;    person(const char* the_name, int the_age)&#xa;    {&#xa;        name = new char[strlen(the_name) + 1];&#xa;        strcpy(name, the_name);&#xa;        age = the_age;&#xa;    }&#xa;    // the destructor must release this resource via delete[]&#xa;    ~person()&#xa;    {&#xa;        delete[] name;&#xa;    }&#xa;};"/>
</node>
<node CREATED="1522143808571" ID="ID_1012929234" MODIFIED="1522158373021" TEXT="Explicit definitions">
<node CREATED="1522143819012" ID="ID_922136815" MODIFIED="1522143828702" TEXT="// 1. copy constructor&#xa;person(const person&amp; that)&#xa;{&#xa;    name = new char[strlen(that.name) + 1];&#xa;    strcpy(name, that.name);&#xa;    age = that.age;&#xa;}&#xa;// 2. copy assignment operator&#xa;person&amp; operator=(const person&amp; that)&#xa;{&#xa;    if (this != &amp;that)&#xa;    {&#xa;        delete[] name;&#xa;        // This is a dangerous point in the flow of execution!&#xa;        // We have temporarily invalidated the class invariants,&#xa;        // and the next statement might throw an exception,&#xa;        // leaving the object in an invalid state :(&#xa;        name = new char[strlen(that.name) + 1];&#xa;        strcpy(name, that.name);&#xa;        age = that.age;&#xa;    }&#xa;    return *this;&#xa;}&#xa;"/>
</node>
<node CREATED="1522143870684" ID="ID_603764814" MODIFIED="1522143872259" TEXT="Exception safety">
<node CREATED="1522143878788" ID="ID_1810666655" MODIFIED="1522143882464" TEXT="// 2. copy assignment operator&#xa;person&amp; operator=(const person&amp; that)&#xa;{&#xa;    char* local_name = new char[strlen(that.name) + 1];&#xa;    // If the above statement throws,&#xa;    // the object is still in the same state as before.&#xa;    // None of the following statements will throw an exception :)&#xa;    strcpy(local_name, that.name);&#xa;    delete[] name;&#xa;    name = local_name;&#xa;    age = that.age;&#xa;    return *this;&#xa;}"/>
</node>
<node CREATED="1522143946675" ID="ID_1717168635" MODIFIED="1522143947967" TEXT="Noncopyable resources">
<node CREATED="1522143972987" ID="ID_233296138" MODIFIED="1522143978724" TEXT="person(const person&amp; that) = delete;&#xa;person&amp; operator=(const person&amp; that) = delete;"/>
</node>
</node>
<node CREATED="1522159387869" ID="ID_189809779" MODIFIED="1522159395962" TEXT="The rule of zero">
<node CREATED="1522159396941" ID="ID_116905952" MODIFIED="1522159397897" TEXT="A class should have a definition of either all special member functions or zero of them"/>
<node CREATED="1522159436485" ID="ID_1864377826" MODIFIED="1522159451344" TEXT="noncopyable pimpl"/>
</node>
<node CREATED="1522144301250" FOLDED="true" ID="ID_1429264391" MODIFIED="1522158583996" TEXT="copy-and-swap idiom">
<font BOLD="true" NAME="&#x5fae;&#x8f6f;&#x96c5;&#x9ed1;" SIZE="12"/>
<node CREATED="1522144335692" ID="ID_1641775671" MODIFIED="1522144350651" TEXT="class dumb_array&#xa;{&#xa;public:&#xa;    // ...&#xa;    friend void swap(dumb_array&amp; first, dumb_array&amp; second) // nothrow&#xa;    {&#xa;        // enable ADL (not necessary in our case, but good practice)&#xa;        using std::swap;&#xa;        // by swapping the members of two objects,&#xa;        // the two objects are effectively swapped&#xa;        swap(first.mSize, second.mSize);&#xa;        swap(first.mArray, second.mArray);&#xa;    }&#xa;    // ...&#xa;};"/>
<node CREATED="1522144357355" ID="ID_1538702694" MODIFIED="1522144363236" TEXT="dumb_array&amp; operator=(dumb_array other) // (1)&#xa;{&#xa;    swap(*this, other); // (2)&#xa;    return *this;&#xa;}"/>
<node CREATED="1522144440509" FOLDED="true" ID="ID_1666165643" MODIFIED="1522158559507" TEXT="c++11">
<font BOLD="true" NAME="&#x5fae;&#x8f6f;&#x96c5;&#x9ed1;" SIZE="12"/>
<node CREATED="1522144426557" ID="ID_1549645107" MODIFIED="1522144436431" TEXT="class dumb_array&#xa;{&#xa;public:&#xa;    // ...&#xa;    // move constructor&#xa;    dumb_array(dumb_array&amp;&amp; other)&#xa;        : dumb_array() // initialize via default constructor, C++11 only&#xa;    {&#xa;        swap(*this, other);&#xa;    }&#xa;    // ...&#xa;};"/>
<node CREATED="1522157507973" ID="ID_895485811" MODIFIED="1522157535948" TEXT="struct X&#xa;{&#xa;    X();&#xa;    X(X const&amp;);&#xa;    void swap(X&amp;) noexcept;&#xa;&#xa;    X(X&amp;&amp; b)&#xa;        : X() // delegate to the default constructor&#xa;    {&#xa;        b.swap(*this);&#xa;    }&#xa;&#xa;    // Note that this operator implements both copy and move assignments.&#xa;    // It accepts its argument by value, which invokes the appropriate (copy or move) constructor.&#xa;    X&amp; operator=(X b) {&#xa;        b.swap(*this);&#xa;        return *this;&#xa;    }&#xa;};">
<font BOLD="true" NAME="&#x5fae;&#x8f6f;&#x96c5;&#x9ed1;" SIZE="12"/>
</node>
</node>
<node CREATED="1522144601539" ID="ID_215503466" MODIFIED="1522144606273" TEXT="&#x201c;The Rule of The Big Four (and a half)&quot; states that if you implement one of&#xa;&#xa;The copy constructor&#xa;The assignment operator&#xa;The move constructor&#xa;The destructor&#xa;The swap function"/>
<node CREATED="1522144689747" ID="ID_847085874" MODIFIED="1522144721421" TEXT="default constructor (which could be private)&#xa;copy constructor (Here you have real code to handle your resource)&#xa;move constructor (using default constructor and swap) :&#xa;    S(S&amp;&amp; s) : S{} { swap(*this, s); }&#xa;assignment operator (using constructor and swap)&#xa;    S&amp; operator=(S s) { swap(*this, s); }&#xa;destructor (deep copy of your resource)&#xa;friend swap (doesn&apos;t have default implementation :/ you should probably want to swap each member). This one is important contrary to the swap member method: std::swap uses move (or copy) constructor, which would lead to infinite recursion"/>
</node>
<node CREATED="1522145106445" ID="ID_602516874" MODIFIED="1522200755520" TEXT="why pointer than object">
<font BOLD="true" NAME="&#x5fae;&#x8f6f;&#x96c5;&#x9ed1;" SIZE="12"/>
<node CREATED="1522145144894" ID="ID_632819459" MODIFIED="1522145145880" TEXT="Dynamic allocation">
<node CREATED="1522145210749" ID="ID_742248253" MODIFIED="1522145212890" TEXT="you should always prefer creating objects with automatic storage duration when you can."/>
<node CREATED="1522145188461" ID="ID_465846546" MODIFIED="1522145350515" TEXT="1. You need the object to outlive the current scope &#xa;2. You need to allocate a lot of memory"/>
</node>
<node CREATED="1522145221109" ID="ID_336155617" MODIFIED="1522145222317" TEXT="Pointers">
<node CREATED="1522145246548" ID="ID_748005058" MODIFIED="1522145247760" TEXT="always prefer the alternatives unless you really need pointers"/>
<node CREATED="1522145253597" ID="ID_712738718" MODIFIED="1522145333937" TEXT="1. You need reference semantics&#xa;2. You need polymorphism&#xa;3. You want to represent that an object is optional&#xa;4. You want to decouple compilation units to improve compilation time&#xa;5. You need to interface with a C library"/>
</node>
</node>
<node CREATED="1522146986560" FOLDED="true" ID="ID_338573220" MODIFIED="1522158014262" TEXT="forward declaration">
<node CREATED="1522147009968" ID="ID_372640769" MODIFIED="1522147019202" TEXT="when you forward declare a type, all the compiler knows is that this type exists; it knows nothing about its size, members, or methods. This is why it&apos;s called an incomplete type. &#xa;Therefore, you cannot use the type to declare a member, or a base class, since the compiler would need to know the layout of the type"/>
<node CREATED="1522147044327" ID="ID_1138750943" MODIFIED="1522157614268" TEXT="What you can do with an incomplete type">
<font BOLD="true" NAME="&#x5fae;&#x8f6f;&#x96c5;&#x9ed1;" SIZE="12"/>
<node CREATED="1522147134768" ID="ID_1712603589" MODIFIED="1522147185104" TEXT="class Foo {&#xa;    X *pt;&#xa;    X &amp;pt;&#xa;};">
<node CREATED="1522147046415" ID="ID_421101524" MODIFIED="1522147053548" TEXT="Declare a member to be a pointer or a reference to the incomplete type"/>
</node>
<node CREATED="1522147151569" ID="ID_1900943829" MODIFIED="1522147155894" TEXT="void f1(X);&#xa;X    f2();">
<node CREATED="1522147059216" ID="ID_470955695" MODIFIED="1522147182155" TEXT="Declare functions or methods which accept/return incomplete types"/>
</node>
<node CREATED="1522147162840" ID="ID_334538066" MODIFIED="1522147166971" TEXT="void f3(X*, X&amp;) {}&#xa;X&amp;   f4()       {}&#xa;X*   f5()       {}">
<node CREATED="1522147069343" ID="ID_1753186500" MODIFIED="1522147174072" TEXT="Define functions or methods which accept/return pointers/references to the incomplete type (but without using its members):  "/>
</node>
</node>
</node>
<node CREATED="1522147230831" FOLDED="true" ID="ID_190465849" MODIFIED="1522158588582" TEXT="singleton">
<font BOLD="true" NAME="&#x5fae;&#x8f6f;&#x96c5;&#x9ed1;" SIZE="12"/>
<node CREATED="1522148051208" ID="ID_452965414" MODIFIED="1522148052708" TEXT="Use a Singleton if">
<node CREATED="1522148054033" ID="ID_1928055513" MODIFIED="1522157630443" TEXT="If you need to have one and only one object of a type in system">
<font BOLD="true" NAME="&#x5fae;&#x8f6f;&#x96c5;&#x9ed1;" SIZE="12"/>
</node>
</node>
<node CREATED="1522147248600" ID="ID_143905679" MODIFIED="1522147249701" TEXT="The classic lazy evaluated and correctly destroyed singleton"/>
<node CREATED="1522147250649" ID="ID_876464601" MODIFIED="1522157635052" TEXT="class S&#xa;{&#xa;    public:&#xa;        static S&amp; getInstance()&#xa;        {&#xa;            static S    instance; // Guaranteed to be destroyed.&#xa;                                  // Instantiated on first use.&#xa;            return instance;&#xa;        }&#xa;    private:&#xa;        S() {}                    // Constructor? (the {} brackets) are needed here.&#xa;&#xa;        // C++ 03&#xa;        // ========&#xa;        // Don&apos;t forget to declare these two. You want to make sure they&#xa;        // are unacceptable otherwise you may accidentally get copies of&#xa;        // your singleton appearing.&#xa;        S(S const&amp;);              // Don&apos;t Implement&#xa;        void operator=(S const&amp;); // Don&apos;t implement&#xa;&#xa;        // C++ 11&#xa;        // =======&#xa;        // We can use the better technique of deleting the methods&#xa;        // we don&apos;t want.&#xa;    public:&#xa;        S(S const&amp;)               = delete;&#xa;        void operator=(S const&amp;)  = delete;&#xa;&#xa;        // Note: Scott Meyers mentions in his Effective Modern&#xa;        //       C++ book, that deleted functions should generally&#xa;        //       be public as it results in better error messages&#xa;        //       due to the compilers behavior to check accessibility&#xa;        //       before deleted status&#xa;};&#xa;">
<font NAME="&#x5fae;&#x8f6f;&#x96c5;&#x9ed1;" SIZE="12"/>
</node>
</node>
<node CREATED="1522148247329" FOLDED="true" ID="ID_700551098" MODIFIED="1522157949232" TEXT="calling the superclass constructor">
<node CREATED="1522148250657" ID="ID_287349572" MODIFIED="1522148254596" TEXT="Base class constructors are automatically called for you if they have no argument. If you want to call a superclass constructor with an argument, you must use the subclass&apos;s constructor initialization list. Unlike Java, C++ supports multiple inheritance (for better or worse), so the base class must be referred to by name, rather than &quot;super()&quot;."/>
<node CREATED="1522148284025" ID="ID_1155165013" MODIFIED="1522148292627" TEXT="class SuperClass&#xa;{&#xa;    public:&#xa;        SuperClass(int foo)&#xa;        {&#xa;            // do something with foo&#xa;        }&#xa;};&#xa;class SubClass : public SuperClass&#xa;{&#xa;    public:&#xa;        SubClass(int foo, int bar)&#xa;        : SuperClass(foo)    // Call the superclass constructor in the subclass&apos; initialization list.&#xa;        {&#xa;            // do something with bar&#xa;        }&#xa;};&#xa;"/>
</node>
<node CREATED="1522148409905" FOLDED="true" ID="ID_106697774" MODIFIED="1522158601018" TEXT="rvalue references">
<font BOLD="true" NAME="&#x5fae;&#x8f6f;&#x96c5;&#x9ed1;" SIZE="12"/>
<node CREATED="1522148455425" ID="ID_1603427600" MODIFIED="1522148456626" TEXT="T&amp;&amp; r = T();"/>
<node CREATED="1522148449154" ID="ID_487932317" MODIFIED="1522157939772" TEXT="Move semantics">
<font BOLD="true" NAME="&#x5fae;&#x8f6f;&#x96c5;&#x9ed1;" SIZE="12"/>
<node CREATED="1522148542218" ID="ID_1046167106" MODIFIED="1522148548871" TEXT="foo(foo&amp;&amp; other)&#xa;{&#xa;   this-&gt;length = other.length;&#xa;   this-&gt;ptr = other.ptr;&#xa;   other.length = 0;&#xa;   other.ptr = nullptr;&#xa;}"/>
</node>
<node CREATED="1522148563810" ID="ID_844866458" MODIFIED="1522157909548" TEXT="Perfect forwarding">
<font BOLD="true" NAME="&#x5fae;&#x8f6f;&#x96c5;&#x9ed1;" SIZE="12"/>
<node CREATED="1522148570441" ID="ID_1573989997" MODIFIED="1522148600023" TEXT="template &lt;typename T, typename A1&gt;&#xa;std::unique_ptr&lt;T&gt; factory(A1&amp;&amp; a1)&#xa;{&#xa;    return std::unique_ptr&lt;T&gt;(new T(std::forward&lt;A1&gt;(a1)));&#xa;}"/>
</node>
<node CREATED="1522148660674" ID="ID_1744903215" MODIFIED="1522157753973" TEXT="Important rvalue reference properties">
<font BOLD="true" NAME="&#x5fae;&#x8f6f;&#x96c5;&#x9ed1;" SIZE="12"/>
<node CREATED="1522148672506" ID="ID_861178594" MODIFIED="1522148678905" TEXT="For overload resolution, lvalues prefer binding to lvalue references and rvalues prefer binding to rvalue references. Hence why temporaries prefer invoking a move constructor / move assignment operator over a copy constructor / assignment operator"/>
<node CREATED="1522148742321" ID="ID_1751151400" MODIFIED="1522157819811" TEXT="rvalue references will implicitly bind to rvalues and to temporaries that are the result of an implicit conversion. i.e. float f = 0f; int&amp;&amp; i = f; is well formed because float is implicitly convertible to int; the reference would be to a temporary that is the result of the conversion. "/>
<node CREATED="1522148772177" ID="ID_588771835" MODIFIED="1522148776293" TEXT="Named rvalue references are lvalues. Unnamed rvalue references are rvalues. This is important to understand why the std::move call is necessary in: foo&amp;&amp; r = foo(); foo f = std::move(r);"/>
</node>
</node>
<node CREATED="1522149344379" FOLDED="true" ID="ID_1995962881" MODIFIED="1522158615999" TEXT="trim">
<node CREATED="1522149352746" ID="ID_1894694243" MODIFIED="1522149357818" TEXT="// trim from start (in place)&#xa;static inline void ltrim(std::string &amp;s) {&#xa;    s.erase(s.begin(), std::find_if(s.begin(), s.end(), [](int ch) {&#xa;        return !std::isspace(ch);&#xa;    }));&#xa;}&#xa;&#xa;// trim from end (in place)&#xa;static inline void rtrim(std::string &amp;s) {&#xa;    s.erase(std::find_if(s.rbegin(), s.rend(), [](int ch) {&#xa;        return !std::isspace(ch);&#xa;    }).base(), s.end());&#xa;}"/>
</node>
<node CREATED="1522149522275" FOLDED="true" ID="ID_1731340608" MODIFIED="1522158593527" TEXT="functor">
<font NAME="&#x5fae;&#x8f6f;&#x96c5;&#x9ed1;" SIZE="12"/>
<node CREATED="1522149683675" ID="ID_301474494" MODIFIED="1522149699110" TEXT="// this is a functor&#xa;struct add_x {&#xa;  add_x(int x) : x(x) {}&#xa;  int operator()(int y) const { return x + y; }&#xa;private:&#xa;  int x;&#xa;};&#xa;&#xa;// Now you can use it like this:&#xa;add_x add42(42); // create an instance of the functor class&#xa;int i = add42(8); // and &quot;call&quot; it&#xa;assert(i == 50); // and it added 42 to its argument&#xa;&#xa;std::vector&lt;int&gt; in; // assume this contains a bunch of values)&#xa;std::vector&lt;int&gt; out(in.size());&#xa;// Pass a functor to std::transform, which calls the functor on every element &#xa;// in the input sequence, and stores the result to the output sequence&#xa;std::transform(in.begin(), in.end(), out.begin(), add_x(1)); &#xa;assert(out[i] == in[i] + 1); // for all i"/>
</node>
<node CREATED="1522149785523" FOLDED="true" ID="ID_428988298" MODIFIED="1522157899979" TEXT="interface define">
<font BOLD="true" NAME="&#x5fae;&#x8f6f;&#x96c5;&#x9ed1;" SIZE="12"/>
<node CREATED="1522149793523" ID="ID_1383958195" MODIFIED="1522149808849" TEXT="class IDemo&#xa;{&#xa;    public:&#xa;        virtual ~IDemo() {}&#xa;        virtual void OverrideMe() = 0;&#xa;};&#xa;class Parent&#xa;{&#xa;    public:&#xa;        virtual ~Parent();&#xa;};&#xa;class Child : public Parent, public IDemo&#xa;{&#xa;    public:&#xa;        virtual void OverrideMe()&#xa;        {&#xa;            //do stuff&#xa;        }&#xa;};"/>
</node>
</node>
</node>
</map>
