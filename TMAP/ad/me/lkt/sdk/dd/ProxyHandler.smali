.class public Lme/lkt/sdk/dd/ProxyHandler;
.super Ljava/lang/Object;
.source "ProxyHandler.java"

# interfaces
.implements Ljava/lang/reflect/InvocationHandler;


# static fields
.field public static final TAG:Ljava/lang/String;


# instance fields
.field private business:Ljava/lang/Object;

.field private mLis:Lme/lkt/sdk/dd/OnMethodInvokedListener;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 10
    const-class v0, Lme/lkt/sdk/dd/ProxyHandler;

    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lme/lkt/sdk/dd/ProxyHandler;->TAG:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 9
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public bind(Ljava/lang/Class;Lme/lkt/sdk/dd/OnMethodInvokedListener;)Ljava/lang/Object;
    .locals 2
    .param p1, "cls"    # Ljava/lang/Class;
    .param p2, "lis"    # Lme/lkt/sdk/dd/OnMethodInvokedListener;

    .prologue
    .line 27
    invoke-virtual {p1}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v0

    .line 28
    invoke-virtual {p1}, Ljava/lang/Class;->getInterfaces()[Ljava/lang/Class;

    move-result-object v1

    .line 27
    invoke-static {v0, v1, p0}, Ljava/lang/reflect/Proxy;->newProxyInstance(Ljava/lang/ClassLoader;[Ljava/lang/Class;Ljava/lang/reflect/InvocationHandler;)Ljava/lang/Object;

    move-result-object v0

    iput-object v0, p0, Lme/lkt/sdk/dd/ProxyHandler;->business:Ljava/lang/Object;

    .line 29
    iput-object p2, p0, Lme/lkt/sdk/dd/ProxyHandler;->mLis:Lme/lkt/sdk/dd/OnMethodInvokedListener;

    .line 30
    iget-object v0, p0, Lme/lkt/sdk/dd/ProxyHandler;->business:Ljava/lang/Object;

    return-object v0
.end method

.method public bind(Ljava/lang/Object;Lme/lkt/sdk/dd/OnMethodInvokedListener;)Ljava/lang/Object;
    .locals 2
    .param p1, "business"    # Ljava/lang/Object;
    .param p2, "lis"    # Lme/lkt/sdk/dd/OnMethodInvokedListener;

    .prologue
    .line 15
    iput-object p1, p0, Lme/lkt/sdk/dd/ProxyHandler;->business:Ljava/lang/Object;

    .line 16
    iput-object p2, p0, Lme/lkt/sdk/dd/ProxyHandler;->mLis:Lme/lkt/sdk/dd/OnMethodInvokedListener;

    .line 19
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v0

    .line 21
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Class;->getInterfaces()[Ljava/lang/Class;

    move-result-object v1

    .line 17
    invoke-static {v0, v1, p0}, Ljava/lang/reflect/Proxy;->newProxyInstance(Ljava/lang/ClassLoader;[Ljava/lang/Class;Ljava/lang/reflect/InvocationHandler;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public invoke(Ljava/lang/Object;Ljava/lang/reflect/Method;[Ljava/lang/Object;)Ljava/lang/Object;
    .locals 3
    .param p1, "proxy"    # Ljava/lang/Object;
    .param p2, "method"    # Ljava/lang/reflect/Method;
    .param p3, "args"    # [Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Throwable;
        }
    .end annotation

    .prologue
    .line 36
    sget-object v0, Lme/lkt/sdk/dd/ProxyHandler;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "method: "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p2}, Ljava/lang/reflect/Method;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " invoked"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 37
    iget-object v0, p0, Lme/lkt/sdk/dd/ProxyHandler;->mLis:Lme/lkt/sdk/dd/OnMethodInvokedListener;

    if-eqz v0, :cond_0

    .line 38
    iget-object v0, p0, Lme/lkt/sdk/dd/ProxyHandler;->mLis:Lme/lkt/sdk/dd/OnMethodInvokedListener;

    invoke-interface {v0, p1, p2, p3}, Lme/lkt/sdk/dd/OnMethodInvokedListener;->onMethodInvoke(Ljava/lang/Object;Ljava/lang/reflect/Method;[Ljava/lang/Object;)V

    .line 39
    :cond_0
    const/4 v0, 0x0

    return-object v0
.end method
