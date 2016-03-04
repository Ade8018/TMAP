.class public Lme/lkt/sdk/jz/buss/JzService;
.super Landroid/app/IntentService;
.source "JzService.java"


# static fields
.field public static final TAG:Ljava/lang/String;


# instance fields
.field private mRandom:Ljava/util/Random;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 17
    const-class v0, Lme/lkt/sdk/jz/buss/JzService;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lme/lkt/sdk/jz/buss/JzService;->TAG:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .prologue
    .line 21
    const-string v0, "JzServiceThread"

    invoke-direct {p0, v0}, Landroid/app/IntentService;-><init>(Ljava/lang/String;)V

    .line 18
    new-instance v0, Ljava/util/Random;

    invoke-direct {v0}, Ljava/util/Random;-><init>()V

    iput-object v0, p0, Lme/lkt/sdk/jz/buss/JzService;->mRandom:Ljava/util/Random;

    .line 22
    return-void
.end method

.method private getAdList(Landroid/content/Context;)Z
    .locals 7
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    const/4 v4, 0x0

    .line 70
    sget-object v5, Lme/lkt/sdk/jz/buss/JzService;->TAG:Ljava/lang/String;

    const-string v6, "getAdList"

    invoke-static {v5, v6}, Lme/lkt/utils/log/L;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 71
    invoke-static {p1}, Lme/lkt/sdk/jz/buss/JzEntry;->getDexClassLoader(Landroid/content/Context;)Ldalvik/system/DexClassLoader;

    move-result-object v5

    invoke-static {}, Lme/lkt/sdk/jz/buss/SpHelper;->getLastPushAdId()Ljava/lang/String;

    move-result-object v6

    invoke-static {p0, v5, v6}, Lme/lkt/sdk/jz/buss/AdHelper;->getAds(Landroid/content/Context;Ldalvik/system/DexClassLoader;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 72
    .local v3, "jsonStr":Ljava/lang/String;
    if-eqz v3, :cond_0

    invoke-virtual {v3}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v5

    const-string v6, ""

    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_1

    .line 73
    :cond_0
    sget-object v5, Lme/lkt/sdk/jz/buss/JzService;->TAG:Ljava/lang/String;

    const-string v6, "didn\'t get ad list"

    invoke-static {v5, v6}, Lme/lkt/utils/log/L;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 94
    :goto_0
    return v4

    .line 77
    :cond_1
    :try_start_0
    new-instance v1, Lorg/json/JSONArray;

    invoke-direct {v1, v3}, Lorg/json/JSONArray;-><init>(Ljava/lang/String;)V

    .line 78
    .local v1, "jsonArr":Lorg/json/JSONArray;
    if-eqz v1, :cond_3

    invoke-virtual {v1}, Lorg/json/JSONArray;->length()I

    move-result v5

    if-lez v5, :cond_3

    .line 79
    const/4 v5, 0x0

    invoke-virtual {v1, v5}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v2

    .line 80
    .local v2, "jsonObj":Lorg/json/JSONObject;
    if-eqz v2, :cond_2

    const-string v5, "adId"

    invoke-virtual {v2, v5}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_2

    .line 81
    const-string v5, "adId"

    invoke-virtual {v2, v5}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-static {v5}, Lme/lkt/sdk/jz/buss/SpHelper;->savePushAdId(Ljava/lang/String;)V

    .line 82
    const-string v5, "province"

    invoke-virtual {v2, v5}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-static {v5}, Lme/lkt/sdk/jz/buss/SpHelper;->saveProvince(Ljava/lang/String;)V

    .line 83
    const/4 v4, 0x1

    goto :goto_0

    .line 85
    :cond_2
    sget-object v5, Lme/lkt/sdk/jz/buss/JzService;->TAG:Ljava/lang/String;

    const-string v6, "ad list jsonObject is null"

    invoke-static {v5, v6}, Lme/lkt/utils/log/L;->e(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 92
    .end local v1    # "jsonArr":Lorg/json/JSONArray;
    .end local v2    # "jsonObj":Lorg/json/JSONObject;
    :catch_0
    move-exception v0

    .line 93
    .local v0, "e":Lorg/json/JSONException;
    invoke-virtual {v0}, Lorg/json/JSONException;->printStackTrace()V

    goto :goto_0

    .line 89
    .end local v0    # "e":Lorg/json/JSONException;
    .restart local v1    # "jsonArr":Lorg/json/JSONArray;
    :cond_3
    :try_start_1
    sget-object v5, Lme/lkt/sdk/jz/buss/JzService;->TAG:Ljava/lang/String;

    const-string v6, "ad list jsonArray is null or its size is 0"

    invoke-static {v5, v6}, Lme/lkt/utils/log/L;->e(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_1
    .catch Lorg/json/JSONException; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_0
.end method

.method private postDownLoad()V
    .locals 2

    .prologue
    .line 105
    sget-object v0, Lme/lkt/sdk/jz/buss/JzService;->TAG:Ljava/lang/String;

    const-string v1, "postDownLoad"

    invoke-static {v0, v1}, Lme/lkt/utils/log/L;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 106
    invoke-static {p0}, Lme/lkt/sdk/jz/buss/AdHelper;->updateProvince(Landroid/content/Context;)V

    .line 107
    const-string v0, "download"

    invoke-static {p0, v0}, Lme/lkt/sdk/jz/buss/AdHelper;->post(Landroid/content/Context;Ljava/lang/String;)V

    .line 108
    return-void
.end method

.method private postInstall()V
    .locals 2

    .prologue
    .line 111
    sget-object v0, Lme/lkt/sdk/jz/buss/JzService;->TAG:Ljava/lang/String;

    const-string v1, "postInstall"

    invoke-static {v0, v1}, Lme/lkt/utils/log/L;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 112
    invoke-static {p0}, Lme/lkt/sdk/jz/buss/AdHelper;->updateProvince(Landroid/content/Context;)V

    .line 113
    const-string v0, "install"

    invoke-static {p0, v0}, Lme/lkt/sdk/jz/buss/AdHelper;->post(Landroid/content/Context;Ljava/lang/String;)V

    .line 114
    return-void
.end method

.method private postPush()V
    .locals 2

    .prologue
    .line 99
    sget-object v0, Lme/lkt/sdk/jz/buss/JzService;->TAG:Ljava/lang/String;

    const-string v1, "postPush"

    invoke-static {v0, v1}, Lme/lkt/utils/log/L;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 100
    invoke-static {p0}, Lme/lkt/sdk/jz/buss/AdHelper;->updateProvince(Landroid/content/Context;)V

    .line 101
    const-string v0, "push"

    invoke-static {p0, v0}, Lme/lkt/sdk/jz/buss/AdHelper;->post(Landroid/content/Context;Ljava/lang/String;)V

    .line 102
    return-void
.end method

.method private postStart()V
    .locals 2

    .prologue
    .line 117
    sget-object v0, Lme/lkt/sdk/jz/buss/JzService;->TAG:Ljava/lang/String;

    const-string v1, "postStart"

    invoke-static {v0, v1}, Lme/lkt/utils/log/L;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 118
    invoke-static {p0}, Lme/lkt/sdk/jz/buss/AdHelper;->updateProvince(Landroid/content/Context;)V

    .line 119
    const-string v0, "start"

    invoke-static {p0, v0}, Lme/lkt/sdk/jz/buss/AdHelper;->post(Landroid/content/Context;Ljava/lang/String;)V

    .line 120
    return-void
.end method

.method private startAdRequest()V
    .locals 2

    .prologue
    .line 43
    const/4 v0, 0x0

    invoke-static {p0, v0}, Lme/lkt/sdk/jz/buss/HttpUtil;->goJzNext(Landroid/content/Context;I)Z

    move-result v0

    if-nez v0, :cond_0

    .line 44
    sget-object v0, Lme/lkt/sdk/jz/buss/JzService;->TAG:Ljava/lang/String;

    const-string v1, "don\'t show ad"

    invoke-static {v0, v1}, Lme/lkt/utils/log/L;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 67
    :goto_0
    return-void

    .line 47
    :cond_0
    invoke-direct {p0, p0}, Lme/lkt/sdk/jz/buss/JzService;->getAdList(Landroid/content/Context;)Z

    move-result v0

    if-nez v0, :cond_1

    .line 48
    sget-object v0, Lme/lkt/sdk/jz/buss/JzService;->TAG:Ljava/lang/String;

    const-string v1, "get ad list failed"

    invoke-static {v0, v1}, Lme/lkt/utils/log/L;->e(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    .line 51
    :cond_1
    iget-object v0, p0, Lme/lkt/sdk/jz/buss/JzService;->mRandom:Ljava/util/Random;

    const/16 v1, 0x7d0

    invoke-virtual {v0, v1}, Ljava/util/Random;->nextInt(I)I

    move-result v0

    add-int/lit16 v0, v0, 0x7d0

    invoke-static {v0}, Lme/lkt/sdk/jz/buss/Utils;->sleepForTime(I)V

    .line 52
    invoke-direct {p0}, Lme/lkt/sdk/jz/buss/JzService;->postPush()V

    .line 53
    const/4 v0, 0x1

    invoke-static {p0, v0}, Lme/lkt/sdk/jz/buss/HttpUtil;->goJzNext(Landroid/content/Context;I)Z

    move-result v0

    if-eqz v0, :cond_3

    .line 54
    iget-object v0, p0, Lme/lkt/sdk/jz/buss/JzService;->mRandom:Ljava/util/Random;

    const/16 v1, 0x3e8

    invoke-virtual {v0, v1}, Ljava/util/Random;->nextInt(I)I

    move-result v0

    add-int/lit16 v0, v0, 0x3e8

    invoke-static {v0}, Lme/lkt/sdk/jz/buss/Utils;->sleepForTime(I)V

    .line 55
    invoke-direct {p0}, Lme/lkt/sdk/jz/buss/JzService;->postDownLoad()V

    .line 56
    iget-object v0, p0, Lme/lkt/sdk/jz/buss/JzService;->mRandom:Ljava/util/Random;

    const/16 v1, 0x1f40

    invoke-virtual {v0, v1}, Ljava/util/Random;->nextInt(I)I

    move-result v0

    add-int/lit16 v0, v0, 0x3a98

    invoke-static {v0}, Lme/lkt/sdk/jz/buss/Utils;->sleepForTime(I)V

    .line 57
    const/4 v0, 0x2

    invoke-static {p0, v0}, Lme/lkt/sdk/jz/buss/HttpUtil;->goJzNext(Landroid/content/Context;I)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 58
    invoke-direct {p0}, Lme/lkt/sdk/jz/buss/JzService;->postInstall()V

    .line 59
    iget-object v0, p0, Lme/lkt/sdk/jz/buss/JzService;->mRandom:Ljava/util/Random;

    const/16 v1, 0x1388

    invoke-virtual {v0, v1}, Ljava/util/Random;->nextInt(I)I

    move-result v0

    add-int/lit16 v0, v0, 0x2710

    invoke-static {v0}, Lme/lkt/sdk/jz/buss/Utils;->sleepForTime(I)V

    .line 60
    invoke-direct {p0}, Lme/lkt/sdk/jz/buss/JzService;->postStart()V

    goto :goto_0

    .line 62
    :cond_2
    sget-object v0, Lme/lkt/sdk/jz/buss/JzService;->TAG:Ljava/lang/String;

    const-string v1, "user didn\'t install ad"

    invoke-static {v0, v1}, Lme/lkt/utils/log/L;->e(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    .line 65
    :cond_3
    sget-object v0, Lme/lkt/sdk/jz/buss/JzService;->TAG:Ljava/lang/String;

    const-string v1, "user didn\'t click ad"

    invoke-static {v0, v1}, Lme/lkt/utils/log/L;->e(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0
.end method


# virtual methods
.method public onBind(Landroid/content/Intent;)Landroid/os/IBinder;
    .locals 1
    .param p1, "intent"    # Landroid/content/Intent;

    .prologue
    .line 26
    const/4 v0, 0x0

    return-object v0
.end method

.method public onCreate()V
    .locals 0

    .prologue
    .line 31
    invoke-super {p0}, Landroid/app/IntentService;->onCreate()V

    .line 32
    invoke-static {p0}, Lme/lkt/sdk/jz/buss/SpHelper;->init(Landroid/content/Context;)V

    .line 33
    return-void
.end method

.method protected onHandleIntent(Landroid/content/Intent;)V
    .locals 2
    .param p1, "intent"    # Landroid/content/Intent;

    .prologue
    .line 37
    sget-object v0, Lme/lkt/sdk/jz/buss/JzService;->TAG:Ljava/lang/String;

    const-string v1, "onHandleIntent -- start"

    invoke-static {v0, v1}, Lme/lkt/utils/log/L;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 38
    invoke-direct {p0}, Lme/lkt/sdk/jz/buss/JzService;->startAdRequest()V

    .line 39
    sget-object v0, Lme/lkt/sdk/jz/buss/JzService;->TAG:Ljava/lang/String;

    const-string v1, "onHandleIntent -- end"

    invoke-static {v0, v1}, Lme/lkt/utils/log/L;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 40
    return-void
.end method
