unit WebModuleUnit1;

interface

uses System.SysUtils, System.Classes, Web.HTTPApp, Data.DB, Datasnap.DBClient,
  View.WebCharts;

type
  TWebModule1 = class(TWebModule)
    WebCharts1: TWebCharts;
    ClientDataSet1: TClientDataSet;
    procedure WebModule1DefaultHandlerAction(Sender: TObject;
      Request: TWebRequest; Response: TWebResponse; var Handled: Boolean);
    procedure WebModule1tbgchartAction(Sender: TObject; Request: TWebRequest;
      Response: TWebResponse; var Handled: Boolean);
    procedure WebModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  WebModuleClass: TComponentClass = TWebModule1;

implementation

uses
  Charts.Types;

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

procedure TWebModule1.WebModule1DefaultHandlerAction(Sender: TObject;
  Request: TWebRequest; Response: TWebResponse; var Handled: Boolean);
begin
  Response.Content :=
    '<html>' +
    '<head><title>Web Server Application</title></head>' +
    '<body>Web Server Application</body>' +
    '</html>';
end;

procedure TWebModule1.WebModule1tbgchartAction(Sender: TObject;
  Request: TWebRequest; Response: TWebResponse; var Handled: Boolean);
begin
Response.Content :=
  WebCharts1
  .NewProject
    .Rows
      .Title
        .Configuracoes
          .H1('Gr�fico de Barras')
        .&End
      .&End
    .&End
    .Jumpline
    .Jumpline
    .Charts
      ._ChartType(bar)
        .Attributes
          .Name('Meu Grafico de Barras')
          .ColSpan(12)
          .Options
            .Title
              .text('Meu Gr�fico de Barras')
            .&End
          .&End
          .DataSet
            .textLabel('Meu DataSet 1')
            .DataSet(ClientDataSet1)
          .&End
        .&End
      .&End
    .&End
  .GenerateFooter
  .HTML;
  ClientDataSet1.Active := False;
end;

procedure TWebModule1.WebModuleCreate(Sender: TObject);
begin
  ClientDataSet1.Active:=True;
end;

end.
