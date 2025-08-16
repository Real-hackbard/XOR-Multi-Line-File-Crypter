unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, cryptage, ComCtrls, XPMan, Spin, Vcl.ExtCtrls;

type
  TForm1 = class(TForm)
    Button1: TButton;
    Edit1: TEdit;
    OpenDialog1: TOpenDialog;
    Button2: TButton;
    Memo1: TMemo;
    StatusBar1: TStatusBar;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Edit2: TEdit;
    Button3: TButton;
    SaveDialog1: TSaveDialog;
    Button4: TButton;
    SpinEdit1: TSpinEdit;
    SpinEdit2: TSpinEdit;
    Label4: TLabel;
    Label5: TLabel;
    CheckBox1: TCheckBox;
    RadioGroup1: TRadioGroup;
    Label6: TLabel;
    RadioGroup2: TRadioGroup;
    Label7: TLabel;
    Button5: TButton;
    RadioGroup3: TRadioGroup;
    Label8: TLabel;
    Memo2: TMemo;
    Button6: TButton;
    Edit3: TEdit;
    Memo3: TMemo;
    Button7: TButton;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Bevel1: TBevel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Memo1Change(Sender: TObject);
    procedure Memo1DblClick(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);
    procedure Memo2Change(Sender: TObject);
  private
    { Déclarations privées }
  public
    { Déclarations publiques }
  end;

var
  Form1: TForm1;
  Chaine :AnsiString;
  A,B : TFileStream;

implementation

{$R *.dfm}
function RandomPassword(PLen:Integer):String;
var   str:String;
begin   Randomize;   //string with all possible chars

  if Form1.RadioGroup1.ItemIndex = 4 then begin
  str:='abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ';
  end;

  if Form1.RadioGroup1.ItemIndex = 5 then begin
  str:='ABCDEFGHIJKLMNOPQRSTUVWXYZ';
  end;

  if Form1.RadioGroup1.ItemIndex = 6 then begin
  str:='abcdefghijklmnopqrstuvwxyz';
  end;

  if Form1.RadioGroup1.ItemIndex = 7 then begin
  str:='!@#$%^&*()"\\/|~`?<>,.;:{}[]';
  end;

  if Form1.RadioGroup1.ItemIndex = 8 then begin
  str:='01';
  end;


  Result:='';
    repeat
  Result:=Result+str[Random(Length(str))+1];
  until(Length(Result)=PLen)
end;

function GeneratePass(syllables, numbers: Byte): string;

  function Replicate(Caracter: string; Quant: Integer): string;
  var
    I: Integer;
  begin
    Result := '';
    for I := 1 to Quant do
      Result := Result + Caracter;
  end;
const
  conso: array [0..19] of Char = ('b', 'c', 'd', 'f', 'g', 'h', 'j',
    'k', 'l', 'm', 'n', 'p', 'r', 's', 't', 'v', 'w', 'x', 'y', 'z');
  vocal: array [0..4] of Char = ('a', 'e', 'i', 'o', 'u');
var
  i: Integer;
  si, sf: Longint;
  n: string;
begin
  Result := '';
  Randomize;

  if syllables <> 0 then
    for i := 1 to syllables do
    begin
      Result := Result + conso[Random(19)];
      Result := Result + vocal[Random(4)];
    end;

  if numbers = 1 then Result := Result + IntToStr(Random(9))
  else if numbers >= 2 then
  begin
    if numbers > 9 then numbers := 9;
    si     := StrToInt('1' + Replicate('0', numbers - 1));
    sf     := StrToInt(Replicate('9', numbers));
    n      := FloatToStr(si + Random(sf));
    Result := Result + Copy(n, 0,numbers);
  end;
end;

function RandPW(iPWLen: Integer; bSpecial: Boolean): String;
var
  sPW: string;
