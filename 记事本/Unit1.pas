unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Menus,ShellAPI, ExtCtrls, ComCtrls;

type
  TForm1 = class(TForm)
    mm1: TMainMenu;
    film1: TMenuItem;
    New1: TMenuItem;
    Open1: TMenuItem;
    Save1: TMenuItem;
    N1: TMenuItem;
    Exit1: TMenuItem;
    edit1: TMenuItem;
    Undo1: TMenuItem;
    N2: TMenuItem;
    Copy1: TMenuItem;
    Paste1: TMenuItem;
    Cut1: TMenuItem;
    Delete1: TMenuItem;
    N3: TMenuItem;
    All1: TMenuItem;
    N4: TMenuItem;
    Find1: TMenuItem;
    Replace1: TMenuItem;
    O1: TMenuItem;
    Font1: TMenuItem;
    BackGround1: TMenuItem;
    Help1: TMenuItem;
    About1: TMenuItem;
    mmo1: TMemo;
    dlgOpen1: TOpenDialog;
    dlgSave1: TSaveDialog;
    dlgFind1: TFindDialog;
    dlgReplace1: TReplaceDialog;
    dlgFont1: TFontDialog;
    dlgColor1: TColorDialog;
    stat1: TStatusBar;
    tmr1: TTimer;
    procedure Open1Click(Sender: TObject);
    procedure Save1Click(Sender: TObject);
    procedure Undo1Click(Sender: TObject);
    procedure Cut1Click(Sender: TObject);
    procedure Copy1Click(Sender: TObject);
    procedure Paste1Click(Sender: TObject);
    procedure Delete1Click(Sender: TObject);
    procedure All1Click(Sender: TObject);
    procedure Datetime1Click(Sender: TObject);
    procedure Font1Click(Sender: TObject);
    procedure BackGround1Click(Sender: TObject);
    procedure About1Click(Sender: TObject);
    procedure Find1Click(Sender: TObject);
    procedure dlgFind1Find(Sender: TObject);
    procedure Replace1Click(Sender: TObject);
    procedure dlgReplace1Replace(Sender: TObject);
    procedure New1Click(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure tmr1Timer(Sender: TObject);
    procedure Exit1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}
var
  FileName:String;
procedure TForm1.Open1Click(Sender: TObject);
begin
    dlgOpen1.filter :='文本文档(*.txt)|*.TXT';


   if  dlgOpen1.Execute then
   begin
     FileName:=dlgOpen1.FileName;
     mmo1.Lines.LoadFromFile(FileName);
   end
   else
      Exit;
end;

procedure TForm1.Save1Click(Sender: TObject);
begin
      dlgSave1.Filter:= '文本文档(*.txt)|*.TXT';

      if dlgSave1.Execute then
      begin
        FileName:= dlgSave1.FileName+'.txt';
        mmo1.Lines.SaveToFile(FileName);
      end;
end;

procedure TForm1.Undo1Click(Sender: TObject);
begin
    mmo1.Undo;
end;

procedure TForm1.Cut1Click(Sender: TObject);
begin
   mmo1.CutToClipboard;
end;

procedure TForm1.Copy1Click(Sender: TObject);
begin
      mmo1.CopyToClipboard;
end;

procedure TForm1.Paste1Click(Sender: TObject);
begin
      mmo1.PasteFromClipboard;
end;

procedure TForm1.Delete1Click(Sender: TObject);
begin
   mmo1.ClearSelection;
end;

procedure TForm1.All1Click(Sender: TObject);
begin
      mmo1.SelectAll;
end;

procedure TForm1.Datetime1Click(Sender: TObject);
begin
  // mmo1.SelText:= DateTimeToStr(Now())
end;

procedure TForm1.Font1Click(Sender: TObject);
begin
      if dlgFont1.Execute then
        mmo1.Font:=dlgFont1.Font
      else
        Exit;
end;

procedure TForm1.BackGround1Click(Sender: TObject);
begin
      if dlgColor1.Execute then
        mmo1.Color:=dlgColor1.Color
      else
        Exit;
end;

procedure TForm1.About1Click(Sender: TObject);
begin
    ShellAbout(Self.Handle,
        PChar('编程日记本 V1.2'),
        PChar('制作人： so、so'),
        HICON(nil));
end;

procedure TForm1.Find1Click(Sender: TObject);
begin
      dlgFind1.FindText:=mmo1.SelText;
      dlgFind1.Execute;
end;

procedure TForm1.dlgFind1Find(Sender: TObject);
var
  i,j, PosReturn,SkipChars: Integer;

begin
  for i:=0 to mmo1.Lines.Count do
    begin
      PosReturn:= Pos(dlgFind1.FindText,mmo1.Lines[i]);
      if PosReturn <> 0 then
      begin
        SkipChars:=0;
        for j:=0 to i-1 do
        SkipChars:= SkipChars + Length(mmo1.Lines[j]);
        SkipChars:= SkipChars + (i*2);
        SkipChars:= SkipChars + PosReturn - 1;

        mmo1.SetFocus;
        mmo1.SelStart:= SkipChars;
        mmo1.SelLength:=Length(dlgFind1.FindText);
        Break;
      end;
    end;

end;

procedure TForm1.Replace1Click(Sender: TObject);
begin
    dlgReplace1.ReplaceText:=mmo1.SelText;
    dlgReplace1.Execute;
end;

procedure TForm1.dlgReplace1Replace(Sender: TObject);
var
      SelPos:Integer;
begin
    with TReplaceDialog(Sender) do
    begin
      SelPos := Pos(FindText,mmo1.Lines.Text);
      if SelPos > 0 then
      begin
         mmo1.SelStart := SelPos - 1;
         mmo1.SelLength:= Length(FindText);
         mmo1.SelText := ReplaceText;
      end
      else
        MessageBox(0,'抱歉找不到需要替换的文件！','通知',MB_OK);
    end;
end;

procedure TForm1.New1Click(Sender: TObject);
var
str1: Integer;
begin
    if mmo1 .Modified = True then
    begin
         Str1:= MessageBox(0,'文件还没有保存，是否继续新建？','提醒',MB_OKCANCEL);
       if  str1 = IDOK  then
          mmo1.Lines.Clear
       else
          Exit;
       
    end
      
    else
        mmo1.Lines.Clear;
end;

procedure TForm1.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
var
str1: Integer;
begin
    if mmo1 .Modified = True then
    begin
         Str1:= MessageBox(0,'是否保存并退出？','提醒',MB_YESNOCANCEL);
       if  str1 = IDNO  then
           Exit
       else  if str1=IDCANCEL then
           CanClose:= False
       else
            begin
            Save1.Click;
            CanClose := true;
            end

    end

    else
        exit;
end;
procedure TForm1.tmr1Timer(Sender: TObject);
var
Hang,Lie,Num,CharsLine:longint;
begin
 stat1.Panels[1].Text:='长度  '+ IntToStr( Length (mmo1.Lines.Text));
 Num:=SendMessage(mmo1.Handle,EM_LINEFROMCHAR,mmo1.SelStart,0);
  CharsLine:=SendMessage(mmo1.Handle,EM_LINEINDEX,Num,0);
  Hang:=Num+1;//当前行
  Lie:=(mmo1.SelStart-CharsLine)+1;//当前列
  stat1.Panels[3].Text:='当前行 '+IntToStr(Hang)+'       '+'当前列 '+IntToStr(Lie) ;
end;

procedure TForm1.Exit1Click(Sender: TObject);
begin
    close;
end;

end.
