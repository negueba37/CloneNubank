unit View.Principal;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.TabControl,
  FMX.Objects, FMX.Layouts, FMX.Controls.Presentation, FMX.StdCtrls,
  FMX.Gestures, FMX.ActnList, System.Actions, View.Lancamentos;

type
  TViewPrincipal = class(TForm)
    Layout1: TLayout;
    Image1: TImage;
    Label1: TLabel;
    Layout2: TLayout;
    HorzScrollBox1: THorzScrollBox;
    Rectangle1: TRectangle;
    Label2: TLabel;
    Image2: TImage;
    Rectangle2: TRectangle;
    Label3: TLabel;
    Image3: TImage;
    Rectangle3: TRectangle;
    Label4: TLabel;
    Image4: TImage;
    Rectangle4: TRectangle;
    Label5: TLabel;
    Image5: TImage;
    Rectangle5: TRectangle;
    Label6: TLabel;
    Image6: TImage;
    Rectangle6: TRectangle;
    Label7: TLabel;
    Image7: TImage;
    Rectangle7: TRectangle;
    Label8: TLabel;
    Image8: TImage;
    Rectangle8: TRectangle;
    Label9: TLabel;
    Image9: TImage;
    Layout3: TLayout;
    Layout4: TLayout;
    TabControl1: TTabControl;
    TabItem1: TTabItem;
    TabItem2: TTabItem;
    TabItem3: TTabItem;
    Rectangle9: TRectangle;
    Rectangle10: TRectangle;
    Image10: TImage;
    Image11: TImage;
    Label10: TLabel;
    Layout5: TLayout;
    Layout6: TLayout;
    Image12: TImage;
    Layout7: TLayout;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Layout8: TLayout;
    Rectangle11: TRectangle;
    Rectangle12: TRectangle;
    Rectangle13: TRectangle;
    StyleBook1: TStyleBook;
    Rectangle15: TRectangle;
    Image13: TImage;
    Image14: TImage;
    Label15: TLabel;
    Rectangle14: TRectangle;
    Layout9: TLayout;
    Image15: TImage;
    Image16: TImage;
    Layout10: TLayout;
    Layout11: TLayout;
    Label16: TLabel;
    Label17: TLabel;
    Rectangle16: TRectangle;
    Layout12: TLayout;
    Image17: TImage;
    Layout13: TLayout;
    Label18: TLabel;
    Label19: TLabel;
    SpeedButton1: TSpeedButton;
    ActionList: TActionList;
    ActTab1: TChangeTabAction;
    ActTab2: TChangeTabAction;
    ActTab3: TChangeTabAction;
    ActLeft: TAction;
    ActRigth: TAction;
    GestureManager: TGestureManager;
    procedure ActLeftExecute(Sender: TObject);
    procedure ActRigthExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Rectangle10Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ViewPrincipal: TViewPrincipal;

implementation

{$R *.fmx}

procedure TViewPrincipal.ActLeftExecute(Sender: TObject);
begin
  case TabControl1.ActiveTab.Index of
    0:ActTab2.Execute;
    1:ActTab3.Execute;
  end;
end;

procedure TViewPrincipal.ActRigthExecute(Sender: TObject);
begin
  case TabControl1.ActiveTab.Index of
    2:ActTab2.Execute;
    1:ActTab1.Execute;
  end;
end;

procedure TViewPrincipal.FormCreate(Sender: TObject);
begin
  TabControl1.ActiveTab := TabItem1;
end;

procedure TViewPrincipal.Rectangle10Click(Sender: TObject);
begin
  if not Assigned(FrmLancamentos) then
    Application.CreateForm(TFrmLancamentos,FrmLancamentos);

  FrmLancamentos.Show;
end;

end.
