object Form2: TForm2
  Left = 326
  Top = 145
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'PAlg'#305'la'
  ClientHeight = 308
  ClientWidth = 732
  Color = clBtnFace
  Font.Charset = TURKISH_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Verdana'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  Visible = True
  PixelsPerInch = 96
  TextHeight = 16
  object GroupBox1: TGroupBox
    Left = 16
    Top = 24
    Width = 697
    Height = 255
    Caption = ' Aktif Process'#39'in Bilgileri '
    TabOrder = 0
    object Label1: TLabel
      Left = 16
      Top = 27
      Width = 47
      Height = 16
      Caption = 'Full Yol'
    end
    object Label2: TLabel
      Left = 16
      Top = 82
      Width = 20
      Height = 16
      Caption = 'Yol'
    end
    object Label3: TLabel
      Left = 16
      Top = 138
      Width = 65
      Height = 16
      Caption = 'Dosya Ad'#305
    end
    object Label4: TLabel
      Left = 16
      Top = 194
      Width = 104
      Height = 16
      Caption = 'Uygulama Ba'#351'l'#305'k'
    end
    object fullP: TEdit
      Left = 16
      Top = 48
      Width = 600
      Height = 24
      TabOrder = 0
    end
    object path: TEdit
      Left = 16
      Top = 104
      Width = 600
      Height = 24
      TabOrder = 1
    end
    object exeadi: TEdit
      Left = 16
      Top = 160
      Width = 600
      Height = 24
      TabOrder = 2
    end
    object exebaslik: TEdit
      Left = 16
      Top = 216
      Width = 600
      Height = 24
      TabOrder = 3
    end
    object Button1: TButton
      Left = 616
      Top = 48
      Width = 61
      Height = 24
      Caption = 'Kopyala'
      TabOrder = 4
      OnClick = Button1Click
    end
    object Button2: TButton
      Left = 616
      Top = 104
      Width = 61
      Height = 24
      Caption = 'Kopyala'
      TabOrder = 5
      OnClick = Button1Click
    end
    object Button3: TButton
      Left = 616
      Top = 160
      Width = 61
      Height = 24
      Caption = 'Kopyala'
      TabOrder = 6
      OnClick = Button1Click
    end
    object Button4: TButton
      Left = 616
      Top = 216
      Width = 61
      Height = 24
      Caption = 'Kopyala'
      TabOrder = 7
      OnClick = Button1Click
    end
    object otoBtn: TButton
      Left = 540
      Top = 0
      Width = 137
      Height = 25
      Caption = 'Oto Alg'#305'lama Kapal'#305
      TabOrder = 8
      OnClick = otoBtnClick
    end
  end
  object appev: TApplicationEvents
    Left = 384
    Top = 16
  end
  object Timer1: TTimer
    Enabled = False
    Interval = 500
    OnTimer = Timer1Timer
    Left = 456
    Top = 16
  end
end
