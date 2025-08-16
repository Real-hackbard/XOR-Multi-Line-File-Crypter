program MultiLinePasswordCrypter;

uses
  Forms,
  Unit1 in 'Unit1.pas' {Form1},
  Cryptage in 'Cryptage.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'Cryptage';
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
