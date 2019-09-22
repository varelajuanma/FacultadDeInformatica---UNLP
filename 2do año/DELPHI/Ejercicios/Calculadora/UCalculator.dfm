object Calculator: TCalculator
  Left = 0
  Top = 0
  AutoSize = True
  Caption = 'Calculator'
  ClientHeight = 128
  ClientWidth = 172
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object SpeedButton1: TSpeedButton
    Left = 0
    Top = 24
    Width = 23
    Height = 22
    Caption = '+'
    OnClick = SpeedButton1Click
  end
  object Label1: TLabel
    Left = 24
    Top = 88
    Width = 148
    Height = 13
    Caption = '-------------------------------------'
  end
  object Edit1: TEdit
    Left = 40
    Top = 0
    Width = 121
    Height = 21
    Alignment = taCenter
    TabOrder = 0
  end
  object Edit2: TEdit
    Left = 40
    Top = 56
    Width = 121
    Height = 21
    Alignment = taCenter
    TabOrder = 1
  end
  object Edit3: TEdit
    Left = 40
    Top = 107
    Width = 121
    Height = 21
    Alignment = taCenter
    ReadOnly = True
    TabOrder = 2
  end
end
