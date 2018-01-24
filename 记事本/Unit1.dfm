object Form1: TForm1
  Left = 396
  Top = 102
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #32534#31243#26085#35760#26412' V1.2'
  ClientHeight = 790
  ClientWidth = 779
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Menu = mm1
  OldCreateOrder = False
  OnCloseQuery = FormCloseQuery
  PixelsPerInch = 96
  TextHeight = 13
  object mmo1: TMemo
    Left = 0
    Top = -2
    Width = 779
    Height = 771
    Color = clBlack
    Font.Charset = GB2312_CHARSET
    Font.Color = clLime
    Font.Height = -16
    Font.Name = #26999#20307
    Font.Style = []
    ImeName = #20013#25991' - QQ'#25340#38899#36755#20837#27861
    ParentFont = False
    TabOrder = 0
    OnChange = Datetime1Click
  end
  object stat1: TStatusBar
    Left = 0
    Top = 771
    Width = 779
    Height = 19
    Panels = <
      item
        Text = #32534#31243#26085#35760#26412' V1.2'
        Width = 100
      end
      item
        Width = 100
      end
      item
        Width = 50
      end
      item
        Width = 50
      end>
  end
  object mm1: TMainMenu
    Left = 144
    Top = 112
    object film1: TMenuItem
      Caption = #25991#20214#65288'&F'#65289
      object New1: TMenuItem
        Caption = #26032#24314#65288'&N'#65289
        OnClick = New1Click
      end
      object Open1: TMenuItem
        Caption = #25171#24320#65288'&O'#65289
        OnClick = Open1Click
      end
      object Save1: TMenuItem
        Caption = #20445#23384#65288'&S'#65289
        OnClick = Save1Click
      end
      object N1: TMenuItem
        Caption = '-'
      end
      object Exit1: TMenuItem
        Caption = #36864#20986#65288'&E'#65289
        OnClick = Exit1Click
      end
    end
    object edit1: TMenuItem
      Caption = #32534#36753#65288'&E'#65289
      object Undo1: TMenuItem
        Caption = #25764#38144#65288'&U'#65289
        OnClick = Undo1Click
      end
      object N2: TMenuItem
        Caption = '-'
      end
      object Copy1: TMenuItem
        Caption = #22797#21046#65288'&C'#65289
        OnClick = Copy1Click
      end
      object Paste1: TMenuItem
        Caption = #31896#24086#65288'&P'#65289
        OnClick = Paste1Click
      end
      object Cut1: TMenuItem
        Caption = #21098#20999#65288'&T'#65289
        OnClick = Cut1Click
      end
      object Delete1: TMenuItem
        Caption = #21024#38500#65288'&D'#65289
        OnClick = Delete1Click
      end
      object N3: TMenuItem
        Caption = '-'
      end
      object All1: TMenuItem
        Caption = #20840#36873#65288'&A'#65289
        OnClick = All1Click
      end
      object N4: TMenuItem
        Caption = '-'
      end
      object Find1: TMenuItem
        Caption = #26597#25214#65288'&F'#65289
        OnClick = Find1Click
      end
      object Replace1: TMenuItem
        Caption = #26367#25442#65288'&R'#65289
        OnClick = Replace1Click
      end
    end
    object O1: TMenuItem
      Caption = #26684#24335#65288'&O'#65289
      object Font1: TMenuItem
        Caption = #23383#20307#65288'&F'#65289
        OnClick = Font1Click
      end
      object BackGround1: TMenuItem
        Caption = #32972#26223#65288'&B'#65289
        OnClick = BackGround1Click
      end
    end
    object Help1: TMenuItem
      Caption = #24110#21161#65288'&H'#65289
      object About1: TMenuItem
        Caption = #20851#20110#65288'&A'#65289
        OnClick = About1Click
      end
    end
  end
  object dlgOpen1: TOpenDialog
    Left = 216
    Top = 112
  end
  object dlgSave1: TSaveDialog
    Left = 296
    Top = 112
  end
  object dlgFind1: TFindDialog
    OnFind = dlgFind1Find
    Left = 376
    Top = 112
  end
  object dlgReplace1: TReplaceDialog
    OnReplace = dlgReplace1Replace
    Left = 464
    Top = 112
  end
  object dlgFont1: TFontDialog
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    Left = 528
    Top = 112
  end
  object dlgColor1: TColorDialog
    Left = 592
    Top = 112
  end
  object tmr1: TTimer
    Interval = 10
    OnTimer = tmr1Timer
    Left = 88
    Top = 112
  end
end
