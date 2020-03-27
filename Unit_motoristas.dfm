object Form_motoristas: TForm_motoristas
  Left = 264
  Top = 213
  Width = 928
  Height = 480
  Caption = 'Motoristas'
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
    Left = 112
    Top = 48
    Width = 37
    Height = 13
    Caption = 'N'#250'mero'
  end
  object Label2: TLabel
    Left = 184
    Top = 48
    Width = 28
    Height = 13
    Caption = 'Nome'
  end
  object Label3: TLabel
    Left = 608
    Top = 48
    Width = 27
    Height = 13
    Caption = 'Idade'
  end
  object Label4: TLabel
    Left = 664
    Top = 48
    Width = 24
    Height = 13
    Caption = 'Sexo'
  end
  object Label5: TLabel
    Left = 712
    Top = 48
    Width = 32
    Height = 13
    Caption = 'Sal'#225'rio'
  end
  object btn_fechar: TBitBtn
    Left = 328
    Top = 352
    Width = 241
    Height = 25
    Caption = 'Fechar'
    TabOrder = 0
    OnClick = btn_fecharClick
  end
  object dbgrid_motoristas: TDBGrid
    Left = 112
    Top = 128
    Width = 689
    Height = 217
    DataSource = ds_motoristas
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
  end
  object edt_num: TEdit
    Left = 112
    Top = 64
    Width = 65
    Height = 21
    TabOrder = 2
  end
  object edt_nome: TEdit
    Left = 184
    Top = 64
    Width = 417
    Height = 21
    TabOrder = 3
  end
  object edt_idade: TEdit
    Left = 608
    Top = 64
    Width = 49
    Height = 21
    TabOrder = 4
  end
  object edt_sexo: TEdit
    Left = 664
    Top = 64
    Width = 41
    Height = 21
    TabOrder = 5
  end
  object edt_salario: TEdit
    Left = 712
    Top = 64
    Width = 89
    Height = 21
    TabOrder = 6
  end
  object btn_inserir: TBitBtn
    Left = 112
    Top = 88
    Width = 137
    Height = 25
    Caption = 'Inserir'
    TabOrder = 7
    OnClick = btn_inserirClick
  end
  object btn_alterar: TBitBtn
    Left = 256
    Top = 88
    Width = 137
    Height = 25
    Caption = 'Alterar'
    TabOrder = 8
    OnClick = btn_alterarClick
  end
  object btn_salvar: TBitBtn
    Left = 400
    Top = 88
    Width = 137
    Height = 25
    Caption = 'Salvar Altera'#231#245'es'
    TabOrder = 9
    OnClick = btn_salvarClick
  end
  object btn_excluir: TBitBtn
    Left = 544
    Top = 88
    Width = 137
    Height = 25
    Caption = 'Excluir'
    TabOrder = 10
    OnClick = btn_excluirClick
  end
  object adoquery_motoristas: TADOQuery
    Connection = Form_menu.ConexaoBD
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'SELECT * FROM MOTORISTAS ORDER BY NOME')
    Left = 216
    Top = 352
  end
  object ds_motoristas: TDataSource
    DataSet = adoquery_motoristas
    Left = 248
    Top = 352
  end
  object adoquery_aux: TADOQuery
    Connection = Form_menu.ConexaoBD
    Parameters = <>
    Left = 280
    Top = 352
  end
end
