.class public Lme/lkt/sdk/jz/buss/SpHelper;
.super Ljava/lang/Object;
.source "SpHelper.java"


# static fields
.field public static final SP_KEY_IS_FIRST_START:Ljava/lang/String; = "is_first_start"

.field public static final SP_KEY_LAST_PUSH_ADID:Ljava/lang/String; = "sp_key_last_push_adId"

.field public static final SP_KEY_PROVINCE:Ljava/lang/String; = "sp_key_province"

.field public static final SP_KEY_SDK_VERSION:Ljava/lang/String; = "sp_key_sdkVersion"

.field public static final SP_NAME:Ljava/lang/String; = "sp"

.field private static sSp:Landroid/content/SharedPreferences;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 6
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static getFormatProvince()[Ljava/lang/String;
    .locals 5

    .prologue
    .line 33
    sget-object v2, Lme/lkt/sdk/jz/buss/SpHelper;->sSp:Landroid/content/SharedPreferences;

    const-string v3, "sp_key_province"

    const-string v4, ""

    invoke-interface {v2, v3, v4}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 34
    .local v0, "pro":Ljava/lang/String;
    const/4 v2, 0x4

    new-array v1, v2, [Ljava/lang/String;

    .line 35
    .local v1, "result":[Ljava/lang/String;
    const/4 v2, 0x0

    aput-object v0, v1, v2

    .line 36
    return-object v1
.end method

.method public static getLastPushAdId()Ljava/lang/String;
    .locals 3

    .prologue
    .line 21
    sget-object v0, Lme/lkt/sdk/jz/buss/SpHelper;->sSp:Landroid/content/SharedPreferences;

    const-string v1, "sp_key_last_push_adId"

    const-string v2, ""

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static init(Landroid/content/Context;)V
    .locals 2
    .param p0, "context"    # Landroid/content/Context;

    .prologue
    .line 15
    sget-object v0, Lme/lkt/sdk/jz/buss/SpHelper;->sSp:Landroid/content/SharedPreferences;

    if-nez v0, :cond_0

    .line 16
    const-string v0, "sp"

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v0

    sput-object v0, Lme/lkt/sdk/jz/buss/SpHelper;->sSp:Landroid/content/SharedPreferences;

    .line 18
    :cond_0
    return-void
.end method

.method public static isFirstStart()Z
    .locals 5

    .prologue
    const/4 v2, 0x1

    const/4 v1, 0x0

    .line 40
    sget-object v3, Lme/lkt/sdk/jz/buss/SpHelper;->sSp:Landroid/content/SharedPreferences;

    const-string v4, "is_first_start"

    invoke-interface {v3, v4, v2}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    .line 41
    .local v0, "result":Z
    if-nez v0, :cond_0

    .line 44
    :goto_0
    return v1

    .line 43
    :cond_0
    sget-object v3, Lme/lkt/sdk/jz/buss/SpHelper;->sSp:Landroid/content/SharedPreferences;

    invoke-interface {v3}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v3

    const-string v4, "is_first_start"

    invoke-interface {v3, v4, v1}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    move-result-object v1

    invoke-interface {v1}, Landroid/content/SharedPreferences$Editor;->commit()Z

    move v1, v2

    .line 44
    goto :goto_0
.end method

.method public static saveProvince(Ljava/lang/String;)V
    .locals 2
    .param p0, "pro"    # Ljava/lang/String;

    .prologue
    .line 29
    sget-object v0, Lme/lkt/sdk/jz/buss/SpHelper;->sSp:Landroid/content/SharedPreferences;

    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    const-string v1, "sp_key_province"

    invoke-interface {v0, v1, p0}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 30
    return-void
.end method

.method public static savePushAdId(Ljava/lang/String;)V
    .locals 2
    .param p0, "adId"    # Ljava/lang/String;

    .prologue
    .line 25
    sget-object v0, Lme/lkt/sdk/jz/buss/SpHelper;->sSp:Landroid/content/SharedPreferences;

    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    const-string v1, "sp_key_last_push_adId"

    invoke-interface {v0, v1, p0}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 26
    return-void
.end method