begin
  sPW := 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ';
  if bSpecial then
  begin
    sPW := sPW + '1234567890!"§$%&/()=?~+,.-{}[]²³\|*';
  end;
  Result := '';
  repeat
    Result := Result + sPW[Random(Length(sPW)) + 1];
  until
    (Length(Result) = iPWLen);
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
  if (Memo1.Lines.Count <> 0) and (Edit1.Text <> '') then
    if FileCrypt(Edit1.Text ,Edit2.text ,Memo1.Text) then begin
      StatusBar1.Panels[1].Text := ('Decrypt Process finish,  OK!');
    end else begin
      StatusBar1.Panels[1].Text := ('Decrypt Process finish, .. Error!');
    end;
    MessageDlg('Decrypt Process finish.',mtInformation, [mbOK], 0);
  StatusBar1.SetFocus;
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  If (OpenDialog1.Execute) then begin
    If FileExists(OpenDialog1.FileName) then begin
      Edit1.Text := OpenDialog1.FileName;
      if ExtractFileExt(OpenDialog1.FileName) = '.exe' then begin
      Edit2.Text := OpenDialog1.FileName + '.crypt';
      end;

      if ExtractFileExt(OpenDialog1.FileName) = '.crypt' then begin
      Edit2.Text := OpenDialog1.FileName + '.exe';
      end;

    end else begin
      Edit1.Text := '';
    end;

  end;

  if (ExtractFileExt(Edit1.Text) <> '.exe') and
     (ExtractFileExt(Edit1.Text) <> '.crypt') then begin
    MessageDlg('this is not an exe or crypt file!',mtInformation, [mbOK], 0);
    Edit1.Clear;
    Edit2.Clear;
    Exit;
  end;

    StatusBar1.SetFocus;
end;

procedure TForm1.Memo1Change(Sender: TObject);
begin
  if Memo1.Lines.Count = 0  then begin
  Memo1.Color := clRed;
    end else begin
  Memo1.Color := clWindow;
  end;
  StatusBar1.Panels[3].Text := IntToStr(Memo1.Lines.Count);
end;

procedure TForm1.Memo1DblClick(Sender: TObject);
begin
  If (OpenDialog1.Execute) then
    If FileExists(OpenDialog1.FileName) then
      MEmo1.Lines.LoadFromFile(OpenDialog1.FileName);
end;

procedure TForm1.Memo2Change(Sender: TObject);
begin
  Label15.Caption := IntToStr(Memo2.Lines.Count);
end;

procedure TForm1.Edit1Change(Sender: TObject);
begin
  If Edit1.Text = '' then Edit1.Color := clRed else Edit1.Color := clWindow;
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
  if SaveDialog1.Execute then Edit2.Text := SaveDialog1.FileName;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  Randomize;
  StatusBar1.Panels[3].Text := IntToStr(Memo1.Lines.Count);
end;

procedure TForm1.Button4Click(Sender: TObject);
const
  UTF8BOM: array[0..2] of Byte = ($EF, $BB, $BF);

var i : integer;
    str, code : string;
    text : TStringList;
    UTF8Str: UTF8String;
    FS: TFileStream;
