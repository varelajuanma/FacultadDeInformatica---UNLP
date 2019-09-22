object Form2: TForm2
  Left = 100
  Top = 192
  AutoSize = True
  Caption = 'Ingrese palabra secreta'
  ClientHeight = 89
  ClientWidth = 337
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesigned
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 337
    Height = 89
    TabOrder = 0
    object Label1: TLabel
      Left = 8
      Top = 14
      Width = 252
      Height = 21
      Caption = 'Palabra secreta (de 5 a 16 letras)'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = 22
      Font.Name = 'Comic Sans MS'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Edit1: TEdit
      Left = 9
      Top = 41
      Width = 252
      Height = 27
      CharCase = ecUpperCase
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = 19
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      PasswordChar = '~'
      ShowHint = False
      TabOrder = 0
      OnChange = Edit1Change
    end
    object Button1: TButton
      Left = 267
      Top = 14
      Width = 65
      Height = 64
      Caption = 'JUGAR'
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = 25
      Font.Name = 'Chiller'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
      OnClick = Button1Click
    end
  end
end
