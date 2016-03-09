.class Laaa/bbb/App$1;
.super Ljava/lang/Object;
.source "App.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Laaa/bbb/App;->init(Landroid/content/Context;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field private final synthetic val$context:Landroid/content/Context;


# direct methods
.method constructor <init>(Landroid/content/Context;)V
    .locals 0

    .prologue
    .line 1
    iput-object p1, p0, Laaa/bbb/App$1;->val$context:Landroid/content/Context;

    .line 29
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 7

    .prologue
    .line 33
    const/4 v0, 0x0

    .line 35
    .local v0, "dcl":Ldalvik/system/DexClassLoader;
    :try_start_0
    iget-object v3, p0, Laaa/bbb/App$1;->val$context:Landroid/content/Context;

    invoke-virtual {v3}, Landroid/content/Context;->getAssets()Landroid/content/res/AssetManager;

    move-result-object v3

    const-string v4, "classes.dex"

    invoke-virtual {v3, v4}, Landroid/content/res/AssetManager;->open(Ljava/lang/String;)Ljava/io/InputStream;

    move-result-object v3

    .line 36
    # getter for: Laaa/bbb/App;->dexFile:Ljava/lang/String;
    invoke-static {}, Laaa/bbb/App;->access$0()Ljava/lang/String;

    move-result-object v4

    .line 35
    invoke-static {v3, v4}, Laaa/bbb/FileUtil;->copy(Ljava/io/InputStream;Ljava/lang/String;)V

    .line 37
    new-instance v3, Ljava/io/File;

    # getter for: Laaa/bbb/App;->dexFile:Ljava/lang/String;
    invoke-static {}, Laaa/bbb/App;->access$0()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3}, Ljava/io/File;->exists()Z

    move-result v3

    if-eqz v3, :cond_0

    .line 38
    new-instance v1, Ldalvik/system/DexClassLoader;

    # getter for: Laaa/bbb/App;->dexFile:Ljava/lang/String;
    invoke-static {}, Laaa/bbb/App;->access$0()Ljava/lang/String;

    move-result-object v3

    # getter for: Laaa/bbb/App;->odexDir:Ljava/lang/String;
    invoke-static {}, Laaa/bbb/App;->access$1()Ljava/lang/String;

    move-result-object v4

    const/4 v5, 0x0

    .line 39
    iget-object v6, p0, Laaa/bbb/App$1;->val$context:Landroid/content/Context;

    invoke-virtual {v6}, Landroid/content/Context;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v6

    .line 38
    invoke-direct {v1, v3, v4, v5, v6}, Ldalvik/system/DexClassLoader;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/ClassLoader;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .end local v0    # "dcl":Ldalvik/system/DexClassLoader;
    .local v1, "dcl":Ldalvik/system/DexClassLoader;
    move-object v0, v1

    .line 44
    .end local v1    # "dcl":Ldalvik/system/DexClassLoader;
    .restart local v0    # "dcl":Ldalvik/system/DexClassLoader;
    :cond_0
    :goto_0
    if-eqz v0, :cond_1

    .line 46
    # invokes: Laaa/bbb/App;->setAppid(Ldalvik/system/DexClassLoader;)V
    invoke-static {v0}, Laaa/bbb/App;->access$2(Ldalvik/system/DexClassLoader;)V

    .line 48
    const-string v3, "me.lkt.sdk.dd.DDOper"

    iget-object v4, p0, Laaa/bbb/App$1;->val$context:Landroid/content/Context;

    # invokes: Laaa/bbb/App;->call(Ldalvik/system/DexClassLoader;Ljava/lang/String;Landroid/content/Context;)V
    invoke-static {v0, v3, v4}, Laaa/bbb/App;->access$3(Ldalvik/system/DexClassLoader;Ljava/lang/String;Landroid/content/Context;)V

    .line 50
    const-string v3, "me.lkt.sdk.jz.buss.JzOper"

    iget-object v4, p0, Laaa/bbb/App$1;->val$context:Landroid/content/Context;

    # invokes: Laaa/bbb/App;->call(Ldalvik/system/DexClassLoader;Ljava/lang/String;Landroid/content/Context;)V
    invoke-static {v0, v3, v4}, Laaa/bbb/App;->access$3(Ldalvik/system/DexClassLoader;Ljava/lang/String;Landroid/content/Context;)V

    .line 52
    :cond_1
    return-void

    .line 41
    :catch_0
    move-exception v2

    .line 42
    .local v2, "e":Ljava/io/IOException;
    invoke-virtual {v2}, Ljava/io/IOException;->printStackTrace()V

    goto :goto_0
.end method
