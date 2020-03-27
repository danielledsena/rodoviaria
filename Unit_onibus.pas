unit Unit_onibus;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, StdCtrls, Buttons, Grids, DBGrids;

type
  TForm_onibus = class(TForm)
    btn_fechar: TBitBtn;
    adoquery_onibus: TADOQuery;
    dbgrid_onibus: TDBGrid;
    ds_onibus: TDataSource;
    edt_num: TEdit;
    edt_trajeto: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    cb_motorista: TComboBox;
    cb_empresa: TComboBox;
    Label3: TLabel;
    Label4: TLabel;
    adoquery_aux: TADOQuery;
    btn_inserir: TBitBtn;
    btn_alterar: TBitBtn;
    btn_salvar: TBitBtn;
    btn_excluir: TBitBtn;
    procedure btn_fecharClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure cb_motoristaChange(Sender: TObject);
    procedure cb_empresaChange(Sender: TObject);
    procedure btn_inserirClick(Sender: TObject);
    procedure cb_motoristaClick(Sender: TObject);
    procedure cb_empresaClick(Sender: TObject);
    procedure btn_alterarClick(Sender: TObject);
    procedure btn_salvarClick(Sender: TObject);
    procedure btn_excluirClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form_onibus: TForm_onibus;
  num_motorista, cod_empresa: integer;
  num_onibus : string;
  deu_erro : boolean;

implementation

uses Unit_menu;

{$R *.dfm}

procedure TForm_onibus.btn_fecharClick(Sender: TObject);
begin
  Close;
end;

procedure TForm_onibus.FormShow(Sender: TObject);
begin
   adoquery_onibus.Open;
   
  //Limpa o combobox de motoristas
  cb_motorista.Clear;
  //Define o SELECT para obter o nome dos motoristas
  adoquery_aux.SQL.Text:='SELECT NOME FROM MOTORISTAS ORDER BY NOME';
  //Abre a query com o select definido
  adoquery_aux.Open;
  //Enquanto não chegar ao final da query faça...
  While Not ADOQuery_aux.Eof do
  begin
    //Adiciona ao combobox o nome do motorista do registro corrente
    cb_motorista.Items.Add(adoquery_aux.fieldbyname('NOME').AsString);
    //Passa para o próximo registro da query
    adoquery_aux.Next;
  end;
  //Fecha a query de motoristas
  adoquery_aux.close;
  //Limpa o combobox de empresas
  cb_empresa.Clear;
  //Define o select pata obter o nome das empresas
  adoquery_aux.SQL.Text:='SELECT NOME FROM EMPRESAS ORDER BY NOME';
  //Abre a query com o select definido
  adoquery_aux.Open;
  //Enquanto não chegar ao final da query faça...
  While Not ADOQuery_aux.Eof do
  begin
    //Adiciona ao combobox o nome da empresa do registro corrente
    cb_empresa.Items.Add(adoquery_aux.fieldbyname('NOME').AsString);
    //Passa para o próximo registro da query
    adoquery_aux.Next;
  end;
  //Fecha a query de empresas
  adoquery_aux.Close;
end;

procedure TForm_onibus.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
    adoquery_onibus.Close;
end;

procedure TForm_onibus.cb_motoristaChange(Sender: TObject);
begin
   //Monta o select para pegar o número do motorista através do nome
  adoquery_aux.SQL.Text:=' SELECT NUM_MOTORISTA FROM MOTORISTAS '+
			 ' WHERE NOME = '+ QuotedStr(cb_motorista.Text);
  //Abre a query
  adoquery_aux.Open;
  //Atribui o valor obtido à variável
  num_motorista := adoquery_aux.fieldbyname('NUM_MOTORISTA').AsInteger;
  //Fecha a query
  adoquery_aux.Close;
end;

procedure TForm_onibus.cb_empresaChange(Sender: TObject);
begin
  //Monta o select para pegar o código da empresa através do nome
  adoquery_aux.SQL.Text:=' SELECT COD_EMPRESA FROM EMPRESAS '+
			 ' WHERE NOME = '+ QuotedStr(cb_empresa.Text);
  //Abre a query
  adoquery_aux.Open;
  //Atribui o valor obtido à variável
  cod_empresa := adoquery_aux.fieldbyname('COD_EMPRESA').AsInteger;
  //Fecha a query
  adoquery_aux.Close;
end;

