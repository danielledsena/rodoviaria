program Rodoviaria;

uses
  Forms,
  Unit_menu in 'Unit_menu.pas' {Form_menu},
  Unit_empresas in 'Unit_empresas.pas' {Form_empresas},
  Unit_motoristas in 'Unit_motoristas.pas' {Form_motoristas},
  Unit_onibus in 'Unit_onibus.pas' {Form_onibus};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm_menu, Form_menu);
  Application.CreateForm(TForm_empresas, Form_empresas);
  Application.CreateForm(TForm_motoristas, Form_motoristas);
  Application.CreateForm(TForm_onibus, Form_onibus);
  Application.Run;
end.
