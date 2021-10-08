unit View.Lancamentos;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Objects,
  FMX.Layouts, FMX.StdCtrls, FMX.Controls.Presentation, FMX.TabControl,
  FMX.Gestures, FMX.ActnList, System.Actions, FMX.ListView.Types,
  FMX.ListView.Appearances, FMX.ListView.Adapters.Base, FMX.ListView;
type
  TLancamento = record
  Codigo:Integer;
  ICone:string;
  Categoria:string;
  Descricao:string;
  Data:TDateTime;
  Valor:Double;
end;
type
  TFrmLancamentos = class(TForm)
    Layout1: TLayout;
    Image1: TImage;
    Layout2: TLayout;
    Rectangle1: TRectangle;
    TabControl1: TTabControl;
    Line1: TLine;
    TabItem1: TTabItem;
    TabItem2: TTabItem;
    TabItem3: TTabItem;
    Layout3: TLayout;
    Image2: TImage;
    Label1: TLabel;
    SpeedButton1: TSpeedButton;
    StyleBook1: TStyleBook;
    Layout4: TLayout;
    Image3: TImage;
    Label2: TLabel;
    Layout5: TLayout;
    Label3: TLabel;
    Label4: TLabel;
    SpeedButton2: TSpeedButton;
    ActionList: TActionList;
    ActTab1: TChangeTabAction;
    ActTab2: TChangeTabAction;
    ActTab3: TChangeTabAction;
    ActLeft: TAction;
    ActRight: TAction;
    GestureManager: TGestureManager;
    Layout6: TLayout;
    ListView: TListView;
    procedure Image1Click(Sender: TObject);
    procedure ActLeftExecute(Sender: TObject);
    procedure ActRightExecute(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    procedure AddLancamento(Lancamento:TLancamento);
  public
    { Public declarations }
  end;

var
  FrmLancamentos: TFrmLancamentos;

implementation

{$R *.fmx}

procedure TFrmLancamentos.ActLeftExecute(Sender: TObject);
begin
  case TabControl1.ActiveTab.Index of
    0:ActTab2.Execute;
    1:ActTab3.Execute;
  end;
end;

procedure TFrmLancamentos.ActRightExecute(Sender: TObject);
begin
  case TabControl1.ActiveTab.Index of
    2:ActTab2.Execute;
    1:ActTab1.Execute;
  end;
end;

procedure TFrmLancamentos.AddLancamento(Lancamento: TLancamento);
var
  img:TListItemImage;
  item:TListViewItem;
  txt:TListItemText;
begin

end;

procedure TFrmLancamentos.FormShow(Sender: TObject);
begin
  TabControl1.ActiveTab := TabItem1;
end;

procedure TFrmLancamentos.Image1Click(Sender: TObject);
begin
  Close;
end;

end.
