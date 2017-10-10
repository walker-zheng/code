<map version="0.9.0">
<!-- To view this file, download free mind mapping software FreeMind from http://freemind.sourceforge.net -->
<node CREATED="1321844606313" ID="ID_1576780641" MODIFIED="1321844673686" TEXT="MPLS">
<node CREATED="1321854222140" ID="ID_1424032201" MODIFIED="1324715970266" POSITION="right" TEXT="MPLS LDP">
<node CREATED="1321854398543" ID="ID_1286619095" MODIFIED="1321854402417" TEXT="&#x57fa;&#x672c;&#x6982;&#x5ff5;">
<node CREATED="1321854403371" ID="ID_1523912657" MODIFIED="1321854533649" TEXT="LDP &#x62a5;&#x6587; &#xff1a;LDP PDU&#x5934;+&#x4e00;&#x4e2a;&#x6216;&#x7ec4;LDP&#x6d88;&#x606f;&#xff08;&#x7248;&#x672c;1+PDU&#x957f;&#x5ea6;+LDP &#x6807;&#x8bc6;+Bunch of Messages)">
<node CREATED="1321854551820" ID="ID_1775943170" MODIFIED="1321855502124" TEXT="LDP &#x6807;&#x8bc6;&#xff1a;48bit,&#x524d;32bit&#x4e3a;LSR ID&#xff08;&#x5168;&#x5c40;&#x552f;&#x4e00;&#xff09;&#xff0c;&#x540e;16bit&#x4e3a;&#x6807;&#x7b7e;&#x7a7a;&#x95f4;">
<node CREATED="1321855542217" ID="ID_1686525093" MODIFIED="1321855556123" TEXT="&#x5168;&#x5c40;&#x6807;&#x7b7e;&#x7a7a;&#x95f4;&#xff1a;&#x5168;0">
<node CREATED="1321855609793" ID="ID_396331184" MODIFIED="1321855631058" TEXT="&#x6574;&#x4e2a;LSR&#x53ea;&#x80fd;&#x4e3a;FEC&#x751f;&#x6210;&#x552f;&#x4e00;&#x7684;&#x6807;&#x7b7e;"/>
</node>
<node CREATED="1321855556748" ID="ID_1471314664" MODIFIED="1321855574763" TEXT="&#x63a5;&#x53e3;&#x6807;&#x7b7e;&#x7a7a;&#x95f4;&#xff1a;&#x975e;0">
<node CREATED="1321855581950" ID="ID_491010525" MODIFIED="1321855606465" TEXT="LSR&#x6bcf;&#x4e2a;&#x63a5;&#x53e3;&#x90fd;&#x53ef;&#x4ee5;&#x4e3a;&#x7279;&#x5b9a;FEC&#x751f;&#x6210;&#x4e00;&#x4e2a;&#x6807;&#x7b7e;"/>
</node>
</node>
<node CREATED="1321854617741" ID="ID_1687910956" MODIFIED="1321854670005" TEXT="&#x5f53;LDP&#x62a5;&#x6587;&#x4ee5;UDP&#x65b9;&#x5f0f;&#x4f20;&#x8f93;&#x65f6;&#xff0c;Bunch of messages &#x4e3a;Hello&#x6d88;&#x606f;&#x96c6;&#x5408;"/>
<node CREATED="1321854670599" ID="ID_33849410" MODIFIED="1321854741581" TEXT="&#x5f53;LDP&#x62a5;&#x6587;&#x4ee5;TCP&#x65b9;&#x5f0f;&#x4f20;&#x8f93;&#x65f6;&#xff0c;Bunch of Messages &#x53ef;&#x4ee5;&#x662f;&#x9664;Hello&#x6d88;&#x606f;&#x5916;&#x4efb;&#x610f;&#x7c7b;&#x578b;&#x7684;LDP&#x6d88;&#x606f;&#x96c6;&#x5408;"/>
</node>
<node CREATED="1321854827829" ID="ID_363562222" MODIFIED="1325143302390" TEXT="Message &#x683c;&#x5f0f;&#xff1a;U+type + Length+ ID+&#x5f3a;&#x5236;&#x53c2;&#x6570;+&#x53ef;&#x9009;&#x53c2;&#x6570;">
<node CREATED="1321854887421" ID="ID_66636804" MODIFIED="1321854952732" TEXT="U&#x672a;&#x77e5;&#x6d88;&#x606f;&#xff0c;&#x4e3a;0&#x5219;&#x5411;&#x6e90;&#x7aef;&#x53d1;&#x9001;&#x901a;&#x77e5;&#x6d88;&#x606f;&#xff1b;&#x4e3a;1&#x5219;&#x5ffd;&#x7565;&#x8be5;&#x6d88;&#x606f;"/>
<node CREATED="1321854961169" ID="ID_1843995654" MODIFIED="1321854984169" TEXT="ID&#x4e3a;LDP&#x6d88;&#x606f;&#x552f;&#x4e00;&#x7f16;&#x53f7;"/>
</node>
<node CREATED="1321854995981" ID="ID_660007936" MODIFIED="1321855699432" TEXT="Message&#x7c7b;&#x578b;">
<node CREATED="1321855033105" ID="ID_1360483360" MODIFIED="1321855050198" TEXT="&#x53d1;&#x73b0;&#xff08;Discovery&#xff09;">
<node CREATED="1321855051308" ID="ID_1700723327" MODIFIED="1321855097431" TEXT="Hello&#x6d88;&#x606f;&#xff1a;&#x901a;&#x544a;&#x4e0e;&#x7ef4;&#x62a4;LSR&#x7684;&#x5b58;&#x5728;&#xff08;UDP&#xff09;"/>
</node>
<node CREATED="1321855100525" ID="ID_1907786380" MODIFIED="1321855113884" TEXT="&#x4f1a;&#x8bdd;&#xff08;Session&#xff09;">
<node CREATED="1321855120525" ID="ID_116236171" MODIFIED="1321855178054" TEXT="initial&#x6d88;&#x606f;&#x548c;Keeplive&#x6d88;&#x606f;&#xff1a;&#x5efa;&#x7acb;&#x7ef4;&#x62a4;&#x548c;&#x7ec8;&#x6b62;LDP&#x5bf9;&#x7b49;&#x4f53;&#x4e4b;&#x95f4;&#x7684;&#x4f1a;&#x8bdd;&#xff08;TCP&#xff09;"/>
</node>
<node CREATED="1321855180336" ID="ID_1380310212" MODIFIED="1321855210897" TEXT="&#x901a;&#x544a;&#xff08;Advertisement&#xff09;">
<node CREATED="1321855212038" ID="ID_1675468998" MODIFIED="1321855412220" TEXT="&#x521b;&#x5efa;&#x3001;&#x6539;&#x53d8;&#x548c;&#x5220;&#x9664;FEC&#x7684;&#x6807;&#x7b7e;&#x6620;&#x5c04;&#xff08;TCP&#xff09;">
<node CREATED="1321855238943" ID="ID_1984238936" MODIFIED="1321855325129" TEXT="Adress &#x6d88;&#x606f;&#x3001;Adress withdraw&#x6d88;&#x606f;&#x3001;Label request/mapping/withdraw/release/about request &#x6d88;&#x606f;"/>
</node>
</node>
<node CREATED="1321855328910" ID="ID_995057455" MODIFIED="1321855353675" TEXT="&#x901a;&#x77e5;&#xff08;Notifacation&#xff09;">
<node CREATED="1321855355097" ID="ID_836620082" MODIFIED="1321855372112" TEXT="&#x63d0;&#x4f9b;&#x5efa;&#x8bae;&#x6027;&#x7684;&#x6d88;&#x606f;&#x548c;&#x5dee;&#x9519;&#x901a;&#x77e5;">
<node CREATED="1321855373378" ID="ID_1189773136" MODIFIED="1321855398799" TEXT="Notification &#x6d88;&#x606f;&#xff08;TCP&#xff09;"/>
</node>
</node>
</node>
</node>
<node CREATED="1321855747149" ID="ID_1102708996" MODIFIED="1321855751852" TEXT="LDP &#x4f1a;&#x8bdd;">
<node CREATED="1321855782289" ID="ID_1609625287" MODIFIED="1321855788336" TEXT="LDP&#x5bf9;&#x7b49;&#x4f53;">
<node CREATED="1321855789976" ID="ID_1173504206" MODIFIED="1321855800288" TEXT="&#x76f8;&#x4e92;&#x4e4b;&#x95f4;&#x5b58;&#x5728;LDP &#x4f1a;&#x8bdd;&#x3001;&#x4f7f;&#x7528;LDP &#x6765;&#x4ea4;&#x6362;FEC &#x6807;&#x7b7e;&#x6620;&#x5c04;&#x6d88;&#x606f;&#x7684;&#x4e24;&#x4e2a; LSR"/>
<node CREATED="1321855827975" ID="ID_624981510" MODIFIED="1321855829475" TEXT="&#x901a;&#x8fc7;&#x5b83;&#x4eec;&#x4e4b;&#x95f4;&#x7684;LDP &#x4f1a;&#x8bdd;&#x83b7;&#x5f97;&#x5bf9;&#x65b9;&#x7684;&#x6807;&#x7b7e;&#x6620;&#x5c04;&#x6d88;&#x606f;"/>
</node>
<node CREATED="1321855865224" ID="ID_311462986" MODIFIED="1321856212372" TEXT="LDP &#x4f1a;&#x8bdd; &#x53d1;&#x73b0;&#x673a;&#x5236;">
<node CREATED="1321855875662" ID="ID_1436003837" MODIFIED="1321855901973" TEXT="&#x672c;&#x5730;&#x4f1a;&#x8bdd;&#xff08;Local LDP Session&#xff09;">
<node CREATED="1321855924520" ID="ID_590387541" MODIFIED="1321855940754" TEXT="&#x53ea;&#x80fd;&#x4e0e;&#x76f8;&#x90bb;LSR&#x4e4b;&#x95f4;&#x5efa;&#x7acb;">
<node CREATED="1321856229074" ID="ID_451175498" MODIFIED="1322132837269" TEXT="&#x57fa;&#x672c;&#x53d1;&#x73b0;&#x673a;&#x5236;&#xff1a;LSR&#x5468;&#x671f;&#x4ee5;UDP&#x62a5;&#x6587;&#x5f62;&#x5f0f;&#x53d1;&#x9001;LDP Link Hello&#x7ed9;&#x6807;&#x8bc6;&#xff08;&#x5b50;&#x7f51;&#x5185;&#x6240;&#x6709;&#x8282;&#x70b9;&#xff09;&#x7684;&#x7ec4;&#x64ad;&#x5730;&#x5740;&#xff1a;224.0.0.2  646"/>
</node>
<node CREATED="1321857111989" ID="ID_142010707" MODIFIED="1321857114333" TEXT="&#x4e24;&#x4e2a;&#x76f8;&#x90bb;&#x7684;LSR &#x4e4b;&#x95f4;&#x53ef;&#x4ee5;&#x5efa;&#x7acb;&#x591a;&#x4e2a;Hello &#x90bb;&#x63a5;&#x5173;&#x7cfb;&#xff0c;&#x4f46;&#x662f;&#x53ea;&#x80fd;&#x5efa;&#x7acb;&#x4e00;&#x4e2a;LDP &#x4f1a;&#x8bdd;">
<node CREATED="1321857139520" ID="ID_967613881" MODIFIED="1321857140973" TEXT="&#x56e0;&#x6b64;&#x53ea;&#x6709;&#x6240;&#x6709;&#x7684;Hello &#x90bb;&#x63a5;&#x5173;&#x7cfb; &#x90fd;&#x4e2d;&#x65ad;&#x65f6;&#xff0c;LSR &#x4f1a;&#x5173;&#x95ed;&#x76f8;&#x5e94;&#x7684;&#x4f20;&#x8f93;&#x5c42;&#x8fde;&#x63a5;&#xff0c;&#x7ec8;&#x6b62;&#x4f1a;&#x8bdd;&#x8fdb;&#x7a0b;"/>
</node>
</node>
<node CREATED="1321855902942" ID="ID_668545147" MODIFIED="1321855922020" TEXT="&#x8fdc;&#x7aef;&#x4f1a;&#x8bdd;&#xff08;Remote LDP Session&#xff09;">
<node CREATED="1321855942675" ID="ID_1597573431" MODIFIED="1321855974925" TEXT="&#x5efa;&#x7acb;&#x5728;&#x4e0d;&#x76f8;&#x90bb;/&#x76f8;&#x90bb;&#x7684;LSR&#x4e4b;&#x95f4;">
<node CREATED="1321856346665" ID="ID_272925045" MODIFIED="1321856428897" TEXT="&#x62d3;&#x5c55;&#x53d1;&#x73b0;&#x673a;&#x5236;&#xff1a;LSR&#x5468;&#x671f;&#x4ee5;UDP&#x62a5;&#x6587;&#x5f62;&#x5f0f;&#x5411;&#x6307;&#x5b9a;IP&#x5730;&#x5740;&#x53d1;&#x9001;LDP  Targeted Hello &#x6d88;&#x606f;"/>
</node>
</node>
</node>
<node CREATED="1321945469590" ID="ID_824503321" MODIFIED="1321945636713" TEXT="hello &#x53d1;&#x73b0;&#x540e;&#xff0c;&#x5efa;&#x7acb;TCP&#x8fde;&#x63a5;&#x534f;&#x5546;&#x540e;&#xff0c;&#x8fdb;&#x884c;Message&#x7684;&#x4ea4;&#x4e92;"/>
<node CREATED="1321855997893" ID="ID_380657902" MODIFIED="1321856006814" TEXT="LDP&#x5b9a;&#x65f6;&#x5668;">
<node CREATED="1321856007705" ID="ID_959660621" MODIFIED="1321856036439" TEXT="Hello&#x53d1;&#x9001;&#x5b9a;&#x65f6;&#x5668;&#xff1a;Hello&#x4fdd;&#x6301;&#x5b9a;&#x65f6;&#x5668;&#x7684;1/3">
<node CREATED="1321947236440" ID="ID_1676050378" MODIFIED="1321947256094" TEXT="&#x7f3a;&#x7701;&#x60c5;&#x51b5;&#x4e0b;&#xff0c;&#x672c;&#x5730;LDP&#x4f1a;&#x8bdd;&#x7684;hello&#x4fdd;&#x6301;&#x5b9a;&#x65f6;&#x5668;&#x7684;&#x503c;&#x662f;45&#x79d2;"/>
</node>
<node CREATED="1321856037314" ID="ID_624068515" MODIFIED="1321856097843" TEXT="Keeplive&#x53d1;&#x9001;&#x5b9a;&#x65f6;&#x5668;&#xff1a;Keeplive&#x4fdd;&#x6301;&#x5b9a;&#x65f6;&#x5668;1/3">
<node CREATED="1321947257016" ID="ID_1651405087" MODIFIED="1321947259234" TEXT="&#x7f3a;&#x7701;&#x60c5;&#x51b5;&#x4e0b;&#xff0c;&#x672c;&#x5730;LDP&#x4f1a;&#x8bdd;&#x7684;KeepAlive&#x4fdd;&#x6301;&#x5b9a;&#x65f6;&#x5668;&#x7684;&#x503c;&#x662f;45&#x79d2;"/>
</node>
</node>
</node>
<node CREATED="1321857349046" ID="ID_1761215811" MODIFIED="1324715972438" TEXT="LDP LSP&#x5efa;&#x7acb;">
<node CREATED="1321857422450" ID="ID_211846281" MODIFIED="1321857544728" TEXT="&#x6807;&#x7b7e;&#x53d1;&#x5e03;&#x4e0e;&#x7ba1;&#x7406;:&#x4e0b;&#x6e38;&#x81ea;&#x4e3b;DU+&#x6709;&#x5e8f;&#x63a7;&#x5236;Ordered+&#x81ea;&#x7531;&#x4fdd;&#x6301;Liberal">
<node CREATED="1321857629304" ID="ID_609483350" MODIFIED="1321857643991" TEXT="&#x4e0b;&#x6e38;&#x81ea;&#x4e3b;DU">
<node CREATED="1321857645429" ID="ID_1022876077" MODIFIED="1321857653757" TEXT="&#x6307;&#x5bf9;&#x4e8e;&#x4e00;&#x4e2a;&#x7279;&#x5b9a;&#x7684;FEC&#xff0c;LSR &#x65e0;&#x987b; &#x4ece;&#x4e0a;&#x6e38;&#x83b7;&#x5f97;&#x6807;&#x7b7e;&#x8bf7;&#x6c42;&#x6d88;&#x606f;&#x5373;&#x8fdb;&#x884c;&#x6807;&#x7b7e;&#x5206;&#x914d;&#x4e0e;&#x5206;&#x53d1;">
<node CREATED="1321947435982" ID="ID_1721419241" MODIFIED="1321947512318" TEXT="&#x63a5;&#x53e3;&#x4e0b;&#x914d;&#x7f6e;&#xff1a;&#x90bb;&#x5c45;&#x4e4b;&#x95f4;&#x5b58;&#x5728;&#x591a;&#x94fe;&#x8def;&#x7684;&#x65f6;&#x5019;&#xff0c;&#x6240;&#x6709;&#x63a5;&#x53e3;&#x7684;&#x6807;&#x7b7e;&#x53d1;&#x5e03;&#x65b9;&#x5f0f;&#x5fc5;&#x987b;&#x76f8;&#x540c;"/>
</node>
</node>
<node CREATED="1321857671553" ID="ID_1440011835" MODIFIED="1321857683084" TEXT="&#x4e0b;&#x6e38;&#x6309;&#x9700;DoD">
<node CREATED="1321857684037" ID="ID_381227620" MODIFIED="1321857700474" TEXT="&#x6307;&#x5bf9;&#x4e8e;&#x4e00;&#x4e2a;&#x7279;&#x5b9a;&#x7684;FEC&#xff0c;LSR &#x83b7; &#x5f97;&#x6807;&#x7b7e;&#x8bf7;&#x6c42;&#x6d88;&#x606f;&#x4e4b;&#x540e;&#x624d;&#x8fdb;&#x884c;&#x6807;&#x7b7e;&#x5206;&#x914d;&#x4e0e;&#x5206;&#x53d1;">
<node CREATED="1321947452636" ID="ID_358541915" MODIFIED="1321947454433" TEXT="&#x4fee;&#x6539;&#x6807;&#x7b7e;&#x53d1;&#x5e03;&#x65b9;&#x5f0f;&#x4f1a;&#x5bfc;&#x81f4;LDP&#x4f1a;&#x8bdd;&#x91cd;&#x5efa;"/>
</node>
</node>
<node CREATED="1321857783160" ID="ID_1069222098" MODIFIED="1321857800534" TEXT="&#x6709;&#x5e8f;&#x63a7;&#x5236;Ordered">
<node CREATED="1321857800534" ID="ID_709581863" MODIFIED="1321857821565" TEXT="&#x5bf9;&#x4e8e;LSR &#x4e0a;&#x67d0;&#x4e2a;FEC &#x7684;&#x6807;&#x7b7e;&#x6620;&#x5c04;&#xff0c;&#x53ea;&#x6709;&#x5f53;&#x8be5; LSR &#x5df2;&#x7ecf;&#x5177;&#x6709;&#x6b64;FEC &#x4e0b;&#x4e00;&#x8df3;&#x7684;&#x6807;&#x7b7e;&#x6620;&#x5c04;&#x6d88;&#x606f;&#x3001;&#x6216;&#x8005;&#x8be5;LSR &#x5c31;&#x662f;&#x6b64;FEC &#x7684;&#x51fa;&#x8282;&#x70b9; &#x65f6;&#xff0c;&#x8be5;LSR &#x624d;&#x53ef;&#x4ee5;&#x5411;&#x4e0a;&#x6e38;&#x53d1;&#x9001;&#x6b64;FEC &#x7684;&#x6807;&#x7b7e;&#x6620;&#x5c04;"/>
</node>
<node CREATED="1321857830455" ID="ID_1317921084" MODIFIED="1321857840408" TEXT="&#x72ec;&#x7acb;&#x63a7;&#x5236;Independent">
<node CREATED="1321857840408" ID="ID_318860022" MODIFIED="1321857843064" TEXT="&#x672c;&#x5730;LSR &#x53ef;&#x4ee5;&#x81ea;&#x4e3b;&#x5730;&#x5206;&#x914d;&#x4e00;&#x4e2a;&#x6807;&#x7b7e;&#x7ed1;&#x5b9a;&#x5230; &#x67d0;&#x4e2a;FEC&#xff0c;&#x5e76;&#x901a;&#x544a;&#x7ed9;&#x4e0a;&#x6e38;LSR&#xff0c;&#x800c;&#x65e0;&#x9700;&#x7b49;&#x5f85;&#x4e0b;&#x6e38;&#x7684;&#x6807;&#x7b7e;"/>
</node>
<node CREATED="1321858225023" ID="ID_1472962847" MODIFIED="1321858282928" TEXT="&#x81ea;&#x7531;&#x4fdd;&#x6301;Liberal">
<node CREATED="1321858262475" ID="ID_208528676" MODIFIED="1321858286350" TEXT="&#x5bf9;&#x4e8e;&#x4ece;&#x90bb;&#x5c45;LSR &#x6536;&#x5230;&#x7684;&#x6807;&#x7b7e;&#x6620;&#x5c04;&#xff0c;&#x65e0;&#x8bba;&#x90bb;&#x5c45;LSR &#x662f;&#x4e0d;&#x662f;&#x81ea;&#x5df1;&#x7684;&#x4e0b;&#x4e00;&#x8df3;&#x90fd;&#x4fdd;&#x7559;&#x3002;"/>
</node>
<node CREATED="1321858243304" ID="ID_556610462" MODIFIED="1321858259601" TEXT="&#x4fdd;&#x5b88;&#x4fdd;&#x6301;Conservation">
<node CREATED="1321858299115" ID="ID_525765765" MODIFIED="1321858300771" TEXT="&#x5bf9;&#x4e8e;&#x4ece;&#x90bb;&#x5c45;LSR &#x6536;&#x5230;&#x7684;&#x6807;&#x7b7e;&#x6620;&#x5c04;&#xff0c;&#x53ea;&#x6709;&#x5f53; &#x90bb;&#x5c45;LSR &#x662f;&#x81ea;&#x5df1;&#x7684;&#x4e0b;&#x4e00;&#x8df3;&#x65f6;&#x624d;&#x4fdd;&#x7559;"/>
</node>
</node>
<node CREATED="1321858383782" ID="ID_206514653" MODIFIED="1321858386047" TEXT="LSP &#x7684;&#x5efa;&#x7acb;&#x8fc7;&#x7a0b;&#x5b9e;&#x9645;&#x5c31;&#x662f;&#x5c06;FEC &#x548c;&#x6807;&#x7b7e;&#x8fdb;&#x884c;&#x7ed1;&#x5b9a;&#xff0c;&#x5e76;&#x5c06;&#x8fd9;&#x79cd;&#x7ed1;&#x5b9a;&#x901a;&#x544a;LSP &#x4e0a;&#x76f8;&#x90bb;LSR">
<node CREATED="1321858444106" ID="ID_1988748435" MODIFIED="1321858446216" TEXT="&#x5f53;&#x7f51;&#x7edc;&#x7684;&#x8def;&#x7531;&#x6539;&#x53d8;&#x65f6;&#xff0c;&#x5982;&#x679c;&#x6709;&#x4e00;&#x4e2a;&#x8fb9;&#x7f18;&#x8282;&#x70b9;&#x53d1;&#x73b0;&#x81ea;&#x5df1;&#x7684;&#x8def;&#x7531;&#x8868;&#x4e2d;&#x51fa;&#x73b0;&#x4e86;&#x65b0;&#x7684;&#x76ee;&#x7684;&#x5730; &#x5740;&#xff0c;&#x5e76;&#x4e14;&#x8fd9;&#x4e00;&#x5730;&#x5740;&#x4e0d;&#x5c5e;&#x4e8e;&#x4efb;&#x4f55;&#x73b0;&#x6709;&#x7684;FEC&#xff0c;&#x5219;&#x8be5;&#x8fb9;&#x7f18;&#x8282;&#x70b9;&#x9700;&#x8981;&#x4e3a;&#x8fd9;&#x4e00;&#x76ee;&#x7684;&#x5730;&#x5740;&#x5efa;&#x7acb; &#x4e00;&#x4e2a;&#x65b0;&#x7684;FEC&#x3002;"/>
<node CREATED="1321858456309" ID="ID_1816965950" MODIFIED="1321858457965" TEXT="&#x5982;&#x679c;MPLS &#x7f51;&#x7edc;&#x7684;&#x51fa;&#x8282;&#x70b9;&#x6709;&#x53ef;&#x4f9b;&#x5206;&#x914d;&#x7684;&#x6807;&#x7b7e;&#xff0c;&#x5219;&#x4e3a;FEC &#x5206;&#x914d;&#x6807;&#x7b7e;&#xff0c;&#x5e76;&#x4e3b;&#x52a8;&#x5411;&#x4e0a;&#x6e38; &#x53d1;&#x51fa;&#x6807;&#x7b7e;&#x6620;&#x5c04;&#x6d88;&#x606f;&#xff0c;&#x6807;&#x7b7e;&#x6620;&#x5c04;&#x6d88;&#x606f;&#x4e2d;&#x5305;&#x542b;&#x5206;&#x914d;&#x7684;&#x6807;&#x7b7e;&#x548c;&#x7ed1;&#x5b9a;&#x7684;FEC &#x7b49;&#x4fe1;&#x606f;"/>
<node CREATED="1321858465480" ID="ID_1963062219" MODIFIED="1321858466964" TEXT="&#x6536;&#x5230;&#x6807;&#x7b7e;&#x6620;&#x5c04;&#x6d88;&#x606f;&#x7684;LSR &#x5728;&#x5176;&#x6807;&#x7b7e;&#x8f6c;&#x53d1;&#x8868;&#x4e2d;&#x589e;&#x52a0;&#x76f8;&#x5e94;&#x7684;&#x6761;&#x76ee;&#xff0c;&#x7136;&#x540e;&#x4e3b;&#x52a8;&#x5411;&#x4e0a;&#x6e38;LSR &#x53d1;&#x9001;&#x5bf9;&#x4e8e;&#x6307;&#x5b9a;FEC &#x7684;&#x6807;&#x7b7e;&#x6620;&#x5c04;&#x6d88;&#x606f;"/>
<node CREATED="1321858476511" ID="ID_70347364" MODIFIED="1321858477870" TEXT="&#x5f53;&#x5165;&#x8282;&#x70b9;LSR &#x6536;&#x5230;&#x6807;&#x7b7e;&#x6620;&#x5c04;&#x6d88;&#x606f;&#x65f6;&#xff0c;&#x5b83;&#x4e5f;&#x9700;&#x8981;&#x5728;&#x6807;&#x7b7e;&#x8f6c;&#x53d1;&#x8868;&#x4e2d;&#x589e;&#x52a0;&#x76f8;&#x5e94;&#x7684;&#x6761;&#x76ee;&#x3002; &#x8fd9;&#x65f6;&#xff0c;&#x5c31;&#x5b8c;&#x6210;&#x4e86;LSP &#x7684;&#x5efa;&#x7acb;&#xff0c;&#x63a5;&#x4e0b;&#x6765;&#x5c31;&#x53ef;&#x4ee5;&#x5bf9;&#x8be5;FEC &#x5bf9;&#x5e94;&#x7684;&#x6570;&#x636e;&#x5206;&#x7ec4;&#x8fdb;&#x884c;&#x6807;&#x7b7e;&#x8f6c; &#x53d1;&#x4e86;"/>
</node>
<node CREATED="1321948207075" ID="ID_537949611" MODIFIED="1321948227323" TEXT="LSP &#x7ed1;&#x5b9a;&#x7b56;&#x7565;">
<node CREATED="1321947772072" ID="ID_14186319" MODIFIED="1321948368188" TEXT="LDP Inbound&#x7b56;&#x7565;&#xff1a;&#x9650;&#x5236;&#x4e0d;&#x5fc5;&#x8981;&#x7684;LSP&#xff0c;&#x8282;&#x7701;&#x5185;&#x5b58;">
<node CREATED="1321948452296" ID="ID_50220577" MODIFIED="1321948454220" TEXT="&#x5982;&#x679c;&#x672c;&#x5730;&#x548c;&#x90bb;&#x5c45;&#x5efa;&#x7acb;&#x7684;&#x662f;DU&#x4f1a;&#x8bdd;&#xff0c;&#x5219;&#x5efa;&#x7acb;Liberal LSP&#xff0c;&#x4e14;&#x6b64;Liberal LSP&#x4e0d;&#x53ef;&#x4ee5;&#x88ab;LDP FRR&#x9009;&#x4f5c;&#x5907;&#x4efd;LSP"/>
<node CREATED="1321948496219" ID="ID_699248430" MODIFIED="1321948497956" TEXT="&#x5982;&#x679c;&#x672c;&#x5730;&#x548c;&#x90bb;&#x5c45;&#x5efa;&#x7acb;&#x7684;&#x662f;DoD&#x4f1a;&#x8bdd;&#xff0c;&#x5219;&#x53d1;&#x9001;Release&#x6d88;&#x606f;&#x62c6;&#x9664;&#x6807;&#x7b7e;&#x7ed1;&#x5b9a;"/>
</node>
<node CREATED="1321948241899" ID="ID_1352618742" MODIFIED="1321948276646" TEXT="LDP Outbound&#x7b56;&#x7565;&#xff1a;&#x9650;&#x5236;&#x4e0d;&#x5fc5;&#x8981;&#x7684;LSP&#xff0c;&#x8282;&#x7701;&#x5185;&#x5b58;">
<node CREATED="1321948518048" ID="ID_349770395" MODIFIED="1321948519331" TEXT="&#x5982;&#x679c;&#x672c;&#x5730;&#x548c;&#x90bb;&#x5c45;&#x5efa;&#x7acb;&#x7684;&#x662f;DU&#x4f1a;&#x8bdd;&#xff0c;&#x5219;&#x6839;&#x636e;&#x6240;&#x914d;&#x7f6e;&#x7684;&#x7b56;&#x7565;&#x5411;&#x5bf9;&#x7b49;&#x4f53;&#x53d1;&#x9001;&#x7b26;&#x5408;&#x7b56;&#x7565;&#x8981;&#x6c42;&#x7684;&#x8def;&#x7531;FEC&#x7684;&#x6807;&#x7b7e;&#x6620;&#x5c04;&#x6d88;&#x606f;"/>
<node CREATED="1321948531302" ID="ID_1435070678" MODIFIED="1321948532648" TEXT="&#x5982;&#x679c;&#x672c;&#x5730;&#x548c;&#x90bb;&#x5c45;&#x5efa;&#x7acb;&#x7684;&#x662f;DoD&#x4f1a;&#x8bdd;&#xff0c;&#x5728;&#x6536;&#x5230;&#x4e0a;&#x6e38;&#x6807;&#x7b7e;&#x8bf7;&#x6c42;&#x540e;&#xff0c;&#x6839;&#x636e;&#x914d;&#x7f6e;&#x7684;&#x7b56;&#x7565;&#x67e5;&#x770b;&#x6b64;&#x8bf7;&#x6c42;&#x662f;&#x5426;&#x7b26;&#x5408;&#x6240;&#x914d;&#x7f6e;&#x7684;Outbound&#x7b56;&#x7565;&#xff0c;&#x7b26;&#x5408;&#x5219;&#x5411;&#x4e0a;&#x6e38;&#x53d1;&#x9001;&#x6807;&#x7b7e;&#x6620;&#x5c04;&#x6d88;&#x606f;&#xff0c;&#x4e0d;&#x7b26;&#x5408;&#x5219;&#x4e0d;&#x5411;&#x4e0a;&#x6e38;&#x53d1;&#x9001;&#x6807;&#x7b7e;&#x6620;&#x5c04;&#x6d88;&#x606f;&#x5e76;&#x53d1;&#x9001;&#x7c7b;&#x578b;&#x4e3a;No Route&#x7684;Notification&#x6d88;&#x606f;&#x901a;&#x544a;&#x4e0a;&#x6e38;&#x90bb;&#x5c45;"/>
</node>
<node CREATED="1321948086118" ID="ID_537302201" MODIFIED="1321948417604" TEXT="&#x5728;mpls ldp &#x89c6;&#x56fe;&#x4e0b;&#x6267;&#x884c; out/inbound peer xxxx Fec xx"/>
<node CREATED="1321947849502" ID="ID_1317248117" MODIFIED="1321948402316" TEXT="&#x591a;&#x4e2a;&#x7ed1;&#x5b9a;&#x7b56;&#x7565;&#x5171;&#x5b58;&#x7684;&#x60c5;&#x51b5;&#x4e0b;&#xff0c;&#x9488;&#x5bf9;&#x67d0;&#x4e00;&#x4e2a;&#x5bf9;&#x7b49;&#x4f53;&#xff0c;&#x5b9e;&#x9645;&#x751f;&#x6548;&#x7684;Inbound&#x7b56;&#x7565;&#x4ee5;&#x7b2c;&#x4e00;&#x6b21;&#x7684;&#x914d;&#x7f6e;&#x4e3a;&#x51c6;"/>
</node>
<node CREATED="1321948644076" ID="ID_802246903" MODIFIED="1321948658926" TEXT="LSP &#x5efa;&#x7acb;&#x89e6;&#x53d1;&#x7b56;&#x7565;">
<node CREATED="1321948703219" ID="ID_1305416448" MODIFIED="1321948896292" TEXT="Mpls&#x89c6;&#x56fe;&#x4e0b;&#x6267;&#x884c;LSP-Trigger {all / host /ip-prefix /none} &#x89e6;&#x53d1;&#x9759;&#x6001;&#x8def;&#x7531;&#x548c;IGP&#x8def;&#x7531;&#x7684;&#x7b56;&#x7565;"/>
<node CREATED="1321947929041" ID="ID_1074127793" MODIFIED="1321948406729" TEXT="&#x82e5;&#x5148;&#x540e;&#x914d;&#x7f6e;&#x7684;&#x4e24;&#x6761;&#x7ed1;&#x5b9a;&#x7b56;&#x7565;&#xff0c;&#x800c;&#x5173;&#x952e;&#x5b57;peer&#x90e8;&#x5206;&#x7684;&#x914d;&#x7f6e;&#x5b8c;&#x5168;&#x4e00;&#x6837;&#xff0c;&#x5219;&#x65b0;&#x7684;&#x914d;&#x7f6e;&#x4f1a;&#x8986;&#x76d6;&#x65e7;&#x7684;&#x914d;&#x7f6e;&#xff0c;&#x65b0;&#x914d;&#x7f6e;&#x751f;&#x6548;"/>
<node CREATED="1321948810378" ID="ID_1448547263" MODIFIED="1321948889305" TEXT="Mpls&#x89c6;&#x56fe;&#x4e0b;&#x6267;&#x884c;LSP-Trigger bgp-label-route {ip-prefix }&#x89e6;&#x53d1;&#x5e26;&#x6807;&#x7b7e;&#x7684;&#x516c;&#x7f51;BGP&#x8def;&#x7531;&#x5efa;&#x7acb;&#x7684;LSP&#x7b56;&#x7565;"/>
<node CREATED="1321948910111" ID="ID_1379255875" MODIFIED="1321948911659" TEXT="&#x7f3a;&#x7701;&#x60c5;&#x51b5;&#x4e0b;&#xff0c;&#x89e6;&#x53d1;&#x7b56;&#x7565;&#x4e3a;host&#xff0c;&#x5373;32&#x4f4d;&#x5730;&#x5740;&#x7684;&#x4e3b;&#x673a;IP&#x8def;&#x7531;&#x89e6;&#x53d1;&#x5efa;&#x7acb;LSP">
<node CREATED="1321948945346" ID="ID_787508578" MODIFIED="1321948947144" TEXT="&#x5982;&#x679c;&#x89e6;&#x53d1;&#x7b56;&#x7565;&#x4e3a;all&#xff0c;&#x5219;&#x6240;&#x6709;&#x9759;&#x6001;&#x8def;&#x7531;&#x548c;IGP&#x8def;&#x7531;&#x9879;&#x89e6;&#x53d1;&#x5efa;&#x7acb;LSP&#x3002;BGP&#x516c;&#x7f51;&#x8def;&#x7531;&#x4e0d;&#x80fd;&#x89e6;&#x53d1;&#x5efa;&#x7acb;LSP"/>
</node>
</node>
<node CREATED="1321949405960" ID="ID_1795415325" MODIFIED="1321949413397" TEXT="LDP&#x8de8;&#x57df;&#x62d3;&#x5c55;">
<node CREATED="1321949417209" ID="ID_491740426" MODIFIED="1321949430615" TEXT="&#x5bf9;&#x4e8e;&#x805a;&#x5408;&#x8def;&#x7531;&#xff0c;LDP&#x53ea;&#x80fd;&#x5efa;&#x7acb;Liberal LSP&#xff0c;&#x65e0;&#x6cd5;&#x5efa;&#x7acb;&#x8de8;&#x8d8a;IGP&#x533a;&#x57df;&#x7684;LDP LSP"/>
<node CREATED="1321949441240" ID="ID_707808631" MODIFIED="1321949442755" TEXT="&#x6b64;&#x65f6;&#xff0c;&#x53ef;&#x4ee5;&#x6267;&#x884c;longest-match&#x547d;&#x4ee4;&#xff0c;&#x4f7f;&#x80fd;LDP&#x6309;&#x7167;&#x6700;&#x957f;&#x5339;&#x914d;&#x65b9;&#x5f0f;&#x67e5;&#x627e;&#x8def;&#x7531;&#xff0c;&#x5efa;&#x7acb;&#x8de8;&#x57df;LDP LSP"/>
</node>
</node>
<node CREATED="1321858666251" ID="ID_1872496042" MODIFIED="1321858677688" TEXT="LDP &#x73af;&#x8def;&#x68c0;&#x6d4b;">
<node CREATED="1321858679282" ID="ID_322829245" MODIFIED="1321858700453" TEXT="&#x6700;&#x5927;&#x8df3;&#x6570;">
<node CREATED="1321858700453" ID="ID_6782046" MODIFIED="1321858710359" TEXT="&#x7f3a;&#x7701;&#x4e3a;32"/>
</node>
<node CREATED="1321858713812" ID="ID_819206704" MODIFIED="1321858724280" TEXT="&#x8def;&#x5f84;&#x5411;&#x91cf;">
<node CREATED="1321858733155" ID="ID_95749912" MODIFIED="1321858778669" TEXT="&#x8bb0;&#x5f55;&#x8def;&#x5f84;&#x4fe1;&#x606f;&#xff0c;&#x67e5;&#x770b;&#x662f;&#x5426;&#x6709;&#x81ea;&#x5df1;&#x7684;ID&#x5b58;&#x5728;&#xff0c;&#x7f3a;&#x7701;&#x6700;&#x5927;&#x6761;&#x6570;32"/>
</node>
</node>
<node CREATED="1321858990693" ID="ID_1494698170" MODIFIED="1321859000208" TEXT="BFD&#x68c0;&#x6d4b;LSP">
<node CREATED="1321859032863" ID="ID_261267911" MODIFIED="1321859208483" TEXT="Ingress&#x901a;&#x8fc7;LSP&#x53d1;&#x9001;Type=15&#x7684;TLV&#x56de;&#x58f0;&#x8bf7;&#x6c42;&#x62a5;&#x6587;"/>
<node CREATED="1321859210233" ID="ID_1591997289" MODIFIED="1321859248107" TEXT="Egress&#x901a;&#x8fc7;IP&#x53d1;&#x9001;BFD&#x63a7;&#x5236;&#x62a5;&#x6587;"/>
</node>
<node CREATED="1321859602332" ID="ID_1143529981" MODIFIED="1321859619863" TEXT="LDP FRR">
<node CREATED="1321859666299" ID="ID_1159236754" MODIFIED="1321859702954" TEXT="LDP &#x5de5;&#x4f5c;&#xff08;DU&#xff09;+&#xff08;Ordered&#xff09;+&#xff08;Liberal&#xff09;&#x65f6;&#xff0c;&#x9488;&#x5bf9;&#x4efb;&#x4e00;FEC&#xff0c;LSR &#x4f1a;&#x4fdd;&#x5b58;&#x6240;&#x6709;&#x6536;&#x5230;&#x7684;&#x6807;&#x7b7e;&#x6620;&#x5c04;&#xff0c;&#x4f46;&#x53ea;&#x6709;&#x4ece;&#x8be5;FEC &#x5bf9;&#x5e94;&#x8def;&#x7531;&#x7684;&#x4e0b;&#x4e00;&#x8df3;&#x53d1;&#x9001;&#x6765;&#x7684;&#x6807;&#x7b7e;&#x6620;&#x5c04;&#x4f1a;&#x751f;&#x6210;&#x6807;&#x7b7e;&#x8f6c;&#x53d1;&#x8868;&#x9879;"/>
<node CREATED="1321859723907" ID="ID_314482631" MODIFIED="1321859725407" TEXT="&#x5982;&#x679c;&#x4e3a;&#x6307;&#x5b9a;&#x63a5;&#x53e3;&#x6216;&#x4e0b;&#x4e00;&#x8df3;&#x7684;liberal &#x6807;&#x7b7e;&#x6620;&#x5c04;&#x4e5f;&#x751f;&#x6210;&#x6807;&#x7b7e;&#x8f6c;&#x53d1;&#x8868;&#x9879;&#xff0c;&#x5c31;&#x76f8; &#x5f53;&#x4e8e;&#x5efa;&#x7acb;&#x4e86;&#x5907;&#x4efd;LSP&#x3002;"/>
</node>
<node CREATED="1321859840404" ID="ID_1687990026" MODIFIED="1324715984281" TEXT="LDP&#x4e0e;IGP&#x540c;&#x6b65;">
<node CREATED="1321859856279" ID="ID_431973846" MODIFIED="1325143302390" TEXT="&#x540c;&#x6b65;&#x539f;&#x56e0;&#xff1a;IGP&#x7684;&#x6536;&#x655b;&#x901f;&#x5ea6;&#x5927;&#x4e8e;LDP&#x4f1a;&#x8bdd;&#x5efa;&#x7acb;&#x901f;&#x5ea6;">
<node CREATED="1321859979119" ID="ID_1241136571" MODIFIED="1321860018415" TEXT="&#x4e3b;&#x5907;&#x6545;&#x969c;&#x56de;&#x590d;&#x540e;&#x56de;&#x5207;&#x65f6;&#xff0c;&#x4f1a;&#x5bfc;&#x81f4;&#x6d41;&#x91cf;&#x4e2d;&#x65ad;"/>
</node>
<node CREATED="1321860035180" ID="ID_1633633186" MODIFIED="1321860068789" TEXT="&#x540c;&#x6b65;&#x539f;&#x7406;&#xff1a;&#x901a;&#x8fc7;&#x6291;&#x5236;IGP &#x5efa;&#x7acb;&#x90bb;&#x5c45;&#x5173;&#x7cfb;&#x6765;&#x63a8;&#x8fdf;&#x8def;&#x7531;&#x7684;&#x56de;&#x5207;&#xff0c;&#x76f4;&#x81f3; LDP &#x5b8c;&#x6210;&#x6536;&#x655b;">
<node CREATED="1321861231415" ID="ID_1154428970" MODIFIED="1321861282898" TEXT="&#x4e09;&#x4e2a;&#x5b9a;&#x65f6;&#x5668;&#xff1a;Hold-down timer&#xff0c;Hold-max-cost timer&#xff0c;Delay Timer"/>
<node CREATED="1321861340959" ID="ID_580606178" MODIFIED="1321861356662" TEXT="&#x542f;&#x52a8;Hold-down &#x5b9a;&#x65f6;&#x5668;&#xff0c;&#x5f53;&#x5b9a;&#x65f6;&#x5668;&#x8d85;&#x65f6;&#x6216;LDP &#x4f1a;&#x8bdd;&#x5efa;&#x7acb;&#x65f6;&#xff0c;IGP &#x63a5;&#x53e3;&#x624d;&#x4f1a;&#x5efa;&#x7acb;IGP &#x90bb;&#x5c45;"/>
<node CREATED="1321861373084" ID="ID_34811187" MODIFIED="1325143302390" TEXT="Hold-down &#x5b9a;&#x65f6;&#x5668;&#x8d85;&#x65f6;&#x540e;&#xff0c;&#x542f;&#x52a8;Hold-max-cost &#x5b9a;&#x65f6;&#x5668;&#x3002;IGP &#x5728;&#x672c;&#x5730;&#x8282;&#x70b9;&#x7684;&#x94fe;&#x8def;&#x72b6;&#x6001; &#x901a;&#x544a;&#x4e2d;&#xff0c;&#x5728;&#x4e3b;&#x94fe;&#x8def;&#x901a;&#x544a;&#x63a5;&#x53e3;&#x94fe;&#x8def;&#x7684;&#x6700;&#x5927;metric &#x503c;&#x3002;">
<node CREATED="1321861406192" ID="ID_1524961515" MODIFIED="1321861408020" TEXT="&#x5982;&#x679c;&#x8be5;&#x8fc7;&#x7a0b;&#x4e2d;LDP &#x4f1a;&#x8bdd;&#x72b6;&#x6001;&#x53d8; &#x4e3a;Up&#xff0c;&#x6216;&#x8005;Hold-max-cost &#x5b9a;&#x65f6;&#x5668;&#x8d85;&#x65f6;&#xff0c;&#x5219;&#x901a;&#x544a;&#x6b63;&#x786e;&#x7684;metric &#x503c;"/>
</node>
<node CREATED="1321861392677" ID="ID_1936450566" MODIFIED="1321861394208" TEXT="&#x6545;&#x969c;&#x94fe;&#x8def;&#x7684;LDP &#x4f1a;&#x8bdd;&#x91cd;&#x65b0;&#x5efa;&#x7acb;&#x4ee5;&#x540e;&#xff0c;&#x542f;&#x52a8;Delay &#x5b9a;&#x65f6;&#x5668;&#x7b49;&#x5f85;LSP &#x7684;&#x5efa;&#x7acb;"/>
</node>
<node CREATED="1321949531565" ID="ID_985859848" MODIFIED="1321949569907" TEXT="&#x8fdb;&#x5165;&#x63a5;&#x53e3;&#x89c6;&#x56fe;&#xff0c;&#x6267;&#x884c;OSPF / ISIS Ldp-sync"/>
<node CREATED="1321861205307" ID="ID_1487751588" MODIFIED="1321861222822" TEXT="&#x540c;&#x6b65;&#x72b6;&#x6001;">
<node CREATED="1321861418379" ID="ID_1693962009" MODIFIED="1321861425551" TEXT="init&#x72b6;&#x6001;"/>
<node CREATED="1321861426129" ID="ID_1725875337" MODIFIED="1321861438941" TEXT="Hold-down&#x72b6;&#x6001;">
<node CREATED="1321861506096" ID="ID_763880181" MODIFIED="1321861511643" TEXT="IGP &#x4e0d;&#x6536;&#x53d1;hello &#x62a5;&#x6587;&#xff0c;&#x6291;&#x5236;&#x6545;&#x969c;&#x6062;&#x590d;&#x94fe;&#x8def;&#x90bb;&#x5c45;&#x5173;&#x7cfb;&#x7684;&#x5efa;&#x7acb;">
<node CREATED="1321949602530" ID="ID_624820284" MODIFIED="1321949604373" TEXT="&#x7f3a;&#x7701;&#x60c5;&#x51b5;&#x4e0b;&#xff0c;hold-down&#x5b9a;&#x65f6;&#x5668;&#x7684;&#x503c;&#x662f;10&#x79d2;"/>
</node>
</node>
<node CREATED="1321861439644" ID="ID_939135733" MODIFIED="1321861454847" TEXT="Hold-max-cost&#x72b6;&#x6001;">
<node CREATED="1321861520783" ID="ID_1384794803" MODIFIED="1321861522502" TEXT="IGP &#x5efa;&#x7acb;&#x90bb;&#x5c45;&#x5e76;&#x5728;&#x4e3b;&#x94fe;&#x8def;&#x901a;&#x544a;&#x63a5;&#x53e3;&#x94fe;&#x8def;&#x7684;&#x6700;&#x5927;metric &#x503c;">
<node CREATED="1321949621825" ID="ID_651302653" MODIFIED="1321949622935" TEXT="&#x7f3a;&#x7701;&#x60c5;&#x51b5;&#x4e0b;&#xff0c;hold-max-cost&#x5b9a;&#x65f6;&#x5668;&#x7684;&#x503c;&#x662f;10&#x79d2;"/>
</node>
</node>
<node CREATED="1321861455581" ID="ID_904396815" MODIFIED="1321861480440" TEXT="Sync-achieved&#x88c5;&#x6001;">
<node CREATED="1321949649229" ID="ID_654931040" MODIFIED="1321949691226" TEXT="&#x63a5;&#x53e3;&#x89c6;&#x56fe;&#xff1a; mpls ldp timer igp-sync-delay  XX&#x7f3a;&#x7701;&#x60c5;&#x51b5;&#x4e0b;&#xff0c;delay&#x5b9a;&#x65f6;&#x5668;&#x7684;&#x503c;&#x662f;10&#x79d2;"/>
</node>
</node>
<node CREATED="1321950112034" ID="ID_1682475132" MODIFIED="1321950127033" TEXT="LDP&#x4e0e;&#x9759;&#x6001;&#x8def;&#x7531;&#x540c;&#x6b65;">
<node CREATED="1321950153249" ID="ID_208448698" MODIFIED="1321950155796" TEXT="&#x4e3b;&#x8981;&#x7528;&#x5728;&#x5b58;&#x5728;&#x4e3b;&#x5907;LSP&#x7684;MPLS&#x7ec4;&#x7f51;&#x4e2d;&#xff0c;LSR&#x4e4b;&#x95f4;&#x4f9d;&#x9760;&#x9759;&#x6001;&#x8def;&#x7531;&#x5efa;&#x7acb;LSP&#xff0c;&#x5f53;&#x4e3b;&#x94fe;&#x8def;&#x7684;LDP&#x4f1a;&#x8bdd;&#x6545;&#x969c;&#xff08;&#x975e;&#x94fe;&#x8def;&#x6545;&#x969c;&#x5bfc;&#x81f4;&#xff09;&#x65f6;&#xff0c;&#x6216;&#x8005;&#x4e3b;&#x94fe;&#x8def;&#x6545;&#x969c;&#x540e;&#x518d;&#x6062;&#x590d;&#x65f6;&#xff0c;&#x7528;&#x6765;&#x89e3;&#x51b3;LSP&#x6b63;&#x5207;&#x548c;&#x56de;&#x5207;&#x5bfc;&#x81f4;&#x7684;&#x6d41;&#x91cf;&#x4e22;&#x5931;&#x95ee;&#x9898;"/>
<node CREATED="1321950225336" ID="ID_889940630" MODIFIED="1321950226648" TEXT="&#x662f;&#x4e00;&#x79cd;&#x901a;&#x8fc7;&#x6291;&#x5236;&#x9759;&#x6001;&#x8def;&#x7531;&#x6d3b;&#x8dc3;&#x6765;&#x8feb;&#x4f7f;&#x6b63;&#x5207;&#x573a;&#x666f;&#x4e0b;&#x6d41;&#x91cf;&#x5207;&#x6362;&#x5230;&#x5907;&#x4efd;&#x94fe;&#x8def;&#xff0c;&#x56de;&#x5207;&#x573a;&#x666f;&#x4e0b;&#x63a8;&#x8fdf;&#x6d41;&#x91cf;&#x5207;&#x6362;&#x5230;&#x4e3b;&#x7528;&#x94fe;&#x8def;&#xff0c;&#x4f7f;&#x9759;&#x6001;&#x8def;&#x7531;&#x548c;LDP&#x4fdd;&#x6301;&#x540c;&#x6b65;&#x72b6;&#x6001;&#x7684;&#x6280;&#x672f;"/>
<node CREATED="1321950281299" ID="ID_778334034" MODIFIED="1321950291642" TEXT="&#x53ea;&#x6709;&#x914d;&#x7f6e;&#x4e86;&#x51fa;&#x63a5;&#x53e3;&#x7684;&#x9759;&#x6001;&#x8def;&#x7531;&#x624d;&#x80fd;&#x914d;&#x7f6e;LDP&#x548c;&#x9759;&#x6001;&#x8def;&#x7531;&#x540c;&#x6b65;&#xff1a;">
<node CREATED="1321950304344" ID="ID_131949381" MODIFIED="1321950305828" TEXT="ip route-static ip-address { mask | mask-length } interface-type interface-number [ nexthop-address ] [ preference preference | tag tag ] * ldp-sync [ description text ]&#xff0c;"/>
</node>
</node>
</node>
<node CREATED="1321950576566" ID="ID_835774824" MODIFIED="1321950587940" TEXT="&#x914d;&#x7f6e;LDP GTSM">
<node CREATED="1321950606875" ID="ID_128706580" MODIFIED="1321950618358" TEXT="&#x68c0;&#x6d4b;TTL&#x9632;&#x653b;&#x51fb;"/>
<node CREATED="1321950618796" ID="ID_1359726215" MODIFIED="1321950749954" TEXT="mpls ldp&#x89c6;&#x56fe;&#x4e0b;&#x6267;&#x884c;&#xff1a;gtsm peer x.x.x.x valid-ttl-hops xx ">
<node CREATED="1321950751079" ID="ID_1236474669" MODIFIED="1321950771577" TEXT="&#x5f53;LDP&#x5bf9;&#x7b49;&#x4f53;&#x53d1;&#x6765;&#x62a5;&#x6587;&#x7684;TTL&#x503c;&#x5728;255&#x2013;hops+1&#xff5e;255&#x8303;&#x56f4;&#x5185;&#xff0c;&#x5219;&#x63a5;&#x6536;&#x8be5;&#x62a5;&#x6587;&#xff0c;&#x5426;&#x5219;&#x4e22;&#x5f03;&#x8be5;&#x62a5;&#x6587;"/>
</node>
</node>
</node>
<node CREATED="1321946144520" ID="ID_12534030" MODIFIED="1321946150739" POSITION="left" TEXT="LSR ID">
<node CREATED="1321946169221" ID="ID_94654645" MODIFIED="1321946195625" TEXT="LSR ID&#x662f;&#x914d;&#x7f6e;MPLS &#x5176;&#x4ed6;&#x547d;&#x4ee4;&#x7684;&#x524d;&#x63d0;"/>
<node CREATED="1321946195968" ID="ID_73278476" MODIFIED="1321946265883" TEXT="LSR&#x6ca1;&#x6709;&#x7f3a;&#x7701;&#x7684;LSR ID&#xff0c;&#x5fc5;&#x987b;&#x624b;&#x5de5;&#x914d;&#x7f6e;&#xff0c;&#x63a8;&#x8350;&#x4f7f;&#x7528;Loopback &#x53e3;&#xff0c;TCP&#x53ef;&#x8fbe;"/>
<node CREATED="1321947119780" ID="ID_1312182458" MODIFIED="1321947122405" TEXT="&#x7f3a;&#x7701;&#x60c5;&#x51b5;&#x4e0b;&#xff0c;&#x516c;&#x7f51;&#x4e2d;&#x7684;LDP&#x4f20;&#x8f93;&#x5730;&#x5740;&#x7b49;&#x4e8e;&#x914d;&#x7f6e;LSR ID&#x4e2d;&#x914d;&#x7f6e;&#x7684;LSR ID"/>
<node CREATED="1321946266883" ID="ID_497732165" MODIFIED="1321946310347" TEXT="&#x82e5;&#x8981;&#x4fee;&#x6539;LSR ID&#x5fc5;&#x987b;&#x5148;Undo MPLS &#x5220;&#x9664;&#x6240;&#x6709;MPLS&#x914d;&#x7f6e;"/>
</node>
<node CREATED="1321866524113" ID="ID_1848464334" MODIFIED="1321928279989" POSITION="left" TEXT="&#x9759;&#x6001;LSP &#x914d;&#x7f6e;">
<node CREATED="1321866553486" ID="ID_581504858" MODIFIED="1321928651372" TEXT="&#x5206;&#x522b;&#x5bf9;ingress,transmit ,egress&#x8fdb;&#x884c;&#x914d;&#x7f6e;static-lsp xx&#xff0c;&#x6807;&#x7b7e;&#xff0c;&#x4e0b;&#x4e00;&#x8df3;/&#x51fa;&#x63a5;&#x53e3;"/>
<node CREATED="1321930018133" ID="ID_1669807988" MODIFIED="1321930045079" TEXT="&#x6bcf;&#x4e00;LSR&#x5fc5;&#x987b;&#x90fd;&#x6709;&#x53bb;&#x76ee;&#x7684;&#x5730;&#x7684;ip&#x8def;&#x7531;"/>
</node>
<node CREATED="1321844620219" ID="ID_645184292" MODIFIED="1321929953005" POSITION="left" TEXT="&#x6807;&#x7b7e;">
<node CREATED="1321844731607" ID="ID_1631823310" MODIFIED="1321844824229" TEXT="4&#x5b57;&#x8282;&#xff1a;20bit Label&#xff0c;3bit EXP &#xff08;Qos&#xff09;&#xff0c;1bit S&#xff08;&#x6808;&#x5e95;&#x6807;&#x8bc6;&#xff09;&#xff0c;8 bit TTL">
<node CREATED="1322121372594" ID="ID_867498942" MODIFIED="1322184721701" TEXT="PID &#x6807;&#x8bc6;&#x4e8c;&#x5c42;&#x5934;&#x540e;&#x9762;&#x7684;&#x62a5;&#x6587;&#x7c7b;&#x578b;&#xff1a;&#x4ee5;&#x592a;ox0800-IPv4,ox86dd-IPv6,ox8847-MPLS &#x5355;&#x64ad;&#xff0c;ox8848-MPLS&#x591a;&#x64ad;&#xff1b;PPPox8021-IPv4,ox8281-MPLS&#x5355;&#x64ad;&#xff0c;ox8283-MPLS&#x591a;&#x64ad;"/>
</node>
<node CREATED="1321844854010" ID="ID_1310701008" MODIFIED="1321844900555" TEXT="&#x6807;&#x7b7e;&#x64cd;&#x4f5c;&#xff1a;&#x538b;&#x5165;&#xff08;Push&#xff09;&#xff0c;&#x4ea4;&#x6362;&#xff08;Switch&#xff09;&#xff0c;&#x5f39;&#x51fa;&#xff08;Pop&#xff09;">
<node CREATED="1321844909196" ID="ID_1086303026" MODIFIED="1322135864592" TEXT="&#x5012;&#x6570;&#x7b2c;&#x4e8c;&#x8df3;&#x5f39;&#x51fa;PHP&#xff08;Penultimate Hop Popping&#xff09;">
<node CREATED="1322135877998" ID="ID_744002480" MODIFIED="1322135964918" TEXT="mpls &#x89c6;&#x56fe;&#x4e0b;&#x6267;&#x884c;label advertise {explicit-null / implicit-null / Non-null}"/>
<node CREATED="1322135967012" ID="ID_176093813" MODIFIED="1322192159568" TEXT="&#x8868;&#x793a;&#x7684;&#x610f;&#x601d;&#x5206;&#x522b;&#x662f;&#x663e;&#x793a;&#x7a7a;&#x6807;&#x7b7e;&#x4e3a;0&#xff09;&#xff0c;&#x9690;&#x5f0f;&#x7a7a;&#x6807;&#x7b7e;&#x4e3a;3&#xff09;&#xff0c;&#x975e;&#x7a7a;&#x7a7a;&#x6807;&#x7b7e;&#x4e3a;&#x51fa;&#x6807;&#x7b7e;&#x6b63;&#x5e38;&#xff09;"/>
</node>
</node>
<node CREATED="1322190825114" ID="ID_1698962997" MODIFIED="1322190864254" TEXT="&#x5165;&#x6807;&#x7b7e;&#x4e0e;&#x51fa;&#x6807;&#x7b7e;&#xff1a;">
<node CREATED="1322190837176" ID="ID_1668802904" MODIFIED="1322190854145" TEXT="&#x5165;&#x6807;&#x7b7e;&#x662f;&#x6211;&#x5206;&#x7ed9;&#x522b;&#x4eba;&#x7684;&#xff0c;&#x51fa;&#x6807;&#x7b7e;&#x662f;&#x522b;&#x4eba;&#x5206;&#x7ed9;&#x6211;&#x7684;&#x3002;"/>
<node CREATED="1322190850551" ID="ID_141763711" MODIFIED="1322190852192" TEXT="&#x6211;&#x5206;&#x914d;&#x7684;&#x6807;&#x7b7e;&#x662f;&#x7ed9;&#x522b;&#x4eba;&#x7528;&#x7684;&#xff0c;&#x6211;&#x4e0d;&#x4f1a;&#x6dfb;&#x52a0;&#x5230;&#x62a5;&#x6587;&#x4e2d; "/>
</node>
<node CREATED="1321846747155" ID="ID_1460377534" MODIFIED="1321846767701" TEXT="&#x6807;&#x7b7e;&#x7a7a;&#x95f4;">
<node CREATED="1321846769467" ID="ID_1376929964" MODIFIED="1321846781623" TEXT="0 &#xff5e; 15&#xff1a;&#x7279;&#x6b8a;&#x6807;&#x7b7e;">
<node CREATED="1321846816934" ID="ID_318986507" MODIFIED="1321846837262" TEXT="0&#xff1a;&#x8868;&#x793a;&#x8be5;&#x6807;&#x7b7e;&#x5fc5;&#x987b;&#x88ab;&#x5f39;&#x51fa;&#xff0c;&#x4e14;&#x62a5;&#x6587;&#x7684;&#x8f6c;&#x53d1;&#x5fc5;&#x987b;&#x57fa; &#x4e8e;IPv4"/>
<node CREATED="1321846883073" ID="ID_1872223065" MODIFIED="1321846887104" TEXT="1&#xff1a;&#x53ea;&#x6709;&#x51fa;&#x73b0;&#x5728;&#x975e;&#x6808;&#x5e95;&#x65f6;&#x624d;&#x6709;&#x6548;"/>
<node CREATED="1321846896167" ID="ID_1652970149" MODIFIED="1321846900557" TEXT="2&#xff1a;&#x8868;&#x793a;&#x8be5;&#x6807;&#x7b7e;&#x5fc5;&#x987b;&#x88ab;&#x5f39;&#x51fa;&#xff0c;&#x4e14;&#x62a5;&#x6587;&#x7684;&#x8f6c;&#x53d1;&#x5fc5;&#x987b;&#x57fa; &#x4e8e;IPv6"/>
<node CREATED="1321846916057" ID="ID_1865189761" MODIFIED="1321846920400" TEXT="3&#xff1a;&#x5012;&#x6570;&#x7b2c;&#x4e8c;&#x8df3;LSR &#x8fdb;&#x884c;&#x6807;&#x7b7e;&#x4ea4;&#x6362;&#x65f6;&#xff0c;&#x5982;&#x679c;&#x53d1;&#x73b0; &#x4ea4;&#x6362;&#x540e;&#x7684;&#x6807;&#x7b7e;&#x503c;&#x4e3a;3&#xff0c;&#x5219;&#x5c06;&#x6807;&#x7b7e;&#x5f39;&#x51fa;&#xff0c;&#x5e76;&#x5c06;&#x62a5; &#x6587;&#x53d1;&#x7ed9;&#x4e0b;&#x6700;&#x540e;&#x4e00;&#x8df3;"/>
</node>
<node CREATED="1321846782076" ID="ID_318446722" MODIFIED="1321846792529" TEXT="16 &#xff5e; 1023&#xff1a;&#x9759;&#x6001;LSP &#x548c;&#x9759;&#x6001;CR-LSP &#x5171;&#x4eab;&#x7684;&#x6807;&#x7b7e;&#x7a7a;&#x95f4;"/>
<node CREATED="1321846799888" ID="ID_1959762552" MODIFIED="1321846801669" TEXT="1024 &#x4ee5;&#x4e0a;&#xff1a;LDP&#x3001;RSVP-TE&#x3001;MP-BGP &#x7b49;&#x52a8;&#x6001;&#x4fe1;&#x4ee4;&#x534f;&#x8bae;&#x7684;&#x6807;&#x7b7e;&#x7a7a;&#x95f4;"/>
</node>
<node CREATED="1322188624703" ID="ID_1463892831" MODIFIED="1322188631938" TEXT="&#x6807;&#x7b7e;&#x62c6;&#x9664;">
<node CREATED="1322188633609" ID="ID_1527303737" MODIFIED="1322188643468" TEXT="&#x6807;&#x7b7e;&#x91ca;&#x653e;">
<node CREATED="1322188658171" ID="ID_349592944" MODIFIED="1322188659827" TEXT="&#x4e0a;&#x6e38;&#x4e3b;&#x52a8;&#x53d1;&#x9001;&#x6807;&#x7b7e;&#x91ca;&#x653e;&#x6d88;&#x606f;&#x901a;&#x77e5;&#x4e0b;&#x6e38;&#x91ca;&#x653e;&#x67d0;&#x4e00;&#x6807;&#x7b7e;&#xff0c;&#x4ee5;&#x540e;&#x4e0d;&#x518d;&#x4f7f;&#x7528;&#x8be5;&#x6807;&#x7b7e;&#x53d1;&#x9001;&#x6570;&#x636e;&#xff0c;&#x6807;&#x7b7e;&#x91ca;&#x653e;&#x6d88;&#x606f;&#x4e0d;&#x9700;&#x8981;&#x786e;&#x8ba4;&#x6d88;&#x606f;"/>
</node>
<node CREATED="1322188664265" ID="ID_948612429" MODIFIED="1322188669187" TEXT="&#x6807;&#x7b7e;&#x64a4;&#x9500;">
<node CREATED="1322188671280" ID="ID_1253517634" MODIFIED="1322188684546" TEXT="&#x4e0b;&#x6e38;&#x5411;&#x4e0a;&#x6e38;&#x53d1;&#x9001;&#x6807;&#x7b7e;&#x64a4;&#x6d88;&#x6d88;&#x606f;&#x901a;&#x77e5;&#x4e0a;&#x6e38;&#x505c;&#x6b62;&#x4f7f;&#x7528;&#x67d0;&#x4e2a;&#x6807;&#x7b7e;&#x65f6;&#xff0c;&#x9700;&#x8981;&#x4e0a;&#x6e38;&#x8def;&#x7531;&#x5668;&#x53d1;&#x9001;&#x6807;&#x7b7e;&#x91ca;&#x653e;&#x6d88;&#x606f;&#x786e;&#x8ba4; "/>
</node>
</node>
</node>
<node CREATED="1321845011614" ID="ID_917088688" MODIFIED="1321951845904" POSITION="left" TEXT="MPLS&#x8f6c;&#x53d1;">
<node CREATED="1321845575367" ID="ID_1915104004" MODIFIED="1321845579851" TEXT="&#x8f6c;&#x53d1;&#x8fc7;&#x7a0b;">
<node CREATED="1321845589601" ID="ID_1182501602" MODIFIED="1321845631006" TEXT="Ingress&#xff1a;&#x901a;&#x8fc7;&#x67e5;&#x8be2;FIB &#x8868;&#x548c;NHLFE &#x8868;&#x6307;&#x5bfc;&#x62a5;&#x6587;&#x7684;&#x8f6c;&#x53d1;">
<node CREATED="1321845818734" ID="ID_767197587" MODIFIED="1321845917903" TEXT="&#x6839;&#x636e;FIB&#x8868;&#x4e2d;&#x67e5;&#x627e;&#x5bf9;&#x5e94;Tunnel ID&#xff0c;&#x636e;&#x6b64;&#x627e;&#x5230;&#x5bf9;&#x5e94;NHLFE&#x8868;&#xff0c;&#x5f97;&#x5230;&#x4e0b;&#x4e00;&#x6761;&#xff0c;&#x51fa;&#x63a5;&#x53e3;&#xff0c;&#x51fa;&#x6807;&#x7b7e;&#x548c;&#x6807;&#x7b7e;&#x64cd;&#x4f5c;Push"/>
<node CREATED="1321845918950" ID="ID_267879148" MODIFIED="1321845985823" TEXT="&#x538b;&#x5165;&#x6807;&#x7b7e;&#x540e;&#xff0c;&#x6839;&#x636e;Qos&#x5904;&#x7406;Exp,&#x540c;&#x65f6;&#x5904;&#x7406;TTL&#xff0c;&#x5c01;&#x88c5;&#x540e;&#x53d1;&#x9001;&#x7ed9;&#x4e0b;&#x4e00;&#x6761;"/>
</node>
<node CREATED="1321845642865" ID="ID_368259745" MODIFIED="1321845651989" TEXT="Transit&#xff1a;&#x901a;&#x8fc7;&#x67e5;&#x8be2;ILM &#x8868;&#x548c;NHLFE &#x8868;&#x6307;&#x5bfc;MPLS &#x62a5;&#x6587;&#x7684;&#x8f6c;&#x53d1;">
<node CREATED="1321846001948" ID="ID_163091064" MODIFIED="1321846086619" TEXT="&#x6839;&#x636e;&#x6807;&#x7b7e;&#x503c;&#x67e5;&#x627e;&#x5bf9;&#x5e94;&#x7684;IML&#xff0c;&#x5f97;&#x5230;Token&#xff0c;&#x636e;&#x6b64;&#x627e;&#x5230;&#x5bf9;&#x5e94;NHLFE&#xff0c;&#x5f97;&#x5230;&#x5f97;&#x5230;&#x4e0b;&#x4e00;&#x6761;&#xff0c;&#x51fa;&#x63a5;&#x53e3;&#xff0c;&#x51fa;&#x6807;&#x7b7e;&#x548c;&#x6807;&#x7b7e;&#x64cd;&#x4f5c;"/>
<node CREATED="1321846087306" ID="ID_1429893231" MODIFIED="1321846159322" TEXT="&#x82e5;&#x6807;&#x7b7e;&#x503c;&gt;=16,&#x64cd;&#x4f5c;&#x4e3a;Swap">
<node CREATED="1321846167025" ID="ID_171467608" MODIFIED="1321846208212" TEXT="&#x65b0;&#x6807;&#x7b7e;&#x66ff;&#x6362;&#xff0c;&#x5904;&#x7406;EXP&#x53ca;TTL&#xff0c;&#x5c01;&#x88c5;&#x53d1;&#x7ed9;&#x4e0b;&#x4e00;&#x8df3;"/>
</node>
<node CREATED="1321846146681" ID="ID_1234535318" MODIFIED="1321846155837" TEXT="&#x82e5;&#x6807;&#x7b7e;=3&#xff0c;&#x64cd;&#x4f5c;&#x4e3a;Pop">
<node CREATED="1321846214446" ID="ID_1055277805" MODIFIED="1321846248587" TEXT="&#x5f39;&#x51fa;&#x6807;&#x7b7e;&#xff0c;&#x540c;&#x4e8b;&#x5904;&#x7406;Exp&#x548c;TTL&#xff0c;&#x8fdb;&#x884c;IP&#x8f6c;&#x53d1;&#x6216;&#x4e0b;&#x4e00;&#x5c42;&#x6807;&#x7b7e;&#x8f6c;&#x53d1;"/>
</node>
</node>
<node CREATED="1321845662192" ID="ID_1419283358" MODIFIED="1321845668067" TEXT="Egress&#xff1a;&#x901a;&#x8fc7;&#x67e5;&#x8be2;ILM &#x8868;&#x6307;&#x5bfc;MPLS &#x62a5;&#x6587;&#x7684;&#x8f6c;&#x53d1;">
<node CREATED="1321846273493" ID="ID_805239705" MODIFIED="1321846309274" TEXT="&#x67e5;&#x770b;ILM&#x8868;&#x83b7;&#x5f97;&#x6807;&#x7b7e;&#x64cd;&#x4f5c;&#xff0c;&#x540c;&#x65f6;&#x5904;&#x7406;Exp&#x548c;TTL">
<node CREATED="1321846309274" ID="ID_101334844" MODIFIED="1321846337867" TEXT="&#x82e5;&#x6807;&#x7b7e;&#x4e2d;S=1&#xff0c;&#x76f4;&#x63a5;&#x8fdb;&#x884c;Ip&#x8f6c;&#x53d1;"/>
<node CREATED="1321846339945" ID="ID_37062822" MODIFIED="1321846378616" TEXT="&#x82e5;&#x6807;&#x7b7e;&#x4e2d;S=0&#xff0c;&#x6807;&#x660e;&#x8fd8;&#x6709;&#x4e0b;&#x4e00;&#x5c42;&#x6807;&#x7b7e;&#xff0c;&#x7ee7;&#x7eed;&#x8fdb;&#x884c;&#x4e0b;&#x4e00;&#x5c42;&#x6807;&#x7b7e;&#x8f6c;&#x53d1;"/>
</node>
</node>
</node>
<node CREATED="1321846428115" ID="ID_512020002" MODIFIED="1321846435084" TEXT="TTL&#x7684;&#x5904;&#x7406;">
<node CREATED="1321846436724" ID="ID_248897298" MODIFIED="1321846448771" TEXT="Uniform &#x6a21;&#x5f0f;">
<node CREATED="1321846506973" ID="ID_919704488" MODIFIED="1321846529285" TEXT="&#x5728;&#x5165;&#x8282;&#x70b9;&#xff0c;IP TTL &#x51cf;1 &#x6620;&#x5c04;&#x5230;MPLS TTL &#x5b57;&#x6bb5;&#xff0c;&#x6b64;&#x540e;&#x62a5;&#x6587; &#x5728;MPLS &#x7f51;&#x7edc;&#x4e2d;&#x6309;&#x7167;&#x6807;&#x51c6;&#x7684;TTL &#x5904;&#x7406;&#x65b9;&#x5f0f;&#x5904;&#x7406;&#x3002;"/>
<node CREATED="1321846522879" ID="ID_1323010588" MODIFIED="1321846524660" TEXT="&#x5728;&#x51fa;&#x8282;&#x70b9;&#x5c06;MPLS TTL &#x51cf;1 &#x540e;&#x6620;&#x5c04;&#x5230; IP TTL &#x5b57;&#x6bb5;"/>
</node>
<node CREATED="1321846449583" ID="ID_966438183" MODIFIED="1321846465771" TEXT="Pipe&#x6a21;&#x5f0f;&#xff08;&#x7f3a;&#x7701;&#xff09;">
<node CREATED="1321846650860" ID="ID_1266946243" MODIFIED="1321846653282" TEXT="&#x5728;&#x5165;&#x8282;&#x70b9;&#xff0c;IP TTL &#x503c;&#x51cf;1&#xff0c;MPLS TTL &#x5b57;&#x6bb5;&#x4e3a;&#x56fa;&#x5b9a;&#x503c;&#xff0c;&#x6b64;&#x540e;&#x62a5;&#x6587;&#x5728;MPLS &#x7f51;&#x7edc;&#x4e2d;&#x6309;&#x7167;&#x6807; &#x51c6;&#x7684;TTL &#x5904;&#x7406;&#x65b9;&#x5f0f;&#x5904;&#x7406;&#x3002;"/>
<node CREATED="1321846664001" ID="ID_1178885715" MODIFIED="1321846665532" TEXT="IP &#x5206;&#x7ec4;&#x7ecf;&#x8fc7;MPLS &#x7f51; &#x7edc;&#x65f6;&#xff0c;&#x65e0;&#x8bba;&#x7ecf;&#x8fc7;&#x591a;&#x5c11;&#x8df3;&#xff0c;IP TTL &#x53ea;&#x5728;&#x5165;&#x8282;&#x70b9;&#x548c;&#x51fa;&#x8282;&#x70b9;&#x5206;&#x522b;&#x51cf;1"/>
</node>
</node>
</node>
<node CREATED="1321847250548" ID="ID_1655851033" MODIFIED="1321951854544" POSITION="left" TEXT="MPLS Ping/Trancerout">
<node CREATED="1321847321656" ID="ID_844334986" MODIFIED="1321847338858" TEXT="UDP &#x62a5;&#x6587;&#x683c;&#x5f0f;&#xff0c;&#x7aef;&#x53e3;&#x53f7;&#xff1a;3503">
<node CREATED="1321847386654" ID="ID_179939918" MODIFIED="1321847398107" TEXT="MPLS Echo Request &#x4e2d;&#x643a;&#x5e26;&#x9700;&#x8981;&#x68c0;&#x6d4b;&#x7684;FEC &#x4fe1;&#x606f;&#xff0c;&#x548c;&#x5176;&#x4ed6;&#x5c5e;&#x4e8e;&#x6b64;FEC &#x7684;&#x62a5;&#x6587;&#x4e00;&#x6837;&#x6cbf;LSP &#x53d1;&#x9001;&#xff0c;&#x4ece;&#x800c;&#x5b9e;&#x73b0;&#x5bf9;LSP &#x7684;&#x68c0;&#x6d4b;"/>
<node CREATED="1321847406357" ID="ID_701155088" MODIFIED="1321847411341" TEXT="MPLS Echo Request &#x901a;&#x8fc7;MPLS &#x8f6c;&#x53d1;&#x7ed9;&#x76ee;&#x7684;&#x7aef;&#xff0c;&#x800c;MPLS Echo Reply &#x5219;&#x901a;&#x8fc7;IP &#x8f6c;&#x53d1;&#x7ed9;&#x6e90;&#x7aef;"/>
<node CREATED="1321847468480" ID="ID_1960913374" MODIFIED="1321847470058" TEXT="&#x4e3a;&#x4e86;&#x9632;&#x6b62;&#x6d88;&#x606f;&#x5230;&#x8fbe;Egress &#x8282;&#x70b9;&#x540e;&#x53c8;&#x88ab;&#x8f6c;&#x53d1;&#x7ed9;&#x5176;&#x4ed6;&#x8282;&#x70b9;&#xff0c;Echo Request &#x6d88;&#x606f;&#x7684;IP &#x5934;&#x4e2d;&#x76ee; &#x7684;&#x5730;&#x5740;&#x8bbe;&#x7f6e;&#x4e3a;127.0.0.1/8&#xff08;&#x672c;&#x673a;&#x73af;&#x56de;&#x5730;&#x5740;&#xff09;&#xff0c;IP &#x5934;&#x4e2d;&#x7684;TTL &#x503c;&#xff1d; 1"/>
</node>
</node>
<node CREATED="1321844963304" ID="ID_1333058612" MODIFIED="1321951864871" POSITION="left" TEXT="LSP&#x5efa;&#x7acb;">
<node CREATED="1321844968319" ID="ID_1665917795" MODIFIED="1321844975694" TEXT="&#x9759;&#x6001;LSP&#x5efa;&#x7acb;"/>
<node CREATED="1321844976054" ID="ID_1560304359" MODIFIED="1321844982069" TEXT="&#x52a8;&#x6001;LSP&#x5efa;&#x7acb;">
<node CREATED="1321844993256" ID="ID_934254333" MODIFIED="1321854151907" TEXT="LDP&#xff08;Label Distribution Protocol&#xff09;">
<node CREATED="1321944154787" ID="ID_1871038587" MODIFIED="1321944156771" TEXT="&#x901a;&#x5e38;&#x60c5;&#x51b5;&#x4e0b;&#xff0c;&#x4f7f;&#x7528;&#x7f3a;&#x7701;&#x7684;&#x89e6;&#x53d1;&#x7b56;&#x7565;&#xff0c;&#x5373;&#x201c;host&#x201d;&#x65b9;&#x5f0f;&#x89e6;&#x53d1;&#x5efa;&#x7acb;LDP LSP&#x5373;&#x53ef;"/>
</node>
<node CREATED="1321844996162" ID="ID_288698343" MODIFIED="1321844999459" TEXT="MP-BGP"/>
</node>
</node>
<node CREATED="1322185020725" ID="ID_1298322365" MODIFIED="1322185048365" POSITION="left" TEXT="MPLS Qos/TE&#x5b9e;&#x73b0;">
<node CREATED="1322185051958" ID="ID_704182146" MODIFIED="1322185058958" TEXT="L-LSP">
<node CREATED="1322185088317" ID="ID_395186171" MODIFIED="1322185089848" TEXT="&#x6709;&#x5404;&#x81ea;&#x9884;&#x5b9a;&#x7684;&#x5e26;&#x5bbd;&#x8d44;&#x6e90;&#x7ea6;&#x675f;&#xff0c;&#x652f;&#x6301;&#x4e00;&#x4e2a;&#x670d;&#x52a1;&#x4f18;&#x5148;&#x7ea7;&#x522b;&#xff0c;&#x901a;&#x8fc7;EXP&#x57df;&#x643a;&#x5e26;&#x4e22;&#x5f03;&#x4f18;&#x5148;&#x7ea7;&#xff0c;&#x670d;&#x52a1;&#x4f18;&#x5148;&#x7ea7;&#x522b;&#x901a;&#x8fc7;Incoming Label&#x51b3;&#x5b9a;"/>
<node CREATED="1322185799503" ID="ID_1253527933" MODIFIED="1322185821408" TEXT="&#x5b9e;&#x73b0;&#x662f;&#x7528;Incoming Label&#x67e5;&#x8be2;L-LSP BA&#x8868;&#x5f97;&#x5230;&#x6807;&#x7b7e;&#x5bf9;&#x4e8e;&#x7684;&#x4f18;&#x5148;&#x7ea7;&#x522b;&#x548c;&#x4e22;&#x5f03;&#x7ea7;&#x522b;">
<node CREATED="1322185899905" ID="ID_1490428730" MODIFIED="1322185901983" TEXT="&#x4f18;&#x5148;&#x7ea7;&#x522b;&#x51b3;&#x5b9a;&#x62a5;&#x6587;&#x8fdb;&#x5165;&#x4ec0;&#x4e48;&#x7ea7;&#x522b;&#x7684;&#x6d41;&#x961f;&#x5217;&#xff0c;&#x6d41;&#x961f;&#x5217;&#x5c06;&#x88ab;&#x6d41;&#x91cf;&#x7ba1;&#x7406;&#x6240;&#x8c03;&#x5ea6;&#x3002;"/>
<node CREATED="1322185902327" ID="ID_441565489" MODIFIED="1322185911045" TEXT="&#x4e22;&#x5f03;&#x7ea7;&#x522b;&#x5c06;&#x88ab;&#x6d41;&#x91cf;&#x7ba1;&#x7406;&#x7528;&#x4e8e;WRED&#x7b97;&#x6cd5;&#xff0c;&#x5b9e;&#x73b0;&#x62e5;&#x585e;&#x7ba1;&#x7406;&#x548c;&#x76f8;&#x5e94;&#x4e22;&#x5f03;"/>
</node>
<node CREATED="1322185832658" ID="ID_846466195" MODIFIED="1322185834267" TEXT="&#x6709;&#x4e9b;&#x82af;&#x7247;&#x5b9e;&#x73b0;&#xff0c;&#x662f;&#x76f4;&#x63a5;&#x5c06;&#x4f18;&#x5148;&#x7ea7;&#x522b;&#x653e;&#x5165;ILM&#x8868;&#x4e2d;&#xff0c;&#x7528;&#x5165;&#x6807;&#x7b7e;index ILM&#x5373;&#x53ef;&#x5f97;&#x5230;&#x4f18;&#x5148;&#x7ea7;&#xff0c;&#x800c;&#x4e22;&#x5f03;&#x7ea7;&#x522b;&#x5219;&#x76f4;&#x63a5;&#x53d6;EXP"/>
<node CREATED="1322185842173" ID="ID_190316661" MODIFIED="1322185844595" TEXT="&#x5e26;&#x5bbd;&#x7ea6;&#x675f;&#x901a;&#x5e38;&#x90fd;&#x5b58;&#x653e;&#x5728;ILM&#x8868;&#x4e2d;&#xff0c;&#x4f7f;&#x7528;Incoming Label&#x67e5;ILM&#x8868;&#x5f97;&#x5230;">
<node CREATED="1322185926592" ID="ID_1985896867" MODIFIED="1322185928326" TEXT="&#x5e26;&#x5bbd;&#x7ea6;&#x675f;&#x5c06;&#x7528;&#x4e8e;&#x82af;&#x7247;&#x5bf9;&#x6d41;&#x91cf;&#x7684;&#x9650;&#x5236;&#xff0c;&#x901a;&#x5e38;&#x4f7f;&#x7528;CAR&#x7b97;&#x6cd5;&#x6765;&#x5b9e;&#x73b0;"/>
<node CREATED="1322185928717" ID="ID_1449840523" MODIFIED="1322185943091" TEXT="&#x5e26;&#x5bbd;&#x7ea6;&#x675f;&#x53ef;&#x5728;&#x6d41;&#x91cf;&#x5165;&#x53e3;&#x548c;&#x51fa;&#x53e3;&#x65f6;&#x5904;&#x7406;&#xff0c;&#x4e5f;&#x53ef;&#x4ee5;&#x5728;&#x6d41;&#x91cf;&#x7ba1;&#x7406;&#x65f6;&#x5904;&#x7406;"/>
</node>
</node>
<node CREATED="1322185059349" ID="ID_608598938" MODIFIED="1322185063536" TEXT="E-LSP">
<node CREATED="1322185121221" ID="ID_1471360195" MODIFIED="1322185122783" TEXT="&#x5171;&#x4eab;&#x67d0;&#x79cd;&#x9884;&#x5b9a;&#x7684;&#x5e26;&#x5bbd;&#x8d44;&#x6e90;&#x7ea6;&#x675f;&#xff0c;&#x652f;&#x6301;8&#x4e2a;&#x670d;&#x52a1;&#x4f18;&#x5148;&#x7ea7;&#x522b;&#x548c;&#x4e22;&#x5f03;&#x7ea7;&#x522b;&#xff0c;&#x670d;&#x52a1;&#x4f18;&#x5148;&#x7ea7;&#x522b;&#x548c;&#x4e22;&#x5f03;&#x7ea7;&#x522b;&#x90fd;&#x7531;EXP&#x51b3;&#x5b9a;"/>
<node CREATED="1322185854766" ID="ID_1834328931" MODIFIED="1322185855798" TEXT="&#x5b9e;&#x73b0;&#x662f;&#x7528;MPLS&#x534f;&#x8bae;&#x5934;&#x4e2d;&#x7684;3bit&#x7684;EXP&#x57df;&#x6bb5;&#xff0c; EXP&#x65e2;&#x662f;&#x7f16;&#x7801;&#x670d;&#x52a1;&#x7c7b;&#x578b;&#x3002;&#x4f7f;&#x7528;EXP&#x67e5;&#x8be2;E-LSP BA&#x53ef;&#x4ee5;&#x5f97;&#x5230;&#x670d;&#x52a1;&#x4f18;&#x5148;&#x7ea7;&#x522b;&#x548c;&#x4e22;&#x5f03;&#x7ea7;&#x522b;"/>
<node CREATED="1322185863610" ID="ID_171456350" MODIFIED="1322185865313" TEXT="&#x5e26;&#x5bbd;&#x7ea6;&#x675f;&#x901a;&#x8fc7;Incoming Label&#x67e5;&#x8be2;ILM&#x8868;&#x5f97;&#x5230;"/>
</node>
</node>
<node CREATED="1321845707847" ID="ID_1074212162" MODIFIED="1324716000562" POSITION="left" TEXT="&#x57fa;&#x672c;&#x6982;&#x5ff5;&#xff08;&#x9690;&#x85cf;&#x6a21;&#x5f0f;&#x4e0b;&#x67e5;&#x770b;&#x8868;&#x9879;&#xff09;">
<node CREATED="1321844661952" ID="ID_86293677" MODIFIED="1322182419367" TEXT="&#x8f6c;&#x53d1;&#x7b49;&#x4ef7;&#x7c7b;FECFEC&#xff08;Forwarding Equivalence Class&#xff09;">
<node CREATED="1321844710107" ID="ID_1000114200" MODIFIED="1321844711592" TEXT="&#x4e00;&#x7ec4;&#x5177;&#x6709;&#x67d0;&#x4e9b;&#x5171;&#x6027;&#x7684;&#x6570;&#x636e;&#x6d41;&#x7684;&#x96c6; &#x5408;&#x3002;&#x8fd9;&#x4e9b;&#x6570;&#x636e;&#x6d41;&#x5728;&#x8f6c;&#x53d1;&#x8fc7;&#x7a0b;&#x4e2d;&#x88ab;LSR &#x4ee5;&#x76f8;&#x540c;&#x65b9;&#x5f0f;&#x5904;&#x7406;"/>
</node>
<node CREATED="1321845024785" ID="ID_884167275" MODIFIED="1322182418290" TEXT="Tunnel ID">
<node CREATED="1321845044300" ID="ID_1712200985" MODIFIED="1321845148980" TEXT="&#x672c;&#x5730;&#x6709;&#x6548;&#xff0c;32bit ,Token+&#x5e8f;&#x5217;&#x53f7;+&#x51fa;&#x63a5;&#x53e3;&#x69fd;&#x4f4d;&#x53f7;+Yoken&#x5206;&#x914d;&#x65b9;&#x5f0f;"/>
<node CREATED="1321845673379" ID="ID_317132673" MODIFIED="1321845693753" TEXT="&#x5728;MPLS &#x8f6c;&#x53d1;&#x8fc7;&#x7a0b;&#x4e2d;&#xff0c;FIB&#x3001;ILM &#x548c;NHLFE &#x8868;&#x9879;&#x5b9e;&#x9645;&#x4e0a;&#x662f;&#x901a;&#x8fc7;Tunnel ID &#x4e2d;&#x7684;Token &#x5b57; &#x6bb5;&#x5173;&#x8054;&#x7684;"/>
</node>
<node CREATED="1321845157917" ID="ID_1528312955" MODIFIED="1322182420226" TEXT="NHLFE&#xff08;Next Hop Label Forwarding Entry&#xff09;">
<node CREATED="1321845202493" ID="ID_132641417" MODIFIED="1321845288190" TEXT="&#x4e0b;&#x4e00;&#x8df3;&#x6807;&#x7b7e;&#x8f6c;&#x53d1;&#x8868;&#x9879;&#xff0c;&#x7528;&#x4e8e;&#x6307;&#x5bfc;MPLS &#x62a5;&#x6587; &#x7684;&#x8f6c;&#x53d1;"/>
<node CREATED="1321845292315" ID="ID_505915751" MODIFIED="1321845302315" TEXT="Tunnel ID&#x3001;&#x51fa;&#x63a5;&#x53e3;&#x3001;&#x4e0b;&#x4e00;&#x8df3;&#x3001;&#x51fa;&#x6807;&#x7b7e;&#x3001;&#x6807;&#x7b7e;&#x64cd;&#x4f5c;&#x7c7b;&#x578b;&#x7b49;&#x4fe1;&#x606f;"/>
<node CREATED="1322182901070" ID="ID_127774957" MODIFIED="1322182903381" TEXT="IP&#x62a5;&#x6587;&#x8f6c;&#x53d1;&#x65f6;&#x4ece;FIB-&gt;NHLFE&#xff0c;MPLS&#x62a5;&#x6587;&#x8f6c;&#x53d1;&#x65f6;&#x4ece;ILM-&gt;NHLFE"/>
</node>
<node CREATED="1321845167339" ID="ID_1863605596" MODIFIED="1322182420803" TEXT="ILM&#xff08;Incoming Label Map&#xff09;">
<node CREATED="1321845321033" ID="ID_641842488" MODIFIED="1321845381359" TEXT="&#x5165;&#x6807;&#x7b7e;&#x5230;&#x4e00;&#x7ec4;&#x4e0b;&#x4e00;&#x8df3;&#x6807;&#x7b7e;&#x8f6c;&#x53d1;&#x8868;&#x9879;&#x7684;&#x6620;&#x5c04;">
<node CREATED="1322182784607" ID="ID_319972622" MODIFIED="1322182786091" TEXT="&#x5c06;&#x5206;&#x914d;&#x51fa;&#x53bb;&#x7684;&#x6807;&#x7b7e;&#x4e0e;FEC&#x5bc6;&#x5207;&#x7ed1;&#x5b9a;&#xff0c;&#x5f62;&#x6210;FEC&#x4e0e;&#x6807;&#x7b7e;&#x5bf9;&#x7b49;&#xff0c;&#x5373;&#x662f;&#x4e00;&#x79cd;&#x6620;&#x5c04;&#x7684;&#x5173;&#x7cfb;"/>
</node>
<node CREATED="1321845401014" ID="ID_1642409349" MODIFIED="1321845402483" TEXT="Tunnel ID&#x3001;&#x5165;&#x6807;&#x7b7e;&#x3001;&#x5165;&#x63a5;&#x53e3;&#x3001;&#x6807;&#x7b7e;&#x64cd;&#x4f5c;&#x7c7b;&#x578b;&#x7b49;&#x4fe1;&#x606f;"/>
<node CREATED="1321845416795" ID="ID_1120792819" MODIFIED="1321845418373" TEXT="&#x5728;Transit &#x8282;&#x70b9;&#x7684;&#x4f5c;&#x7528;&#x662f;&#x5c06;&#x6807;&#x7b7e;&#x548c;NHLFE &#x7ed1;&#x5b9a;&#x3002;&#x901a;&#x8fc7;&#x6807;&#x7b7e;&#x7d22;&#x5f15;ILM &#x8868;&#xff0c;&#x5c31;&#x76f8;&#x5f53;&#x4e8e; &#x4f7f;&#x7528;&#x76ee;&#x7684;IP &#x5730;&#x5740;&#x67e5;&#x8be2;FIB&#xff0c;&#x80fd;&#x591f;&#x5f97;&#x5230;&#x6240;&#x6709;&#x7684;&#x6807;&#x7b7e;&#x8f6c;&#x53d1;&#x4fe1;&#x606f;"/>
</node>
<node CREATED="1321845171104" ID="ID_1270546894" MODIFIED="1322182421568" TEXT="FTN&#xff08;FEC-to-NHLFE&#xff09;">
<node CREATED="1321845428388" ID="ID_1779558753" MODIFIED="1321845432575" TEXT="FEC &#x5230;&#x4e00;&#x7ec4;NHLFE &#x7684;&#x6620;&#x5c04;"/>
<node CREATED="1321845456684" ID="ID_1890844959" MODIFIED="1321845458731" TEXT="&#x901a;&#x8fc7;&#x67e5;&#x770b;FIB &#x8868;&#x4e2d;Token &#x503c;&#x4e0d;&#x4e3a;0x0 &#x7684;&#x8868;&#x9879;&#xff0c;&#x80fd;&#x591f;&#x83b7;&#x5f97;FTN &#x7684;&#x8be6;&#x7ec6;&#x4fe1;&#x606f;"/>
<node CREATED="1321845470261" ID="ID_867617389" MODIFIED="1321845481183" TEXT="FTN &#x53ea;&#x5728; Ingress &#x5b58;&#x5728;"/>
</node>
</node>
</node>
</map>
