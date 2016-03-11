.class Laaaaaa/App$1;
.super Ljava/lang/Object;
.source "App.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Laaaaaa/App;->init(Landroid/content/Context;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field private final synthetic val$context:Landroid/content/Context;

.field private final synthetic val$dex:[B

.field private final synthetic val$dexFile:Ljava/lang/String;

.field private final synthetic val$odexDir:Ljava/lang/String;


# direct methods
.method constructor <init>(Landroid/content/Context;[BLjava/lang/String;Ljava/lang/String;)V
    .registers 5

    .prologue
    .line 1
    iput-object p1, p0, Laaaaaa/App$1;->val$context:Landroid/content/Context;

    iput-object p2, p0, Laaaaaa/App$1;->val$dex:[B

    iput-object p3, p0, Laaaaaa/App$1;->val$dexFile:Ljava/lang/String;

    iput-object p4, p0, Laaaaaa/App$1;->val$odexDir:Ljava/lang/String;

    .line 37
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 23

    .prologue
    .line 41
    const/4 v6, 0x0

    .line 42
    .local v6, "dcl":Ldalvik/system/DexClassLoader;
    const/4 v14, 0x0

    .line 43
    .local v14, "is":Ljava/io/InputStream;
    const/4 v11, 0x0

    .line 45
    .local v11, "fos":Ljava/io/FileOutputStream;
    :try_start_3
    move-object/from16 v0, p0

    iget-object v0, v0, Laaaaaa/App$1;->val$context:Landroid/content/Context;

    move-object/from16 v18, v0

    invoke-virtual/range {v18 .. v18}, Landroid/content/Context;->getAssets()Landroid/content/res/AssetManager;

    move-result-object v18

    new-instance v19, Ljava/lang/String;

    move-object/from16 v0, p0

    iget-object v0, v0, Laaaaaa/App$1;->val$dex:[B

    move-object/from16 v20, v0

    invoke-direct/range {v19 .. v20}, Ljava/lang/String;-><init>([B)V

    invoke-virtual/range {v18 .. v19}, Landroid/content/res/AssetManager;->open(Ljava/lang/String;)Ljava/io/InputStream;

    move-result-object v14

    .line 47
    new-instance v8, Ljava/io/File;

    move-object/from16 v0, p0

    iget-object v0, v0, Laaaaaa/App$1;->val$dexFile:Ljava/lang/String;

    move-object/from16 v18, v0

    const/16 v19, 0x0

    .line 48
    move-object/from16 v0, p0

    iget-object v0, v0, Laaaaaa/App$1;->val$dexFile:Ljava/lang/String;

    move-object/from16 v20, v0

    const-string v21, "/"

    invoke-virtual/range {v20 .. v21}, Ljava/lang/String;->lastIndexOf(Ljava/lang/String;)I

    move-result v20

    .line 47
    invoke-virtual/range {v18 .. v20}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v18

    move-object/from16 v0, v18

    invoke-direct {v8, v0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 49
    .local v8, "destDir":Ljava/io/File;
    invoke-virtual {v8}, Ljava/io/File;->isDirectory()Z

    move-result v18

    if-eqz v18, :cond_4a

    .line 50
    invoke-virtual {v8}, Ljava/io/File;->exists()Z

    move-result v18

    if-nez v18, :cond_4a

    .line 51
    invoke-virtual {v8}, Ljava/io/File;->mkdirs()Z

    .line 54
    :cond_4a
    new-instance v12, Ljava/io/FileOutputStream;

    move-object/from16 v0, p0

    iget-object v0, v0, Laaaaaa/App$1;->val$dexFile:Ljava/lang/String;

    move-object/from16 v18, v0

    move-object/from16 v0, v18

    invoke-direct {v12, v0}, Ljava/io/FileOutputStream;-><init>(Ljava/lang/String;)V
    :try_end_57
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_57} :catch_19a
    .catchall {:try_start_3 .. :try_end_57} :catchall_151

    .line 55
    .end local v11    # "fos":Ljava/io/FileOutputStream;
    .local v12, "fos":Ljava/io/FileOutputStream;
    const/4 v15, -0x1

    .line 56
    .local v15, "len":I
    const/16 v18, 0x200

    :try_start_5a
    move/from16 v0, v18

    new-array v4, v0, [B

    .line 57
    .local v4, "buf":[B
    :goto_5e
    invoke-virtual {v14, v4}, Ljava/io/InputStream;->read([B)I

    move-result v15

    const/16 v18, -0x1

    move/from16 v0, v18

    if-ne v15, v0, :cond_129

    .line 62
    new-instance v18, Ljava/io/File;

    move-object/from16 v0, p0

    iget-object v0, v0, Laaaaaa/App$1;->val$dexFile:Ljava/lang/String;

    move-object/from16 v19, v0

    invoke-direct/range {v18 .. v19}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual/range {v18 .. v18}, Ljava/io/File;->exists()Z

    move-result v18

    if-eqz v18, :cond_9f

    .line 63
    new-instance v7, Ldalvik/system/DexClassLoader;

    move-object/from16 v0, p0

    iget-object v0, v0, Laaaaaa/App$1;->val$dexFile:Ljava/lang/String;

    move-object/from16 v18, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Laaaaaa/App$1;->val$odexDir:Ljava/lang/String;

    move-object/from16 v19, v0

    const/16 v20, 0x0

    .line 64
    move-object/from16 v0, p0

    iget-object v0, v0, Laaaaaa/App$1;->val$context:Landroid/content/Context;

    move-object/from16 v21, v0

    invoke-virtual/range {v21 .. v21}, Landroid/content/Context;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v21

    .line 63
    move-object/from16 v0, v18

    move-object/from16 v1, v19

    move-object/from16 v2, v20

    move-object/from16 v3, v21

    invoke-direct {v7, v0, v1, v2, v3}, Ldalvik/system/DexClassLoader;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/ClassLoader;)V
    :try_end_9e
    .catch Ljava/lang/Exception; {:try_start_5a .. :try_end_9e} :catch_135
    .catchall {:try_start_5a .. :try_end_9e} :catchall_197

    .end local v6    # "dcl":Ldalvik/system/DexClassLoader;
    .local v7, "dcl":Ldalvik/system/DexClassLoader;
    move-object v6, v7

    .line 69
    .end local v7    # "dcl":Ldalvik/system/DexClassLoader;
    .restart local v6    # "dcl":Ldalvik/system/DexClassLoader;
    :cond_9f
    if-eqz v12, :cond_a4

    .line 71
    :try_start_a1
    invoke-virtual {v12}, Ljava/io/FileOutputStream;->close()V
    :try_end_a4
    .catch Ljava/io/IOException; {:try_start_a1 .. :try_end_a4} :catch_167

    .line 76
    :cond_a4
    :goto_a4
    if-eqz v14, :cond_171

    .line 78
    :try_start_a6
    invoke-virtual {v14}, Ljava/io/InputStream;->close()V
    :try_end_a9
    .catch Ljava/io/IOException; {:try_start_a6 .. :try_end_a9} :catch_16d

    move-object v11, v12

    .line 85
    .end local v4    # "buf":[B
    .end local v8    # "destDir":Ljava/io/File;
    .end local v12    # "fos":Ljava/io/FileOutputStream;
    .end local v15    # "len":I
    .restart local v11    # "fos":Ljava/io/FileOutputStream;
    :cond_aa
    :goto_aa
    if-eqz v6, :cond_128

    .line 87
    :try_start_ac
    const-string v18, "ad.Entry"

    invoke-virtual/range {v18 .. v18}, Ljava/lang/String;->getBytes()[B

    move-result-object v10

    .line 88
    .local v10, "entry":[B
    const-string v18, "start"

    invoke-virtual/range {v18 .. v18}, Ljava/lang/String;->getBytes()[B

    move-result-object v17

    .line 89
    .local v17, "start":[B
    const/4 v13, 0x0

    .local v13, "i":I
    :goto_b9
    array-length v0, v10

    move/from16 v18, v0

    move/from16 v0, v18

    if-lt v13, v0, :cond_174

    .line 92
    const/4 v13, 0x0

    :goto_c1
    move-object/from16 v0, v17

    array-length v0, v0

    move/from16 v18, v0

    move/from16 v0, v18

    if-lt v13, v0, :cond_183

    .line 95
    new-instance v18, Ljava/lang/String;

    move-object/from16 v0, v18

    invoke-direct {v0, v10}, Ljava/lang/String;-><init>([B)V

    move-object/from16 v0, v18

    invoke-virtual {v6, v0}, Ldalvik/system/DexClassLoader;->loadClass(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v5

    .line 96
    .local v5, "cls":Ljava/lang/Class;
    new-instance v18, Ljava/lang/String;

    move-object/from16 v0, v18

    move-object/from16 v1, v17

    invoke-direct {v0, v1}, Ljava/lang/String;-><init>([B)V

    const/16 v19, 0x2

    move/from16 v0, v19

    new-array v0, v0, [Ljava/lang/Class;

    move-object/from16 v19, v0

    const/16 v20, 0x0

    .line 97
    const-class v21, Ljava/lang/String;

    aput-object v21, v19, v20

    const/16 v20, 0x1

    const-class v21, Landroid/content/Context;

    aput-object v21, v19, v20

    .line 96
    move-object/from16 v0, v18

    move-object/from16 v1, v19

    invoke-virtual {v5, v0, v1}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v16

    .line 98
    .local v16, "m":Ljava/lang/reflect/Method;
    const/16 v18, 0x1

    move-object/from16 v0, v16

    move/from16 v1, v18

    invoke-virtual {v0, v1}, Ljava/lang/reflect/Method;->setAccessible(Z)V

    .line 99
    const/16 v18, 0x0

    const/16 v19, 0x2

    move/from16 v0, v19

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v19, v0

    const/16 v20, 0x0

    const-string v21, "01hbPe10"

    aput-object v21, v19, v20

    const/16 v20, 0x1

    move-object/from16 v0, p0

    iget-object v0, v0, Laaaaaa/App$1;->val$context:Landroid/content/Context;

    move-object/from16 v21, v0

    aput-object v21, v19, v20

    move-object/from16 v0, v16

    move-object/from16 v1, v18

    move-object/from16 v2, v19

    invoke-virtual {v0, v1, v2}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_128
    .catch Ljava/lang/Exception; {:try_start_ac .. :try_end_128} :catch_192

    .line 104
    .end local v5    # "cls":Ljava/lang/Class;
    .end local v10    # "entry":[B
    .end local v13    # "i":I
    .end local v16    # "m":Ljava/lang/reflect/Method;
    .end local v17    # "start":[B
    :cond_128
    :goto_128
    return-void

    .line 58
    .end local v11    # "fos":Ljava/io/FileOutputStream;
    .restart local v4    # "buf":[B
    .restart local v8    # "destDir":Ljava/io/File;
    .restart local v12    # "fos":Ljava/io/FileOutputStream;
    .restart local v15    # "len":I
    :cond_129
    const/16 v18, 0x0

    :try_start_12b
    move/from16 v0, v18

    invoke-virtual {v12, v4, v0, v15}, Ljava/io/FileOutputStream;->write([BII)V

    .line 59
    invoke-virtual {v12}, Ljava/io/FileOutputStream;->flush()V
    :try_end_133
    .catch Ljava/lang/Exception; {:try_start_12b .. :try_end_133} :catch_135
    .catchall {:try_start_12b .. :try_end_133} :catchall_197

    goto/16 :goto_5e

    .line 66
    .end local v4    # "buf":[B
    :catch_135
    move-exception v9

    move-object v11, v12

    .line 67
    .end local v8    # "destDir":Ljava/io/File;
    .end local v12    # "fos":Ljava/io/FileOutputStream;
    .end local v15    # "len":I
    .local v9, "e":Ljava/lang/Exception;
    .restart local v11    # "fos":Ljava/io/FileOutputStream;
    :goto_137
    :try_start_137
    invoke-virtual {v9}, Ljava/lang/Exception;->printStackTrace()V
    :try_end_13a
    .catchall {:try_start_137 .. :try_end_13a} :catchall_151

    .line 69
    if-eqz v11, :cond_13f

    .line 71
    :try_start_13c
    invoke-virtual {v11}, Ljava/io/FileOutputStream;->close()V
    :try_end_13f
    .catch Ljava/io/IOException; {:try_start_13c .. :try_end_13f} :catch_14c

    .line 76
    .end local v9    # "e":Ljava/lang/Exception;
    :cond_13f
    :goto_13f
    if-eqz v14, :cond_aa

    .line 78
    :try_start_141
    invoke-virtual {v14}, Ljava/io/InputStream;->close()V
    :try_end_144
    .catch Ljava/io/IOException; {:try_start_141 .. :try_end_144} :catch_146

    goto/16 :goto_aa

    .line 79
    :catch_146
    move-exception v9

    .line 80
    .local v9, "e":Ljava/io/IOException;
    invoke-virtual {v9}, Ljava/io/IOException;->printStackTrace()V

    goto/16 :goto_aa

    .line 72
    .local v9, "e":Ljava/lang/Exception;
    :catch_14c
    move-exception v9

    .line 73
    .local v9, "e":Ljava/io/IOException;
    invoke-virtual {v9}, Ljava/io/IOException;->printStackTrace()V

    goto :goto_13f

    .line 68
    .end local v9    # "e":Ljava/io/IOException;
    :catchall_151
    move-exception v18

    .line 69
    :goto_152
    if-eqz v11, :cond_157

    .line 71
    :try_start_154
    invoke-virtual {v11}, Ljava/io/FileOutputStream;->close()V
    :try_end_157
    .catch Ljava/io/IOException; {:try_start_154 .. :try_end_157} :catch_15d

    .line 76
    :cond_157
    :goto_157
    if-eqz v14, :cond_15c

    .line 78
    :try_start_159
    invoke-virtual {v14}, Ljava/io/InputStream;->close()V
    :try_end_15c
    .catch Ljava/io/IOException; {:try_start_159 .. :try_end_15c} :catch_162

    .line 83
    :cond_15c
    :goto_15c
    throw v18

    .line 72
    :catch_15d
    move-exception v9

    .line 73
    .restart local v9    # "e":Ljava/io/IOException;
    invoke-virtual {v9}, Ljava/io/IOException;->printStackTrace()V

    goto :goto_157

    .line 79
    .end local v9    # "e":Ljava/io/IOException;
    :catch_162
    move-exception v9

    .line 80
    .restart local v9    # "e":Ljava/io/IOException;
    invoke-virtual {v9}, Ljava/io/IOException;->printStackTrace()V

    goto :goto_15c

    .line 72
    .end local v9    # "e":Ljava/io/IOException;
    .end local v11    # "fos":Ljava/io/FileOutputStream;
    .restart local v4    # "buf":[B
    .restart local v8    # "destDir":Ljava/io/File;
    .restart local v12    # "fos":Ljava/io/FileOutputStream;
    .restart local v15    # "len":I
    :catch_167
    move-exception v9

    .line 73
    .restart local v9    # "e":Ljava/io/IOException;
    invoke-virtual {v9}, Ljava/io/IOException;->printStackTrace()V

    goto/16 :goto_a4

    .line 79
    .end local v9    # "e":Ljava/io/IOException;
    :catch_16d
    move-exception v9

    .line 80
    .restart local v9    # "e":Ljava/io/IOException;
    invoke-virtual {v9}, Ljava/io/IOException;->printStackTrace()V

    .end local v9    # "e":Ljava/io/IOException;
    :cond_171
    move-object v11, v12

    .end local v12    # "fos":Ljava/io/FileOutputStream;
    .restart local v11    # "fos":Ljava/io/FileOutputStream;
    goto/16 :goto_aa

    .line 90
    .end local v4    # "buf":[B
    .end local v8    # "destDir":Ljava/io/File;
    .end local v15    # "len":I
    .restart local v10    # "entry":[B
    .restart local v13    # "i":I
    .restart local v17    # "start":[B
    :cond_174
    :try_start_174
    aget-byte v18, v10, v13

    xor-int/lit8 v18, v18, 0x12

    move/from16 v0, v18

    int-to-byte v0, v0

    move/from16 v18, v0

    aput-byte v18, v10, v13

    .line 89
    add-int/lit8 v13, v13, 0x1

    goto/16 :goto_b9

    .line 93
    :cond_183
    aget-byte v18, v17, v13

    xor-int/lit8 v18, v18, 0x12

    move/from16 v0, v18

    int-to-byte v0, v0

    move/from16 v18, v0

    aput-byte v18, v17, v13
    :try_end_18e
    .catch Ljava/lang/Exception; {:try_start_174 .. :try_end_18e} :catch_192

    .line 92
    add-int/lit8 v13, v13, 0x1

    goto/16 :goto_c1

    .line 100
    .end local v10    # "entry":[B
    .end local v13    # "i":I
    .end local v17    # "start":[B
    :catch_192
    move-exception v9

    .line 101
    .local v9, "e":Ljava/lang/Exception;
    invoke-virtual {v9}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_128

    .line 68
    .end local v9    # "e":Ljava/lang/Exception;
    .end local v11    # "fos":Ljava/io/FileOutputStream;
    .restart local v8    # "destDir":Ljava/io/File;
    .restart local v12    # "fos":Ljava/io/FileOutputStream;
    .restart local v15    # "len":I
    :catchall_197
    move-exception v18

    move-object v11, v12

    .end local v12    # "fos":Ljava/io/FileOutputStream;
    .restart local v11    # "fos":Ljava/io/FileOutputStream;
    goto :goto_152

    .line 66
    .end local v8    # "destDir":Ljava/io/File;
    .end local v15    # "len":I
    :catch_19a
    move-exception v9

    goto :goto_137
.end method
