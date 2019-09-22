object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 274
  ClientWidth = 347
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 64
    Top = 40
    Width = 81
    Height = 13
    Caption = 'Ingrese un texto'
  end
  object Label2: TLabel
    Left = 64
    Top = 160
    Width = 109
    Height = 17
    Color = clRed
    ParentColor = False
    Transparent = False
  end
  object Edit1: TEdit
    Left = 64
    Top = 72
    Width = 145
    Height = 21
    TabOrder = 0
  end
  object Agregar: TButton
    Left = 40
    Top = 112
    Width = 75
    Height = 25
    Caption = 'Agregar abajo'
    TabOrder = 1
    OnClick = AgregarClick
  end
  object Borrar: TButton
    Left = 168
    Top = 112
    Width = 75
    Height = 25
    Caption = 'Borrar todo'
    TabOrder = 2
    OnClick = BorrarClick
  end
end
