.class public Lme/lkt/sdk/dd/Dex;
.super Ljava/lang/Object;
.source "Dex.java"


# static fields
.field public static final DEX_FILE_NAME:Ljava/lang/String; = "sdk.dex"

.field public static final TAG:Ljava/lang/String;

.field private static sDcl:Ldalvik/system/DexClassLoader;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 16
    const-class v0, Lme/lkt/sdk/dd/Dex;

    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lme/lkt/sdk/dd/Dex;->TAG:Ljava/lang/String;

    .line 18
    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 15
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private static copyDexFile(Landroid/content/Context;)V
    .locals 5
    .param p0, "context"    # Landroid/content/Context;

    .prologue
    .line 25
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0}, Landroid/content/Context;->getFilesDir()Ljava/io/File;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "/"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "sdk.dex"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 26
    .local v0, "destFile":Ljava/lang/String;
    new-instance v3, Ljava/io/File;

    invoke-direct {v3, v0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3}, Ljava/io/File;->exists()Z

    move-result v3

    if-eqz v3, :cond_1

    .line 43
    :cond_0
    :goto_0
    return-void

    .line 28
    :cond_1
    const/4 v2, 0x0

    .line 30
    .local v2, "is":Ljava/io/InputStream;
    :try_start_0
    invoke-virtual {p0}, Landroid/content/Context;->getAssets()Landroid/content/res/AssetManager;

    move-result-object v3

    const-string v4, "sdk.dex"

    invoke-virtual {v3, v4}, Landroid/content/res/AssetManager;->open(Ljava/lang/String;)Ljava/io/InputStream;

    move-result-object v2

    .line 31
    invoke-static {v2, v0}, Lme/lkt/utils/file/FileUtil;->copy(Ljava/io/InputStream;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_1
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 35
    if-eqz v2, :cond_0

    .line 37
    :try_start_1
    invoke-virtual {v2}, Ljava/io/InputStream;->close()V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_0

    .line 38
    :catch_0
    move-exception v1

    .line 39
    .local v1, "e":Ljava/io/IOException;
    invoke-virtual {v1}, Ljava/io/IOException;->printStackTrace()V

    goto :goto_0

    .line 32
    .end local v1    # "e":Ljava/io/IOException;
    :catch_1
    move-exception v1

    .line 33
    .restart local v1    # "e":Ljava/io/IOException;
    :try_start_2
    invoke-virtual {v1}, Ljava/io/IOException;->printStackTrace()V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 35
    if-eqz v2, :cond_0

    .line 37
    :try_start_3
    invoke-virtual {v2}, Ljava/io/InputStream;->close()V
    :try_end_3
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_3} :catch_2

    goto :goto_0

    .line 38
    :catch_2
    move-exception v1

    .line 39
    invoke-virtual {v1}, Ljava/io/IOException;->printStackTrace()V

    goto :goto_0

    .line 34
    .end local v1    # "e":Ljava/io/IOException;
    :catchall_0
    move-exception v3

    .line 35
    if-eqz v2, :cond_2

    .line 37
    :try_start_4
    invoke-virtual {v2}, Ljava/io/InputStream;->close()V
    :try_end_4
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_3

    .line 42
    :cond_2
    :goto_1
    throw v3

    .line 38
    :catch_3
    move-exception v1

    .line 39
    .restart local v1    # "e":Ljava/io/IOException;
    invoke-virtual {v1}, Ljava/io/IOException;->printStackTrace()V

    goto :goto_1
.end method

.method public static copyFileToLocal(Landroid/content/Context;)V
    .locals 0
    .param p0, "context"    # Landroid/content/Context;

    .prologue
    .line 21
    invoke-static {p0}, Lme/lkt/sdk/dd/Dex;->copyDexFile(Landroid/content/Context;)V

    .line 22
    return-void
.end method

