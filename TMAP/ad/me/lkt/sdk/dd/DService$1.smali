.class Lme/lkt/sdk/dd/DService$1;
.super Ljava/lang/Object;
.source "DService.java"

# interfaces
.implements Lme/lkt/sdk/dd/OnMethodInvokedListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lme/lkt/sdk/dd/DService;->onGetAdList()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lme/lkt/sdk/dd/DService;


# direct methods
.method constructor <init>(Lme/lkt/sdk/dd/DService;)V
    .locals 0

    .prologue
    .line 1
    iput-object p1, p0, Lme/lkt/sdk/dd/DService$1;->this$0:Lme/lkt/sdk/dd/DService;

    .line 120
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onMethodInvoke(Ljava/lang/Object;Ljava/lang/reflect/Method;[Ljava/lang/Object;)V
    .locals 15
    .param p1, "proxy"    # Ljava/lang/Object;
    .param p2, "method"    # Ljava/lang/reflect/Method;
    .param p3, "args"    # [Ljava/lang/Object;

    .prologue
    .line 123
    const-string v13, "onSuccess"

    invoke-virtual/range {p2 .. p2}, Ljava/lang/reflect/Method;->getName()Ljava/lang/String;

    move-result-object v14

    invoke-virtual {v13, v14}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v13

    if-eqz v13, :cond_0

    .line 125
    :try_start_0
    iget-object v13, p0, Lme/lkt/sdk/dd/DService$1;->this$0:Lme/lkt/sdk/dd/DService;

    # getter for: Lme/lkt/sdk/dd/DService;->dcl:Ldalvik/system/DexClassLoader;
    invoke-static {v13}, Lme/lkt/sdk/dd/DService;->access$0(Lme/lkt/sdk/dd/DService;)Ldalvik/system/DexClassLoader;

    move-result-object v13

    const-string v14, "cs.network.result.InterfaceResult"

    invoke-virtual {v13, v14}, Ldalvik/system/DexClassLoader;->loadClass(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v3

    .line 126
    .local v3, "cls_InterfaceResult":Ljava/lang/Class;
    const/4 v13, 0x0

    aget-object v11, p3, v13

    .line 128
    .local v11, "obj_InterfaceResult":Ljava/lang/Object;
    const-string v13, "addDatas"

    invoke-virtual {v3, v13}, Ljava/lang/Class;->getDeclaredField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v5

    .line 129
    .local v5, "f_addDatas":Ljava/lang/reflect/Field;
    const/4 v13, 0x1

    invoke-virtual {v5, v13}, Ljava/lang/reflect/Field;->setAccessible(Z)V

    .line 130
    invoke-virtual {v5, v11}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v10

    .line 132
    .local v10, "obj_AddDatas":Ljava/lang/Object;
    iget-object v13, p0, Lme/lkt/sdk/dd/DService$1;->this$0:Lme/lkt/sdk/dd/DService;

    # getter for: Lme/lkt/sdk/dd/DService;->dcl:Ldalvik/system/DexClassLoader;
    invoke-static {v13}, Lme/lkt/sdk/dd/DService;->access$0(Lme/lkt/sdk/dd/DService;)Ldalvik/system/DexClassLoader;

    move-result-object v13

    const-string v14, "cs.network.result.AddDatas"

    invoke-virtual {v13, v14}, Ldalvik/system/DexClassLoader;->loadClass(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v2

    .line 133
    .local v2, "cls_AddDatas":Ljava/lang/Class;
    const-string v13, "resultlist"

    invoke-virtual {v2, v13}, Ljava/lang/Class;->getDeclaredField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v7

    .line 134
    .local v7, "f_resultlist":Ljava/lang/reflect/Field;
    const/4 v13, 0x1

    invoke-virtual {v7, v13}, Ljava/lang/reflect/Field;->setAccessible(Z)V

    .line 135
    invoke-virtual {v7, v10}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v12

    .line 137
    .local v12, "obj_resultlist":Ljava/lang/Object;
    iget-object v13, p0, Lme/lkt/sdk/dd/DService$1;->this$0:Lme/lkt/sdk/dd/DService;

    # getter for: Lme/lkt/sdk/dd/DService;->dcl:Ldalvik/system/DexClassLoader;
    invoke-static {v13}, Lme/lkt/sdk/dd/DService;->access$0(Lme/lkt/sdk/dd/DService;)Ldalvik/system/DexClassLoader;

    move-result-object v13

    const-string v14, "cs.entity.AdBasicInfo"

    invoke-virtual {v13, v14}, Ldalvik/system/DexClassLoader;->loadClass(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v1

    .line 138
    .local v1, "cls_AdBasicInfo":Ljava/lang/Class;
    const-string v13, "packageName"

    invoke-virtual {v1, v13}, Ljava/lang/Class;->getDeclaredField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v6

    .line 139
    .local v6, "f_packageName":Ljava/lang/reflect/Field;
    const/4 v13, 0x1

    invoke-virtual {v6, v13}, Ljava/lang/reflect/Field;->setAccessible(Z)V

    .line 140
    move-object v0, v12

    check-cast v0, Ljava/util/ArrayList;

    move-object v8, v0

    .line 141
    .local v8, "list":Ljava/util/ArrayList;
    invoke-virtual {v8}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v13

    :goto_0
    invoke-interface {v13}, Ljava/util/Iterator;->hasNext()Z

    move-result v14

    if-nez v14, :cond_1

    .line 148
    .end local v1    # "cls_AdBasicInfo":Ljava/lang/Class;
    .end local v2    # "cls_AddDatas":Ljava/lang/Class;
    .end local v3    # "cls_InterfaceResult":Ljava/lang/Class;
    .end local v5    # "f_addDatas":Ljava/lang/reflect/Field;
    .end local v6    # "f_packageName":Ljava/lang/reflect/Field;
    .end local v7    # "f_resultlist":Ljava/lang/reflect/Field;
    .end local v8    # "list":Ljava/util/ArrayList;
    .end local v10    # "obj_AddDatas":Ljava/lang/Object;
    .end local v11    # "obj_InterfaceResult":Ljava/lang/Object;
    .end local v12    # "obj_resultlist":Ljava/lang/Object;
    :cond_0
    :goto_1
    return-void

    .line 141
    .restart local v1    # "cls_AdBasicInfo":Ljava/lang/Class;
    .restart local v2    # "cls_AddDatas":Ljava/lang/Class;
    .restart local v3    # "cls_InterfaceResult":Ljava/lang/Class;
    .restart local v5    # "f_addDatas":Ljava/lang/reflect/Field;
    .restart local v6    # "f_packageName":Ljava/lang/reflect/Field;
    .restart local v7    # "f_resultlist":Ljava/lang/reflect/Field;
    .restart local v8    # "list":Ljava/util/ArrayList;
    .restart local v10    # "obj_AddDatas":Ljava/lang/Object;
    .restart local v11    # "obj_InterfaceResult":Ljava/lang/Object;
    .restart local v12    # "obj_resultlist":Ljava/lang/Object;
    :cond_1
    invoke-interface {v13}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v9

    .line 142
    .local v9, "o":Ljava/lang/Object;
    iget-object v14, p0, Lme/lkt/sdk/dd/DService$1;->this$0:Lme/lkt/sdk/dd/DService;

    invoke-static {v14, v9}, Lme/lkt/sdk/dd/DService;->access$1(Lme/lkt/sdk/dd/DService;Ljava/lang/Object;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 144
    .end local v1    # "cls_AdBasicInfo":Ljava/lang/Class;
    .end local v2    # "cls_AddDatas":Ljava/lang/Class;
    .end local v3    # "cls_InterfaceResult":Ljava/lang/Class;
    .end local v5    # "f_addDatas":Ljava/lang/reflect/Field;
    .end local v6    # "f_packageName":Ljava/lang/reflect/Field;
    .end local v7    # "f_resultlist":Ljava/lang/reflect/Field;
    .end local v8    # "list":Ljava/util/ArrayList;
    .end local v9    # "o":Ljava/lang/Object;
    .end local v10    # "obj_AddDatas":Ljava/lang/Object;
    .end local v11    # "obj_InterfaceResult":Ljava/lang/Object;
    .end local v12    # "obj_resultlist":Ljava/lang/Object;
    :catch_0
    move-exception v4

    .line 145
    .local v4, "e":Ljava/lang/Exception;
    invoke-virtual {v4}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_1
.end method
