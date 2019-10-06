unit Unit2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls;

type
  TForm2 = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Image1: TImage;
    Image2: TImage;
    Image3: TImage;
    Label3: TLabel;
    procedure Label1Click(Sender: TObject);
    procedure Label1MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure Label1MouseLeave(Sender: TObject);
    procedure Label2Click(Sender: TObject);
    procedure Label2MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure Label2MouseLeave(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Label3Click(Sender: TObject);
    procedure Label3MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure Label3MouseLeave(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation

uses Unit1;

{$R *.dfm}

procedure TForm2.Label1Click(Sender: TObject);
begin
form1.show;
form2.Visible:=false;
end;

procedure TForm2.Label1MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
Label1.Font.Color:=$0000ff;
end;

procedure TForm2.Label1MouseLeave(Sender: TObject);
begin
Label1.Font.Color:=$ffffff;
end;

procedure TForm2.Label2Click(Sender: TObject);
begin
Application.Terminate;
end;

procedure TForm2.Label2MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
label2.Font.Color:=$0000ff;
end;

procedure TForm2.Label2MouseLeave(Sender: TObject);
begin
label2.Font.Color:=$ffffff;
end;

procedure TForm2.FormShow(Sender: TObject);
begin
panel1.Color:=$000000;
Label1.Font.Color:=$ffffff;
label2.Font.Color:=$ffffff;
label3.Font.Color:=$ffffff;
end;

procedure TForm2.Label3Click(Sender: TObject);
begin
ShowMessage('"mohammad javad haji bolori" email:m.javad65@gmail.com');
end;

procedure TForm2.Label3MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
label3.Font.Color:=$0000ff;
end;

procedure TForm2.Label3MouseLeave(Sender: TObject);
begin
label3.Font.Color:=$ffffff;
end;

end.