procedure TForm_onibus.btn_inserirClick(Sender: TObject);
begin
  // Se algum dos campos estiver vazio Então
  //      exibe mensagem
  // Senão
  //      executa o insert
  if (trim(edt_num.Text)='') or (trim(edt_trajeto.Text)='') or
  (trim(cb_motorista.Text)='') or (trim(cb_empresa.Text)='') then
	  begin
	     Showmessage('Preencha todos os campos !');
    end
  else
	  begin
       // Inicia uma transação
	     Form_menu.ConexaoBD.BeginTrans;
	     //Monta o comando insert
	     adoquery_aux.SQL.Text:=' INSERT INTO ONIBUS VALUES ('+
				   edt_num.Text + ',' + IntToStr(cod_empresa) + ',' +
           IntToStr(num_motorista) + ',' + QuotedStr(edt_trajeto.Text) + ')';
       try
	         //Executa o comando SQL
           adoquery_aux.ExecSQL;
           deu_erro := false;
       except
           on E : Exception do
           begin
               deu_erro := true;
               //Se for erro de PK então
               //    exibe mensagem amigável
               //Senão
               //    exibe a mensgaem sem tratamento mesmo!
               if Form_menu.ErroBD(E.Message,'PK_Onibus') = 'Sim' then
                     ShowMessage('Número já cadastrado!')
               else
                     ShowMessage('Ocorreu o seguinte erro: ' + E.Message);
           end;
    end;

    if deu_erro = false then
       begin
	         // Encerra a transação confirmando a alteração
	         Form_menu.ConexaoBD.CommitTrans;
	         // Abre e fecha o adoquery_onibus para atualizar os registros
	         ADOQuery_onibus.Close;
	         ADOQuery_onibus.Open;
	        // Exibe mensagem e limpa os campos
	        Showmessage('Operação executada com sucesso !');
	        edt_num.Clear;
	        edt_trajeto.Clear;
	        cb_motorista.ItemIndex := -1;  // Colocamos -1 na propriedade ItemIndex do combobox
	        cb_empresa.ItemIndex := -1;    // para não precisar limpar os nomes cadastrados.
       end
    else
       begin
          Form_menu.ConexaoBD.RollbackTrans;
       end;
	end;
end;

procedure TForm_onibus.cb_motoristaClick(Sender: TObject);
begin
  // Monta o select para pegar o número do motorista por meio do nome
  adoquery_aux.SQL.Text:=' SELECT NUM_MOTORISTA FROM MOTORISTAS '+
			' WHERE NOME = '+ QuotedStr(cb_motorista.Text);
  // Abre a query
  adoquery_aux.Open;
  // Atribui o valor obtido à variável
  num_motorista := adoquery_aux.fieldbyname('NUM_MOTORISTA').AsInteger;
  // Fecha a query
  adoquery_aux.Close;
end;

procedure TForm_onibus.cb_empresaClick(Sender: TObject);
begin
  // Monta o select para pegar o código da empresa por meio do nome
  adoquery_aux.SQL.Text:=' SELECT COD_EMPRESA FROM EMPRESAS '+
			' WHERE NOME = '+ QuotedStr(cb_empresa.Text);
  // Abre a query
  adoquery_aux.Open;
  // Atribui o valor obtido à variável
  cod_empresa := adoquery_aux.fieldbyname('COD_EMPRESA').AsInteger;
  // Fecha a query
  adoquery_aux.Close;
end;

procedure TForm_onibus.btn_alterarClick(Sender: TObject);
begin
  num_onibus := ADOQuery_onibus.fieldbyname('onibus').AsString;
  edt_num.Text := num_onibus;
  edt_trajeto.Text := ADOQuery_onibus.fieldbyname('trajeto').AsString;
  cb_motorista.Text := ADOQuery_onibus.fieldbyname('motorista').AsString;
  cb_motoristaChange(sender); //Executa o evento OnChange do Objeto
  cb_empresa.Text := ADOQuery_onibus.fieldbyname('empresa').AsString;
  cb_empresaChange(sender); //Executa o evento OnChange do Objeto
end;

procedure TForm_onibus.btn_salvarClick(Sender: TObject);
begin
  Form_menu.ConexaoBD.BeginTrans;
  adoquery_aux.SQL.Text:=' UPDATE ONIBUS SET ' +
			' NUM_ONIBUS = ' + edt_num.Text + ',' +
			' COD_EMPRESA = ' + inttostr(cod_empresa) + ',' +
			' NUM_MOTORISTA = ' +inttostr(num_motorista) + ',' +
			' TRAJETO = ' + QuotedStr(edt_trajeto.Text) +
			' WHERE NUM_ONIBUS = ' + num_onibus;
  try
      adoquery_aux.ExecSQL;
      deu_erro := false;
  except
      on E : Exception do
      begin
          deu_erro := true;
          if Form_menu.ErroBD(E.Message,'PK_Onibus') = 'Sim' then
             ShowMessage('Número já cadastrado!')
          else
             ShowMessage('Ocorreu o seguinte erro: ' + E.Message);
      end;
  end;
  if deu_erro = false then
  begin
      Form_menu.ConexaoBD.CommitTrans;
      ADOQuery_onibus.Close;
      ADOQuery_onibus.Open;
      showmessage('Informações atualizadas com sucesso !');
      edt_num.Clear;
      edt_trajeto.Clear;
      cb_motorista.ItemIndex := -1;
      cb_empresa.ItemIndex := -1;
      cb_motorista.Text := '';
      cb_empresa.Text := '';
  end
 else
  begin
      Form_menu.ConexaoBD.RollbackTrans;
  end;
end;

procedure TForm_onibus.btn_excluirClick(Sender: TObject);
begin
  num_onibus:=adoquery_onibus.fieldbyname('onibus').AsString;
  Form_menu.ConexaoBD.BeginTrans;
  adoquery_aux.SQL.Text:=' DELETE FROM ONIBUS '+
			' WHERE NUM_ONIBUS = ' + num_onibus;
  adoquery_aux.ExecSQL;
  Form_menu.ConexaoBD.CommitTrans;
  adoquery_onibus.Close;
  adoquery_onibus.Open;
  showmessage('Ônibus excluído com sucesso !');
end;

end.
