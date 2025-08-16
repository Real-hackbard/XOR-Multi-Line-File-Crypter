object Form1: TForm1
  Left = 430
  Top = 158
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Multi Line File Crypter'
  ClientHeight = 610
  ClientWidth = 867
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Position = poScreenCenter
  OnCreate = FormCreate
  TextHeight = 13
  object Label1: TLabel
    Left = 38
    Top = 29
    Width = 22
    Height = 13
    Caption = 'File :'
  end
  object Label2: TLabel
    Left = 8
    Top = 80
    Width = 52
    Height = 13
    Caption = 'Password :'
  end
  object Label3: TLabel
    Left = 28
    Top = 53
    Width = 31
    Height = 13
    Caption = 'Save :'
  end
  object Label4: TLabel
    Left = 29
    Top = 493
    Width = 31
    Height = 13
    Caption = 'Lines :'
  end
  object Label5: TLabel
    Left = 28
    Top = 521
    Width = 33
    Height = 13
    Caption = 'Chars :'
  end
  object Label6: TLabel
    Left = 27
    Top = 224
    Width = 33
    Height = 13
    Caption = 'Mode :'
  end
  object Label7: TLabel
    Left = 14
    Top = 306
    Width = 46
    Height = 13
    Caption = 'Unicode :'
  end
  object Label8: TLabel
    Left = 26
    Top = 394
    Width = 34
    Height = 13
    Caption = 'Buffer :'
  end
  object Label9: TLabel
    Left = 504
    Top = 8
    Width = 86
    Height = 13
    Caption = 'String Encryption :'
  end
  object Label10: TLabel
    Left = 438
    Top = 36
    Width = 52
    Height = 13
    Caption = 'Password :'
  end
  object Label11: TLabel
    Left = 463
    Top = 58
    Width = 27
    Height = 13
    Caption = 'Text :'
  end
  object Label12: TLabel
    Left = 460
    Top = 299
    Width = 30
    Height = 13
    Caption = 'Crypt :'
  end
  object Bevel1: TBevel
    Left = 423
    Top = 8
    Width = 2
    Height = 577
  end
  object Label13: TLabel
    Left = 515
    Top = 538
    Width = 27
    Height = 13
    Caption = 'Text :'
  end
  object Label14: TLabel
    Left = 512
    Top = 557
    Width = 30
    Height = 13
    Caption = 'Crypt :'
  end
  object Label15: TLabel
    Left = 552
    Top = 538
    Width = 6
    Height = 13
    Caption = '0'
  end
  object Label16: TLabel
    Left = 552
    Top = 557
    Width = 6
    Height = 13
    Caption = '0'
  end
  object Button1: TButton
    Left = 302
    Top = 553
    Width = 75
    Height = 25
    Caption = 'Decrypt'
    TabOrder = 0
    TabStop = False
    OnClick = Button1Click
  end
  object Edit1: TEdit
    Left = 64
    Top = 24
    Width = 312
    Height = 21
    TabStop = False
    Color = clWhite
    ReadOnly = True
    TabOrder = 1
    Text = 'load exe file..'
    OnChange = Edit1Change
  end
  object Button2: TButton
    Left = 382
    Top = 23
    Width = 25
    Height = 22
    Caption = '...'
    TabOrder = 2
    TabStop = False
    OnClick = Button2Click
  end
  object Memo1: TMemo
    Left = 65
    Top = 72
    Width = 311
    Height = 137
    TabStop = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    Lines.Strings = (
      'This is a Multi Line'
      'Password Text for'
      'Encrypting File.')
    ParentFont = False
    ScrollBars = ssBoth
    TabOrder = 3
    OnChange = Memo1Change
    OnDblClick = Memo1DblClick
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 591
    Width = 867
    Height = 19
    Panels = <
      item
        Text = 'Status:'
        Width = 50
      end
      item
        Text = 'ready..'
        Width = 170
      end
      item
        Text = 'Line:'
        Width = 50
      end
      item
        Width = 50
      end>
    ExplicitTop = 590
    ExplicitWidth = 807
  end
  object Edit2: TEdit
    Left = 64
    Top = 48
    Width = 312
    Height = 21
    TabStop = False
    TabOrder = 5
  end
  object Button3: TButton
    Left = 382
    Top = 47
    Width = 25
    Height = 22
    Caption = '...'
    TabOrder = 6
    TabStop = False
    OnClick = Button3Click
  end
  object Button4: TButton
    Left = 65
    Top = 553
    Width = 75
    Height = 25
    Caption = 'Generate'
    TabOrder = 7
    TabStop = False
    OnClick = Button4Click
  end
  object SpinEdit1: TSpinEdit
    Left = 65
    Top = 489
    Width = 73
    Height = 22
    TabStop = False
    MaxValue = 0
    MinValue = 0
    TabOrder = 8
    Value = 5
  end
  object SpinEdit2: TSpinEdit
    Left = 65
    Top = 517
    Width = 73
    Height = 22
    TabStop = False
    MaxValue = 0
    MinValue = 0
    TabOrder = 9
    Value = 15
  end
  object CheckBox1: TCheckBox
    Left = 176
    Top = 492
    Width = 97
    Height = 17
    Caption = 'Save Password'
    TabOrder = 10
  end
  object RadioGroup1: TRadioGroup
    Left = 64
    Top = 215
    Width = 312
    Height = 78
    Columns = 3
    ItemIndex = 0
    Items.Strings = (
      'Random'
      'Decimal'
      'Chars'
      'HEX'
      'Upper/Lower'
      'Upper'
      'Lower'
      'ASCii'
      'Binary')
    TabOrder = 11
  end
  object RadioGroup2: TRadioGroup
    Left = 65
    Top = 299
    Width = 312
    Height = 80
    Columns = 3
    ItemIndex = 7
    Items.Strings = (
      'ASCii'
      'ANSi'
      'UTF-7'
      'UTF-8'
      'UTF-16 BE'
      'UTF-16 LE'
      'UTF-8 Boom'
      'Default')
    TabOrder = 12
  end
  object Button5: TButton
    Left = 221
    Top = 553
    Width = 75
    Height = 25
    Caption = 'Crypt'
    TabOrder = 13
    OnClick = Button5Click
  end
  object RadioGroup3: TRadioGroup
    Left = 66
    Top = 385
    Width = 310
    Height = 98
    Columns = 2
    ItemIndex = 4
    Items.Strings = (
      '64 Kb'
      '128 Kb'
      '256 Kb'
      '512 Kb'
      '1024 Kb'
      '2048 Kb'
      '4096 Kb')
    TabOrder = 14
  end
  object Memo2: TMemo
    Left = 496
    Top = 55
    Width = 363
    Height = 226
    TabStop = False
    Lines.Strings = (
      
        'function FileCrypt(Source : AnsiString; Destination : AnsiString' +
        '; Cle : AnsiString):boolean;'
      'var'
      '  FSource, Fdest :TFileStream;'
      '  Buffer : array[1..4096] of integer;'
      '  VCle : ^integer;'
      '  nblu : integer;'
      '  I , J, LongCle, a : integer;'
      'begin'
      '  Screen.Cursor := crHourGlass;'
      ''
      '  If (FileExists(Source)) and (Cle <> '#39#39') then begin'
      '    LongCle := Length(Cle);'
      '    try'
      '      FSource := TFileStream.Create(Source,fmOpenRead);'
      '      FDest := TFileStream.Create(Destination, fmCreate);'
      '      while FSource.Position < FSource.Size do begin'
      ''
      '        if Form1.RadioGroup3.ItemIndex = 0 then begin'
      '        nblu := FSource.Read(Buffer, 64);'
      '        end;'
      ''
      '        if Form1.RadioGroup3.ItemIndex = 1 then begin'
      '        nblu := FSource.Read(Buffer, 128);'
      '        end;'
      ''
      '        if Form1.RadioGroup3.ItemIndex = 2 then begin'
      '        nblu := FSource.Read(Buffer, 256);'
      '        end;'
      ''
      '        if Form1.RadioGroup3.ItemIndex = 3 then begin'
      '        nblu := FSource.Read(Buffer, 512);'
      '        end;'
      ''
      '        if Form1.RadioGroup3.ItemIndex = 4 then begin'
      '        nblu := FSource.Read(Buffer, 1024);'
      '        end;'
      ''
      '        if Form1.RadioGroup3.ItemIndex = 5 then begin'
      '        nblu := FSource.Read(Buffer, 2048);'
      '        end;'
      ''
      '        if Form1.RadioGroup3.ItemIndex = 6 then begin'
      '        nblu := FSource.Read(Buffer, 4096);'
      '        end;'
      ''
      '        For I:= 1 to nblu do begin'
      '          For J:= 1 to LongCle do begin'
      '            VCle := @Cle[J];'
      '            Buffer[I] := Buffer[I] xor VCle^;'
      '          end;'
      '        end;'
      ''
      '        FDest.Write(Buffer,nblu);'
      '      end;'
      '      Result := True;'
      '    finally'
      '      FSource.Free;'
      '      FDest.Free;'
      '      Screen.Cursor := crDefault;'
      '    end;'
      '  end else Result := False;'
      'end;')
    ScrollBars = ssBoth
    TabOrder = 15
    OnChange = Memo2Change
  end
  object Button6: TButton
    Left = 688
    Top = 553
    Width = 75
    Height = 25
    Caption = 'Crypt'
    TabOrder = 16
    OnClick = Button6Click
  end
  object Edit3: TEdit
    Left = 496
    Top = 31
    Width = 363
    Height = 21
    TabOrder = 17
    Text = '123456789'
  end
  object Memo3: TMemo
    Left = 496
    Top = 287
    Width = 363
    Height = 234
    ScrollBars = ssBoth
    TabOrder = 18
  end
  object Button7: TButton
    Left = 784
    Top = 553
    Width = 75
    Height = 25
    Caption = 'Decrypt'
    TabOrder = 19
    OnClick = Button7Click
  end
  object OpenDialog1: TOpenDialog
    Left = 192
    Top = 8
  end
  object SaveDialog1: TSaveDialog
    Left = 264
    Top = 8
  end
end
