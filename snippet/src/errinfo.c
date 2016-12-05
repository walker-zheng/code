/* 声明出错代码 */
#define     ERR_NO_ERROR    0  /* No error                 */
#define     ERR_OPEN_FILE   1  /* Open file error          */
#define     ERR_SEND_MESG   2  /* sending a message error  */
#define     ERR_BAD_ARGS    3  /* Bad arguments            */
#define     ERR_MEM_NONE    4  /* Memeroy is not enough    */
#define     ERR_SERV_DOWN   5  /* Service down try later   */
#define     ERR_UNKNOW_INFO 6  /* Unknow information       */
#define     ERR_SOCKET_ERR  7  /* Socket operation failed  */
#define     ERR_PERMISSION  8  /* Permission denied        */
#define     ERR_BAD_FORMAT  9  /* Bad configuration file   */
#define     ERR_TIME_OUT   10  /* Communication time out   */

/* 声明出错信息 */
char* errmsg[] = {
    /* 0 */       "No error",               
    /* 1 */       "Open file error",       
    /* 2 */       "Failed in sending/receiving a message", 
    /* 3 */       "Bad arguments", 
    /* 4 */       "Memeroy is not enough",
    /* 5 */       "Service is down; try later",
    /* 6 */       "Unknow information",
    /* 7 */       "A socket operation has failed",
    /* 8 */       "Permission denied",
    /* 9 */       "Bad configuration file format", 
    /* 10 */      "Communication time out",
};

/* 声明错误代码全局变量 */
long errno = 0;

/* 打印出错信息函数 */
void perror( char* info)
{
    if ( info ){
        printf("%s: %s/n", info, errmsg[errno] );
        return;
    }

    printf("Error: %s/n", errmsg[errno] );
}

bool CheckPermission( char* userName )
{
    if ( strcpy(userName, "root") != 0 ){
        errno = ERR_PERMISSION_DENIED;
        return (FALSE);
    }
}

main()
{
    if (! CheckPermission( username ) ){
        perror("main()");
    }
}
