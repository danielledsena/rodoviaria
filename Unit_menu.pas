unit Unit_menu;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, DB, ADODB;

type
  TForm_menu = class(TForm)
    Empresas: TBitBtn;
    Motoristas: TBitBtn;
    Onibus: TBitBtn;
    Fechar: TBitBtn;
    ConexaoBD: TADOConnection;
    procedure FecharClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure EmpresasClick(Sender: TObject);
    procedure MotoristasClick(Sender: TObject);
    procedure OnibusClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    function ErroBD(msg: string; texto: string) : string;
  end;

var
  Form_menu: TForm_menu;

implementation

uses Unit_empresas, Unit_motoristas, Unit_onibus;

{$R *.dfm}

procedure TForm_menu.FecharClick(Sender: TObject);
begin
  Application.Terminate;
end;

procedure TForm_menu.FormShow(Sender: TObject);
begin
  ConexaoBD.Open;
end;

procedure TForm_menu.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  ConexaoBD.Close;
end;

procedure TForm_menu.EmpresasClick(Sender: TObject);
begin
  form_empresas.showmodal;
end;

procedure TForm_menu.MotoristasClick(Sender: TObject);
begin
 form_motoristas.showmodal;
end;

procedure TForm_menu.OnibusClick(Sender: TObject);
begin
 form_onibus.showmodal;
end;

function TForm_menu.ErroBD(msg, texto: string): string;

var
  i, tam_msg, tam_texto : integer;
  pedaco : string;

begin

  tam_msg := length(msg);
  tam_texto := length(texto);

  for i:=1 to tam_msg do
  begin
    pedaco := copy(msg,i,tam_texto);
    if pedaco = texto then
      begin
        result := 'Sim';
        break;
      end
    else
      result := 'Não';
  end;

end;

end.
