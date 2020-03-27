object Form_onibus: TForm_onibus
  Left = 242
  Top = 210
  Width = 928
  Height = 480
  Caption = #212'nibus'
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
    Left = 104
    Top = 24
    Width = 37
    Height = 13
    Caption = 'N'#250'mero'
  end
  object Label2: TLabel
    Left = 312
    Top = 24
    Width = 33
    Height = 13
    Caption = 'Trajeto'
  end
  object Label3: TLabel
    Left = 104
    Top = 64
    Width = 43
    Height = 13
    Caption = 'Motorista'
  end
  object Label4: TLabel
    Left = 440
    Top = 64
    Width = 41
    Height = 13
    Caption = 'Empresa'
  end
  object btn_fechar: TBitBtn
    Left = 328
    Top = 376
    Width = 201
    Height = 25
    Caption = 'Fechar'
    TabOrder = 0
    OnClick = btn_fecharClick
  end
  object dbgrid_onibus: TDBGrid
    Left = 104
    Top = 152
    Width = 689
    Height = 216
    DataSource = ds_onibus
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
  end
  object edt_num: TEdit
    Left = 104
    Top = 40
    Width = 193
    Height = 21
    TabOrder = 2
  end
  object edt_trajeto: TEdit
    Left = 312
    Top = 40
    Width = 481
    Height = 21
    TabOrder = 3
  end
  object cb_motorista: TComboBox
    Left = 104
    Top = 80
    Width = 321
    Height = 21
    ItemHeight = 13
    TabOrder = 4
    OnChange = cb_motoristaChange
    OnClick = cb_motoristaClick
  end
  object cb_empresa: TComboBox
    Left = 440
    Top = 80
    Width = 353
    Height = 21
    ItemHeight = 13
    TabOrder = 5
    OnChange = cb_empresaChange
    OnClick = cb_empresaClick
  end
  object btn_inserir: TBitBtn
    Left = 104
    Top = 112
    Width = 121
    Height = 25
    Caption = 'Inserir'
    TabOrder = 6
    OnClick = btn_inserirClick
  end
  object btn_alterar: TBitBtn
    Left = 232
    Top = 112
    Width = 121
    Height = 25
    Caption = 'Alterar'
    TabOrder = 7
    OnClick = btn_alterarClick
  end
  object btn_salvar: TBitBtn
    Left = 360
    Top = 112
    Width = 121
    Height = 25
    Caption = 'Salvar Altera'#231#245'es'
    TabOrder = 8
    OnClick = btn_salvarClick
  end
  object btn_excluir: TBitBtn
    Left = 488
    Top = 112
    Width = 121
    Height = 25
    Caption = 'Excluir'
    TabOrder = 9
    OnClick = btn_excluirClick
  end
  object adoquery_onibus: TADOQuery
    Connection = Form_menu.ConexaoBD
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'SELECT ONIBUS.NUM_ONIBUS AS ONIBUS,'
      'EMPRESAS.NOME AS EMPRESA,'
      'MOTORISTAS.NOME AS MOTORISTA,'
      'ONIBUS.TRAJETO'
      'FROM ONIBUS'
      'INNER JOIN EMPRESAS'
      'ON EMPRESAS.COD_EMPRESA = ONIBUS.COD_EMPRESA'
      'INNER JOIN MOTORISTAS'
      'ON MOTORISTAS.NUM_MOTORISTA = ONIBUS.NUM_MOTORISTA')
    Left = 200
    Top = 376
  end
  object ds_onibus: TDataSource
    DataSet = adoquery_onibus
    Left = 232
    Top = 376
  end
  object adoquery_aux: TADOQuery
    Connection = Form_menu.ConexaoBD
    Parameters = <>
    Left = 264
    Top = 376
  end
end
