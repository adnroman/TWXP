unit Unit4;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, XPMan,Registry, ComCtrls,ShellApi, StdCtrls;

    Procedure Shutdown;
    Procedure Reboot;
    Procedure ShowVersionWindows;
    Procedure ScreenProperties;

type
   TForm4 = class(TForm)
    XPManifest1: TXPManifest;
    Button1: TButton;
    CheckBox1: TCheckBox;
    Button2: TButton;
    TrackBar1: TTrackBar;
    StatusBar1: TStatusBar;
    Button3: TButton;
    procedure Button3Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure TrackBar1Change(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure checked;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form4: TForm4;
  tweakname:string;
implementation

uses txp;

{$R *.dfm}


  Procedure ShowVersionWindows;
begin
  WinExec(Pchar('rundll32 shell32,ShellAboutA Info-Box'),sw_Show);
end;

Procedure ScreenProperties;
begin
 WinExec(Pchar('rundll32 shell32,Control_RunDLL desk.cpl'),sw_Show);
end;

Procedure Reboot;
var
 ph:THandle;
 tp,prevst:TTokenPrivileges;
 rl:DWORD;
begin

if (MessageBox(0,'Для того,чтобы изменения вступили в силу,'+'необходимо перезагрузить систему.'+'Вы хотите перезагрузить компьютер сейчас?','Перезагрузка системы',MB_OKCANCEL or MB_ICONINFORMATION) = 1)
then
begin
  OpenProcessToken(GetCurrentProcess,TOKEN_ADJUST_PRIVILEGES or
  TOKEN_QUERY,ph);
  LookupPrivilegeValue(Nil,'SeShutdownPrivilege',tp.Privileges[0].Luid);
  tp.PrivilegeCount:=1;
  tp.Privileges[0].Attributes:=2;
  AdjustTokenPrivileges(ph,FALSE,tp,SizeOf(prevst),prevst,rl);
  ExitWindowsEx(EWX_REBOOT or EWX_FORCE,0);
 end;
 end;

Procedure Shutdown;
var
 ph:THandle;
 tp,prevst:TTokenPrivileges;
 rl:DWORD;
begin
 OpenProcessToken(GetCurrentProcess,TOKEN_ADJUST_PRIVILEGES or
TOKEN_QUERY,ph);
 LookupPrivilegeValue(Nil,'SeShutdownPrivilege',tp.Privileges[0].Luid);
 tp.PrivilegeCount:=1;
 tp.Privileges[0].Attributes:=2;
 AdjustTokenPrivileges(ph,FALSE,tp,SizeOf(prevst),prevst,rl);
 ExitWindowsEx(EWX_SHUTDOWN or EWX_POWEROFF,0);
end;

procedure TForm4.Button3Click(Sender: TObject);
begin


if(Application.MessageBox(pchar('Вы хотите восстановить первоначальные настройки реестра'),'Не хотите ли?',MB_OKCANCEL+MB_ICONQUESTION)=1)
 then
begin
  tweakname:='Autoback.reg';
  checked; 
 end;

end;


procedure TForm4.Button2Click(Sender: TObject);
begin

form1.show;
Hide;
end;

procedure TForm4.Button1Click(Sender: TObject);
begin
 if(Application.MessageBox(pchar('Автор программного продукта снимает с себя всю ответственность за дальнейшее поведение программы. Продолжить?:)'),'Вы подумали?',MB_OKCANCEL+MB_ICONQUESTION)=1)
 then
begin
 if TrackBar1.Position=0
 then
 tweakname:='TweakMax.reg'
    else
   if TrackBar1.Position=1
   then
   tweakname:='TweakMed.reg'
   else
   if TrackBar1.Position=2
   then
   tweakname:='TweakMin.reg';

   checked;


end;

end;



procedure TForm4.TrackBar1Change(Sender: TObject);
begin
 if TrackBar1.Position=0
 then
   StatusBar1.Panels[1].Text:='Максимальные'
   else
   if TrackBar1.Position=1
   then
   StatusBar1.Panels[1].Text:='Средние'
     else
   if TrackBar1.Position=2
   then
   StatusBar1.Panels[1].Text:='Минимальные';

end;

procedure TForm4.FormShow(Sender: TObject);
 var
Rg: TRegistry;
begin
Rg:=TRegistry.Create;
Rg.RootKey:=HKEY_LOCAL_MACHINE;

Rg.OpenKey('system', true);


try Rg.WriteInteger('test', 1);
 Rg.CloseKey;
except showmessage('Нет прав!! Попросите администратора дать вам права для того, чтобы угробить реестр:)');
close;
 end;

 if zakr=true
 then close;


end;


procedure TForm4.checked;
begin
 if CheckBox1.Checked=false
then
begin
  ShellExecute(Application.Handle, 'open',(PChar(ExtractFilePath(Application.ExeName)+tweakname)), nil, nil, SW_NORMAL);
  Reboot;
  end
  else
  begin
  form1.Show;
   try
     form1.ListBox2.items.LoadFromFile(tweakname);
   except showmessage ('файл оптимизации не найден') ;
   hide;
   end;
 end;
  end;



end.
