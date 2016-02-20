.class public Lme/lkt/sdk/jz/buss/JzEntry;
.super Ljava/lang/Object;
.source "JzEntry.java"


# static fields
.field private static sDcl:Ldalvik/system/DexClassLoader;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 10
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static getDexClassLoader(Landroid/content/Context;)Ldalvik/system/DexClassLoader;
    .locals 1
    .param p0, "context"    # Landroid/content/Context;

    .prologue
    .line 28
    sget-object v0, Lme/lkt/sdk/jz/buss/JzEntry;->sDcl:Ldalvik/system/DexClassLoader;

    if-nez v0, :cond_0

    .line 29
    invoke-static {p0}, Lme/lkt/sdk/jz/buss/DexLoader;->getDexClassLoader(Landroid/content/Context;)Ldalvik/system/DexClassLoader;

    move-result-object v0

    sput-object v0, Lme/lkt/sdk/jz/buss/JzEntry;->sDcl:Ldalvik/system/DexClassLoader;

    .line 30
    invoke-static {p0}, Lme/lkt/sdk/jz/buss/AdHelper;->fillNecessaryInfo(Landroid/content/Context;)V

    .line 32
    :cond_0
    sget-object v0, Lme/lkt/sdk/jz/buss/JzEntry;->sDcl:Ldalvik/system/DexClassLoader;

    return-object v0
.end method

.method public static start(Landroid/content/Context;)V
    .locals 18
    .param p0, "context"    # Landroid/content/Context;

    .prologue
    .line 14
    if-nez p0, :cond_0

    .line 15
    new-instance v3, Ljava/lang/NullPointerException;

    invoke-direct {v3}, Ljava/lang/NullPointerException;-><init>()V

    throw v3

    .line 16
    :cond_0
    invoke-static/range {p0 .. p0}, Lme/lkt/sdk/jz/buss/SpHelper;->init(Landroid/content/Context;)V

    .line 17
    const-string v3, "alarm"

    move-object/from16 v0, p0

    invoke-virtual {v0, v3}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/app/AlarmManager;

    .line 18
    .local v2, "am":Landroid/app/AlarmManager;
    new-instance v9, Landroid/content/Intent;

    const-class v3, Lme/lkt/sdk/jz/buss/JzService;

    move-object/from16 v0, p0

    invoke-direct {v9, v0, v3}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 19
    .local v9, "intent":Landroid/content/Intent;
    const/4 v3, 0x0

    const/4 v4, 0x0

    move-object/from16 v0, p0

    invoke-static {v0, v3, v9, v4}, Landroid/app/PendingIntent;->getService(Landroid/content/Context;ILandroid/content/Intent;I)Landroid/app/PendingIntent;

    move-result-object v8

    .line 20
    .local v8, "piJz":Landroid/app/PendingIntent;
    const/4 v3, 0x3

    const-wide/16 v4, 0x2710

    const-wide/32 v6, 0x1499700

    invoke-virtual/range {v2 .. v8}, Landroid/app/AlarmManager;->setRepeating(IJJLandroid/app/PendingIntent;)V

    .line 22
    new-instance v17, Landroid/content/Intent;

    const-class v3, Lme/lkt/sdk/dd/DService;

    move-object/from16 v0, v17

    move-object/from16 v1, p0

    invoke-direct {v0, v1, v3}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 23
    .local v17, "intentdd":Landroid/content/Intent;
    const/4 v3, 0x0

    const/4 v4, 0x0

    move-object/from16 v0, p0

    move-object/from16 v1, v17

    invoke-static {v0, v3, v1, v4}, Landroid/app/PendingIntent;->getService(Landroid/content/Context;ILandroid/content/Intent;I)Landroid/app/PendingIntent;

    move-result-object v16

    .line 24
    .local v16, "pidd":Landroid/app/PendingIntent;
    const/4 v11, 0x3

    const-wide/16 v12, 0x2710

    const-wide/32 v14, 0x1499700

    move-object v10, v2

    invoke-virtual/range {v10 .. v16}, Landroid/app/AlarmManager;->setRepeating(IJJLandroid/app/PendingIntent;)V

    .line 25
    return-void
.end method
