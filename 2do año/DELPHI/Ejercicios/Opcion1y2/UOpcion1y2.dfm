object Form7: TForm7
  Left = 0
  Top = 0
  AutoSize = True
  BorderWidth = 20
  Caption = 'Opci'#243'n'
  ClientHeight = 105
  ClientWidth = 193
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnClick = FormClick
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 193
    Height = 105
    Color = clTeal
    ParentBackground = False
    TabOrder = 0
    object Label1: TLabel
      Left = 17
      Top = 3
      Width = 33
      Height = 13
      Caption = 'Opci'#243'n'
    end
    object Edit1: TEdit
      Left = 56
      Top = 0
      Width = 121
      Height = 21
      TabOrder = 0
      Text = 'Ingrese una opci'#243'n'
    end
    object Button2: TButton
      Left = 102
      Top = 67
      Width = 75
      Height = 25
      Caption = 'Opci'#243'n 2'
      TabOrder = 1
      OnClick = Button2Click
    end
    object Button1: TButton
      Left = 17
      Top = 67
      Width = 75
      Height = 25
      Caption = 'Opci'#243'n 1'
      TabOrder = 2
      OnClick = Button1Click
    end
  end
end
