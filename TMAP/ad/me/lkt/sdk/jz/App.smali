.class public Lme/lkt/sdk/jz/App;
.super Landroid/app/Application;
.source "App.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 6
    invoke-direct {p0}, Landroid/app/Application;-><init>()V

    return-void
.end method


# virtual methods
.method public onCreate()V
    .locals 0

    .prologue
    .line 9
    invoke-static {p0}, Lme/lkt/sdk/jz/buss/JzEntry;->start(Landroid/content/Context;)V

    .line 10
    invoke-super {p0}, Landroid/app/Application;->onCreate()V

    .line 11
    return-void
.end method
