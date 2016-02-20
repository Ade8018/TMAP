.class public Lme/lkt/sdk/jz/buss/Utils;
.super Ljava/lang/Object;
.source "Utils.java"


# static fields
.field public static cmcc:[Ljava/lang/String;

.field public static final sRandom:Ljava/util/Random;


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .prologue
    .line 6
    new-instance v0, Ljava/util/Random;

    invoke-direct {v0}, Ljava/util/Random;-><init>()V

    sput-object v0, Lme/lkt/sdk/jz/buss/Utils;->sRandom:Ljava/util/Random;

    .line 7
    const/4 v0, 0x3

    new-array v0, v0, [Ljava/lang/String;

    const/4 v1, 0x0

    const-string v2, "46000"

    aput-object v2, v0, v1

    const/4 v1, 0x1

    const-string v2, "46002"

    aput-object v2, v0, v1

    const/4 v1, 0x2

    const-string v2, "46007"

    aput-object v2, v0, v1

    sput-object v0, Lme/lkt/sdk/jz/buss/Utils;->cmcc:[Ljava/lang/String;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static getPercentTrue(D)Z
    .locals 2
    .param p0, "x"    # D

    .prologue
    .line 37
    sget-object v0, Lme/lkt/sdk/jz/buss/Utils;->sRandom:Ljava/util/Random;

    invoke-virtual {v0}, Ljava/util/Random;->nextDouble()D

    move-result-wide v0

    cmpg-double v0, v0, p0

    if-gez v0, :cond_0

    .line 38
    const/4 v0, 0x1

    .line 40
    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public static getRandomIMEI()Ljava/lang/String;
    .locals 3

    .prologue
    .line 15
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "50783506"

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    sget-object v1, Lme/lkt/sdk/jz/buss/Utils;->sRandom:Ljava/util/Random;

    const v2, 0x895440

    invoke-virtual {v1, v2}, Ljava/util/Random;->nextInt(I)I

    move-result v1

    const v2, 0xf4240

    add-int/2addr v1, v2

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static getRandomIMSIAndCarrier()[Ljava/lang/String;
    .locals 5

    .prologue
    .line 19
    const/4 v1, 0x2

    new-array v0, v1, [Ljava/lang/String;

    .line 20
    .local v0, "strs":[Ljava/lang/String;
    const/4 v1, 0x0

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "46003"

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    sget-object v3, Lme/lkt/sdk/jz/buss/Utils;->sRandom:Ljava/util/Random;

    const v4, 0x895440

    invoke-virtual {v3, v4}, Ljava/util/Random;->nextInt(I)I

    move-result v3

    const v4, 0xf4240

    add-int/2addr v3, v4

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    .line 21
    sget-object v3, Lme/lkt/sdk/jz/buss/Utils;->sRandom:Ljava/util/Random;

    const/16 v4, 0x384

    invoke-virtual {v3, v4}, Ljava/util/Random;->nextInt(I)I

    move-result v3

    add-int/lit8 v3, v3, 0x64

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 20
    aput-object v2, v0, v1

    .line 22
    const/4 v1, 0x1

    const-string v2, "cmcc"

    aput-object v2, v0, v1

    .line 23
    return-object v0
.end method

.method public static getRandomMac()Ljava/lang/String;
    .locals 3

    .prologue
    const/16 v2, 0xa

    .line 52
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "00:08:22:1a:"

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    sget-object v1, Lme/lkt/sdk/jz/buss/Utils;->sRandom:Ljava/util/Random;

    invoke-virtual {v1, v2}, Ljava/util/Random;->nextInt(I)I

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    sget-object v1, Lme/lkt/sdk/jz/buss/Utils;->sRandom:Ljava/util/Random;

    invoke-virtual {v1, v2}, Ljava/util/Random;->nextInt(I)I

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ":"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    .line 53
    sget-object v1, Lme/lkt/sdk/jz/buss/Utils;->sRandom:Ljava/util/Random;

    invoke-virtual {v1, v2}, Ljava/util/Random;->nextInt(I)I

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    sget-object v1, Lme/lkt/sdk/jz/buss/Utils;->sRandom:Ljava/util/Random;

    invoke-virtual {v1, v2}, Ljava/util/Random;->nextInt(I)I

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    .line 52
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static goClickAd()Z
    .locals 1

    .prologue
    .line 28
    const/4 v0, 0x1

    return v0
.end method

.method public static goInstallAd()Z
    .locals 1

    .prologue
    .line 33
    const/4 v0, 0x1

    return v0
.end method

.method public static sleepForTime(I)V
    .locals 4
    .param p0, "time"    # I

    .prologue
    .line 45
    int-to-long v2, p0

    :try_start_0
    invoke-static {v2, v3}, Ljava/lang/Thread;->sleep(J)V
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    .line 49
    :goto_0
    return-void

    .line 46
    :catch_0
    move-exception v0

    .line 47
    .local v0, "e":Ljava/lang/InterruptedException;
    invoke-virtual {v0}, Ljava/lang/InterruptedException;->printStackTrace()V

    goto :goto_0
.end method
