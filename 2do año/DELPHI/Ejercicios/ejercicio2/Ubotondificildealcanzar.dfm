object Ejercicio2: TEjercicio2
  Left = 0
  Top = 0
  AutoSize = True
  Caption = 'Boton dificil de alcanzar!'
  ClientHeight = 368
  ClientWidth = 482
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
    Left = 441
    Top = 302
    Width = 37
    Height = 22
    Caption = 'Paso'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = 22
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object SpeedButton1: TSpeedButton
    Left = 0
    Top = 0
    Width = 225
    Height = 41
    GroupIndex = 1
    Down = True
    Caption = 'Bot'#243'n Fijo'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object SpeedButton2: TSpeedButton
    Left = 257
    Top = 0
    Width = 225
    Height = 41
    GroupIndex = 1
    Caption = 'Bot'#243'n Escurridizo'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Panel1: TPanel
    Left = 0
    Top = 47
    Width = 482
    Height = 257
    TabOrder = 0
    object BitBtn1: TBitBtn
      Left = 120
      Top = 109
      Width = 209
      Height = 41
      Caption = 'Haga Click aqu'#237' (si puede)'
      DoubleBuffered = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentDoubleBuffered = False
      ParentFont = False
      TabOrder = 0
      OnClick = BitBtn1Click
      OnMouseMove = BitBtn1MouseMove
    end
  end
  object Edit1: TEdit
    Left = 441
    Top = 330
    Width = 41
    Height = 38
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = 30
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 1
    Text = '20'
  end
  object Bitbtn2: TBitBtn
    Left = 0
    Top = 325
    Width = 89
    Height = 43
    Caption = 'Izquierda'
    DoubleBuffered = True
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentDoubleBuffered = False
    ParentFont = False
    TabOrder = 2
    OnClick = Bitbtn2Click
  end
  object BitBtn3: TBitBtn
    Left = 112
    Top = 325
    Width = 89
    Height = 43
    Caption = 'Arriba'
    DoubleBuffered = True
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentDoubleBuffered = False
    ParentFont = False
    TabOrder = 3
    OnClick = BitBtn3Click
  end
  object BitBtn4: TBitBtn
    Left = 224
    Top = 325
    Width = 89
    Height = 43
    Caption = 'Abajo'
    DoubleBuffered = True
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentDoubleBuffered = False
    ParentFont = False
    TabOrder = 4
    OnClick = BitBtn4Click
  end
  object BitBtn5: TBitBtn
    Left = 336
    Top = 325
    Width = 89
    Height = 43
    Caption = 'Derecha'
    DoubleBuffered = True
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentDoubleBuffered = False
    ParentFont = False
    TabOrder = 5
    OnClick = BitBtn5Click
  end
end
