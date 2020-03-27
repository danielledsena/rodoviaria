object Form_empresas: TForm_empresas
  Left = 271
  Top = 232
  Width = 928
  Height = 480
  Caption = 'Empresas'
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
  object Label1: TLabel
    Left = 120
    Top = 16
    Width = 33
    Height = 13
    Caption = 'C'#243'digo'
  end
  object Label2: TLabel
    Left = 304
    Top = 16
    Width = 28
    Height = 13
    Caption = 'Nome'
  end
  object btn_fechar: TBitBtn
    Left = 360
    Top = 312
    Width = 137
    Height = 25
    Caption = 'Fechar'
    TabOrder = 0
    OnClick = btn_fecharClick
  end
  object dbgrid_empresas: TDBGrid
    Left = 120
    Top = 88
    Width = 673
    Height = 217
    DataSource = ds_empresas
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
  end
  object edt_cod: TEdit
    Left = 120
    Top = 32
    Width = 161
    Height = 21
    MaxLength = 10
    TabOrder = 2
  end
  object edt_nome: TEdit
    Left = 304
    Top = 32
    Width = 489
    Height = 21
    MaxLength = 30
    TabOrder = 3
  end
  object btn_inserir: TBitBtn
    Left = 120
    Top = 56
    Width = 121
    Height = 25
    Caption = 'Inserir'
    TabOrder = 4
    OnClick = btn_inserirClick
  end
  object btn_alterar: TBitBtn
    Left = 248
    Top = 56
    Width = 121
    Height = 25
    Caption = 'Alterar'
    TabOrder = 5
    OnClick = btn_alterarClick
  end
  object btn_salvar: TBitBtn
    Left = 376
    Top = 56
    Width = 121
    Height = 25
    Caption = 'Salvar Altera'#231#245'es'
    TabOrder = 6
    OnClick = btn_salvarClick
  end
  object btn_excluir: TBitBtn
    Left = 504
    Top = 56
    Width = 121
    Height = 25
    Caption = 'Excluir'
    TabOrder = 7
    OnClick = btn_excluirClick
  end
  object adoquery_empresas: TADOQuery
    Connection = Form_menu.ConexaoBD
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'SELECT * FROM EMPRESAS ORDER BY NOME')
    Left = 248
    Top = 312
  end
  object ds_empresas: TDataSource
    DataSet = adoquery_empresas
    Left = 280
    Top = 312
  end
  object adoquery_aux: TADOQuery
    Connection = Form_menu.ConexaoBD
    Parameters = <>
    Left = 312
    Top = 312
  end
end
