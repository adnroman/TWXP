unit txp;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs,Printers, StdCtrls, Registry, XPMan, Menus,   ShellApi,  ComCtrls, IniFiles,
  Buttons;

type
  TForm1 = class(TForm)
    XPManifest1: TXPManifest;
    PopupMenu1: TPopupMenu;
    N3: TMenuItem;
    MainMenu1: TMainMenu;
    N16: TMenuItem;
    N17: TMenuItem;
    Memo1: TMemo;
    Edit1: TRichEdit;
    N1: TMenuItem;
    N2: TMenuItem;
    N4: TMenuItem;
    Button5: TButton;
    Button4: TButton;
    PageControl1: TPageControl;
    TabSheet2: TTabSheet;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    CheckBox3: TCheckBox;
    CheckBox4: TCheckBox;
    CheckBox5: TCheckBox;
    CheckBox6: TCheckBox;
    CheckBox7: TCheckBox;
    CheckBox8: TCheckBox;
    CheckBox9: TCheckBox;
    CheckBox10: TCheckBox;
    CheckBox11: TCheckBox;
    TabSheet3: TTabSheet;
    CheckBox12: TCheckBox;
    CheckBox13: TCheckBox;
    CheckBox14: TCheckBox;
    CheckBox15: TCheckBox;
    CheckBox16: TCheckBox;
    CheckBox17: TCheckBox;
    CheckBox18: TCheckBox;
    CheckBox19: TCheckBox;
    CheckBox20: TCheckBox;
    CheckBox21: TCheckBox;
    CheckBox22: TCheckBox;
    TabSheet4: TTabSheet;
    CheckBox23: TCheckBox;
    CheckBox24: TCheckBox;
    CheckBox25: TCheckBox;
    CheckBox26: TCheckBox;
    CheckBox27: TCheckBox;
    CheckBox28: TCheckBox;
    CheckBox29: TCheckBox;
    CheckBox30: TCheckBox;
    CheckBox31: TCheckBox;
    CheckBox32: TCheckBox;
    CheckBox33: TCheckBox;
    TabSheet5: TTabSheet;
    CheckBox34: TCheckBox;
    CheckBox35: TCheckBox;
    CheckBox36: TCheckBox;
    CheckBox37: TCheckBox;
    CheckBox38: TCheckBox;
    CheckBox39: TCheckBox;
    CheckBox40: TCheckBox;
    CheckBox41: TCheckBox;
    CheckBox42: TCheckBox;
    CheckBox43: TCheckBox;
    CheckBox44: TCheckBox;
    TabSheet1: TTabSheet;
    CheckBox45: TCheckBox;
    CheckBox46: TCheckBox;
    CheckBox47: TCheckBox;
    CheckBox48: TCheckBox;
    CheckBox49: TCheckBox;
    CheckBox50: TCheckBox;
    CheckBox51: TCheckBox;
    CheckBox52: TCheckBox;
    CheckBox53: TCheckBox;
    CheckBox54: TCheckBox;
    CheckBox55: TCheckBox;
    TabSheet7: TTabSheet;
    Button2: TButton;
    Button6: TButton;
    ListBox2: TListBox;
    Button7: TButton;
    TabSheet6: TTabSheet;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    RichEdit1: TRichEdit;
    ListBox1: TListBox;
    ListBox3: TListBox;
    TabSheet8: TTabSheet;
    CheckBox56: TCheckBox;
    CheckBox57: TCheckBox;
    CheckBox58: TCheckBox;
    CheckBox59: TCheckBox;
    CheckBox60: TCheckBox;
    CheckBox61: TCheckBox;
    CheckBox62: TCheckBox;
    CheckBox63: TCheckBox;
    CheckBox64: TCheckBox;
    CheckBox65: TCheckBox;
    CheckBox66: TCheckBox;
    OpenDialog1: TOpenDialog;
    SaveDialog1: TSaveDialog;
    PrintDialog1: TPrintDialog;
    D1: TMenuItem;
    N5: TMenuItem;
    Windows1: TMenuItem;

    procedure FormCreate(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure N17Click(Sender: TObject);
    procedure Button10Click(Sender: TObject);
    procedure ListBox1Click(Sender: TObject);
    procedure voznya(Sender: TObject; MousePos: TPoint; var Handled: Boolean);
    procedure sohranenie(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure N16Click(Sender: TObject);
    procedure ListBox3Click(Sender: TObject);
    procedure N4Click(Sender: TObject);
    procedure ListBox2Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);
    procedure TabSheet2ContextPopup(Sender: TObject; MousePos: TPoint;
      var Handled: Boolean);
    procedure backup;
    procedure showhelp(Sender: TObject; Shift: TShiftState; X, Y: Integer);
    procedure Button6Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure D1Click(Sender: TObject);
    procedure FormHide(Sender: TObject);
    procedure N5Click(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure Button4Click(Sender: TObject);
    procedure Windows1Click(Sender: TObject);
    procedure N6Click(Sender: TObject);


     private
    { Private declarations }
  public
    { Public declarations }
  end;

var

  Form1: TForm1;
  select: boolean=true;//для проверки кнопки
  checkper:string; // проверка бэкапа
  list1Line,list2Line: string; // для отчетов и справки
 checknameper, checkcaption:string;   // для присвоения имен чекбоксов
 razdel:HKEY; // переменная для обозначния раздела реестра
 znach,znach1,Frazdel, znach2,regpath, regtip, param,helptext:string; // строковые типы параметров секции реестра

    reger: boolean=false; // для проверки ошибок в разделе реестра
    regtiper: boolean=false;  // для проверки ошибок в типе параметра реестра
    backnum:integer;// количество резервных копий
    backcheck:string; // проверка на бэкап
    zakr:boolean; // определяет закрытие формы
implementation

uses Unit2,  Unit3, Unit4;

{$R *.dfm}






//////////////процедура создания формы\\\\\\\\\\\\\\\\\\\\\\\\\\

procedure TForm1.FormCreate(Sender: TObject);
var
 i,rintznach: integer;
  Ini: Tinifile;
 Rg: TRegistry;
rznach:string;

begin

 Ini:=TiniFile.Create(application.ExeName+'reg.ini');
backcheck:=Ini.Readstring('PARAM','back','false');
backnum:=Ini.Readinteger('PARAM','backnum',0);
if backcheck ='false'
then
begin
backup;
listbox2.Items.SaveToFile('backup'+inttostr(backnum)+'.reg');
backcheck:='true';
 backnum:=backnum+1;
Ini.WriteInteger('PARAM','backnum',backnum);
Ini.WriteString('PARAM','back', backcheck);
end;

Rg:=TRegistry.Create;

  ////// блок присвоения свойств всем чекбоксам на форме
  For i:=1 to 66 do
  begin
checkcaption:=Ini.ReadString((FindComponent(Format('CheckBox%d',[i])) as TCheckBox).Name,'caption','не найден');
checknameper:=(FindComponent(Format('CheckBox%d',[i])) as TCheckBox).name ;  // поиск имени объекта по маске имени
Frazdel:=Ini.ReadString(checknameper,'razdel','не найден');//чтение значения раздела реестра и дальнейшая ее проверка
regpath:=Ini.ReadString(checknameper,'regpath','не найден');
regtip:=Ini.ReadString(checknameper,'regtip','не найден');
param:=Ini.ReadString(checknameper,'param','не найден');
znach1:= Ini.ReadString(checknameper,'znach1','не найден');
znach2:= Ini.ReadString(checknameper,'znach2','не найден');


if Frazdel='HKEY_CURRENT_USER'
then Rg.RootKey:=HKEY_CURRENT_USER
else
if Frazdel='HKEY_LOCAL_MACHINE'
then Rg.RootKey:=HKEY_LOCAL_MACHINE
else
if Frazdel='HKEY_CLASSES_ROOT'
then Rg.RootKey:=HKEY_CLASSES_ROOT
else
if Frazdel='HKEY_USERS'
then Rg.RootKey:=HKEY_USERS
else
if Frazdel='HKEY_CURRENT_CONFIG '
then Rg.RootKey:=HKEY_CURRENT_CONFIG;
 Rg.OpenKeyReadOnly(regpath);
 if Rg.ValueExists(param)
 then
 begin
case Rg.Getdatatype(param) of {определение типа параметроа}
rdString, rdExpandString:
begin
rznach:=Rg.ReadString(param); {если параметр строковый, то получаем строку}
if rznach=znach2
then
(FindComponent(Format('CheckBox%d',[i])) as TCheckBox).Checked:=true;
end;
rdInteger: {параметр integer}
begin
rintznach:=Rg.readinteger(param);
if rintznach=strtoint(znach2)
then
 (FindComponent(Format('CheckBox%d',[i])) as TCheckBox).Checked:=true;

  end;
 end;
 end;

 /// блок устаовки свойств

 with (FindComponent(Format('CheckBox%d',[i])) as TCheckBox) do
 begin
 OnContextPopup:=voznya;
 PopupMenu:=PopupMenu1;
 caption:= checkcaption;
OnMouseMove:=showhelp;
 end;



 end;
 Ini.Free;
end;

//создать резервную копию реестра
procedure TForm1.N2Click(Sender: TObject);
  var
  Ini: Tinifile;
begin
Ini:=TiniFile.Create(application.ExeName+'reg.ini');
backnum:=Ini.Readinteger('PARAM','backnum',0);
listbox2.Clear;
backup; // отсылка на бэкап
listbox2.Items.SaveToFile('backup'+inttostr(backnum)+'.reg');
backcheck:='true';
backnum:=backnum+1;
Ini.WriteInteger('PARAM','backnum',backnum);
Ini.WriteString('PARAM','back', backcheck);
 Ini.Free;
end;




 // процедура применить изменения
procedure TForm1.Button5Click(Sender: TObject);
var
 Rg: TRegistry;
 Ini: Tinifile;
 i:integer;
 str: string;
begin
if(Application.MessageBox(pchar('Вы хорошо подумали о применении этих настроек? '),'Применить?',MB_OKCANCEL+MB_ICONQUESTION)=1)
 then
 begin
PageControl1.ActivePage := TabSheet7;
 ListBox2.clear;
listbox2.items.Add('Windows Registry Editor Version 5.00');
listbox2.items.Add('');
Rg:=TRegistry.Create;
Ini:=TiniFile.Create(application.ExeName+'reg.ini');
// блок опрашивает все чекбоксы на форме, беря их параметры изменения реестра из ини файла
  For i:=1 to 66 do
  begin
checknameper:=(FindComponent(Format('CheckBox%d',[i])) as TCheckBox).name ;  // поиск имени объекта по маске имени
checkcaption:=(FindComponent(Format('CheckBox%d',[i])) as TCheckBox).caption; // поиск названия объекта по маске имени
 reger:=false;
 regtiper:=false;
 regpath:=Ini.ReadString(checknameper,'regpath','не найден');
regtip:=Ini.ReadString(checknameper,'regtip','не найден');
param:=Ini.ReadString(checknameper,'param','не найден');
 helptext:=Ini.ReadString(checknameper,'helptext','не найден');
if (FindComponent(Format('CheckBox%d',[i])) as TCheckBox).checked=true // если чекбокс выбран-значение одно, если нет-другое
then znach:= Ini.ReadString((FindComponent(Format('CheckBox%d',[i])) as TCheckBox).Name,'znach2',Edit1.Text)
else znach:= Ini.ReadString((FindComponent(Format('CheckBox%d',[i])) as TCheckBox).Name,'znach1',Edit1.Text);


Frazdel:=Ini.ReadString(checknameper,'razdel','не найден');//чтение значения раздела реестра и дальнейшая ее проверка
if Frazdel='HKEY_CURRENT_USER'
then Rg.RootKey:=HKEY_CURRENT_USER
else
if Frazdel='HKEY_LOCAL_MACHINE'
then Rg.RootKey:=HKEY_LOCAL_MACHINE
else
if Frazdel='HKEY_CLASSES_ROOT'
then Rg.RootKey:=HKEY_CLASSES_ROOT
else
if Frazdel='HKEY_USERS'
then Rg.RootKey:=HKEY_USERS
else
if Frazdel='HKEY_CURRENT_CONFIG '
then Rg.RootKey:=HKEY_CURRENT_CONFIG
else
begin
listbox2.items.Add('{'+helptext+'}');
listbox2.items.Add('');
str:= '//ошибка в разделе реестра:    '+Frazdel+'  объект: '+checknameper; // отчет об ошибке
ListBox2.Items.Add(str);
ListBox2.Items.Add('');
reger:=true;
  end;
 if reger<>true then
 begin

// при отсутствии ошибки в значении раздела реестра происходит его изменение, при условии успешной проверки типов и существования параметра

Rg.OpenKey(regpath, true);

 if regtip='DWORD'
  then
   edit1.Text:= regpath;
begin
  try Rg.WriteInteger(param, StrtoInt(znach));

listbox2.items.Add('{'+helptext+'}');
listbox2.items.Add('');
listbox2.items.Add('['+Frazdel+'\'+regpath+']');
listbox2.items.Add('"'+param+'"'+'=dword:'+znach);
listbox2.items.Add('');

   except
 listbox2.items.Add('{'+'ошибка записи:  '+ Frazdel + '\'+ regpath+regtip+ '\\'+param+ '='+ znach+'}') ;
    end;
   end;
 if  regtip='STRING'
 then
 begin
  try Rg.WriteString(param, znach) ;
  listbox2.items.Add('{'+helptext+'}');
listbox2.items.Add('');
listbox2.items.Add('['+Frazdel+'\'+regpath+']');
listbox2.items.Add('"'+param+'"'+'=dword:'+znach);
listbox2.items.Add('');

    except
     listbox2.items.Add('{'+helptext+'}');
    listbox2.items.Add('{'+'ошибка записи:  '+ Frazdel + '\'+ regpath+regtip+ '\\'+param+ '='+ znach+'}') ;
     end;
   end;
 if  regtip<>'STRING'
 then
 if regtip<>'DWORD'
 then
 begin
  listbox2.items.Add('{'+helptext+'}');
 regtiper:=true;
 str:= 'ошибка типе параметра:  '+regtip+'  объект: '+checknameper;
ListBox2.Items.Add(str);
 end;
    Rg.CloseKey;
   end;

  end;
  Ini.Free;
Rg.Free;
if(Application.MessageBox(pchar('Чтобы настройки вступили в силу необходимо перезагрузится.  Продолжить?:)'),'Перезагрузить?',MB_OKCANCEL+MB_ICONQUESTION)=1)
 then reboot;
    end;
   end;



procedure TForm1.N3Click(Sender: TObject);
begin
form2.show;
end;


procedure TForm1.N17Click(Sender: TObject);
begin
 about.show;
end;

procedure TForm1.Button10Click(Sender: TObject);

var Myini : TIniFile;
begin
  ListBox1.Clear;
  Myini:=TiniFile.Create(ExtractFilePath(paramstr(0))+'bookmarks.ini');
  MyIni.ReadSections(listBox1.Items);
  MyIni.Free;
end;


procedure TForm1.ListBox1Click(Sender: TObject);
var

     Myini : TIniFile;
   I: Integer;
 begin
    richedit1.clear;
    ListBox2.clear;
   for I := 0 to ListBox1.Items.Count - 1 do
   begin
     if  ListBox1.Selected[I] then
      list1Line := ListBox1.Items.Strings[I];
     edit1.Text:=list1Line;
        end;
     if list1Line<>''
     then
      begin
   ListBox3.Clear;
 Myini:=TiniFile.Create(ExtractFilePath(paramstr(0))+'bookmarks.ini');
  MyIni.ReadSection(list1Line, memo1.Lines);
  MyIni.Free;
ListBox3.items.AddStrings(memo1.Lines);
 memo1.clear;
end;
end;





procedure TForm1.ListBox3Click(Sender: TObject);
 var
Myini : TIniFile;
I: Integer;
 begin
  richedit1.clear;
   for I := 0 to ListBox3.Items.Count - 1 do
   begin
     if  ListBox3.Selected[I] then
      list2Line := ListBox3.Items.strings[I];
      edit1.Text:=list2Line;
      end;

 Myini:=TiniFile.Create(ExtractFilePath(paramstr(0))+'bookmarks.ini');
 if list1Line<>''
 then
 begin
   richedit1.text:=MyIni.Readstring(list1Line,list2Line,'fuck');
end;
  MyIni.Free;
end;



procedure TForm1.voznya(Sender: TObject; MousePos: TPoint;
  var Handled: Boolean);
 begin
 checknameper:=(Sender as TControl).Name ;
 checkcaption:= (FindComponent(checknameper) as TCheckBox).caption ;

end;

procedure TForm1.sohranenie(Sender: TObject);
   var
  i: integer;
Ini: Tinifile;
begin
Ini:=TiniFile.Create(application.ExeName+'reg.ini');
  For i:=1 to 66 do
  begin
  checknameper:=(FindComponent(Format('CheckBox%d',[i])) as TCheckBox).name;
  checkcaption:=(FindComponent(Format('CheckBox%d',[i])) as TCheckBox).caption;
  end;
 Ini.Free;
end;



procedure TForm1.SpeedButton1Click(Sender: TObject);
begin
form4.show;
end;

procedure TForm1.N16Click(Sender: TObject);
  var Myini : TIniFile;
begin
  ListBox1.Clear;
  Myini:=TiniFile.Create(ExtractFilePath(paramstr(0))+'bookmarks.ini');
  MyIni.ReadSections(listBox1.Items);
  MyIni.Free;
end;

procedure TForm1.N4Click(Sender: TObject);
begin
close;
end;

procedure TForm1.ListBox2Click(Sender: TObject);
var
I:integer;
begin
for I := 0 to ListBox2.Items.Count - 1 do
begin
if  ListBox2.Selected[I] then
list2Line := ListBox2.Items.strings[I];
edit1.Text:=list2Line;
end;
end;

procedure TForm1.Button7Click(Sender: TObject);
begin
ListBox2.Clear;
end;

procedure TForm1.TabSheet2ContextPopup(Sender: TObject; MousePos: TPoint;
var Handled: Boolean);
begin
end;


 ////////создание резервной копии
procedure TForm1.backup;
 var
p: PChar;
Rg: TRegistry;

Ini: Tinifile;
i: integer;
str,vn, znachbin :string;
j, k : longint;
firststr: Boolean;
begin
Ini:=TiniFile.Create(application.ExeName+'reg.ini');
listbox2.clear;
PageControl1.ActivePage := TabSheet7;
listbox2.items.Add('Windows Registry Editor Version 5.00');
listbox2.items.Add('');
Rg:=TRegistry.Create;
For i:=1 to 66 do
begin
checknameper:=(FindComponent(Format('CheckBox%d',[i])) as TCheckBox).name ;  // поиск имени объекта по маске имени
Frazdel:=Ini.ReadString(checknameper,'razdel','не найден');//чтение значения раздела реестра и дальнейшая ее проверка
regpath:=Ini.ReadString(checknameper,'regpath','не найден');
regtip:=Ini.ReadString(checknameper,'regtip','не найден');
param:=Ini.ReadString(checknameper,'param','не найден');
helptext:=Ini.ReadString(checknameper,'helptext','не найден');
if Frazdel='HKEY_CURRENT_USER'
then Rg.RootKey:=HKEY_CURRENT_USER
else
if Frazdel='HKEY_LOCAL_MACHINE'
then Rg.RootKey:=HKEY_LOCAL_MACHINE
else
if Frazdel='HKEY_CLASSES_ROOT'
then Rg.RootKey:=HKEY_CLASSES_ROOT
else
if Frazdel='HKEY_USERS'
then Rg.RootKey:=HKEY_USERS
else
if Frazdel='HKEY_CURRENT_CONFIG '
then Rg.RootKey:=HKEY_CURRENT_CONFIG
else
begin

 str:= ';'+'ошибка в разделе реестра: '+Frazdel+'  объект: '+checknameper; // отчет об ошибке
 ListBox2.Items.Add(str);
  ListBox2.Items.Add('');
   reger:=true;
  end;
 Rg.OpenKeyReadOnly(regpath);
 if Rg.ValueExists(param)
 then
 begin
 vn:=param;
case Rg.Getdatatype(param) of {определение типа параметроа}
rdString, rdExpandString:
znach1:=('"'+Rg.ReadString(param)+'"'); {если параметр строковый, то получаем строку}
rdInteger: {параметр integer}
znach1:=('dword:' + IntToHex(Rg.readinteger(param), 8));
{если тип данных-binary, то запись идет после бэкслэша,строка из 25
чисел, по 2, разделенные между собой запятыми, а строки - бэкслэшами}
rdBinary:
 begin
firststr:=true;
j := Rg.GetDataSize(param); {определение размера параметра}
{выделение памяти}
GetMem(p, j);
Rg.ReadBinaryData(param, p^, j); {чтение данных посимвольно}
for k := 0 to j - 1 do
begin
znachbin:=znachbin + IntToHex(Byte(p[k]), 2); {запись байта в HEX формате}
if k <> j - 1 then {если не последний байт}
begin
znachbin:=znachbin+ ','; {то ставим запятую}
if (k > 0) and ((k mod 25) = 0) {если строка слишком большая} then
znachbin:=znachbin+  '\'; {тогда записываем бэкслэш}
if firststr=true  then
begin
firststr:=false;{если первая строка то записываем все параметры-запара}
listbox2.items.Add('['+Frazdel+'\'+regpath+']');
listbox2.items.Add('"'+param+'"'+'='+'hex:\'+znachbin);
end{begin}
else
listbox2.items.Add('"'+param+'"'+'='+znachbin);
end; {if}
end; {for}
FreeMem(p, j); {освобождение памяти}
end;
else
listbox2.items.Add('"'+'"');; {запись пустой строки если неверный тип данных}
end;{case}
listbox2.items.Add('['+Frazdel+'\'+regpath+']');
listbox2.items.Add('"'+param+'"'+'='+znach1);
listbox2.items.Add('');
end;{перебор элементов}
Rg.CloseKey;
end;
Rg.Free;

Ini.Free;
end;
procedure TForm1.showhelp(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
  var
Ini: Tinifile;
begin

checknameper:=(Sender as TControl).Name ;
checkcaption:= (FindComponent(checknameper) as TCheckBox).caption ;

Ini:=TiniFile.Create(application.ExeName+'reg.ini');

helptext:=Ini.ReadString(checknameper,'helptext','не найден');
edit1.Text:=helptext;
ini.Free;
end;

procedure TForm1.Button6Click(Sender: TObject);


 
begin



  if SaveDialog1.Execute then
     ListBox2.Items.SaveToFile(SaveDialog1.Filename);

end;

procedure TForm1.Button2Click(Sender: TObject);
 var
  LineHeight:Integer;
  xPos,yPos:Integer;
  i:Integer;
begin


if PrintDialog1.Execute then
  begin
edit1.lines:=listbox2.Items;
listbox2.Clear;
listbox2.Items.AddStrings(edit1.lines);
edit1.Clear;
  xPos:=300;//отступ
  Printer.Canvas.Font:=Listbox1.Font;
  LineHeight:=Printer.Canvas.TextHeight('A');
  yPos:=0;
  Printer.BeginDoc;
  for i:=0 to Listbox2.Items.Count-1 do
  begin
    Printer.Canvas.TextOut(xPos,yPos,Listbox2.Items[i]);
    Inc(yPos,LineHeight);
    
    if yPos+LineHeight>Printer.PageHeight then
    begin
      yPos:=0;
      Printer.NewPage;
    end;
  end;
  Printer.EndDoc;
    end;
listbox2.Clear;
end;


procedure TForm1.D1Click(Sender: TObject);
var
Ini: Tinifile;
  i:integer;
begin
 Ini:=TiniFile.Create(application.ExeName+'reg.ini');
 backnum:=Ini.Readinteger('PARAM','backnum',0);
 for i:=backnum downto 0 do
 begin

 ShellExecute(Application.Handle, 'open',(PChar(ExtractFilePath(Application.ExeName)+'backup'+inttostr(i)+'.reg')), nil, nil, SW_NORMAL);
 




end;
end;



procedure TForm1.FormHide(Sender: TObject);
begin
zakr:=true;
form4.Show;
end;

procedure TForm1.N5Click(Sender: TObject);
begin
 ShellExecute(Application.Handle, 'open',PChar('help.chm'), nil, nil, SW_NORMAL);
end;

procedure TForm1.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   if Key = VK_F1 then
 ShellExecute(Application.Handle, 'open',PChar('help.chm'), nil, nil, SW_NORMAL);
end;

procedure TForm1.FormKeyPress(Sender: TObject; var Key: Char);
begin
if Key = #13 then
 ShellExecute(Application.Handle, 'open',PChar('help.chm'), nil, nil, SW_NORMAL);
end;

procedure TForm1.Button4Click(Sender: TObject);
begin
Hide;
end;

procedure TForm1.Windows1Click(Sender: TObject);
begin
ShowVersionWindows;
end;

procedure TForm1.N6Click(Sender: TObject);
begin
ScreenProperties;
end;

end.

