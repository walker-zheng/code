
///< 屏幕能力
#define SCREEN_MAX_NUM              9       ///< 设备最大的屏幕数
#define SCREEN_MAX_CHANNAL_NUM      16      ///< 屏幕上最大的D1通道数

#define COMBINE_SCREEN_MAX_NUM      4       ///< 设备最大的拼接屏幕数


typedef unsigned long DWORD;
typedef long LONG;


///< 屏幕能力
#define SCREEN_MAX_NUM              9       ///< 设备最大的屏幕数
#define SCREEN_MAX_CHANNAL_NUM      16      ///< 屏幕上最大的D1通道数
#define COMBINE_SCREEN_MAX_NUM      4       ///< 设备最大的拼接屏幕数

///< screen类型
typedef enum tagSCREEN_TYPE
{
    SCREEN_TYPE_SPLIT   = 0,      ///< 分割屏
    SCREEN_TYPE_COMBINE = 1,      ///< 拼接屏
    SCREEN_TYPE_BUTTON,
} SCREEN_TYPE;

///< screen split类型
typedef enum tagSCREEN_SPLIT_TYPE
{
    RV_SPLIT1,
    RV_SPLIT2,
    RV_SPLIT4,
    RV_SPLIT8,
    RV_SPLIT9,
    RV_SPLIT16,
    RV_SPLITPIP,
    RV_SPLIT6,
    RV_SPLIT12,
    RV_SPLIT13,
    RV_SPLIT20,
    RV_SPLIT25,
    RV_SPLIT33,
    RV_SPLIT5,
    RV_SPLIT_NR,
} SCREEN_SPLIT_TYPE;
///< 拼接屏类型
typedef enum tagSCREEN_COMBINE_TYPE
{
    SCREEN_COMBINE_12 = 0,
    SCREEN_COMBINE_13 = 1,
    SCREEN_COMBINE_14 = 2,
    SCREEN_COMBINE_21 = 3,
    SCREEN_COMBINE_22 = 4,
    SCREEN_COMBINE_23 = 5,
    SCREEN_COMBINE_24 = 6,
    SCREEN_COMBINE_32 = 7,
    SCREEN_COMBINE_42 = 8,
    SCREEN_COMBINE_33 = 9,
    SCREEN_COMBINE_BUTON,
} SCREEN_COMBINE_TYPE;


///< screen类型
typedef struct
{
    int enable;         ///< 使能项，暂时未用
    SCREEN_SPLIT_TYPE screen_type;
    int                 sub;        ///< 分割子类型
} SCREEN_INFO;


//  ability struct of decoder [解码器能力结构体]
typedef  struct
{
#if 0
    unsigned short usDecoderNums ;  //max number of channles [解码器最大路数]
    unsigned short usNetMode;       //support multiple network mode, every bit flags support : 1:support 0:not support [支持多种网络模式 每一位标识是否支持 0标识不支持，1标识支持]
    //bit 0 : common network vs100,vs200, default setted to 1 [第0位 通用网络vs100，vs200；默认此为支持 置1]
    //bit 1 : support rtsp Client [第1位 支持rtsp Client]
    //bit 2 : support vs300  [第2位 支持vs300；]
    //第3位 : sony rtsp
    //第4位 : 黄河rtsp
    //第5位 : 中星贝尔接入
    // 第6位: VIVOTEK接入
    // 第7位: 三洋接入
    // 第8位: 三星接入
    // 第9位: 星网锐捷接入
    // 第10位: 郎驰接入(亚安)
    // 第11位: 亚安YAAN200W

    int iAbilityMask;               //decode abbility for every channel, max 16 channels now, so every 2 bits mark 1 channel in 32 bits [每路解码器解码能力 ，现有最大16通道，32位每2位标识一个通道]
    //00:max support to CIF, 01:max support to D1, 10:max support to 720p, 11:more [00 最大支持CIF，01 最大支持D1，10，最大支持720p, 11 更高]
    unsigned char ucDecoderType;    //type of decoder [解码器形式]
    //0:mixed type of DVR (both contain analog channels and digital channels), 1:pure decoder(only digital channels) [0混合dvr（既有模拟也可以数字），1纯解码器（只有数字）]
    unsigned char ucModeAblity;     //bit 0 : support multi-connection tour ? [第0位 是否支持多连接轮巡的方式]
    unsigned short  usMaxChNum;     //max number of channels for every supported tour when support multi-connection tour [支持多连接方式时,每路支持的轮巡列表的通道的最大数目]
    int iRes [3];                   //reserved [保留]
#endif
    //modify by zts 2013-6-5
    unsigned int    usDecoderNums ; /// 解码器最大路数
    unsigned int    usNetMode;      /// 参考NET_CLI_PROTO_TYPE_E，按位表示
    unsigned int    iAbilityMask;   /// 通道的最大解码能力，两位一个通道，最多16个通道，00:CIF,01:D1,10:720p,11:更高
    unsigned char   ucDecoderType;  /// 如果纯解码器，vs100根据需求裁剪页面 0混合dvr（既有模拟也可以数字），1纯解码器（只有数字）
    unsigned char   ucModeAblity;   /// 第0位 是否支持多连接轮巡的方式
    unsigned short  usMaxChNum;     /// 支持多连接方式时,每路支持的轮巡列表的通道的最大数目
    unsigned int    uiNetMode2;     /// 用掉一个保留位，便于扩展接入类型
    unsigned int    iRes;           /// 保留
    unsigned char    ucScreenNums;
    unsigned char    ucCombScreenNums;
    SCREEN_INFO    singlescreens[SCREEN_MAX_CHANNAL_NUM];
    SCREEN_INFO    combScreens[COMBINE_SCREEN_MAX_NUM];
} RV_DECODE_EN;





