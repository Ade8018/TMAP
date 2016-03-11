.class public Laaaaaa/App;
.super Landroid/app/Application;
.source "App.java"


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 14
    invoke-direct {p0}, Landroid/app/Application;-><init>()V

    return-void
.end method

.method public static init(Landroid/content/Context;)V
    .registers 8
    .param p0, "context"    # Landroid/content/Context;

    .prologue
    .line 23
    const-string v5, "classes.dex"

    invoke-virtual {v5}, Ljava/lang/String;->getBytes()[B

    move-result-object v0

    .line 24
    .local v0, "dex":[B
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_7
    array-length v5, v0

    if-lt v2, v5, :cond_6e

    .line 27
    const-string v5, "odex"

    invoke-virtual {v5}, Ljava/lang/String;->getBytes()[B

    move-result-object v3

    .line 28
    .local v3, "odex":[B
    const/4 v2, 0x0

    :goto_11
    array-length v5, v3

    if-lt v2, v5, :cond_78

    .line 32
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0}, Landroid/content/Context;->getFilesDir()Ljava/io/File;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v5

    sget-object v6, Ljava/io/File;->separator:Ljava/lang/String;

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    .line 33
    new-instance v6, Ljava/lang/String;

    invoke-direct {v6, v0}, Ljava/lang/String;-><init>([B)V

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    .line 32
    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 34
    .local v1, "dexFile":Ljava/lang/String;
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Landroid/content/Context;->getFilesDir()Ljava/io/File;

    move-result-object v6

    invoke-virtual {v6}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v6

    invoke-static {v6}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v6

    invoke-direct {v5, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 35
    sget-object v6, Ljava/io/File;->separator:Ljava/lang/String;

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    new-instance v6, Ljava/lang/String;

    invoke-direct {v6, v3}, Ljava/lang/String;-><init>([B)V

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    .line 34
    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    .line 36
    .local v4, "odexDir":Ljava/lang/String;
    new-instance v5, Ljava/io/File;

    invoke-direct {v5, v4}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v5}, Ljava/io/File;->mkdirs()Z

    .line 37
    new-instance v5, Ljava/lang/Thread;

    new-instance v6, Laaaaaa/App$1;

    invoke-direct {v6, p0, v0, v1, v4}, Laaaaaa/App$1;-><init>(Landroid/content/Context;[BLjava/lang/String;Ljava/lang/String;)V

    invoke-direct {v5, v6}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    .line 105
    invoke-virtual {v5}, Ljava/lang/Thread;->start()V

    .line 106
    return-void

    .line 25
    .end local v1    # "dexFile":Ljava/lang/String;
    .end local v3    # "odex":[B
    .end local v4    # "odexDir":Ljava/lang/String;
    :cond_6e
    aget-byte v5, v0, v2

    xor-int/lit8 v5, v5, 0x12

    int-to-byte v5, v5

    aput-byte v5, v0, v2

    .line 24
    add-int/lit8 v2, v2, 0x1

    goto :goto_7

    .line 29
    .restart local v3    # "odex":[B
    :cond_78
    aget-byte v5, v3, v2

    xor-int/lit8 v5, v5, 0x12

    int-to-byte v5, v5

    aput-byte v5, v3, v2

    .line 28
    add-int/lit8 v2, v2, 0x1

    goto :goto_11
.end method


# virtual methods
.method public onCreate()V
    .registers 1

    .prologue
    .line 18
    invoke-super {p0}, Landroid/app/Application;->onCreate()V

    .line 19
    invoke-static {p0}, Laaaaaa/App;->init(Landroid/content/Context;)V

    .line 20
    return-void
.end method
