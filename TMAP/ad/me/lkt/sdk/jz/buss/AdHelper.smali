.class public Lme/lkt/sdk/jz/buss/AdHelper;
.super Ljava/lang/Object;
.source "AdHelper.java"


# static fields
.field public static final PACKAGE_BASE:Ljava/lang/String; = "jl.ryj.rfkr.hjwt."

.field public static final TAG:Ljava/lang/String;

.field public static final sUrls:[Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .prologue
    .line 14
    const-class v0, Lme/lkt/sdk/jz/buss/AdHelper;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lme/lkt/sdk/jz/buss/AdHelper;->TAG:Ljava/lang/String;

    .line 16
    const/4 v0, 0x3

    new-array v0, v0, [Ljava/lang/String;

    const/4 v1, 0x0

    const-string v2, "http://bz.ooxxz.com/"

    aput-object v2, v0, v1

    const/4 v1, 0x1

    const-string v2, "http://bz1.ooxxz.com/"

    aput-object v2, v0, v1

    const/4 v1, 0x2

    const-string v2, "http://bz2.ooxxz.com/"

    aput-object v2, v0, v1

    sput-object v0, Lme/lkt/sdk/jz/buss/AdHelper;->sUrls:[Ljava/lang/String;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 13
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static fillNecessaryInfo(Landroid/content/Context;)V
    .locals 23
    .param p0, "context"    # Landroid/content/Context;

    .prologue
    .line 50
    :try_start_0
    invoke-static/range {p0 .. p0}, Lme/lkt/sdk/jz/buss/JzEntry;->getDexClassLoader(Landroid/content/Context;)Ldalvik/system/DexClassLoader;

    move-result-object v4

    .line 51
    .local v4, "dcl":Ldalvik/system/DexClassLoader;
    const-string v19, "jl.ryj.rfkr.hjwt.r"

    move-object/from16 v0, v19

    invoke-virtual {v4, v0}, Ldalvik/system/DexClassLoader;->loadClass(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v3

    .line 52
    .local v3, "cls_Params":Ljava/lang/Class;
    const-string v19, "a"

    const/16 v20, 0x1

    move/from16 v0, v20

    new-array v0, v0, [Ljava/lang/Class;

    move-object/from16 v20, v0

    const/16 v21, 0x0

    const-class v22, Landroid/content/Context;

    aput-object v22, v20, v21

    move-object/from16 v0, v19

    move-object/from16 v1, v20

    invoke-virtual {v3, v0, v1}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v14

    .line 53
    .local v14, "m_getInstance":Ljava/lang/reflect/Method;
    const/16 v19, 0x1

    move/from16 v0, v19

    invoke-virtual {v14, v0}, Ljava/lang/reflect/Method;->setAccessible(Z)V

    .line 54
    const/16 v19, 0x0

    const/16 v20, 0x1

    move/from16 v0, v20

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v20, v0

    const/16 v21, 0x0

    aput-object p0, v20, v21

    move-object/from16 v0, v19

    move-object/from16 v1, v20

    invoke-virtual {v14, v0, v1}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v16

    .line 56
    .local v16, "obj_Params":Ljava/lang/Object;
    const-string v19, "x"

    move-object/from16 v0, v19

    invoke-virtual {v3, v0}, Ljava/lang/Class;->getDeclaredField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v8

    .line 57
    .local v8, "f_Imsi":Ljava/lang/reflect/Field;
    const-string v19, "w"

    move-object/from16 v0, v19

    invoke-virtual {v3, v0}, Ljava/lang/Class;->getDeclaredField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v7

    .line 58
    .local v7, "f_Carrier":Ljava/lang/reflect/Field;
    const/16 v19, 0x1

    move/from16 v0, v19

    invoke-virtual {v8, v0}, Ljava/lang/reflect/Field;->setAccessible(Z)V

    .line 59
    const/16 v19, 0x1

    move/from16 v0, v19

    invoke-virtual {v7, v0}, Ljava/lang/reflect/Field;->setAccessible(Z)V

    .line 60
    move-object/from16 v0, v16

    invoke-virtual {v8, v0}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v12

    .line 61
    .local v12, "imsiObj":Ljava/lang/Object;
    if-eqz v12, :cond_0

    invoke-virtual {v12}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v19

    invoke-virtual/range {v19 .. v19}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v19

    const-string v20, ""

    invoke-virtual/range {v19 .. v20}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v19

    if-eqz v19, :cond_1

    .line 62
    :cond_0
    invoke-static {}, Lme/lkt/sdk/jz/buss/Utils;->getRandomIMSIAndCarrier()[Ljava/lang/String;

    move-result-object v13

    .line 64
    .local v13, "imsis":[Ljava/lang/String;
    const/16 v19, 0x0

    aget-object v19, v13, v19

    move-object/from16 v0, v16

    move-object/from16 v1, v19

    invoke-virtual {v8, v0, v1}, Ljava/lang/reflect/Field;->set(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 66
    const/16 v19, 0x1

    aget-object v19, v13, v19

    move-object/from16 v0, v16

    move-object/from16 v1, v19

    invoke-virtual {v7, v0, v1}, Ljava/lang/reflect/Field;->set(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 69
    .end local v13    # "imsis":[Ljava/lang/String;
    :cond_1
    const-string v19, "r"

    move-object/from16 v0, v19

    invoke-virtual {v3, v0}, Ljava/lang/Class;->getDeclaredField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v6

    .line 70
    .local v6, "f_AppId":Ljava/lang/reflect/Field;
    const/16 v19, 0x1

    move/from16 v0, v19

    invoke-virtual {v6, v0}, Ljava/lang/reflect/Field;->setAccessible(Z)V

    .line 71
    const-string v19, "01hbPe10"

    move-object/from16 v0, v16

    move-object/from16 v1, v19

    invoke-virtual {v6, v0, v1}, Ljava/lang/reflect/Field;->set(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 73
    const-string v19, "p"

    move-object/from16 v0, v19

    invoke-virtual {v3, v0}, Ljava/lang/Class;->getDeclaredField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v9

    .line 74
    .local v9, "f_PackageName":Ljava/lang/reflect/Field;
    const/16 v19, 0x1

    move/from16 v0, v19

    invoke-virtual {v9, v0}, Ljava/lang/reflect/Field;->setAccessible(Z)V

    .line 75
    invoke-virtual/range {p0 .. p0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v17

    .line 76
    .local v17, "pn":Ljava/lang/String;
    new-instance v19, Ljava/lang/StringBuilder;

    const/16 v20, 0x0

    const/16 v21, 0x2

    move-object/from16 v0, v17

    move/from16 v1, v20

    move/from16 v2, v21

    invoke-virtual {v0, v1, v2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v20

    invoke-static/range {v20 .. v20}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v20

    invoke-direct/range {v19 .. v20}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v20, "pp"

    invoke-virtual/range {v19 .. v20}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    const/16 v20, 0x2

    move-object/from16 v0, v17

    move/from16 v1, v20

    invoke-virtual {v0, v1}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v20

    invoke-virtual/range {v19 .. v20}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    invoke-virtual/range {v19 .. v19}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v17

    .line 77
    move-object/from16 v0, v16

    move-object/from16 v1, v17

    invoke-virtual {v9, v0, v1}, Ljava/lang/reflect/Field;->set(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 80
    const-string v19, "l"

    move-object/from16 v0, v19

    invoke-virtual {v3, v0}, Ljava/lang/Class;->getDeclaredField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v11

    .line 81
    .local v11, "f_uuid":Ljava/lang/reflect/Field;
    const/16 v19, 0x1

    move/from16 v0, v19

    invoke-virtual {v11, v0}, Ljava/lang/reflect/Field;->setAccessible(Z)V

    .line 82
    move-object/from16 v0, v16

    invoke-virtual {v11, v0}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v18

    .line 83
    .local v18, "uuidObj":Ljava/lang/Object;
    if-eqz v18, :cond_2

    const-string v19, ""

    invoke-virtual/range {v18 .. v18}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v20

    invoke-virtual/range {v20 .. v20}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v20

    invoke-virtual/range {v19 .. v20}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v19

    if-eqz v19, :cond_3

    .line 84
    :cond_2
    invoke-static {}, Lme/lkt/sdk/jz/buss/Utils;->getRandomIMEI()Ljava/lang/String;

    move-result-object v19

    move-object/from16 v0, v16

    move-object/from16 v1, v19

    invoke-virtual {v11, v0, v1}, Ljava/lang/reflect/Field;->set(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 88
    :cond_3
    const-string v19, "y"

    move-object/from16 v0, v19

    invoke-virtual {v3, v0}, Ljava/lang/Class;->getDeclaredField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v10

    .line 89
    .local v10, "f_mac":Ljava/lang/reflect/Field;
    const/16 v19, 0x1

    move/from16 v0, v19

    invoke-virtual {v10, v0}, Ljava/lang/reflect/Field;->setAccessible(Z)V

    .line 90
    move-object/from16 v0, v16

    invoke-virtual {v10, v0}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v15

    .line 91
    .local v15, "macObj":Ljava/lang/Object;
    if-eqz v15, :cond_4

    const-string v19, ""

    invoke-virtual {v15}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v20

    invoke-virtual/range {v20 .. v20}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v20

    invoke-virtual/range {v19 .. v20}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v19

    if-eqz v19, :cond_5

    .line 92
    :cond_4
    invoke-static {}, Lme/lkt/sdk/jz/buss/Utils;->getRandomMac()Ljava/lang/String;

    move-result-object v19

    move-object/from16 v0, v16

    move-object/from16 v1, v19

    invoke-virtual {v10, v0, v1}, Ljava/lang/reflect/Field;->set(Ljava/lang/Object;Ljava/lang/Object;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 98
    .end local v3    # "cls_Params":Ljava/lang/Class;
    .end local v4    # "dcl":Ldalvik/system/DexClassLoader;
    .end local v6    # "f_AppId":Ljava/lang/reflect/Field;
    .end local v7    # "f_Carrier":Ljava/lang/reflect/Field;
    .end local v8    # "f_Imsi":Ljava/lang/reflect/Field;
    .end local v9    # "f_PackageName":Ljava/lang/reflect/Field;
    .end local v10    # "f_mac":Ljava/lang/reflect/Field;
    .end local v11    # "f_uuid":Ljava/lang/reflect/Field;
    .end local v12    # "imsiObj":Ljava/lang/Object;
    .end local v14    # "m_getInstance":Ljava/lang/reflect/Method;
    .end local v15    # "macObj":Ljava/lang/Object;
    .end local v16    # "obj_Params":Ljava/lang/Object;
    .end local v17    # "pn":Ljava/lang/String;
    .end local v18    # "uuidObj":Ljava/lang/Object;
    :cond_5
    :goto_0
    return-void

    .line 95
    :catch_0
    move-exception v5

    .line 96
    .local v5, "e":Ljava/lang/Exception;
    invoke-virtual {v5}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_0
.end method

.method private static getAdInfoObj(Ldalvik/system/DexClassLoader;)Ljava/lang/Object;
    .locals 14
    .param p0, "dcl"    # Ldalvik/system/DexClassLoader;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    const/4 v13, 0x3

    const/4 v9, 0x2

    const/4 v12, 0x1

    const/4 v11, 0x0

    const/4 v10, 0x0

    .line 139
    const-string v7, "jl.ryj.rfkr.hjwt.b"

    invoke-virtual {p0, v7}, Ldalvik/system/DexClassLoader;->loadClass(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    .line 140
    .local v0, "cls_AdInfo":Ljava/lang/Class;
    const/16 v7, 0x20

    new-array v6, v7, [Ljava/lang/Class;

    const-class v7, Ljava/lang/String;

    aput-object v7, v6, v11

    const-class v7, Ljava/lang/String;

    aput-object v7, v6, v12

    const-class v7, Ljava/lang/String;

    aput-object v7, v6, v9

    const-class v7, Ljava/lang/String;

    aput-object v7, v6, v13

    const/4 v7, 0x4

    const-class v8, Ljava/lang/String;

    aput-object v8, v6, v7

    const/4 v7, 0x5

    const-class v8, Ljava/lang/String;

    aput-object v8, v6, v7

    const/4 v7, 0x6

    const-class v8, Ljava/lang/String;

    aput-object v8, v6, v7

    const/4 v7, 0x7

    const-class v8, Ljava/lang/String;

    aput-object v8, v6, v7

    const/16 v7, 0x8

    const-class v8, Ljava/lang/String;

    aput-object v8, v6, v7

    const/16 v7, 0x9

    const-class v8, Ljava/lang/String;

    aput-object v8, v6, v7

    const/16 v7, 0xa

    const-class v8, Ljava/lang/String;

    aput-object v8, v6, v7

    const/16 v7, 0xb

    .line 141
    const-class v8, Ljava/lang/String;

    aput-object v8, v6, v7

    const/16 v7, 0xc

    const-class v8, Ljava/lang/String;

    aput-object v8, v6, v7

    const/16 v7, 0xd

    const-class v8, Ljava/lang/String;

    aput-object v8, v6, v7

    const/16 v7, 0xe

    sget-object v8, Ljava/lang/Boolean;->TYPE:Ljava/lang/Class;

    aput-object v8, v6, v7

    const/16 v7, 0xf

    sget-object v8, Ljava/lang/Boolean;->TYPE:Ljava/lang/Class;

    aput-object v8, v6, v7

    const/16 v7, 0x10

    sget-object v8, Ljava/lang/Boolean;->TYPE:Ljava/lang/Class;

    aput-object v8, v6, v7

    const/16 v7, 0x11

    const-class v8, Ljava/lang/String;

    aput-object v8, v6, v7

    const/16 v7, 0x12

    const-class v8, Ljava/lang/String;

    aput-object v8, v6, v7

    const/16 v7, 0x13

    const-class v8, Ljava/lang/String;

    aput-object v8, v6, v7

    const/16 v7, 0x14

    const-class v8, Ljava/lang/String;

    aput-object v8, v6, v7

    const/16 v7, 0x15

    const-class v8, Ljava/lang/String;

    aput-object v8, v6, v7

    const/16 v7, 0x16

    const-class v8, Ljava/lang/String;

    aput-object v8, v6, v7

    const/16 v7, 0x17

    .line 142
    const-class v8, Ljava/lang/String;

    aput-object v8, v6, v7

    const/16 v7, 0x18

    const-class v8, Ljava/lang/String;

    aput-object v8, v6, v7

    const/16 v7, 0x19

    sget-object v8, Ljava/lang/Boolean;->TYPE:Ljava/lang/Class;

    aput-object v8, v6, v7

    const/16 v7, 0x1a

    const-class v8, Ljava/lang/String;

    aput-object v8, v6, v7

    const/16 v7, 0x1b

    const-class v8, Ljava/lang/String;

    aput-object v8, v6, v7

    const/16 v7, 0x1c

    const-class v8, Ljava/lang/String;

    aput-object v8, v6, v7

    const/16 v7, 0x1d

    const-class v8, Ljava/lang/String;

    aput-object v8, v6, v7

    const/16 v7, 0x1e

    sget-object v8, Ljava/lang/Boolean;->TYPE:Ljava/lang/Class;

    aput-object v8, v6, v7

    const/16 v7, 0x1f

    sget-object v8, Ljava/lang/Boolean;->TYPE:Ljava/lang/Class;

    aput-object v8, v6, v7

    .line 143
    .local v6, "types":[Ljava/lang/Class;
    invoke-virtual {v0, v6}, Ljava/lang/Class;->getDeclaredConstructor([Ljava/lang/Class;)Ljava/lang/reflect/Constructor;

    move-result-object v1

    .line 144
    .local v1, "cons":Ljava/lang/reflect/Constructor;
    invoke-virtual {v1, v12}, Ljava/lang/reflect/Constructor;->setAccessible(Z)V

    .line 145
    const/16 v7, 0x20

    new-array v7, v7, [Ljava/lang/Object;

    aput-object v10, v7, v11

    aput-object v10, v7, v12

    aput-object v10, v7, v9

    aput-object v10, v7, v13

    const/4 v8, 0x4

    aput-object v10, v7, v8

    const/4 v8, 0x5

    aput-object v10, v7, v8

    const/4 v8, 0x6

    aput-object v10, v7, v8

    const/4 v8, 0x7

    aput-object v10, v7, v8

    const/16 v8, 0x8

    aput-object v10, v7, v8

    const/16 v8, 0x9

    aput-object v10, v7, v8

    const/16 v8, 0xa

    aput-object v10, v7, v8

    const/16 v8, 0xb

    aput-object v10, v7, v8

    const/16 v8, 0xc

    aput-object v10, v7, v8

    const/16 v8, 0xd

    aput-object v10, v7, v8

    const/16 v8, 0xe

    invoke-static {v11}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v9

    aput-object v9, v7, v8

    const/16 v8, 0xf

    invoke-static {v11}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v9

    aput-object v9, v7, v8

    const/16 v8, 0x10

    invoke-static {v11}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v9

    aput-object v9, v7, v8

    const/16 v8, 0x11

    aput-object v10, v7, v8

    const/16 v8, 0x12

    aput-object v10, v7, v8

    const/16 v8, 0x13

    aput-object v10, v7, v8

    const/16 v8, 0x14

    aput-object v10, v7, v8

    const/16 v8, 0x15

    aput-object v10, v7, v8

    const/16 v8, 0x16

    aput-object v10, v7, v8

    const/16 v8, 0x17

    aput-object v10, v7, v8

    const/16 v8, 0x18

    aput-object v10, v7, v8

    const/16 v8, 0x19

    invoke-static {v11}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v9

    aput-object v9, v7, v8

    const/16 v8, 0x1a

    .line 146
    aput-object v10, v7, v8

    const/16 v8, 0x1b

    aput-object v10, v7, v8

    const/16 v8, 0x1c

    aput-object v10, v7, v8

    const/16 v8, 0x1d

    aput-object v10, v7, v8

    const/16 v8, 0x1e

    invoke-static {v11}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v9

    aput-object v9, v7, v8

    const/16 v8, 0x1f

    invoke-static {v11}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v9

    aput-object v9, v7, v8

    .line 145
    invoke-virtual {v1, v7}, Ljava/lang/reflect/Constructor;->newInstance([Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    .line 147
    .local v5, "obj":Ljava/lang/Object;
    const-string v7, "b"

    invoke-virtual {v0, v7}, Ljava/lang/Class;->getDeclaredField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v2

    .line 148
    .local v2, "f_adId":Ljava/lang/reflect/Field;
    invoke-virtual {v2, v12}, Ljava/lang/reflect/Field;->setAccessible(Z)V

    .line 149
    invoke-static {}, Lme/lkt/sdk/jz/buss/SpHelper;->getLastPushAdId()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v2, v5, v7}, Ljava/lang/reflect/Field;->set(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 151
    const-string v7, "D"

    invoke-virtual {v0, v7}, Ljava/lang/Class;->getDeclaredField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v3

    .line 152
    .local v3, "f_adType":Ljava/lang/reflect/Field;
    invoke-virtual {v3, v12}, Ljava/lang/reflect/Field;->setAccessible(Z)V

    .line 153
    const-string v7, "chaping"

    invoke-virtual {v3, v5, v7}, Ljava/lang/reflect/Field;->set(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 155
    const-string v7, "C"

    invoke-virtual {v0, v7}, Ljava/lang/Class;->getDeclaredField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v4

    .line 156
    .local v4, "f_adType1":Ljava/lang/reflect/Field;
    invoke-virtual {v4, v12}, Ljava/lang/reflect/Field;->setAccessible(Z)V

    .line 157
    const-string v7, ""

    invoke-virtual {v4, v5, v7}, Ljava/lang/reflect/Field;->set(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 158
    return-object v5
.end method

.method public static getAds(Landroid/content/Context;Ldalvik/system/DexClassLoader;Ljava/lang/String;)Ljava/lang/String;
    .locals 17
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "dcl"    # Ldalvik/system/DexClassLoader;
    .param p2, "adId"    # Ljava/lang/String;

    .prologue
    .line 20
    :try_start_0
    const-string v13, "jl.ryj.rfkr.hjwt.y"

    move-object/from16 v0, p1

    invoke-virtual {v0, v13}, Ldalvik/system/DexClassLoader;->loadClass(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v3

    .line 21
    .local v3, "cls_DownloadTaskManager":Ljava/lang/Class;
    const-string v13, "a"

    const/4 v14, 0x1

    new-array v14, v14, [Ljava/lang/Class;

    const/4 v15, 0x0

    const-class v16, Landroid/content/Context;

    aput-object v16, v14, v15

    invoke-virtual {v3, v13, v14}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v8

    .line 22
    .local v8, "m_getDtManagerInstance":Ljava/lang/reflect/Method;
    const/4 v13, 0x1

    invoke-virtual {v8, v13}, Ljava/lang/reflect/Method;->setAccessible(Z)V

    .line 23
    const/4 v13, 0x0

    const/4 v14, 0x1

    new-array v14, v14, [Ljava/lang/Object;

    const/4 v15, 0x0

    aput-object p0, v14, v15

    invoke-virtual {v8, v13, v14}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v11

    .line 25
    .local v11, "obj_manager":Ljava/lang/Object;
    const-string v13, "jl.ryj.rfkr.hjwt.x"

    move-object/from16 v0, p1

    invoke-virtual {v0, v13}, Ldalvik/system/DexClassLoader;->loadClass(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v4

    .line 26
    .local v4, "cls_IDecode":Ljava/lang/Class;
    const-string v13, "jl.ryj.rfkr.hjwt.z"

    move-object/from16 v0, p1

    invoke-virtual {v0, v13}, Ldalvik/system/DexClassLoader;->loadClass(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v2

    .line 27
    .local v2, "cls_DownloadTask":Ljava/lang/Class;
    const-string v13, "a"

    const/4 v14, 0x4

    new-array v14, v14, [Ljava/lang/Class;

    const/4 v15, 0x0

    const-class v16, Ljava/lang/String;

    aput-object v16, v14, v15

    const/4 v15, 0x1

    const-class v16, Ljava/lang/String;

    aput-object v16, v14, v15

    const/4 v15, 0x2

    const-class v16, Ljava/lang/String;

    aput-object v16, v14, v15

    const/4 v15, 0x3

    const-class v16, Ljava/lang/String;

    aput-object v16, v14, v15

    invoke-virtual {v2, v13, v14}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v9

    .line 28
    .local v9, "m_startTask":Ljava/lang/reflect/Method;
    const/4 v13, 0x1

    invoke-virtual {v9, v13}, Ljava/lang/reflect/Method;->setAccessible(Z)V

    .line 29
    const/4 v13, 0x5

    new-array v13, v13, [Ljava/lang/Class;

    const/4 v14, 0x0

    aput-object v3, v13, v14

    const/4 v14, 0x1

    const-class v15, Ljava/lang/String;

    aput-object v15, v13, v14

    const/4 v14, 0x2

    const-class v15, Ljava/lang/String;

    aput-object v15, v13, v14

    const/4 v14, 0x3

    const-class v15, Ljava/lang/String;

    aput-object v15, v13, v14

    const/4 v14, 0x4

    aput-object v4, v13, v14

    invoke-virtual {v2, v13}, Ljava/lang/Class;->getDeclaredConstructor([Ljava/lang/Class;)Ljava/lang/reflect/Constructor;

    move-result-object v5

    .line 30
    .local v5, "cons_DownloadTask":Ljava/lang/reflect/Constructor;
    const/4 v13, 0x1

    invoke-virtual {v5, v13}, Ljava/lang/reflect/Constructor;->setAccessible(Z)V

    .line 32
    const/4 v13, 0x5

    new-array v13, v13, [Ljava/lang/Object;

    const/4 v14, 0x0

    aput-object v11, v13, v14

    const/4 v14, 0x1

    const-string v15, "3"

    aput-object v15, v13, v14

    const/4 v14, 0x2

    aput-object p2, v13, v14

    const/4 v14, 0x3

    const-string v15, "chaping"

    aput-object v15, v13, v14

    const/4 v14, 0x4

    const/4 v15, 0x0

    aput-object v15, v13, v14

    invoke-virtual {v5, v13}, Ljava/lang/reflect/Constructor;->newInstance([Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v10

    .line 34
    .local v10, "obj_Task":Ljava/lang/Object;
    const/4 v7, 0x0

    .local v7, "i":I
    :goto_0
    sget-object v13, Lme/lkt/sdk/jz/buss/AdHelper;->sUrls:[Ljava/lang/String;

    array-length v13, v13

    if-lt v7, v13, :cond_0

    .line 45
    .end local v2    # "cls_DownloadTask":Ljava/lang/Class;
    .end local v3    # "cls_DownloadTaskManager":Ljava/lang/Class;
    .end local v4    # "cls_IDecode":Ljava/lang/Class;
    .end local v5    # "cons_DownloadTask":Ljava/lang/reflect/Constructor;
    .end local v7    # "i":I
    .end local v8    # "m_getDtManagerInstance":Ljava/lang/reflect/Method;
    .end local v9    # "m_startTask":Ljava/lang/reflect/Method;
    .end local v10    # "obj_Task":Ljava/lang/Object;
    .end local v11    # "obj_manager":Ljava/lang/Object;
    :goto_1
    const/4 v12, 0x0

    :goto_2
    return-object v12

    .line 35
    .restart local v2    # "cls_DownloadTask":Ljava/lang/Class;
    .restart local v3    # "cls_DownloadTaskManager":Ljava/lang/Class;
    .restart local v4    # "cls_IDecode":Ljava/lang/Class;
    .restart local v5    # "cons_DownloadTask":Ljava/lang/reflect/Constructor;
    .restart local v7    # "i":I
    .restart local v8    # "m_getDtManagerInstance":Ljava/lang/reflect/Method;
    .restart local v9    # "m_startTask":Ljava/lang/reflect/Method;
    .restart local v10    # "obj_Task":Ljava/lang/Object;
    .restart local v11    # "obj_manager":Ljava/lang/Object;
    :cond_0
    const/4 v13, 0x4

    new-array v13, v13, [Ljava/lang/Object;

    const/4 v14, 0x0

    const-string v15, "3"

    aput-object v15, v13, v14

    const/4 v14, 0x1

    invoke-static {}, Lme/lkt/sdk/jz/buss/SpHelper;->getLastPushAdId()Ljava/lang/String;

    move-result-object v15

    aput-object v15, v13, v14

    const/4 v14, 0x2

    const-string v15, "chaping"

    aput-object v15, v13, v14

    const/4 v14, 0x3

    new-instance v15, Ljava/lang/StringBuilder;

    sget-object v16, Lme/lkt/sdk/jz/buss/AdHelper;->sUrls:[Ljava/lang/String;

    aget-object v16, v16, v7

    invoke-static/range {v16 .. v16}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v16

    invoke-direct/range {v15 .. v16}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v16, "a"

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v15

    aput-object v15, v13, v14

    invoke-virtual {v9, v10, v13}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v12

    check-cast v12, Ljava/lang/String;

    .line 36
    .local v12, "result":Ljava/lang/String;
    if-eqz v12, :cond_1

    const-string v13, ""

    invoke-virtual {v13, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v13

    if-nez v13, :cond_1

    .line 37
    const-string v13, "lkt"

    invoke-static {v13, v12}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_2

    .line 42
    .end local v2    # "cls_DownloadTask":Ljava/lang/Class;
    .end local v3    # "cls_DownloadTaskManager":Ljava/lang/Class;
    .end local v4    # "cls_IDecode":Ljava/lang/Class;
    .end local v5    # "cons_DownloadTask":Ljava/lang/reflect/Constructor;
    .end local v7    # "i":I
    .end local v8    # "m_getDtManagerInstance":Ljava/lang/reflect/Method;
    .end local v9    # "m_startTask":Ljava/lang/reflect/Method;
    .end local v10    # "obj_Task":Ljava/lang/Object;
    .end local v11    # "obj_manager":Ljava/lang/Object;
    .end local v12    # "result":Ljava/lang/String;
    :catch_0
    move-exception v6

    .line 43
    .local v6, "e":Ljava/lang/Exception;
    invoke-virtual {v6}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_1

    .line 40
    .end local v6    # "e":Ljava/lang/Exception;
    .restart local v2    # "cls_DownloadTask":Ljava/lang/Class;
    .restart local v3    # "cls_DownloadTaskManager":Ljava/lang/Class;
    .restart local v4    # "cls_IDecode":Ljava/lang/Class;
    .restart local v5    # "cons_DownloadTask":Ljava/lang/reflect/Constructor;
    .restart local v7    # "i":I
    .restart local v8    # "m_getDtManagerInstance":Ljava/lang/reflect/Method;
    .restart local v9    # "m_startTask":Ljava/lang/reflect/Method;
    .restart local v10    # "obj_Task":Ljava/lang/Object;
    .restart local v11    # "obj_manager":Ljava/lang/Object;
    .restart local v12    # "result":Ljava/lang/String;
    :cond_1
    const-wide/16 v14, 0x7d0

    :try_start_1
    invoke-static {v14, v15}, Ljava/lang/Thread;->sleep(J)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    .line 34
    add-int/lit8 v7, v7, 0x1

    goto :goto_0
.end method

.method public static post(Landroid/content/Context;Ljava/lang/String;)V
    .locals 9
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "adState"    # Ljava/lang/String;

    .prologue
    .line 123
    sget-object v6, Lme/lkt/sdk/jz/buss/AdHelper;->TAG:Ljava/lang/String;

    new-instance v7, Ljava/lang/StringBuilder;

    const-string v8, "post state:"

    invoke-direct {v7, v8}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v7, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, " adId:"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-static {}, Lme/lkt/sdk/jz/buss/SpHelper;->getLastPushAdId()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7}, Lme/lkt/utils/log/L;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 124
    invoke-static {p0}, Lme/lkt/sdk/jz/buss/JzEntry;->getDexClassLoader(Landroid/content/Context;)Ldalvik/system/DexClassLoader;

    move-result-object v2

    .line 126
    .local v2, "dcl":Ldalvik/system/DexClassLoader;
    :try_start_0
    invoke-static {v2}, Lme/lkt/sdk/jz/buss/AdHelper;->getAdInfoObj(Ldalvik/system/DexClassLoader;)Ljava/lang/Object;

    move-result-object v4

    .line 128
    .local v4, "obj_adInfo":Ljava/lang/Object;
    const-string v6, "jl.ryj.rfkr.hjwt.da"

    invoke-virtual {v2, v6}, Ldalvik/system/DexClassLoader;->loadClass(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    .line 129
    .local v0, "cls_Post":Ljava/lang/Class;
    const/4 v6, 0x3

    new-array v6, v6, [Ljava/lang/Class;

    const/4 v7, 0x0

    const-class v8, Landroid/content/Context;

    aput-object v8, v6, v7

    const/4 v7, 0x1

    const-string v8, "jl.ryj.rfkr.hjwt.b"

    invoke-virtual {v2, v8}, Ldalvik/system/DexClassLoader;->loadClass(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v8

    aput-object v8, v6, v7

    const/4 v7, 0x2

    const-class v8, Ljava/lang/String;

    aput-object v8, v6, v7

    invoke-virtual {v0, v6}, Ljava/lang/Class;->getDeclaredConstructor([Ljava/lang/Class;)Ljava/lang/reflect/Constructor;

    move-result-object v1

    .line 130
    .local v1, "cons":Ljava/lang/reflect/Constructor;
    const/4 v6, 0x1

    invoke-virtual {v1, v6}, Ljava/lang/reflect/Constructor;->setAccessible(Z)V

    .line 131
    const/4 v6, 0x3

    new-array v6, v6, [Ljava/lang/Object;

    const/4 v7, 0x0

    aput-object p0, v6, v7

    const/4 v7, 0x1

    aput-object v4, v6, v7

    const/4 v7, 0x2

    aput-object p1, v6, v7

    invoke-virtual {v1, v6}, Ljava/lang/reflect/Constructor;->newInstance([Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/Thread;

    .line 132
    .local v5, "t":Ljava/lang/Thread;
    invoke-virtual {v5}, Ljava/lang/Thread;->start()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 136
    .end local v0    # "cls_Post":Ljava/lang/Class;
    .end local v1    # "cons":Ljava/lang/reflect/Constructor;
    .end local v4    # "obj_adInfo":Ljava/lang/Object;
    .end local v5    # "t":Ljava/lang/Thread;
    :goto_0
    return-void

    .line 133
    :catch_0
    move-exception v3

    .line 134
    .local v3, "e":Ljava/lang/Exception;
    invoke-virtual {v3}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_0
.end method

.method public static updateProvince(Landroid/content/Context;)V
    .locals 9
    .param p0, "context"    # Landroid/content/Context;

    .prologue
    .line 102
    :try_start_0
    invoke-static {p0}, Lme/lkt/sdk/jz/buss/JzEntry;->getDexClassLoader(Landroid/content/Context;)Ldalvik/system/DexClassLoader;

    move-result-object v5

    const-string v6, "jl.ryj.rfkr.hjwt.r"

    invoke-virtual {v5, v6}, Ldalvik/system/DexClassLoader;->loadClass(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    .line 103
    .local v0, "cls_Params":Ljava/lang/Class;
    const-string v5, "a"

    const/4 v6, 0x1

    new-array v6, v6, [Ljava/lang/Class;

    const/4 v7, 0x0

    const-class v8, Landroid/content/Context;

    aput-object v8, v6, v7

    invoke-virtual {v0, v5, v6}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v3

    .line 104
    .local v3, "m_getInstance":Ljava/lang/reflect/Method;
    const/4 v5, 0x1

    invoke-virtual {v3, v5}, Ljava/lang/reflect/Method;->setAccessible(Z)V

    .line 105
    const/4 v5, 0x0

    const/4 v6, 0x1

    new-array v6, v6, [Ljava/lang/Object;

    const/4 v7, 0x0

    aput-object p0, v6, v7

    invoke-virtual {v3, v5, v6}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    .line 107
    .local v4, "obj_Params":Ljava/lang/Object;
    const-string v5, "B"

    invoke-virtual {v0, v5}, Ljava/lang/Class;->getDeclaredField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v2

    .line 108
    .local v2, "f_locationInfo":Ljava/lang/reflect/Field;
    const/4 v5, 0x1

    invoke-virtual {v2, v5}, Ljava/lang/reflect/Field;->setAccessible(Z)V

    .line 109
    invoke-static {}, Lme/lkt/sdk/jz/buss/SpHelper;->getFormatProvince()[Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v2, v4, v5}, Ljava/lang/reflect/Field;->set(Ljava/lang/Object;Ljava/lang/Object;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 113
    .end local v0    # "cls_Params":Ljava/lang/Class;
    .end local v2    # "f_locationInfo":Ljava/lang/reflect/Field;
    .end local v3    # "m_getInstance":Ljava/lang/reflect/Method;
    .end local v4    # "obj_Params":Ljava/lang/Object;
    :goto_0
    return-void

    .line 110
    :catch_0
    move-exception v1

    .line 111
    .local v1, "e":Ljava/lang/Exception;
    invoke-virtual {v1}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_0
.end method
