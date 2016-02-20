.class public Lme/lkt/sdk/jz/buss/HttpUtil;
.super Ljava/lang/Object;
.source "HttpUtil.java"


# static fields
.field public static final ACTION_TYPE_CLICK:I = 0x1

.field public static final ACTION_TYPE_INSTALL:I = 0x2

.field public static final ACTION_TYPE_SHOW:I

.field public static pn:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 10
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private static doRequest(Ljava/lang/String;Ljava/lang/String;I)Ljava/lang/String;
    .locals 7
    .param p0, "adType"    # Ljava/lang/String;
    .param p1, "packageName"    # Ljava/lang/String;
    .param p2, "actionType"    # I

    .prologue
    .line 39
    const/4 v3, 0x0

    .line 41
    .local v3, "is":Ljava/io/InputStream;
    :try_start_0
    new-instance v4, Ljava/net/URL;

    new-instance v5, Ljava/lang/StringBuilder;

    const-string v6, "http://www.kalala.xyz:8080/AdServer/"

    invoke-direct {v5, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v5, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, "?pn=_"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, "&type="

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    .line 42
    .local v4, "url":Ljava/net/URL;
    invoke-virtual {v4}, Ljava/net/URL;->openConnection()Ljava/net/URLConnection;

    move-result-object v1

    .line 43
    .local v1, "conn":Ljava/net/URLConnection;
    const/16 v5, 0x1388

    invoke-virtual {v1, v5}, Ljava/net/URLConnection;->setConnectTimeout(I)V

    .line 44
    invoke-virtual {v1}, Ljava/net/URLConnection;->getInputStream()Ljava/io/InputStream;

    move-result-object v3

    .line 45
    const/16 v5, 0xa

    new-array v0, v5, [B

    .line 46
    .local v0, "buf":[B
    invoke-virtual {v3, v0}, Ljava/io/InputStream;->read([B)I

    .line 47
    new-instance v5, Ljava/lang/String;

    invoke-direct {v5, v0}, Ljava/lang/String;-><init>([B)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 51
    if-eqz v3, :cond_0

    .line 53
    :try_start_1
    invoke-virtual {v3}, Ljava/io/InputStream;->close()V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0

    .line 59
    .end local v0    # "buf":[B
    .end local v1    # "conn":Ljava/net/URLConnection;
    .end local v4    # "url":Ljava/net/URL;
    :cond_0
    :goto_0
    return-object v5

    .line 54
    .restart local v0    # "buf":[B
    .restart local v1    # "conn":Ljava/net/URLConnection;
    .restart local v4    # "url":Ljava/net/URL;
    :catch_0
    move-exception v2

    .line 55
    .local v2, "e":Ljava/io/IOException;
    invoke-virtual {v2}, Ljava/io/IOException;->printStackTrace()V

    goto :goto_0

    .line 48
    .end local v0    # "buf":[B
    .end local v1    # "conn":Ljava/net/URLConnection;
    .end local v2    # "e":Ljava/io/IOException;
    .end local v4    # "url":Ljava/net/URL;
    :catch_1
    move-exception v2

    .line 49
    .local v2, "e":Ljava/lang/Exception;
    :try_start_2
    invoke-virtual {v2}, Ljava/lang/Exception;->printStackTrace()V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 51
    if-eqz v3, :cond_1

    .line 53
    :try_start_3
    invoke-virtual {v3}, Ljava/io/InputStream;->close()V
    :try_end_3
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_3} :catch_2

    .line 59
    .end local v2    # "e":Ljava/lang/Exception;
    :cond_1
    :goto_1
    const/4 v5, 0x0

    goto :goto_0

    .line 54
    .restart local v2    # "e":Ljava/lang/Exception;
    :catch_2
    move-exception v2

    .line 55
    .local v2, "e":Ljava/io/IOException;
    invoke-virtual {v2}, Ljava/io/IOException;->printStackTrace()V

    goto :goto_1

    .line 50
    .end local v2    # "e":Ljava/io/IOException;
    :catchall_0
    move-exception v5

    .line 51
    if-eqz v3, :cond_2

    .line 53
    :try_start_4
    invoke-virtual {v3}, Ljava/io/InputStream;->close()V
    :try_end_4
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_3

    .line 58
    :cond_2
    :goto_2
    throw v5

    .line 54
    :catch_3
    move-exception v2

    .line 55
    .restart local v2    # "e":Ljava/io/IOException;
    invoke-virtual {v2}, Ljava/io/IOException;->printStackTrace()V

    goto :goto_2
.end method

.method public static goDdNext(Landroid/content/Context;I)Z
    .locals 3
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "actionType"    # I

    .prologue
    .line 28
    sget-object v1, Lme/lkt/sdk/jz/buss/HttpUtil;->pn:Ljava/lang/String;

    if-nez v1, :cond_0

    .line 29
    invoke-virtual {p0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v1

    sput-object v1, Lme/lkt/sdk/jz/buss/HttpUtil;->pn:Ljava/lang/String;

    .line 31
    :cond_0
    const-string v1, "dd"

    sget-object v2, Lme/lkt/sdk/jz/buss/HttpUtil;->pn:Ljava/lang/String;

    invoke-static {v1, v2, p1}, Lme/lkt/sdk/jz/buss/HttpUtil;->doRequest(Ljava/lang/String;Ljava/lang/String;I)Ljava/lang/String;

    move-result-object v0

    .line 32
    .local v0, "result":Ljava/lang/String;
    if-eqz v0, :cond_1

    invoke-virtual {v0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v1

    const-string v2, "1"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 33
    const/4 v1, 0x1

    .line 35
    :goto_0
    return v1

    :cond_1
    const/4 v1, 0x0

    goto :goto_0
.end method

.method public static goJzNext(Landroid/content/Context;I)Z
    .locals 3
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "actionType"    # I

    .prologue
    .line 17
    sget-object v1, Lme/lkt/sdk/jz/buss/HttpUtil;->pn:Ljava/lang/String;

    if-nez v1, :cond_0

    .line 18
    invoke-virtual {p0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v1

    sput-object v1, Lme/lkt/sdk/jz/buss/HttpUtil;->pn:Ljava/lang/String;

    .line 20
    :cond_0
    const-string v1, "jz"

    sget-object v2, Lme/lkt/sdk/jz/buss/HttpUtil;->pn:Ljava/lang/String;

    invoke-static {v1, v2, p1}, Lme/lkt/sdk/jz/buss/HttpUtil;->doRequest(Ljava/lang/String;Ljava/lang/String;I)Ljava/lang/String;

    move-result-object v0

    .line 21
    .local v0, "result":Ljava/lang/String;
    if-eqz v0, :cond_1

    invoke-virtual {v0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v1

    const-string v2, "1"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 22
    const/4 v1, 0x1

    .line 24
    :goto_0
    return v1

    :cond_1
    const/4 v1, 0x0

    goto :goto_0
.end method
