unit Cryptage;

interface

uses Classes, SysUtils, Forms, Controls;


function Crypt(entree:AnsiString; cle:AnsiString):AnsiString;
function FileCrypt(Source : AnsiString; Destination : AnsiString; Cle : AnsiString):boolean;

implementation

uses Unit1;

function Crypt(entree:AnsiString; cle:AnsiString):AnsiString;
var
  I,J,LongEntree,LongCle,VResult : integer;
  VEntree,VCle : ^byte;
  VBuffer: ^AnsiChar;
  buffer : AnsiString;
begin
  LongEntree := length(entree);
  LongCle := length(Cle);

  If (LongEntree > 0) and (LongCle > 0) then begin
    setlength(buffer,LongEntree);

    for I:= 1 to LongEntree do begin
      for J := 1 to LongCle do begin
        VEntree := @Entree[I];
        VCle := @Cle[J];
        VResult := VEntree^ xor VCle^;
        VBuffer := @VResult;
        Buffer[I] := VBuffer^;
      end;
    end;
  end;
  if Buffer <> '' then result := buffer else Result := '';
end;

function FileCrypt(Source : AnsiString; Destination : AnsiString; Cle : AnsiString):boolean;
var
  FSource, Fdest :TFileStream;
  Buffer : array[1..4096] of integer;
  VCle : ^integer;
  nblu : integer;
  I , J, LongCle, a : integer;
begin
  Screen.Cursor := crHourGlass;

  If (FileExists(Source)) and (Cle <> '') then begin
    LongCle := Length(Cle);
    try
      FSource := TFileStream.Create(Source,fmOpenRead);
      FDest := TFileStream.Create(Destination, fmCreate);
      while FSource.Position < FSource.Size do begin

        if Form1.RadioGroup3.ItemIndex = 0 then begin
        nblu := FSource.Read(Buffer, 64);
        end;

        if Form1.RadioGroup3.ItemIndex = 1 then begin
        nblu := FSource.Read(Buffer, 128);
        end;

        if Form1.RadioGroup3.ItemIndex = 2 then begin
        nblu := FSource.Read(Buffer, 256);
        end;

        if Form1.RadioGroup3.ItemIndex = 3 then begin
        nblu := FSource.Read(Buffer, 512);
        end;

        if Form1.RadioGroup3.ItemIndex = 4 then begin
        nblu := FSource.Read(Buffer, 1024);
        end;

        if Form1.RadioGroup3.ItemIndex = 5 then begin
        nblu := FSource.Read(Buffer, 2048);
        end;

        if Form1.RadioGroup3.ItemIndex = 6 then begin
        nblu := FSource.Read(Buffer, 4096);
        end;

        For I:= 1 to nblu do begin
          For J:= 1 to LongCle do begin
            VCle := @Cle[J];
            Buffer[I] := Buffer[I] xor VCle^;
          end;
        end;

        FDest.Write(Buffer,nblu);
      end;
      Result := True;
    finally
      FSource.Free;
      FDest.Free;
      Screen.Cursor := crDefault;
    end;
  end else Result := False;
end;

end.
 