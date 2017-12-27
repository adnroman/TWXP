unit Unit2;
interface

uses
  Windows, Messages,IniFiles,txp, Controls, StdCtrls, Classes,SysUtils, Variants,  Graphics, Forms,
  Dialogs;

type
  TForm2 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Edit1: TEdit;
    Edit3: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    ComboBox1: TComboBox;
    Label5: TLabel;
    Edit4: TEdit;
    Edit5: TEdit;
    Label6: TLabel;
    Label7: TLabel;
    Edit6: TEdit;
    Edit7: TEdit;
    Label8: TLabel;
    ComboBox2: TComboBox;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
     procedure zapoln(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;
  constrname:string;
implementation



{$R *.dfm}


procedure TForm2.Button1Click(Sender: TObject);
var
 Ini: Tinifile;
      begin
   Ini:=TiniFile.Create(application.ExeName+'reg.ini');
   Ini.WriteString(constrname,'caption',  Edit1.text);
   Ini.WriteString(constrname,'razdel', ComboBox2.Text);
   Ini.WriteString(constrname,'regpath',  Edit3.Text);
   Ini.WriteString(constrname,'regtip',  ComboBox1.Text);
   Ini.WriteString(constrname,'param',  Edit4.Text);
   Ini.WriteString(constrname,'znach1',  Edit5.Text);
   Ini.WriteString(constrname,'znach2',  Edit6.Text);
   Ini.WriteString(constrname,'helptext',  Edit7.Text);
   Ini.Free;
   form2.caption:='';
   close;
end;
     
procedure TForm2.Button2Click(Sender: TObject);
var Ini: Tinifile;
begin
close;
end;



procedure TForm2.zapoln(Sender: TObject);

  var Ini: Tinifile;
begin
  constrname:=checknameper;
  Ini:=TiniFile.Create(application.ExeName+'reg.ini');
form2.caption:=form2.caption+checkcaption;
Edit1.text:=checkcaption;
ComboBox2.Text:= Ini.ReadString(constrname,'razdel','не найден');
Edit3.Text:= Ini.ReadString(constrname,'regpath','не найден');
ComboBox1.Text:= Ini.ReadString(constrname,'regtip','не найден');
Edit4.Text:= Ini.ReadString(constrname,'param','не найден');
Edit5.Text:= Ini.ReadString(constrname,'znach1','не найден');
Edit6.Text:= Ini.ReadString(constrname,'znach2','не найден');
Edit7.Text:= Ini.ReadString(constrname,'helptext','не найден');
Ini.Free;

end;

procedure TForm2.FormCreate(Sender: TObject);
begin
Form2.OnShow:=zapoln;
end;

end.
