object Form_menu: TForm_menu
  Left = 262
  Top = 161
  Width = 928
  Height = 480
  Caption = 'Menu Rodovi'#225'ria'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Empresas: TBitBtn
    Left = 264
    Top = 88
    Width = 75
    Height = 25
    Caption = 'Empresas'
    TabOrder = 0
    OnClick = EmpresasClick
  end
  object Motoristas: TBitBtn
    Left = 264
    Top = 128
    Width = 75
    Height = 25
    Caption = 'Motoristas'
    TabOrder = 1
    OnClick = MotoristasClick
  end
  object Onibus: TBitBtn
    Left = 264
    Top = 168
    Width = 75
    Height = 25
    Caption = #212'nibus'
    TabOrder = 2
    OnClick = OnibusClick
  end
  object Fechar: TBitBtn
    Left = 264
    Top = 208
    Width = 75
    Height = 25
    Caption = 'Fechar'
    TabOrder = 3
    OnClick = FecharClick
  end
  object ConexaoBD: TADOConnection
    Connected = True
    ConnectionString = 
      'Provider=SQLOLEDB.1;Password=123;Persist Security Info=True;User' +
      ' ID=sa;Initial Catalog=Rodoviaria;Data Source=HP-PC'
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 288
    Top = 272
  end
end
