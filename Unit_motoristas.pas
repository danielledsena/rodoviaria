unit Unit_motoristas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, StdCtrls, Buttons, Grids, DBGrids;

type
  TForm_motoristas = class(TForm)
    btn_fechar: TBitBtn;
    adoquery_motoristas: TADOQuery;
    dbgrid_motoristas: TDBGrid;
    ds_motoristas: TDataSource;
    edt_num: TEdit;
    edt_nome: TEdit;
    edt_idade: TEdit;
    edt_sexo: TEdit;
    edt_salario: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    adoquery_aux: TADOQuery;
    btn_inserir: TBitBtn;
    btn_alterar: TBitBtn;
    btn_salvar: TBitBtn;
    btn_excluir: TBitBtn;
    procedure btn_fecharClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btn_inserirClick(Sender: TObject);
    procedure btn_alterarClick(Sender: TObject);
    procedure btn_salvarClick(Sender: TObject);
    procedure btn_excluirClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form_motoristas: TForm_motoristas;
  num_motorista: string;
  deu_erro: boolean;

implementation

uses Unit_menu;

{$R *.dfm}

procedure TForm_motoristas.btn_fecharClick(Sender: TObject);
begin
Close;
end;

procedure TForm_motoristas.FormShow(Sender: TObject);
begin
  adoquery_motoristas.Open;
end;

procedure TForm_motoristas.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  adoquery_motoristas.Close;
end;

procedure TForm_motoristas.btn_inserirClick(Sender: TObject);
begin
 if (trim(edt_num.Text)='') or (trim(edt_nome.Text)='') or
    (trim(edt_idade.Text)='') or (trim(edt_sexo.Text)='') or
    (trim(edt_salario.Text)='') then
  begin
   Showmessage('Preencha todos os campos !');
  end
 else
  begin
   Form_menu.ConexaoBD.BeginTrans;
   adoquery_aux.SQL.Text:=' INSERT INTO MOTORISTAS VALUES (' +
			edt_num.Text + ',' + QuotedStr(edt_nome.Text) + ',' +
			edt_idade.Text + ',' + QuotedStr(edt_sexo.Text) + ',' +
			edt_salario.Text + ')';
   try
      adoquery_aux.ExecSQL;
      deu_erro := false;
   except
      on E : Exception do
      begin
         deu_erro := true;
         // Se for erro de PK ent�o
         //   exibe mensagem amig�vel
         // Sen�o
         //   exibe a mensagem sem tratamento mesmo!
         if Form_menu.ErroBD(E.Message,'PK_Motoristas') = 'Sim' then
            ShowMessage('N�mero j� cadastrado!')
         else
            ShowMessage('Ocorreu o seguinte erro: ' + E.Message);
      end;
  end;

  if deu_erro = false then
      begin
         Form_menu.ConexaoBD.CommitTrans;
         ADOQuery_motoristas.Close;
         ADOQuery_motoristas.Open;
         Showmessage('Opera��o executada com sucesso !');
         edt_num.Clear;
         edt_nome.Clear;
         edt_idade.Clear;
         edt_sexo.Clear;
         edt_salario.Clear;
      end
  else
      begin
         Form_menu.ConexaoBD.RollbackTrans;
      end;
  end;
end;

procedure TForm_motoristas.btn_alterarClick(Sender: TObject);
begin
  num_motorista:=adoquery_motoristas.fieldbyname('num_motorista').AsString;
  edt_num.Text:=num_motorista;
  edt_nome.Text:=adoquery_motoristas.fieldbyname('nome').AsString;
  edt_idade.Text:=adoquery_motoristas.fieldbyname('idade').AsString;
  edt_sexo.Text:=adoquery_motoristas.fieldbyname('sexo').AsString;
  edt_salario.Text:=adoquery_motoristas.fieldbyname('salario').AsString;
end;

procedure TForm_motoristas.btn_salvarClick(Sender: TObject);
begin
  Form_menu.ConexaoBD.BeginTrans;
  adoquery_aux.SQL.Text:= ' UPDATE MOTORISTAS SET ' +
			' NUM_MOTORISTA = ' + edt_num.Text + ',' +
			' NOME = ' + QuotedStr(edt_nome.Text) + ',' +
			' IDADE = ' + edt_idade.Text + ',' +
			' SEXO = ' + QuotedStr(edt_sexo.Text) + ',' +
			' SALARIO = ' + edt_salario.Text +
			' WHERE NUM_MOTORISTA = ' + num_motorista;
  try
      adoquery_aux.ExecSQL;
      deu_erro := false;
  except
       on E : Exception do
       begin
          deu_erro := true;
          if Form_menu.ErroBD(E.Message,'FK_Onibus_Motoristas') = 'Sim' then
            ShowMessage('Imposs�vel atualizar o c�digo pois existem �nibus ligados a este motorista!')
          else if Form_menu.ErroBD(E.Message,'PK_Motoristas') = 'Sim' then
            ShowMessage('C�digo j� cadastrado!')
          else
            ShowMessage('Ocorreu o seguinte erro: ' + E.Message);
       end;
  end;

  if deu_erro = false then
    begin
      Form_menu.ConexaoBD.CommitTrans;
      ADOQuery_motoristas.Close;
      ADOQuery_motoristas.Open;
      Showmessage('Informa��es atualizadas com sucesso !');
      edt_num.Clear;
      edt_nome.Clear;
      edt_idade.Clear;
      edt_sexo.Clear;
      edt_salario.Clear;
    end
  else
    begin
      Form_menu.ConexaoBD.RollbackTrans;
    end;
end;

procedure TForm_motoristas.btn_excluirClick(Sender: TObject);
begin
  num_motorista:=adoquery_motoristas.fieldbyname('num_motorista').AsString;
  Form_menu.ConexaoBD.BeginTrans;
  adoquery_aux.SQL.Text:=' DELETE FROM MOTORISTAS '+
			' WHERE NUM_MOTORISTA = ' + num_motorista;
  deu_erro := false;
  try
      adoquery_aux.ExecSQL;
  except
      on E: Exception do
      begin
        deu_erro := true;
        if Form_menu.ErroBD(E.Message,'FK_Onibus_Motoristas') = 'Sim' then
           ShowMessage('Imposs�vel excluir pois existem �nibus ligados a este motorista!')
        else
           ShowMessage('Ocorreu o seguinte erro: ' + E.Message);
      end;
  end;

  if deu_erro = true then
      Form_menu.ConexaoBD.RollbackTrans
  else
      begin
           Form_menu.ConexaoBD.CommitTrans;
           adoquery_motoristas.Close;
           adoquery_motoristas.Open;
           showmessage('Motorista exclu�do com sucesso !');
      end;
end;

end.