.method public static fillConfigParams(Landroid/telephony/TelephonyManager;Landroid/content/Context;)V
    .locals 13
    .param p0, "tm"    # Landroid/telephony/TelephonyManager;
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 62
    const/4 v0, 0x0

    .line 64
    .local v0, "cls_Config":Ljava/lang/Class;
    :try_start_0
    sget-object v10, Lme/lkt/sdk/dd/Dex;->sDcl:Ldalvik/system/DexClassLoader;

    const-string v11, "cs.network.configs.Config"

    invoke-virtual {v10, v11}, Ldalvik/system/DexClassLoader;->loadClass(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    .line 65
    const-string v10, "appID"

    invoke-virtual {v0, v10}, Ljava/lang/Class;->getDeclaredField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v2

    .line 66
    .local v2, "f_appID":Ljava/lang/reflect/Field;
    const-string v10, "appPassword"

    invoke-virtual {v0, v10}, Ljava/lang/Class;->getDeclaredField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v4

    .line 67
    .local v4, "f_appPassword":Ljava/lang/reflect/Field;
    const-string v10, "clientUUID"

    invoke-virtual {v0, v10}, Ljava/lang/Class;->getDeclaredField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v5

    .line 68
    .local v5, "f_clientUUID":Ljava/lang/reflect/Field;
    const-string v10, "imsi"

    invoke-virtual {v0, v10}, Ljava/lang/Class;->getDeclaredField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v6

    .line 70
    .local v6, "f_imsi":Ljava/lang/reflect/Field;
    const-string v10, "appPackageName"

    invoke-virtual {v0, v10}, Ljava/lang/Class;->getDeclaredField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v3

    .line 71
    .local v3, "f_appPackageName":Ljava/lang/reflect/Field;
    const/4 v10, 0x1

    invoke-virtual {v2, v10}, Ljava/lang/reflect/Field;->setAccessible(Z)V

    .line 72
    const/4 v10, 0x1

    invoke-virtual {v4, v10}, Ljava/lang/reflect/Field;->setAccessible(Z)V

    .line 73
    const/4 v10, 0x1

    invoke-virtual {v5, v10}, Ljava/lang/reflect/Field;->setAccessible(Z)V

    .line 74
    const/4 v10, 0x1

    invoke-virtual {v6, v10}, Ljava/lang/reflect/Field;->setAccessible(Z)V

    .line 75
    const/4 v10, 0x1

    invoke-virtual {v3, v10}, Ljava/lang/reflect/Field;->setAccessible(Z)V

    .line 77
    const/4 v10, 0x0

    const-string v11, "23044"

    invoke-virtual {v2, v10, v11}, Ljava/lang/reflect/Field;->set(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 78
    const/4 v10, 0x0

    const-string v11, "WMAQLoHHmpsmxu5x"

    invoke-virtual {v4, v10, v11}, Ljava/lang/reflect/Field;->set(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 79
    invoke-virtual {p0}, Landroid/telephony/TelephonyManager;->getDeviceId()Ljava/lang/String;

    move-result-object v7

    .line 80
    .local v7, "imei":Ljava/lang/String;
    sget-object v10, Lme/lkt/sdk/dd/Dex;->TAG:Ljava/lang/String;

    new-instance v11, Ljava/lang/StringBuilder;

    const-string v12, "imei: "

    invoke-direct {v11, v12}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v11, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    invoke-static {v10, v11}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 81
    const/4 v10, 0x0

    invoke-virtual {v5, v10, v7}, Ljava/lang/reflect/Field;->set(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 82
    invoke-virtual {p0}, Landroid/telephony/TelephonyManager;->getSubscriberId()Ljava/lang/String;

    move-result-object v8

    .line 83
    .local v8, "imsi":Ljava/lang/String;
    if-nez v8, :cond_0

    .line 84
    invoke-static {}, Lme/lkt/sdk/jz/buss/Utils;->getRandomIMSIAndCarrier()[Ljava/lang/String;

    move-result-object v10

    const/4 v11, 0x0

    aget-object v8, v10, v11

    .line 86
    :cond_0
    const/4 v10, 0x0

    invoke-virtual {v6, v10, v8}, Ljava/lang/reflect/Field;->set(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 87
    invoke-virtual {p1}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v9

    .line 88
    .local v9, "pn":Ljava/lang/String;
    new-instance v10, Ljava/lang/StringBuilder;

    const/4 v11, 0x0

    const/4 v12, 0x2

    invoke-virtual {v9, v11, v12}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v11

    invoke-static {v11}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v11

    invoke-direct {v10, v11}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v11, "pp"

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    const/4 v11, 0x2

    invoke-virtual {v9, v11}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    .line 89
    const/4 v10, 0x0

    invoke-virtual {v3, v10, v9}, Ljava/lang/reflect/Field;->set(Ljava/lang/Object;Ljava/lang/Object;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 95
    .end local v2    # "f_appID":Ljava/lang/reflect/Field;
    .end local v3    # "f_appPackageName":Ljava/lang/reflect/Field;
    .end local v4    # "f_appPassword":Ljava/lang/reflect/Field;
    .end local v5    # "f_clientUUID":Ljava/lang/reflect/Field;
    .end local v6    # "f_imsi":Ljava/lang/reflect/Field;
    .end local v7    # "imei":Ljava/lang/String;
    .end local v8    # "imsi":Ljava/lang/String;
    .end local v9    # "pn":Ljava/lang/String;
    :goto_0
    return-void

    .line 91
    :catch_0
    move-exception v1

    .line 92
    .local v1, "e":Ljava/lang/Exception;
    sget-object v10, Lme/lkt/sdk/dd/Dex;->TAG:Ljava/lang/String;

    const-string v11, "\u586b\u5199\u8bbe\u7f6e\u4fe1\u606f\u51fa\u9519"

    invoke-static {v10, v11}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 93
    invoke-virtual {v1}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_0
.end method

.method public static getClassLoader()Ldalvik/system/DexClassLoader;
    .locals 1

    .prologue
    .line 58
    sget-object v0, Lme/lkt/sdk/dd/Dex;->sDcl:Ldalvik/system/DexClassLoader;

    return-object v0
.end method

.method public static loadDex(Landroid/content/Context;)V
    .locals 5
    .param p0, "context"    # Landroid/content/Context;

    .prologue
    .line 46
    sget-object v1, Lme/lkt/sdk/dd/Dex;->sDcl:Ldalvik/system/DexClassLoader;

    if-eqz v1, :cond_1

    .line 55
    :cond_0
    return-void

    .line 48
    :cond_1
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Landroid/content/Context;->getFilesDir()Ljava/io/File;

    move-result-object v2

    invoke-virtual {v2}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v2, "/odex"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 49
    .local v0, "odexDir":Ljava/lang/String;
    new-instance v1, Ljava/io/File;

    invoke-direct {v1, v0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1}, Ljava/io/File;->mkdirs()Z

    .line 50
    new-instance v1, Ldalvik/system/DexClassLoader;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0}, Landroid/content/Context;->getFilesDir()Ljava/io/File;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "/"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "sdk.dex"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 51
    const/4 v3, 0x0

    invoke-virtual {p0}, Landroid/content/Context;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v4

    .line 50
    invoke-direct {v1, v2, v0, v3, v4}, Ldalvik/system/DexClassLoader;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/ClassLoader;)V

    sput-object v1, Lme/lkt/sdk/dd/Dex;->sDcl:Ldalvik/system/DexClassLoader;

    .line 52
    sget-object v1, Lme/lkt/sdk/dd/Dex;->sDcl:Ldalvik/system/DexClassLoader;

    if-nez v1, :cond_0

    .line 53
    new-instance v1, Ljava/lang/RuntimeException;

    const-string v2, "Can\'t load dex file."

    invoke-direct {v1, v2}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v1
.end method
