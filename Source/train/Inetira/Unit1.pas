unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, GLCadencer, GLWin32Viewer, GLMisc, GLScene, GLObjects, GLBehaviours
  ,VectorGeometry, StdCtrls, ComCtrls, GLDCE, GLCollision, GLShadowVolume,
  GLVectorFileObjects, glfile3ds, GLFireFX, GLFileSmd, GLTexture, ExtCtrls,
  GLWin32FullScreenViewer, keyboard, AsyncTimer, GLWindows, GLGui,
  GLBitmapFont, GLWindowsFont, GLGeomObjects, GLSpaceText, GLSkydome,
  GLLensFlare;

type
  TForm1 = class(TForm)
    GLScene1: TGLScene;
    GLSceneViewer1: TGLSceneViewer;
    GLCadencer1: TGLCadencer;
    GLCamera1: TGLCamera;
    GLLightSource1: TGLLightSource;
    GLSphere1: TGLSphere;
    focus_camera: TGLDummyCube;
    GLPlane1: TGLPlane;
    CollisionManager1: TCollisionManager;
    plane1: TGLDummyCube;
    GLFireFXManager1: TGLFireFXManager;
    GLActor1: TGLActor;
    GLMaterialLibrary1: TGLMaterialLibrary;
    GLCamera2: TGLCamera;
    GLCamera3: TGLCamera;
    GLDummyCube1: TGLDummyCube;
    GLCube1: TGLCube;
    GLActor2: TGLActor;
    AsyncTimer1: TAsyncTimer;
    GLGuiLayout1: TGLGuiLayout;
    GLWindowsBitmapFont1: TGLWindowsBitmapFont;
    GLForm1: TGLForm;
    GLLabel1: TGLLabel;
    GLLabel2: TGLLabel;
    GLLabel3: TGLLabel;
    GLLabel4: TGLLabel;
    GLLabel5: TGLLabel;
    GLLabel6: TGLLabel;
    GLLabel7: TGLLabel;
    GLFullScreenViewer1: TGLFullScreenViewer;
    GLLightSource2: TGLLightSource;
    down: TGLDummyCube;
    left: TGLDummyCube;
    right: TGLDummyCube;
    up: TGLDummyCube;
    between: TGLDummyCube;
    GLCube2: TGLCube;
    GLCube3: TGLCube;
    GLCube4: TGLCube;
    GLCube5: TGLCube;
    GLCube6: TGLCube;
    mane2: TGLCube;
    mane3: TGLCube;
    coli2: TGLDummyCube;
    coli1: TGLDummyCube;
    AsyncTimer2: TAsyncTimer;
    GLDummyCube2: TGLDummyCube;
    GLSphere2: TGLSphere;
    GLFireFXManager2: TGLFireFXManager;
    GLLabel8: TGLLabel;
    GLLabel9: TGLLabel;
    GLFreeForm1: TGLFreeForm;
    GLShadowVolume1: TGLShadowVolume;
    Shadow1: TGLDummyCube;
    Shadow2: TGLDummyCube;
    GLArrowLine1: TGLArrowLine;
    GLArrowLine2: TGLArrowLine;
    GLSkyDome1: TGLSkyDome;
    GLLensFlare1: TGLLensFlare;
    GLLightSource3: TGLLightSource;
    GLCamera4: TGLCamera;
    glreset: TGLLabel;
    glexit: TGLLabel;
    GLWindowsBitmapFont2: TGLWindowsBitmapFont;
    player1: TGLLabel;
    player2: TGLLabel;
    GLDummyCube3: TGLDummyCube;
    GLPlane2: TGLPlane;
    procedure GLCadencer1Progress(Sender: TObject; const deltaTime,
      newTime: Double);
    procedure CollisionManager1Collision(Sender: TObject; object1,
      object2: TGLBaseSceneObject);
    procedure FormCreate(Sender: TObject);
    procedure GLSceneViewer1MouseMove(Sender: TObject; Shift: TShiftState;
      X, Y: Integer);
    procedure GLSceneViewer1MouseDown(Sender: TObject;
      Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure Button4Click(Sender: TObject);
    procedure AsyncTimer1Timer(Sender: TObject);
    procedure GLFullScreenViewer1KeyPress(Sender: TObject; var Key: Char);
    procedure GLFullScreenViewer1DblClick(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure GLFullScreenViewer1MouseDown(Sender: TObject;
      Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure GLFullScreenViewer1MouseMove(Sender: TObject;
      Shift: TShiftState; X, Y: Integer);
    procedure FormKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure GLFullScreenViewer1KeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure AsyncTimer2Timer(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  mx,my: Integer;
  st,rt: String;
  cam1: boolean;
  Act1,Act2: boolean;
  Ianim,Sanim,sub: Integer;
  Ispeed: Integer;
  Shoot,cam: boolean;
  timer1,timer2: boolean;
  a:TAffineVector;
  playagain: boolean;

const
  speed=250;

implementation

uses Math, Unit2;

{$R *.dfm}

procedure TForm1.GLCadencer1Progress(Sender: TObject; const deltaTime,
  newTime: Double);
begin
//GetOrCreateInertia(GLSphere1).ApplyTranslationAcceleration(deltatime,VectorMake(0, -2, 0) );
if (timer1=true)and(timer2=false) then
GetOrCreateInertia(GLDummyCube1).ApplyTranslationAcceleration(deltatime,VectorMake(0, 0, -3) );
if (timer1=false)and(timer2=true) then
GetOrCreateInertia(GLDummyCube2).ApplyTranslationAcceleration(deltatime,VectorMake(0, 0, -3) );
CollisionManager1.CheckCollisions;

if (IsKeyDown('e'))and(shoot=false)and(playagain=false) then
  begin
      if (Timer1=false)and(timer2=true) then
      begin
        GetOrCreateInertia(GLDummyCube2).TranslationSpeed.SetVector(0,0,0);
        GLDummyCube2.Position.X:=-1.1;
        GLDummyCube2.Position.Y:=6;
        GLDummyCube2.Position.Z:=27;
        GLSphere2.Position.X:=0;
        GLSphere2.Position.y:=0;
        GLSphere2.Position.z:=-22;
        GLActor2.CurrentFrame:=1;
        Sanim:=0; Ianim:=1;
        GLLabel5.Visible:=false;
        shoot:=true;
        Sanim:=0; Ianim:=1;
        GLdummyCube2.PitchAngle:=((0*3.75)+53);
        AsyncTimer1.Enabled:=true;
        AsyncTimer2.Enabled:=false;
        Timer1:=true;
        Timer2:=false;
        GLCadencer1.Enabled:=false;
        GLFireFXManager1.Paused:=false;
        GLFireFXManager2.Paused:=true;
        exit;
      end;
      if (Timer1=true)and(Timer2=false) then
      begin
        GetOrCreateInertia(GLDummyCube1).TranslationSpeed.SetVector(0,0,0);
        GLDummyCube1.Position.X:=-1.1;
        GLDummyCube1.Position.Y:=6;
        GLDummyCube1.Position.Z:=27;
        GLSphere1.Position.X:=0;
        GLSphere1.Position.y:=0;
        GLSphere1.Position.z:=-22;
        GLActor1.CurrentFrame:=1;
        Sanim:=0; Ianim:=1;
        GLdummyCube1.PitchAngle:=((0*3.75)+53);
        GLLabel5.Visible:=false;
        shoot:=true;
        AsyncTimer1.Enabled:=false;
        AsyncTimer2.Enabled:=true;
        Timer1:=false;
        Timer2:=true;
        GLCadencer1.Enabled:=false;
        GLFireFXManager1.Paused:=true;
        GLFireFXManager2.Paused:=false;
        exit;
      end;
end;



//if Act1=true then
//begin


//end;





//GLDCEManager1.Step(deltatime);
 if playagain=true then
      begin
        if (IsKeyDown('r')) then
          begin
          Ianim:=1; Sanim:=0; Ispeed:=3; Shoot:=true; timer1:=true; timer2:=false; sub:=0; cam:=false; playagain:=false;
          //-------------
          GetOrCreateInertia(GLDummyCube2).TranslationSpeed.SetVector(0,0,0);
          GLDummyCube2.Position.X:=-1.1;
          GLDummyCube2.Position.Y:=6;
          GLDummyCube2.Position.Z:=27;
          GLSphere2.Position.X:=0;
          GLSphere2.Position.y:=0;
          GLSphere2.Position.z:=-22;
          GLActor2.CurrentFrame:=1;
          //-------------
          GetOrCreateInertia(GLDummyCube1).TranslationSpeed.SetVector(0,0,0);
          GLDummyCube1.Position.X:=-1.1;
          GLDummyCube1.Position.Y:=6;
          GLDummyCube1.Position.Z:=27;
          GLSphere1.Position.X:=0;
          GLSphere1.Position.y:=0;
          GLSphere1.Position.z:=-22;
          GLActor1.CurrentFrame:=1;
          //-------------
          GLdummyCube2.PitchAngle:=((0*3.75)+53);
          GLdummyCube1.PitchAngle:=((0*3.75)+53);
          //-------------
          GLLabel5.Visible:=false;
          shoot:=true;
          AsyncTimer1.Enabled:=true;
          AsyncTimer2.Enabled:=false;
          Timer1:=true;
          Timer2:=false;
          GLCadencer1.Enabled:=false;
          GLFireFXManager1.Paused:=false;
          GLFireFXManager2.Paused:=true;
          //------------
          GLArrowLine1.Position.X:=50;
          GLArrowLine1.Position.Y:=-42;
          GLArrowLine1.Position.Z:=40;
          GLArrowLine2.Position.X:=50;
          GLArrowLine2.Position.Y:=-42;
          GLArrowLine2.Position.Z:=-40;
          //------------
          GLLabel7.Caption:='0';
          GLLabel9.Caption:='0';
          GLLabel2.Caption:='0';
          GLLabel4.Caption:='0';
          //------------
          GLCamera1.Position.X:=70;
          GLCamera1.Position.Y:=10;
          GLCamera1.Position.Z:=0;
          focus_camera.Position.X:=0;
          focus_camera.Position.Y:=0;
          focus_camera.Position.Z:=0;
          //------------
          glreset.Visible:=false;
          glexit.Visible:=false;
          player1.Visible:=false;
          player2.Visible:=false;
          

          end;

        if (IsKeyDown('t')) then
          Application.Terminate;
      end;



end;

procedure TForm1.CollisionManager1Collision(Sender: TObject; object1,
  object2: TGLBaseSceneObject);
var   a,b,c:TGLBaseSceneObject;

begin
GLSceneViewer1.Camera:=GLCamera1;
GLFullScreenViewer1.Camera:=glcamera1;
if (Timer1=true)and(Timer2=false) then
  begin
  if GLFireFXManager1.Disabled=false then
  begin
    GLSceneViewer1.Camera:=GLCamera1;
    GLForm1.Visible:=true;
    GLFireFXManager1.ParticleSize:=2;
    GLFireFXManager1.IsotropicExplosion(4,5,4);
    GetOrCreateInertia(GLDummyCube1).TranslationSpeed.SetVector(0,0,0);
    a:=coli2;

    if (object1=a)or(object2=a) then
    begin
      if GLLabel5.Visible=false then
      GLLabel7.Caption:=inttostr(strtoint(GLLabel7.Caption)+1);
      GLLabel5.Visible:=true;
      if (StrToInt(GLLabel7.Caption)=5) then
      begin
      glreset.Visible:=true;
      glexit.Visible:=true;
      player1.Visible:=true;
      playagain:=true;
      end;

    end;
    GLFireFXManager1.Disabled:=true;
  end;
end;

if (Timer1=false)and(Timer2=true) then
begin
   if GLFireFXManager2.Disabled=false then
  begin
    GLSceneViewer1.Camera:=GLCamera1;
    GLForm1.Visible:=true;
    GLFireFXManager2.ParticleSize:=2;
    GLFireFXManager2.IsotropicExplosion(4,5,4);
    GetOrCreateInertia(GLDummyCube2).TranslationSpeed.SetVector(0,0,0);
    b:=coli1;

    if (object2=b)or(object1=b) then
    begin
      if GLLabel5.Visible=false then
      GLLabel9.Caption:=inttostr(strtoint(GLLabel9.Caption)+1);
      GLLabel5.Visible:=true;
      if (StrToInt(GLLabel9.Caption)=5) then
      begin
      glreset.Visible:=true;
      glexit.Visible:=true;
      player2.Visible:=true;
      playagain:=true;
      end;

    end;
    GLFireFXManager2.Disabled:=true;
  end;

end;
  //AsyncTimer1.Enabled:=true;
end;
//GLSphere1.Position.X:=0;
//GLSphere1.Position.y:=0;
//GLSphere1.Position.z:=40;
//showmessage('collision');



procedure TForm1.FormCreate(Sender: TObject);
begin

Ianim:=1; Sanim:=0; Ispeed:=3; Shoot:=true; timer1:=true; timer2:=false; sub:=0; cam:=false; playagain:=false;

SetCurrentDir(ExtractFilePath(Application.ExeName)+'..\..\media');
GLFreeForm1.LoadFromFile('plan.3ds');


GLActor1.LoadFromFile('robo.smd');
GLActor2.LoadFromFile('robo1.smd');

GlActor1.AddDataFromFile('robo_fire.smd');
GLActor1.Animations[1].MakeSkeletalTranslationStatic;

GlActor1.AddDataFromFile('robo_run.smd');
GLActor1.Animations[2].MakeSkeletalTranslationStatic;

GlActor2.AddDataFromFile('robo_fire.smd');
GLActor2.Animations[1].MakeSkeletalTranslationStatic;

GlActor2.AddDataFromFile('robo_run.smd');
GLActor2.Animations[2].MakeSkeletalTranslationStatic;

st:='robo_fire';
GLActor1.SwitchToAnimation(st);
rt:='robo_fire';
GLActor2.SwitchToAnimation(rt);
GLCadencer1.Enabled:=false;
end;

procedure TForm1.GLSceneViewer1MouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
if (ssleft in shift) then
begin
    GLCamera1.MoveAroundTarget(my-y, mx-x);
      mx:=x; my:=y;
end;
end;

procedure TForm1.GLSceneViewer1MouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
mx:=x; my:=y;
end;

procedure TForm1.Button4Click(Sender: TObject);
begin

  if cam1=false then
  begin
    GLSceneViewer1.Camera:=GLCamera1;
    cam1:=true;
    exit;
  end;

  if cam1=true then
  begin
    GLSceneViewer1.Camera:=GLCamera2;
    cam1:=false;
    exit;
  end;

end;

procedure TForm1.AsyncTimer1Timer(Sender: TObject);

label start;

begin
   form1.Caption:=floattostr(GLArrowLine1.Position.x);

  if not(IsKeyDown(37))and(not(IsKeyDown(38)))and(not(IsKeyDown(39)))and(not(IsKeyDown(40)))then
  begin
     GLArrowLine1.PointTo(GLActor2,YHmgVector);
     GLArrowLine2.PointTo(GLActor1,YHmgVector);
     GLActor1.RollAngle:=-90;
  end;

  GLForm1.DoChanges;

  if IsKeyDown('p') then
  mane2.Position.Z:=mane2.Position.Z+1;

  if (IsKeyDown('o')) then
    begin
       GLFullScreenViewer1.Active:=True;
       GLSceneViewer1.Visible:=False;
       GLCamera1.SceneScale:=GLFullScreenViewer1.Height/350;
    end;

  if (IsKeyDown('s'))and(Sanim<29) then
  begin
     if st<>'robo_fire' then
     begin
        st:='robo_fire';
        GLActor1.SwitchToAnimation(st);
        Sanim:=0; Ianim:=1;
     end;
     GLLabel4.Caption:=inttostr(Sanim);
     Sanim:=Sanim+Ianim;
     GLActor1.CurrentFrame:=GLActor1.CurrentFrame+Ianim;
     GLdummyCube1.PitchAngle:=((Sanim*3.75)+53);
  end;

  if (IsKeyDown('x'))and(Sanim>2) then
  begin
     if st<>'robo_fire' then
     begin
        st:='robo_fire';
        GLActor1.SwitchToAnimation(st);
        Sanim:=0; Ianim:=1;
     end;
     Sanim:=Sanim-Ianim;
     GLLabel4.Caption:=inttostr(Sanim);
     GLActor1.CurrentFrame:=GLActor1.CurrentFrame-Ianim;
     GLdummyCube1.PitchAngle:=((Sanim*3.75)+53);
  end;

  if (IsKeyDown('a'))and(Ispeed<30) then
  begin
     GLLabel2.Caption:=inttostr(Ispeed);
     Ispeed:=Ispeed+1;

  end;

  if (IsKeyDown('z'))and(Ispeed>1) then
  begin
     Ispeed:=Ispeed-1;
     GLLabel2.Caption:=inttostr(Ispeed);
  end;

  if (IsKeyDown('w'))and(shoot=true) then
  begin
      GLFireFXManager1.ParticleSize:=0.5;                                //Sanim
      GLFireFXManager1.Disabled:=false;
      if Sanim<=13 then sub:=1;
      if (sanim>13)and(sanim<=20) then sub:=5;
      if (sanim>20)and(sanim<=25) then sub:=10;
      if (sanim>25)and(sanim<=29) then sub:=20;
      GetOrCreateInertia(GLDummyCube1).TranslationSpeed.SetVector(Ispeed,0,sub);
      GLActor1.AnimationMode:=aamNone;
      GLFireFXManager2.Paused:=true;
      GLCadencer1.Enabled:=true;
      GLSceneViewer1.Camera:=GLCamera4;
      GLFullScreenViewer1.Camera:=glcamera4;
      GLForm1.Visible:=false;
      shoot:=false;
      AsyncTimer1.Enabled:=false
  end;

{  if (IsKeyDown('e'))and(shoot=false) then
  begin
      GLCadencer1.Enabled:=false;
      GetOrCreateInertia(GLDummyCube1).TranslationSpeed.SetVector(0,0,0);
      GLDummyCube1.Position.X:=-1.1;
      GLDummyCube1.Position.Y:=6;
      GLDummyCube1.Position.Z:=27;
      GLSphere1.Position.X:=0;
      GLSphere1.Position.y:=0;
      GLSphere1.Position.z:=-22;
      GLLabel5.Visible:=false;
      shoot:=true;
  end;  }

{  if (IskeyDown('c')) then
  begin
        if cam1=false then
        begin
            GLSceneViewer1.Camera:=GLCamera1;
            GLFullScreenViewer1.Camera:=GLCamera1;
            cam1:=true;
            exit;
        end;

        if cam1=true then
        begin
            GLSceneViewer1.Camera:=GLCamera2;
            GLFullScreenViewer1.Camera:=GLCamera2;
            cam1:=false;
            exit;
        end;
  end;}

  if (IsKeyDown(38))and(not(IsKeyDown(37)))and(not(IsKeyDown(39)))and(not(IsKeyDown(40))) then
  begin
     if GLActor1.RollAngle<>90 then GLActor1.RollAngle:=90;

     if st<>'robo_run' then
     begin
        st:='robo_run';
        GLActor1.SwitchToAnimation(st);
        GLActor1.AnimationMode:=aamLoop;
        GLdummyCube1.PitchAngle:=((-0*3.75)+55);
     end;
     GLActor1.NextFrame(1);
     if GLArrowLine1.Position.Z>(between.Position.Z+6) then
     begin
        GLArrowLine1.Position.Z:=GLArrowLine1.Position.Z-0.5;
        focus_camera.Position.Z:=focus_camera.Position.Z-0.25;
        GLCamera1.Position.Z:=GLCamera1.Position.Z-0.25;
     end;
     GLArrowLine1.PointTo(glarrowline1,YHmgVector);
  end;


  if (IsKeyDown(40))and(not(IsKeyDown(37)))and(not(IsKeyDown(39)))and(not(IsKeyDown(38))) then
  begin
     if GLActor1.RollAngle<>-90 then GLActor1.RollAngle:=-90;
     if st<>'robo_run' then
     begin
        st:='robo_run';
        GLActor1.SwitchToAnimation(st);
        GLActor1.AnimationMode:=aamLoop;
        GLdummyCube1.PitchAngle:=((-0*3.75)+55);
     end;
     GLActor1.NextFrame(1);
     if GLArrowLine1.Position.Z<down.Position.Z then
     begin
        GLArrowLine1.Position.Z:=GLArrowLine1.Position.Z+0.5;
        focus_camera.Position.Z:=focus_camera.Position.Z+0.25;
        GLCamera1.Position.Z:=GLCamera1.Position.Z+0.25;
     end;
     GLArrowLine1.PointTo(glarrowline1,YHmgVector);
  end;


  if (IsKeyDown(37))and(not(IsKeyDown(38)))and(not(IsKeyDown(39)))and(not(IsKeyDown(40))) then
  begin
     if GLActor1.RollAngle<>180 then GLActor1.RollAngle:=180;
     if st<>'robo_run' then
     begin
        st:='robo_run';
        GLActor1.SwitchToAnimation(st);
        GLActor1.AnimationMode:=aamLoop;
        GLdummyCube1.PitchAngle:=((-0*3.75)+55);
     end;
     GLActor1.NextFrame(1);
     if (GLArrowLine1.Position.X-50)>left.Position.X then
     begin
        GLArrowLine1.Position.X:=GLArrowLine1.Position.X-0.5;
        GLCamera1.Position.x:=GLCamera1.Position.X-0.25;
        GLCamera1.Position.Z:=GLCamera1.Position.Z+0.25;
        focus_camera.Position.x:=focus_camera.Position.X-0.25;
     end;
     GLArrowLine1.PointTo(glarrowline1,YHmgVector);
  end;

  if (IsKeyDown(39))and(not(IsKeyDown(37)))and(not(IsKeyDown(38)))and(not(IsKeyDown(40))) then
  begin
     if GLActor1.RollAngle<>0 then GLActor1.RollAngle:=0;
     if st<>'robo_run' then
     begin
        st:='robo_run';
        GLActor1.SwitchToAnimation(st);
        GLActor1.AnimationMode:=aamLoop;
        GLdummyCube1.PitchAngle:=((-0*3.75)+55);
     end;
     GLActor1.NextFrame(1);
     if (GLArrowLine1.Position.X-50)<right.Position.X then
     begin
        GLArrowLine1.Position.X:=GLArrowLine1.Position.X+0.5;
        GLCamera1.Position.x:=GLCamera1.Position.X+0.25;
        GLCamera1.Position.Z:=GLCamera1.Position.Z-0.25;
        focus_camera.Position.x:=focus_camera.Position.X+0.25;
     end;
     GLArrowLine1.PointTo(glarrowline1,YHmgVector);
  end;

  if IsKeyDown('m') then
      GLActor1.RollAngle:=GLActor1.RollAngle-1;
  if IsKeyDown('n') then
      GLActor1.RollAngle:=GLActor1.RollAngle+1;

end;


procedure TForm1.GLFullScreenViewer1KeyPress(Sender: TObject;
  var Key: Char);
begin
if Key=#27 then begin
      GLFullScreenViewer1DblClick(Self);
      Key:=#0;
   end;
end;

procedure TForm1.GLFullScreenViewer1DblClick(Sender: TObject);
begin
 // Make the windows viewer visible again
   GLSceneViewer1.Visible:=True;
   // Deactivate full-screen mode
   GLFullScreenViewer1.Active:=False;
   // And apply back the adequate scale for the SceneViewer
   FormResize(Self);
end;

procedure TForm1.FormResize(Sender: TObject);
begin
GLCamera1.SceneScale:=GLSceneViewer1.Height/350;
end;

procedure TForm1.GLFullScreenViewer1MouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
mx:=x; my:=y;
end;

procedure TForm1.GLFullScreenViewer1MouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
 if (ssleft in shift) then
begin
    GLCamera1.MoveAroundTarget(my-y, mx-x);
      mx:=x; my:=y;
end;
end;

procedure TForm1.FormKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if st<>'robo_fire' then
  begin
    st:='robo_fire';
    GLActor1.SwitchToAnimation(st);
    Sanim:=0; Ianim:=1;
  end;
  if rt<>'robo_fire' then
  begin
    rt:='robo_fire';
    GLActor2.SwitchToAnimation(rt);
    Sanim:=0; Ianim:=1;
  end;
end;

procedure TForm1.GLFullScreenViewer1KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if st<>'robo_fire' then
  begin
    st:='robo_fire';
    GLActor1.SwitchToAnimation(st);
    Sanim:=0; Ianim:=1;
  end;
  if rt<>'robo_fire' then
  begin
    rt:='robo_fire';
    GLActor2.SwitchToAnimation(rt);
    Sanim:=0; Ianim:=1;
  end;
end;

procedure TForm1.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if IsKeyDown('1') then
GLSceneViewer1.Camera:=glcamera1;
if IsKeyDown('2') then
GLSceneViewer1.Camera:=glcamera2;
if IsKeyDown('3') then
GLSceneViewer1.Camera:=glcamera3;
end;

procedure TForm1.AsyncTimer2Timer(Sender: TObject);
begin
  form1.Caption:=floattostr(glactor2.RollAngle);
  if not(IsKeyDown(37))and(not(IsKeyDown(38)))and(not(IsKeyDown(39)))and(not(IsKeyDown(40)))then
  begin
  GLArrowLine2.PointTo(GLActor1,YHmgVector);
  GLArrowLine1.PointTo(GLActor2,YHmgVector);
  GLActor2.RollAngle:=-90;
  end;
  GLForm1.DoChanges;

  if IsKeyDown('p') then
  GLActor2.Position.Z:=GLActor2.Position.Z+1;

  if (IsKeyDown('o')) then
    begin
       // GLFullScreenViewer1.UseCurrentResolution;
       GLFullScreenViewer1.Active:=True;
       // Hide the windows viewer so it is no longer updated
       GLSceneViewer1.Visible:=False;
       // Apply proper scale
       GLCamera1.SceneScale:=GLFullScreenViewer1.Height/350;
    end;

  if (IsKeyDown('s'))and(Sanim<29) then
  begin
     if rt<>'robo_fire' then
     begin
        rt:='robo_fire';
        GLActor2.SwitchToAnimation(rt);
        Sanim:=0; Ianim:=1;
     end;
     GLLabel4.Caption:=inttostr(Sanim);
     Sanim:=Sanim+Ianim;
     GLActor2.CurrentFrame:=GLActor2.CurrentFrame+Ianim;
     GLdummyCube2.PitchAngle:=((Sanim*3.75)+53);
  end;

  if (IsKeyDown('x'))and(Sanim>2) then
  begin
     if rt<>'robo_fire' then
     begin
        rt:='robo_fire';
        GLActor2.SwitchToAnimation(rt);
        Sanim:=0; Ianim:=1;
     end;
     Sanim:=Sanim-Ianim;
     GLLabel4.Caption:=inttostr(Sanim);
     GLActor2.CurrentFrame:=GLActor2.CurrentFrame-Ianim;
     GLdummyCube2.PitchAngle:=((Sanim*3.75)+53);
  end;

  if (IsKeyDown('a'))and(Ispeed<30) then
  begin
     GLLabel2.Caption:=inttostr(Ispeed);
     Ispeed:=Ispeed+1;

  end;

  if (IsKeyDown('z'))and(Ispeed>1) then
  begin
     Ispeed:=Ispeed-1;
     GLLabel2.Caption:=inttostr(Ispeed);
  end;

  if (IsKeyDown('w'))and(shoot=true) then
  begin
      GLFireFXManager2.ParticleSize:=0.5;                                //Sanim
      GLFireFXManager2.Disabled:=false;
      if Sanim<=13 then sub:=1;
      if (sanim>13)and(sanim<=20) then sub:=5;
      if (sanim>20)and(sanim<=25) then sub:=10;
      if (sanim>25)and(sanim<=29) then sub:=20;
      GetOrCreateInertia(GLDummyCube2).TranslationSpeed.SetVector(Ispeed,0,sub);
      GLActor2.AnimationMode:=aamNone;
      GLFireFXManager1.Paused:=true;
      GLCadencer1.Enabled:=true;
      GLSceneViewer1.Camera:=GLCamera3;
      GLFullScreenViewer1.Camera:=GLCamera3;
      GLForm1.Visible:=false;
      shoot:=false;
      AsyncTimer2.Enabled:=false
  end;

{  if (IsKeyDown('e'))and(shoot=false) then
  begin
      GLCadencer1.Enabled:=false;
      GetOrCreateInertia(GLDummyCube2).TranslationSpeed.SetVector(0,0,0);
      GLDummyCube2.Position.X:=-1.1;
      GLDummyCube2.Position.Y:=6;
      GLDummyCube2.Position.Z:=27;
      GLSphere2.Position.X:=0;
      GLSphere2.Position.y:=0;
      GLSphere2.Position.z:=-22;
      GLLabel5.Visible:=false;
      shoot:=true;
  end;   }

{  if (IskeyDown('c')) then
  begin
        if cam1=false then
        begin
            GLSceneViewer1.Camera:=GLCamera1;
            GLFullScreenViewer1.Camera:=GLCamera1;
            cam1:=true;
            exit;
        end;

        if cam1=true then
        begin
            GLSceneViewer1.Camera:=GLCamera2;
            GLFullScreenViewer1.Camera:=GLCamera2;
            cam1:=false;
            exit;
        end;
  end;}

  if (IsKeyDown(38))and(not(IsKeyDown(37)))and(not(IsKeyDown(39)))and(not(IsKeyDown(40))) then
  begin
     if GLActor2.RollAngle<>-90 then GLActor2.RollAngle:=-90;
     if rt<>'robo_run' then
     begin
        rt:='robo_run';
        GLActor2.SwitchToAnimation(rt);
        GLActor2.AnimationMode:=aamLoop;
        GLdummyCube2.PitchAngle:=((-0*3.75)+55);
     end;
     GLActor2.NextFrame(1);
     if (GLArrowLine2.Position.Z)<(between.Position.Z-6) then
     begin
         GLArrowLine2.Position.Z:=GLArrowLine2.Position.Z+0.5;
         focus_camera.Position.Z:=focus_camera.Position.Z+0.25;
         GLCamera1.Position.Z:=GLCamera1.Position.Z+0.25;
     end;
     GLArrowLine2.PointTo(GLArrowLine2,YHmgVector);
  end;


  if (IsKeyDown(40))and(not(IsKeyDown(37)))and(not(IsKeyDown(39)))and(not(IsKeyDown(38))) then
  begin
     if GLActor2.RollAngle<>90 then GLActor2.RollAngle:=90;
     if rt<>'robo_run' then
     begin
        rt:='robo_run';
        GLActor2.SwitchToAnimation(rt);
        GLActor2.AnimationMode:=aamLoop;
        GLdummyCube2.PitchAngle:=((-0*3.75)+55);
     end;
     GLActor2.NextFrame(1);
     if (GLArrowLine2.Position.Z)>up.Position.Z then
     begin
         GLArrowLine2.Position.Z:=GLArrowLine2.Position.Z-0.5;
         focus_camera.Position.Z:=focus_camera.Position.Z-0.25;
         GLCamera1.Position.Z:=GLCamera1.Position.Z-0.25;
     end;
     GLArrowLine2.PointTo(GLArrowLine2,YHmgVector);
  end;


  if (IsKeyDown(37))and(not(IsKeyDown(38)))and(not(IsKeyDown(39)))and(not(IsKeyDown(40))) then
  begin
     if GLActor2.RollAngle<>0 then GLActor2.RollAngle:=0;
     if rt<>'robo_run' then
     begin
        rt:='robo_run';
        GLActor2.SwitchToAnimation(rt);
        GLActor2.AnimationMode:=aamLoop;
        GLdummyCube2.PitchAngle:=((-0*3.75)+55);
     end;
     GLActor2.NextFrame(1);
     if (GLArrowLine2.Position.X-50)<right.Position.X then
     begin
        GLArrowLine2.Position.X:=GLArrowLine2.Position.X+0.5;
        GLCamera1.Position.x:=GLCamera1.Position.X+0.25;
        GLCamera1.Position.Z:=GLCamera1.Position.Z-0.25;
        focus_camera.Position.x:=focus_camera.Position.X+0.25;
     end;
     GLArrowLine2.PointTo(GLArrowLine2,YHmgVector);
  end;

  if (IsKeyDown(39))and(not(IsKeyDown(37)))and(not(IsKeyDown(38)))and(not(IsKeyDown(40))) then
  begin
     if GLActor2.RollAngle<>180 then GLActor2.RollAngle:=180;
     if rt<>'robo_run' then
     begin
        rt:='robo_run';
        GLActor2.SwitchToAnimation(rt);
        GLActor2.AnimationMode:=aamLoop;
        GLdummyCube2.PitchAngle:=((-0*3.75)+55);
     end;
     GLActor2.NextFrame(1);
     if (GLArrowLine2.Position.X-50)>left.Position.X then
     begin
        GLArrowLine2.Position.X:=GLArrowLine2.Position.X-0.5;
        GLCamera1.Position.x:=GLCamera1.Position.X-0.25;
        GLCamera1.Position.Z:=GLCamera1.Position.Z+0.25;
        focus_camera.Position.x:=focus_camera.Position.X-0.25;
     end;
     GLArrowLine2.PointTo(GLArrowLine2,YHmgVector);
  end;

  if IsKeyDown('m') then GLActor2.RollAngle:=GLActor2.RollAngle-1;
  if IsKeyDown('n') then GLActor2.RollAngle:=GLActor2.RollAngle+1;

end;

procedure TForm1.FormClose(Sender: TObject; var Action: TCloseAction);
begin
Application.Terminate;
end;

End.
