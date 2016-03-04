.class public Lme/lkt/utils/bitmap/BitmapUtils;
.super Ljava/lang/Object;
.source "BitmapUtils.java"


# static fields
.field public static final TAG:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 23
    const-class v0, Lme/lkt/utils/bitmap/BitmapUtils;

    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lme/lkt/utils/bitmap/BitmapUtils;->TAG:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 22
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static compressDimension(Landroid/graphics/Bitmap;I)Landroid/graphics/Bitmap;
    .locals 9
    .param p0, "bm"    # Landroid/graphics/Bitmap;
    .param p1, "longerEdgeLength"    # I

    .prologue
    const/4 v8, 0x1

    .line 289
    if-eqz p0, :cond_0

    if-ge p1, v8, :cond_1

    .line 307
    :cond_0
    :goto_0
    return-object p0

    .line 292
    :cond_1
    invoke-virtual {p0}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v5

    .line 293
    .local v5, "width":I
    invoke-virtual {p0}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v3

    .line 294
    .local v3, "height":I
    new-instance v0, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v0}, Ljava/io/ByteArrayOutputStream;-><init>()V

    .line 295
    .local v0, "baos":Ljava/io/ByteArrayOutputStream;
    sget-object v6, Landroid/graphics/Bitmap$CompressFormat;->PNG:Landroid/graphics/Bitmap$CompressFormat;

    const/16 v7, 0x64

    invoke-virtual {p0, v6, v7, v0}, Landroid/graphics/Bitmap;->compress(Landroid/graphics/Bitmap$CompressFormat;ILjava/io/OutputStream;)Z

    .line 296
    div-int v1, v5, p1

    .line 297
    .local v1, "be":I
    if-ge v5, v3, :cond_2

    .line 298
    div-int v1, v3, p1

    .line 300
    :cond_2
    if-ge v1, v8, :cond_3

    .line 301
    const/4 v1, 0x1

    .line 304
    :cond_3
    invoke-virtual {v0}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object v2

    .line 305
    .local v2, "buf":[B
    new-instance v4, Landroid/graphics/BitmapFactory$Options;

    invoke-direct {v4}, Landroid/graphics/BitmapFactory$Options;-><init>()V

    .line 306
    .local v4, "ops":Landroid/graphics/BitmapFactory$Options;
    iput v1, v4, Landroid/graphics/BitmapFactory$Options;->inSampleSize:I

    .line 307
    const/4 v6, 0x0

    array-length v7, v2

    invoke-static {v2, v6, v7, v4}, Landroid/graphics/BitmapFactory;->decodeByteArray([BIILandroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;

    move-result-object p0

    goto :goto_0
.end method

.method public static compressQuality(Landroid/graphics/Bitmap;I)[B
    .locals 3
    .param p0, "bm"    # Landroid/graphics/Bitmap;
    .param p1, "needSize"    # I

    .prologue
    .line 271
    new-instance v0, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v0}, Ljava/io/ByteArrayOutputStream;-><init>()V

    .line 272
    .local v0, "bos":Ljava/io/ByteArrayOutputStream;
    if-eqz p0, :cond_0

    if-gtz p1, :cond_1

    .line 273
    :cond_0
    invoke-virtual {v0}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object v2

    .line 284
    :goto_0
    return-object v2

    .line 275
    :cond_1
    const/16 v1, 0x64

    .line 276
    .local v1, "q":I
    sget-object v2, Landroid/graphics/Bitmap$CompressFormat;->JPEG:Landroid/graphics/Bitmap$CompressFormat;

    invoke-virtual {p0, v2, v1, v0}, Landroid/graphics/Bitmap;->compress(Landroid/graphics/Bitmap$CompressFormat;ILjava/io/OutputStream;)Z

    .line 277
    :goto_1
    invoke-virtual {v0}, Ljava/io/ByteArrayOutputStream;->size()I

    move-result v2

    if-le v2, p1, :cond_2

    const/16 v2, 0xa

    if-ge v1, v2, :cond_3

    .line 284
    :cond_2
    invoke-virtual {v0}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object v2

    goto :goto_0

    .line 279
    :cond_3
    invoke-virtual {v0}, Ljava/io/ByteArrayOutputStream;->reset()V

    .line 280
    add-int/lit8 v1, v1, -0xa

    .line 281
    sget-object v2, Landroid/graphics/Bitmap$CompressFormat;->JPEG:Landroid/graphics/Bitmap$CompressFormat;

    invoke-virtual {p0, v2, v1, v0}, Landroid/graphics/Bitmap;->compress(Landroid/graphics/Bitmap$CompressFormat;ILjava/io/OutputStream;)Z

    goto :goto_1
.end method

.method public static convertBmp(Landroid/graphics/Bitmap;)Landroid/graphics/Bitmap;
    .locals 7
    .param p0, "bmp"    # Landroid/graphics/Bitmap;

    .prologue
    const/4 v1, 0x0

    .line 184
    invoke-virtual {p0}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v3

    .line 185
    .local v3, "w":I
    invoke-virtual {p0}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v4

    .line 186
    .local v4, "h":I
    new-instance v5, Landroid/graphics/Matrix;

    invoke-direct {v5}, Landroid/graphics/Matrix;-><init>()V

    .line 187
    .local v5, "matrix":Landroid/graphics/Matrix;
    const/high16 v0, -0x40800000    # -1.0f

    const/high16 v2, 0x3f800000    # 1.0f

    invoke-virtual {v5, v0, v2}, Landroid/graphics/Matrix;->postScale(FF)Z

    .line 188
    const/4 v6, 0x1

    move-object v0, p0

    move v2, v1

    invoke-static/range {v0 .. v6}, Landroid/graphics/Bitmap;->createBitmap(Landroid/graphics/Bitmap;IIIILandroid/graphics/Matrix;Z)Landroid/graphics/Bitmap;

    move-result-object p0

    .line 189
    return-object p0
.end method

.method public static montageBitmap(Landroid/graphics/Bitmap;Landroid/graphics/Bitmap;ZII)Landroid/graphics/Bitmap;
    .locals 8
    .param p0, "floatBitmap"    # Landroid/graphics/Bitmap;
    .param p1, "src"    # Landroid/graphics/Bitmap;
    .param p2, "stretch"    # Z
    .param p3, "x"    # I
    .param p4, "y"    # I

    .prologue
    const/4 v7, 0x0

    const/4 v6, 0x0

    .line 135
    move-object v3, p0

    .line 136
    .local v3, "sizeFloatBitmap":Landroid/graphics/Bitmap;
    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v4

    .line 137
    .local v4, "w":I
    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v1

    .line 138
    .local v1, "h":I
    if-eqz p2, :cond_0

    .line 140
    const/4 v5, 0x1

    invoke-static {p0, v4, v1, v5}, Landroid/graphics/Bitmap;->createScaledBitmap(Landroid/graphics/Bitmap;IIZ)Landroid/graphics/Bitmap;

    move-result-object v3

    .line 142
    :cond_0
    sget-object v5, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    invoke-static {v4, v1, v5}, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    move-result-object v2

    .line 143
    .local v2, "newBM":Landroid/graphics/Bitmap;
    new-instance v0, Landroid/graphics/Canvas;

    invoke-direct {v0, v2}, Landroid/graphics/Canvas;-><init>(Landroid/graphics/Bitmap;)V

    .line 144
    .local v0, "canvas":Landroid/graphics/Canvas;
    invoke-virtual {v0, p1, v6, v6, v7}, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;FFLandroid/graphics/Paint;)V

    .line 145
    int-to-float v5, p3

    int-to-float v6, p4

    invoke-virtual {v0, v3, v5, v6, v7}, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;FFLandroid/graphics/Paint;)V

    .line 146
    return-object v2
.end method

.method public static savePicture(Landroid/graphics/Bitmap;Ljava/lang/String;Ljava/lang/String;)V
    .locals 7
    .param p0, "bitmap"    # Landroid/graphics/Bitmap;
    .param p1, "rootPath"    # Ljava/lang/String;
    .param p2, "name"    # Ljava/lang/String;

    .prologue
    .line 93
    const/4 v0, 0x0

    .line 94
    .local v0, "b":Ljava/io/FileOutputStream;
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-static {p1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v6

    invoke-direct {v5, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v6, "/"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    .line 95
    .local v4, "fileName":Ljava/lang/String;
    new-instance v3, Ljava/io/File;

    invoke-direct {v3, p1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 96
    .local v3, "file":Ljava/io/File;
    invoke-virtual {v3}, Ljava/io/File;->exists()Z

    move-result v5

    if-nez v5, :cond_0

    .line 97
    invoke-virtual {v3}, Ljava/io/File;->mkdirs()Z

    .line 101
    :cond_0
    :try_start_0
    new-instance v1, Ljava/io/FileOutputStream;

    invoke-direct {v1, v4}, Ljava/io/FileOutputStream;-><init>(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/io/FileNotFoundException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 103
    .end local v0    # "b":Ljava/io/FileOutputStream;
    .local v1, "b":Ljava/io/FileOutputStream;
    :try_start_1
    sget-object v5, Landroid/graphics/Bitmap$CompressFormat;->PNG:Landroid/graphics/Bitmap$CompressFormat;

    const/16 v6, 0x64

    invoke-virtual {p0, v5, v6, v1}, Landroid/graphics/Bitmap;->compress(Landroid/graphics/Bitmap$CompressFormat;ILjava/io/OutputStream;)Z
    :try_end_1
    .catch Ljava/io/FileNotFoundException; {:try_start_1 .. :try_end_1} :catch_4
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 108
    if-eqz v1, :cond_3

    .line 109
    :try_start_2
    invoke-virtual {v1}, Ljava/io/FileOutputStream;->flush()V

    .line 110
    invoke-virtual {v1}, Ljava/io/FileOutputStream;->close()V
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_3

    move-object v0, v1

    .line 116
    .end local v1    # "b":Ljava/io/FileOutputStream;
    .restart local v0    # "b":Ljava/io/FileOutputStream;
    :cond_1
    :goto_0
    return-void

    .line 104
    :catch_0
    move-exception v2

    .line 105
    .local v2, "e":Ljava/io/FileNotFoundException;
    :goto_1
    :try_start_3
    invoke-virtual {v2}, Ljava/io/FileNotFoundException;->printStackTrace()V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 108
    if-eqz v0, :cond_1

    .line 109
    :try_start_4
    invoke-virtual {v0}, Ljava/io/FileOutputStream;->flush()V

    .line 110
    invoke-virtual {v0}, Ljava/io/FileOutputStream;->close()V
    :try_end_4
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_1

    goto :goto_0

    .line 112
    :catch_1
    move-exception v2

    .line 113
    .local v2, "e":Ljava/io/IOException;
    invoke-virtual {v2}, Ljava/io/IOException;->printStackTrace()V

    goto :goto_0

    .line 106
    .end local v2    # "e":Ljava/io/IOException;
    :catchall_0
    move-exception v5

    .line 108
    :goto_2
    if-eqz v0, :cond_2

    .line 109
    :try_start_5
    invoke-virtual {v0}, Ljava/io/FileOutputStream;->flush()V

    .line 110
    invoke-virtual {v0}, Ljava/io/FileOutputStream;->close()V
    :try_end_5
    .catch Ljava/io/IOException; {:try_start_5 .. :try_end_5} :catch_2

    .line 115
    :cond_2
    :goto_3
    throw v5

    .line 112
    :catch_2
    move-exception v2

    .line 113
    .restart local v2    # "e":Ljava/io/IOException;
    invoke-virtual {v2}, Ljava/io/IOException;->printStackTrace()V

    goto :goto_3

    .line 112
    .end local v0    # "b":Ljava/io/FileOutputStream;
    .end local v2    # "e":Ljava/io/IOException;
    .restart local v1    # "b":Ljava/io/FileOutputStream;
    :catch_3
    move-exception v2

    .line 113
    .restart local v2    # "e":Ljava/io/IOException;
    invoke-virtual {v2}, Ljava/io/IOException;->printStackTrace()V

    .end local v2    # "e":Ljava/io/IOException;
    :cond_3
    move-object v0, v1

    .end local v1    # "b":Ljava/io/FileOutputStream;
    .restart local v0    # "b":Ljava/io/FileOutputStream;
    goto :goto_0

    .line 106
    .end local v0    # "b":Ljava/io/FileOutputStream;
    .restart local v1    # "b":Ljava/io/FileOutputStream;
    :catchall_1
    move-exception v5

    move-object v0, v1

    .end local v1    # "b":Ljava/io/FileOutputStream;
    .restart local v0    # "b":Ljava/io/FileOutputStream;
    goto :goto_2

    .line 104
    .end local v0    # "b":Ljava/io/FileOutputStream;
    .restart local v1    # "b":Ljava/io/FileOutputStream;
    :catch_4
    move-exception v2

    move-object v0, v1

    .end local v1    # "b":Ljava/io/FileOutputStream;
    .restart local v0    # "b":Ljava/io/FileOutputStream;
    goto :goto_1
.end method

.method public static scaleBitmapByHeight(Landroid/graphics/Bitmap;I)Landroid/graphics/Bitmap;
    .locals 2
    .param p0, "src"    # Landroid/graphics/Bitmap;
    .param p1, "height"    # I

    .prologue
    .line 173
    .line 174
    invoke-virtual {p0}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v0

    mul-int/2addr v0, p1

    invoke-virtual {p0}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v1

    div-int/2addr v0, v1

    const/4 v1, 0x0

    .line 173
    invoke-static {p0, v0, p1, v1}, Landroid/graphics/Bitmap;->createScaledBitmap(Landroid/graphics/Bitmap;IIZ)Landroid/graphics/Bitmap;

    move-result-object v0

    return-object v0
.end method

.method public static scaleBitmapByWidth(Landroid/graphics/Bitmap;I)Landroid/graphics/Bitmap;
    .locals 2
    .param p0, "src"    # Landroid/graphics/Bitmap;
    .param p1, "width"    # I

    .prologue
    .line 159
    invoke-virtual {p0}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v0

    mul-int/2addr v0, p1

    .line 160
    invoke-virtual {p0}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v1

    div-int/2addr v0, v1

    const/4 v1, 0x0

    .line 159
    invoke-static {p0, p1, v0, v1}, Landroid/graphics/Bitmap;->createScaledBitmap(Landroid/graphics/Bitmap;IIZ)Landroid/graphics/Bitmap;

    move-result-object v0

    return-object v0
.end method

.method public static toRoundBitmap(Landroid/graphics/Bitmap;)Landroid/graphics/Bitmap;
    .locals 28
    .param p0, "bitmap"    # Landroid/graphics/Bitmap;

    .prologue
    .line 33
    if-nez p0, :cond_0

    .line 34
    const/16 v16, 0x0

    .line 84
    :goto_0
    return-object v16

    .line 36
    :cond_0
    invoke-virtual/range {p0 .. p0}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v23

    .line 37
    .local v23, "width":I
    invoke-virtual/range {p0 .. p0}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v14

    .line 40
    .local v14, "height":I
    move/from16 v0, v23

    if-gt v0, v14, :cond_1

    .line 41
    div-int/lit8 v24, v23, 0x2

    move/from16 v0, v24

    int-to-float v0, v0

    move/from16 v20, v0

    .line 42
    .local v20, "roundPx":F
    const/16 v22, 0x0

    .line 43
    .local v22, "top":F
    move/from16 v0, v23

    int-to-float v5, v0

    .line 44
    .local v5, "bottom":F
    const/4 v15, 0x0

    .line 45
    .local v15, "left":F
    move/from16 v0, v23

    int-to-float v0, v0

    move/from16 v19, v0

    .line 46
    .local v19, "right":F
    move/from16 v14, v23

    .line 47
    const/4 v11, 0x0

    .line 48
    .local v11, "dst_left":F
    const/4 v13, 0x0

    .line 49
    .local v13, "dst_top":F
    move/from16 v0, v23

    int-to-float v12, v0

    .line 50
    .local v12, "dst_right":F
    move/from16 v0, v23

    int-to-float v10, v0

    .line 65
    .local v10, "dst_bottom":F
    :goto_1
    sget-object v24, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    move/from16 v0, v23

    move-object/from16 v1, v24

    invoke-static {v0, v14, v1}, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    move-result-object v16

    .line 66
    .local v16, "output":Landroid/graphics/Bitmap;
    new-instance v6, Landroid/graphics/Canvas;

    move-object/from16 v0, v16

    invoke-direct {v6, v0}, Landroid/graphics/Canvas;-><init>(Landroid/graphics/Bitmap;)V

    .line 68
    .local v6, "canvas":Landroid/graphics/Canvas;
    const v8, -0xbdbdbe

    .line 69
    .local v8, "color":I
    new-instance v17, Landroid/graphics/Paint;

    invoke-direct/range {v17 .. v17}, Landroid/graphics/Paint;-><init>()V

    .line 70
    .local v17, "paint":Landroid/graphics/Paint;
    new-instance v21, Landroid/graphics/Rect;

    float-to-int v0, v15

    move/from16 v24, v0

    move/from16 v0, v22

    float-to-int v0, v0

    move/from16 v25, v0

    move/from16 v0, v19

    float-to-int v0, v0

    move/from16 v26, v0

    .line 71
    float-to-int v0, v5

    move/from16 v27, v0

    .line 70
    move-object/from16 v0, v21

    move/from16 v1, v24

    move/from16 v2, v25

    move/from16 v3, v26

    move/from16 v4, v27

    invoke-direct {v0, v1, v2, v3, v4}, Landroid/graphics/Rect;-><init>(IIII)V

    .line 72
    .local v21, "src":Landroid/graphics/Rect;
    new-instance v9, Landroid/graphics/Rect;

    float-to-int v0, v11

    move/from16 v24, v0

    float-to-int v0, v13

    move/from16 v25, v0

    .line 73
    float-to-int v0, v12

    move/from16 v26, v0

    float-to-int v0, v10

    move/from16 v27, v0

    .line 72
    move/from16 v0, v24

    move/from16 v1, v25

    move/from16 v2, v26

    move/from16 v3, v27

    invoke-direct {v9, v0, v1, v2, v3}, Landroid/graphics/Rect;-><init>(IIII)V

    .line 74
    .local v9, "dst":Landroid/graphics/Rect;
    new-instance v18, Landroid/graphics/RectF;

    move-object/from16 v0, v18

    invoke-direct {v0, v9}, Landroid/graphics/RectF;-><init>(Landroid/graphics/Rect;)V

    .line 76
    .local v18, "rectF":Landroid/graphics/RectF;
    const/16 v24, 0x1

    move-object/from16 v0, v17

    move/from16 v1, v24

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    .line 78
    const/16 v24, 0x0

    const/16 v25, 0x0

    const/16 v26, 0x0

    const/16 v27, 0x0

    move/from16 v0, v24

    move/from16 v1, v25

    move/from16 v2, v26

    move/from16 v3, v27

    invoke-virtual {v6, v0, v1, v2, v3}, Landroid/graphics/Canvas;->drawARGB(IIII)V

    .line 79
    const v24, -0xbdbdbe

    move-object/from16 v0, v17

    move/from16 v1, v24

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setColor(I)V

    .line 80
    move-object/from16 v0, v18

    move/from16 v1, v20

    move/from16 v2, v20

    move-object/from16 v3, v17

    invoke-virtual {v6, v0, v1, v2, v3}, Landroid/graphics/Canvas;->drawRoundRect(Landroid/graphics/RectF;FFLandroid/graphics/Paint;)V

    .line 82
    new-instance v24, Landroid/graphics/PorterDuffXfermode;

    sget-object v25, Landroid/graphics/PorterDuff$Mode;->SRC_IN:Landroid/graphics/PorterDuff$Mode;

    invoke-direct/range {v24 .. v25}, Landroid/graphics/PorterDuffXfermode;-><init>(Landroid/graphics/PorterDuff$Mode;)V

    move-object/from16 v0, v17

    move-object/from16 v1, v24

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setXfermode(Landroid/graphics/Xfermode;)Landroid/graphics/Xfermode;

    .line 83
    move-object/from16 v0, p0

    move-object/from16 v1, v21

    move-object/from16 v2, v17

    invoke-virtual {v6, v0, v1, v9, v2}, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;Landroid/graphics/Rect;Landroid/graphics/Rect;Landroid/graphics/Paint;)V

    goto/16 :goto_0

    .line 52
    .end local v5    # "bottom":F
    .end local v6    # "canvas":Landroid/graphics/Canvas;
    .end local v8    # "color":I
    .end local v9    # "dst":Landroid/graphics/Rect;
    .end local v10    # "dst_bottom":F
    .end local v11    # "dst_left":F
    .end local v12    # "dst_right":F
    .end local v13    # "dst_top":F
    .end local v15    # "left":F
    .end local v16    # "output":Landroid/graphics/Bitmap;
    .end local v17    # "paint":Landroid/graphics/Paint;
    .end local v18    # "rectF":Landroid/graphics/RectF;
    .end local v19    # "right":F
    .end local v20    # "roundPx":F
    .end local v21    # "src":Landroid/graphics/Rect;
    .end local v22    # "top":F
    :cond_1
    div-int/lit8 v24, v14, 0x2

    move/from16 v0, v24

    int-to-float v0, v0

    move/from16 v20, v0

    .line 53
    .restart local v20    # "roundPx":F
    sub-int v24, v23, v14

    div-int/lit8 v24, v24, 0x2

    move/from16 v0, v24

    int-to-float v7, v0

    .line 54
    .local v7, "clip":F
    move v15, v7

    .line 55
    .restart local v15    # "left":F
    move/from16 v0, v23

    int-to-float v0, v0

    move/from16 v24, v0

    sub-float v19, v24, v7

    .line 56
    .restart local v19    # "right":F
    const/16 v22, 0x0

    .line 57
    .restart local v22    # "top":F
    int-to-float v5, v14

    .line 58
    .restart local v5    # "bottom":F
    move/from16 v23, v14

    .line 59
    const/4 v11, 0x0

    .line 60
    .restart local v11    # "dst_left":F
    const/4 v13, 0x0

    .line 61
    .restart local v13    # "dst_top":F
    int-to-float v12, v14

    .line 62
    .restart local v12    # "dst_right":F
    int-to-float v10, v14

    .restart local v10    # "dst_bottom":F
    goto/16 :goto_1
.end method

.method public static toRoundBitmap(Landroid/graphics/Bitmap;F)Landroid/graphics/Bitmap;
    .locals 28
    .param p0, "bitmap"    # Landroid/graphics/Bitmap;
    .param p1, "radiusRate"    # F

    .prologue
    .line 201
    if-nez p0, :cond_0

    .line 202
    const/16 v16, 0x0

    .line 257
    :goto_0
    return-object v16

    .line 204
    :cond_0
    invoke-virtual/range {p0 .. p0}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v23

    .line 205
    .local v23, "width":I
    invoke-virtual/range {p0 .. p0}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v14

    .line 207
    .local v14, "height":I
    const/high16 p1, 0x3f800000    # 1.0f

    .line 211
    move/from16 v0, v23

    if-gt v0, v14, :cond_1

    .line 212
    div-int/lit8 v24, v23, 0x2

    move/from16 v0, v24

    int-to-float v0, v0

    move/from16 v20, v0

    .line 213
    .local v20, "roundPx":F
    const/16 v22, 0x0

    .line 214
    .local v22, "top":F
    move/from16 v0, v23

    int-to-float v5, v0

    .line 215
    .local v5, "bottom":F
    const/4 v15, 0x0

    .line 216
    .local v15, "left":F
    move/from16 v0, v23

    int-to-float v0, v0

    move/from16 v19, v0

    .line 217
    .local v19, "right":F
    move/from16 v14, v23

    .line 218
    const/4 v11, 0x0

    .line 219
    .local v11, "dst_left":F
    const/4 v13, 0x0

    .line 220
    .local v13, "dst_top":F
    move/from16 v0, v23

    int-to-float v12, v0

    .line 221
    .local v12, "dst_right":F
    move/from16 v0, v23

    int-to-float v10, v0

    .line 236
    .local v10, "dst_bottom":F
    :goto_1
    sget-object v24, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    move/from16 v0, v23

    move-object/from16 v1, v24

    invoke-static {v0, v14, v1}, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    move-result-object v16

    .line 237
    .local v16, "output":Landroid/graphics/Bitmap;
    new-instance v6, Landroid/graphics/Canvas;

    move-object/from16 v0, v16

    invoke-direct {v6, v0}, Landroid/graphics/Canvas;-><init>(Landroid/graphics/Bitmap;)V

    .line 239
    .local v6, "canvas":Landroid/graphics/Canvas;
    const v8, -0xbdbdbe

    .line 241
    .local v8, "color":I
    new-instance v17, Landroid/graphics/Paint;

    invoke-direct/range {v17 .. v17}, Landroid/graphics/Paint;-><init>()V

    .line 242
    .local v17, "paint":Landroid/graphics/Paint;
    new-instance v21, Landroid/graphics/Rect;

    float-to-int v0, v15

    move/from16 v24, v0

    move/from16 v0, v22

    float-to-int v0, v0

    move/from16 v25, v0

    move/from16 v0, v19

    float-to-int v0, v0

    move/from16 v26, v0

    .line 243
    float-to-int v0, v5

    move/from16 v27, v0

    .line 242
    move-object/from16 v0, v21

    move/from16 v1, v24

    move/from16 v2, v25

    move/from16 v3, v26

    move/from16 v4, v27

    invoke-direct {v0, v1, v2, v3, v4}, Landroid/graphics/Rect;-><init>(IIII)V

    .line 244
    .local v21, "src":Landroid/graphics/Rect;
    new-instance v9, Landroid/graphics/Rect;

    float-to-int v0, v11

    move/from16 v24, v0

    float-to-int v0, v13

    move/from16 v25, v0

    .line 245
    float-to-int v0, v12

    move/from16 v26, v0

    float-to-int v0, v10

    move/from16 v27, v0

    .line 244
    move/from16 v0, v24

    move/from16 v1, v25

    move/from16 v2, v26

    move/from16 v3, v27

    invoke-direct {v9, v0, v1, v2, v3}, Landroid/graphics/Rect;-><init>(IIII)V

    .line 246
    .local v9, "dst":Landroid/graphics/Rect;
    new-instance v18, Landroid/graphics/RectF;

    move-object/from16 v0, v18

    invoke-direct {v0, v9}, Landroid/graphics/RectF;-><init>(Landroid/graphics/Rect;)V

    .line 248
    .local v18, "rectF":Landroid/graphics/RectF;
    const/16 v24, 0x1

    move-object/from16 v0, v17

    move/from16 v1, v24

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    .line 250
    const/16 v24, 0x0

    const/16 v25, 0x0

    const/16 v26, 0x0

    const/16 v27, 0x0

    move/from16 v0, v24

    move/from16 v1, v25

    move/from16 v2, v26

    move/from16 v3, v27

    invoke-virtual {v6, v0, v1, v2, v3}, Landroid/graphics/Canvas;->drawARGB(IIII)V

    .line 251
    const v24, -0xbdbdbe

    move-object/from16 v0, v17

    move/from16 v1, v24

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setColor(I)V

    .line 252
    div-float v24, v20, p1

    .line 253
    div-float v25, v20, p1

    .line 252
    move-object/from16 v0, v18

    move/from16 v1, v24

    move/from16 v2, v25

    move-object/from16 v3, v17

    invoke-virtual {v6, v0, v1, v2, v3}, Landroid/graphics/Canvas;->drawRoundRect(Landroid/graphics/RectF;FFLandroid/graphics/Paint;)V

    .line 255
    new-instance v24, Landroid/graphics/PorterDuffXfermode;

    sget-object v25, Landroid/graphics/PorterDuff$Mode;->SRC_IN:Landroid/graphics/PorterDuff$Mode;

    invoke-direct/range {v24 .. v25}, Landroid/graphics/PorterDuffXfermode;-><init>(Landroid/graphics/PorterDuff$Mode;)V

    move-object/from16 v0, v17

    move-object/from16 v1, v24

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setXfermode(Landroid/graphics/Xfermode;)Landroid/graphics/Xfermode;

    .line 256
    move-object/from16 v0, p0

    move-object/from16 v1, v21

    move-object/from16 v2, v17

    invoke-virtual {v6, v0, v1, v9, v2}, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;Landroid/graphics/Rect;Landroid/graphics/Rect;Landroid/graphics/Paint;)V

    goto/16 :goto_0

    .line 223
    .end local v5    # "bottom":F
    .end local v6    # "canvas":Landroid/graphics/Canvas;
    .end local v8    # "color":I
    .end local v9    # "dst":Landroid/graphics/Rect;
    .end local v10    # "dst_bottom":F
    .end local v11    # "dst_left":F
    .end local v12    # "dst_right":F
    .end local v13    # "dst_top":F
    .end local v15    # "left":F
    .end local v16    # "output":Landroid/graphics/Bitmap;
    .end local v17    # "paint":Landroid/graphics/Paint;
    .end local v18    # "rectF":Landroid/graphics/RectF;
    .end local v19    # "right":F
    .end local v20    # "roundPx":F
    .end local v21    # "src":Landroid/graphics/Rect;
    .end local v22    # "top":F
    :cond_1
    div-int/lit8 v24, v14, 0x2

    move/from16 v0, v24

    int-to-float v0, v0

    move/from16 v20, v0

    .line 224
    .restart local v20    # "roundPx":F
    sub-int v24, v23, v14

    div-int/lit8 v24, v24, 0x2

    move/from16 v0, v24

    int-to-float v7, v0

    .line 225
    .local v7, "clip":F
    move v15, v7

    .line 226
    .restart local v15    # "left":F
    move/from16 v0, v23

    int-to-float v0, v0

    move/from16 v24, v0

    sub-float v19, v24, v7

    .line 227
    .restart local v19    # "right":F
    const/16 v22, 0x0

    .line 228
    .restart local v22    # "top":F
    int-to-float v5, v14

    .line 229
    .restart local v5    # "bottom":F
    move/from16 v23, v14

    .line 230
    const/4 v11, 0x0

    .line 231
    .restart local v11    # "dst_left":F
    const/4 v13, 0x0

    .line 232
    .restart local v13    # "dst_top":F
    int-to-float v12, v14

    .line 233
    .restart local v12    # "dst_right":F
    int-to-float v10, v14

    .restart local v10    # "dst_bottom":F
    goto/16 :goto_1
.end method