begin
  Memo1.Clear;
  if RadioGroup1.ItemIndex = 0 then begin  // Random
    for i := 1 to SpinEdit1.Value do
    begin
      Memo1.Lines.Add((RandPW(SpinEdit2.Value, True)));
    end;
  end;

  if RadioGroup1.ItemIndex = 1 then begin  // Decimal
    for i := 0 to SpinEdit1.Value do
    begin
      Memo1.Lines.Add(GeneratePass(0, SpinEdit2.Value));
    end;
  end;

  if RadioGroup1.ItemIndex = 2 then begin  // Chars
    for i := 0 to SpinEdit1.Value do
    begin
      Memo1.Lines.Add(GeneratePass(SpinEdit2.Value, 0));
    end;
  end;

  if RadioGroup1.ItemIndex = 3 then begin  // HEX
    for i := 0 to SpinEdit1.Value do
    begin
    Randomize;
     str:='ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789';
     Code:='';
     repeat
      Code := Code+str[Random(Length(str)) + 1];
      until
      (Length(Code)=SpinEdit2.Value);
       Memo1.Lines.Add( Code);
    end;
  end;

  if RadioGroup1.ItemIndex = 4 then begin  // Upper/Lower
    for i := 0 to SpinEdit1.Value do
    begin
      Memo1.Lines.Add(RandomPassword(SpinEdit2.Value));
    end;
  end;

  if RadioGroup1.ItemIndex = 5 then begin  // Upper
    for i := 0 to SpinEdit1.Value do
    begin
      Memo1.Lines.Add(RandomPassword(SpinEdit2.Value));
    end;
  end;

  if RadioGroup1.ItemIndex = 6 then begin  // Lower
    for i := 0 to SpinEdit1.Value do
    begin
      Memo1.Lines.Add(RandomPassword(SpinEdit2.Value));
    end;
  end;

  if RadioGroup1.ItemIndex = 7 then begin  // ASCii
    for i := 0 to SpinEdit1.Value do
    begin
      Memo1.Lines.Add(RandomPassword(SpinEdit2.Value));
    end;
  end;

  if RadioGroup1.ItemIndex = 8 then begin  // Binary
    for i := 0 to SpinEdit1.Value do
    begin
      Memo1.Lines.Add(RandomPassword(SpinEdit2.Value));
    end;
  end;

  try
      text := TStringList.Create;
      text.Text := (Memo1.Text);

      case RadioGroup2.ItemIndex of
      0 : text.SaveToFile(ExtractFilePath(Application.ExeName) + 'text.txt', TEncoding.ASCII);
      1 : text.SaveToFile(ExtractFilePath(Application.ExeName) + 'text.txt', TEncoding.ANSI);
      2 : text.SaveToFile(ExtractFilePath(Application.ExeName) + 'text.txt', TEncoding.UTF7);
      3 : text.SaveToFile(ExtractFilePath(Application.ExeName) + 'text.txt', TEncoding.UTF8);
      4 : text.SaveToFile(ExtractFilePath(Application.ExeName) + 'text.txt', TEncoding.BigEndianUnicode);
      5 : text.SaveToFile(ExtractFilePath(Application.ExeName) + 'text.txt', TEncoding.Unicode);
      6 : begin
            UTF8Str := UTF8Encode(Memo1.Text);
            FS := TFileStream.Create(ExtractFilePath(Application.ExeName) + 'text.txt', fmCreate);
            try
              FS.WriteBuffer(UTF8BOM[0], SizeOf(UTF8BOM));
              FS.WriteBuffer(PAnsiChar(UTF8Str)^, Length(UTF8Str));
            finally
            FS.Free;
          end;
          end;
      7 : text.SaveToFile(ExtractFilePath(Application.ExeName) + 'text.txt', TEncoding.Default);
      end;
  finally
    text.Free;
  end;

  StatusBar1.Panels[3].Text := IntToStr(Memo1.Lines.Count-1);
  StatusBar1.SetFocus;
end;

procedure TForm1.Button5Click(Sender: TObject);
var s : string;
    t : integer;
begin
  s := '';
  t := RadioGroup1.ItemIndex;

   if (t >= 0) and (t < RadioGroup1.Items.Count) then
    begin
      s := RadioGroup1.Items[t];
    end;

   if CheckBox1.Checked = true then begin
    Memo1.Lines.SaveToFile(Edit2.Text + '.' + s + '.pass.txt');
  end;

  if (Memo1.Lines.Count <> 0) and (Edit1.Text <> '') then
    if FileCrypt(Edit1.Text ,Edit2.text ,Memo1.Text) then begin
      StatusBar1.Panels[1].Text := ('Encrypt Process finish,  OK!');
    end else begin
      StatusBar1.Panels[1].Text := ('Encrypt Process finish, .. Error!');
    end;

  MessageDlg('Encrypt Process finish.',mtInformation, [mbOK], 0);
  StatusBar1.SetFocus;
end;

procedure TForm1.Button6Click(Sender: TObject);
var str, strCode : AnsiString;
    i : integer;
begin
  Memo3.Clear;
  str := Memo2.Text;

  for i := 0 to Memo2.Lines.Count do begin
    strcode := Crypt(Memo2.Lines[i], Edit3.Text);
    Memo3.Lines.Add(strcode);
  end;
  Label16.Caption := IntToStr(Memo3.Lines.Count);
end;

procedure TForm1.Button7Click(Sender: TObject);
var str, strCode : AnsiString;
    i : integer;
begin
  Memo2.Clear;
  str := Memo3.Text;

  for i := 0 to Memo3.Lines.Count do begin
    strcode := Crypt(Memo3.Lines[i], Edit3.Text);
    Memo2.Lines.Add(strcode);
  end;

  Memo2.Lines.Delete(i-1);
  Label15.Caption := IntToStr(i-1);
end;

end.
