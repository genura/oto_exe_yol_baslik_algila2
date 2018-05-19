unit Unit2;
//
interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, AppEvnts, ExtCtrls;

type
  TForm2 = class(TForm)
    GroupBox1: TGroupBox;
    fullP: TEdit;
    path: TEdit;
    exeadi: TEdit;
    exebaslik: TEdit;
    appev: TApplicationEvents;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Timer1: TTimer;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    otoBtn: TButton;
    procedure Timer1Timer(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure otoBtnClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure kopyala(nesne:TEdit);
    procedure appProc(Sender:TObject);
  end;

var
  Form2: TForm2;

implementation

{$R *.dfm}
 uses PsAPI;

function GetCurrentActiveProcessPath: String;
var
  pid     : DWORD;
  hProcess: THandle;
  path    : array[0..4095] of Char;
begin
  GetWindowThreadProcessId(GetForegroundWindow, pid);

  hProcess := OpenProcess(PROCESS_QUERY_INFORMATION or PROCESS_VM_READ, FALSE, pid);
  if hProcess <> 0 then
    try
      if GetModuleFileNameEx(hProcess, 0, @path[0], Length(path)) = 0 then
      begin
//        RaiseLastOSError;

        exit;
      end;

      result := path;
    finally
      CloseHandle(hProcess);
    end
  else
    RaiseLastOSError;
end;
          
procedure TForm2.appProc(Sender: TObject);
begin
     Timer1.Enabled:=true;
end;

procedure TForm2.Button1Click(Sender: TObject);
begin
     if sender=button1 then kopyala(fullP);
     if sender=button2 then kopyala(path);
     if sender=button3 then kopyala(exeadi);
     if sender=button4 then kopyala(exebaslik);


end;




procedure TForm2.kopyala(nesne: TEdit);
begin
 nesne.SelectAll;
 nesne.CopyToClipboard;
end;

procedure TForm2.otoBtnClick(Sender: TObject);
begin
// tamamen kapamak aþaðidakileri kullan
// appev.OnDeactivate:=nil;
// Timer1.Enabled:=false;


     case otoBtn.Tag of

        1:begin
          appev.OnDeactivate:=nil;
          otoBtn.Caption:='Oto Algýlama Kapalý';
          Timer1.Enabled:=false;
          fullP.Clear; path.Clear; exeadi.Clear; exebaslik.Clear;//temizle
          otoBtn.Font.Style:=[];
          otoBtn.Tag:=0;
        end;

        0:begin
          appev.OnDeactivate:=appProc;
          otoBtn.Caption:='Oto Algýlama Açýk';
          otoBtn.Font.Style:=[fsBold];
          otoBtn.Tag:=1;
        end;
     end;


end;

procedure TForm2.Timer1Timer(Sender: TObject);
var
  hwndForeground: HWND;
  titleLength: Integer;
  title,fullyol: string;

begin
  hwndForeground := GetForegroundWindow();
  titleLength := GetWindowTextLength(hwndForeground);
  SetLength(title, titleLength);
  GetWindowText(hwndForeground, PChar(title), titleLength + 1);
  title := PChar(title);



  fullyol := GetCurrentActiveProcessPath;

  fullP.Text:=fullyol;
  path.Text:=ExtractFilePath(fullyol);
  exeadi.Text:=ExtractFileName(fullyol);
  exebaslik.Text:=title;



  Timer1.Enabled:=false;
//  memo2.Lines.Add (title+' pid: '+ pids);

end;

end.