///< 分割屏属性
typedef struct t_ScreenSplitInfo
{
    SCREEN_SPLIT_TYPE   split;  ///< 哪种拼接屏
    int                 sub;        ///< 显示拼接屏哪个部分
} RV_ScreenSplitInfo;
///< 拼接屏属性
typedef struct t_ScreenCombineInfo
{
    SCREEN_COMBINE_TYPE combineType;         ///< 哪种拼接屏
    int                 index;              ///< 显示拼接屏哪个部分
    RV_ScreenSplitInfo  combineSplitInfo;   ///< 拼接屏添加分割类型
} RV_ScreenCombineInfo;

typedef struct t_ScreenChnInfo
{
    int used;         ///< 这个屏幕通道是否显示
    int logicChn;     ///< 逻辑通道
    int streamType;   ///< 码流类型
} RV_ScreenChnInfo;


#define MAX_SPLIT_COMINE_NUMS 32
#define MAX_SPLITCOMBINE_NUMBER 32
typedef struct
{
    unsigned int iChMask;        //channel mask, flag by bits, total 32 bits (4 byts)(max 32 types) [通道掩码，按位标识，总32位4字节,最大32种形式]
    /*for example : 4 views, support mode (1,2,3,4channel)(1,3,4,5channel) [4画面 ，支持 模式（1，2，3，4通道）（1，3，4，5）]
    corresponding mask is 0000 0000 0000 0000 0000 0000 0000 1111=0x0F [对应的掩码为  0000 0000 0000 0000 0000 0000 0000 1111=0x0F]
    0000 0000 0000 0000 0000 0000 0001 1101=0x1D [0000 0000 0000 0000 0000 0000 0001 1101=0x1D]
    if 9 views, support mode (1,2,4,5,6,7,8,9,10channel) [如果9画面 支持（1，2，4，5，6，7，8，9，10通道）]
    corresponding mask is 0000 0000 0000 0000 0000 0011 1111 1011=0x3FB [对应的掩码为0000 0000 0000 0000 0000 0011 1111 1011=0x3FB]
    the mask content here, need to decide by uiSplitType in  SPLIT_MODE, and there has include or exclude relation now [此处掩码内容，是需要根据 SPLIT_MODE中uiSplitType来定，现有制定是包含关系还是排除关系]
    */
    unsigned char ucSpecialCh;   /*special channel (restrict to be show in the first view or the biggest view) [特殊通道（约束为自动排在最前或者大窗口显示）]*/
    unsigned char ucRes[3];
} RV_SPLIT_COMBINE_CH;
typedef struct
{
    unsigned char ucSplitMode;  /*mode of multi-view preview, reference to enum split_combine_t [多画面预览模式，参考枚举split_combine_t]*/
    unsigned char ucSplitType;  /*supported split views type, every two bits corresponding one bit in iSplitMode [支持分屏组合的类型 ，每两位对应画面预览模式iSplitMode一位]
                                0 : all random combine [0 全部任意组合， ]
                                if random [如果为任意]
                                1 : include relation, just some combines supported, limit to max 64 now [1 包含关系，只有少部分组合组合满足，现有约束最大64个；]
                                2 : exclude relation, max 64 combines to exclude [2 排除关系，最大64个排除组合；]
                                if it is include or exclude method, the subscript of SPLIT_COMBINE array flag detail infomation [如果是包含或者排除方式，SPLIT_COMBINE数组标示具体信息]
                                other : not defined now, reserved [其他 暂无定义，后续扩展使用]
                                */
    unsigned char ucCombinNums; /*the total number of combine, max to N_SPLIT_COMINE_NUMS 32 now [组合中总个数，现有最大N_SPLIT_COMINE_NUMS 32个]*/
    unsigned char ucRes;
    RV_SPLIT_COMBINE_CH stCombineCh[MAX_SPLIT_COMINE_NUMS];
} RV_SPLIT_COMBINE;

typedef struct
{
    int screenIndex;
    int screenType;
    RV_SPLIT_COMBINE stSplitCombine;
} RV_SPLIT_COMBINE_NEW;
/******************************************************************************
* attributes struct of tour function [轮巡功能属性结构体]
*****************************************************************************/
#define V_TOUR_COMBINE_NUM 10
typedef struct
{
    unsigned int iSplitMode;    //support many multi-views preview mode, flag by bits, reference to enum split_combine_t [支持多种画面预览模式，按位标识，参考枚举split_combine_t]
    //bit0 : SPLIT1, this is default in all devices, this is sinlg view and full screen [第0位 SPLIT1 此默认都支持，此为单画面，全屏]
    //bit1 : SPLIT2 [第1位 SPLIT2]
    //bit2 : SPLIT4 [第2位 SPLIT4]
    //bit3 : SPLIT8 [第3位 SPLIT8]
    //bit4 : SPLIT9 [第4位 SPLIT9]
    //bit5 : SPLIT16 [第5位 SPLIT16]
    //bit6 : SPLITIP [第6位 SPLITIP]
    //bit7 : SPLIT6 [第7位 SPLIT6]
    //bit8 : SPLIT12 [第8位 SPLIT12]
} RV_SPLIT_MODE;
typedef struct
{
    unsigned char bTourEnable;      //enable [使能]
    unsigned char ucRes;
    unsigned short usIntervalTime;  //tour time slice [轮巡时间间隔]
} RV_DISPLAY_TOUR_CFG;
typedef struct
{
    int screenIndex;
    int screenType;
    RV_DISPLAY_TOUR_CFG stDisplayTour;
} RV_DISPLAY_TOUR_CFG_NEW;
typedef struct
{
    DWORD    dwSize;
    RV_DISPLAY_TOUR_CFG stDisplayTour;
    RV_SPLIT_COMBINE stSplitCombine[V_TOUR_COMBINE_NUM];
} RV_DISPLAY_TOUR;

/******************************************************************************
* struct of views split function [画面分割功能属性结构体]
*****************************************************************************/
typedef struct
{
    RV_SPLIT_MODE stSplitMode;      //mode [模式]
    RV_SPLIT_COMBINE_CH stCombineCH;//channel combine [通道组合]
} RV_DISPLAY_SPLIT_CFG;

typedef struct
{
    // decoder multi screen
    int screenIndex;
    int screenType;
    RV_DISPLAY_SPLIT_CFG stSplitCfg;
} RV_DISPLAY_SPLIT_CFG_NEW;
/******************************************************************************
* channel combine and tour struct of decoder views group [解码器画面分组通道组合以及轮询结构体]
*****************************************************************************/
typedef struct
{
    DWORD    dwSize;
    int enable;
    int screenIndex;
    int screenType;
    RV_DISPLAY_SPLIT_CFG stSplitCfg;
    RV_DISPLAY_TOUR_CFG stTourCfg;
    LONG iCombineNum;
    RV_SPLIT_COMBINE stSplitCombine[V_TOUR_COMBINE_NUM];
} RV_WSCC;

typedef struct t_ScreenAudioParam
{
    int     audio;          /*! 音量   HSL(luminance) 0-100 default: 50 */
} RV_ScreenAudioParam;
typedef struct t_ScreenShowParam
{
    int     byBrightness;           /*! 亮度   HSL(luminance) 0-100 default: 50 */
    int     bySaturation;           /*! 饱和度 0-100 default: 50*/
    int     byHue;                  /*! 色度  0-100 default: 50 */
    int     byContrast;             /*! 对比度 0-100 default: 50 */
    int     byGain;                 /*! 增益  0-63*/
    int    bySharpness;         // 锐度  0 - 255
} RV_ScreenShowParam;
typedef struct t_SCREEN_CFG
{
    int enable;         ///< 使能项，暂时未用
    int screenType;     ///< 屏幕类型   单屏/拼接屏
    int screenIndex;    ///< 单屏幕 索引
    int split;          ///< 分割 类型
    int sub;            ///< 分割 子类型 主显示分割
    int combineType;    ///< 拼接屏 拼接屏类型
    int screenNum;      ///< 拼接屏 屏幕个数
    int screenIndexs[SCREEN_MAX_NUM]; ///< 拼接屏 屏幕索引
    RV_ScreenAudioParam screenAudio;                                 //屏幕 音频 选择的通道
    RV_ScreenShowParam screenShow;              // 屏幕 显示调节
    RV_ScreenChnInfo screenChnInfo[SCREEN_MAX_CHANNAL_NUM];
} RV_DECODER_SCREEN_CFG;
