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
    lytAbas: TLayout;
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
    imgCasa: TImage;
    imgRestaurante: TImage;
    imgLoja: TImage;
    imgCompra: TImage;
    imgOutros: TImage;
    imgSaude: TImage;
    imgFerramenta: TImage;
    imgBarra: TImage;
    procedure Image1Click(Sender: TObject);
    procedure ActLeftExecute(Sender: TObject);
    procedure ActRightExecute(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ListViewScrollViewChange(Sender: TObject);
    procedure ListViewUpdateObjects(const Sender: TObject;
      const AItem: TListViewItem);
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
  img : TListItemImage;
  item : TListViewItem;
  txt : TListItemText;
begin
  if ListView.Items.Count = 0 then
  begin
    item := ListView.Items.Add;
    item.Height := 200;
    item.Objects.Clear;
    item.Tag := -1;
  end;

  item := ListView.items.Add;
  with item do
  begin
    img := TListItemImage(Objects.FindDrawable('Image6'));
    {$IFDEF ANDROID}
    img.OwnsBitmap := True;
    {$ENDIF}
    img.TagString := Lancamento.ICone;

    if Lancamento.ICone = 'CASA' then img.Bitmap := imgCasa.Bitmap
    else if Lancamento.ICone = 'CASA' then img.Bitmap := imgCasa.Bitmap
    else if Lancamento.ICone = 'COMIDA' then img.Bitmap := imgCasa.Bitmap
    else if Lancamento.ICone = 'SERVICO' then img.Bitmap := imgCasa.Bitmap
    else if Lancamento.ICone = 'LOJA' then img.Bitmap := imgCasa.Bitmap
    else if Lancamento.ICone = 'MERCADO' then img.Bitmap := imgCasa.Bitmap
    else if Lancamento.ICone = 'SAUDE' then img.Bitmap := imgCasa.Bitmap
    else if Lancamento.ICone = 'OUTROS' then img.Bitmap := imgCasa.Bitmap;

    img := TListItemImage(item.Objects.FindDrawable('Image5'));
    img.Bitmap := imgBarra.Bitmap;

    img := TListItemImage(item.Objects.FindDrawable('Image4'));
    img.Bitmap := imgBarra.Bitmap;

    txt := TListItemText(item.Objects.FindDrawable('Text1'));
    txt.Text := Lancamento.Categoria;

    txt := TListItemText(item.Objects.FindDrawable('Text2'));
    txt.Text := Lancamento.Descricao + chr(13)+chr(10)+'R$ '+FormatFloat('#,##0.00',Lancamento.Valor);
    txt.TagString := Lancamento.Descricao;
    txt.TagFloat := Lancamento.Valor;

    txt := TListItemText(item.Objects.FindDrawable('Text3'));
    txt.Text := Copy(DateToStr(Lancamento.Data),1,5);
    txt.TagString := Copy(DateToStr(Lancamento.Data),1,5);

    item.Height := 75;
    item.Tag := Lancamento.Codigo;
  end
end;

procedure TFrmLancamentos.FormCreate(Sender: TObject);
begin
  imgCasa.Visible := False;
  imgRestaurante.Visible := False;
  imgLoja.Visible := False;
  imgCompra.Visible := False;
  imgOutros.Visible := False;
  imgSaude.Visible := False;
  imgFerramenta.Visible := False;
  imgBarra.Visible := False;
end;

procedure TFrmLancamentos.FormShow(Sender: TObject);
var
  Lancamento:TLancamento;
begin
  TabControl1.ActiveTab := TabItem1;
  Lancamento.Codigo := 100;
  Lancamento.ICone := 'CASA';
  Lancamento.Categoria := 'Teste';
  Lancamento.Descricao := 'Teste de list';
  Lancamento.Data := Now;
  Lancamento.Valor := 100;

  AddLancamento(Lancamento);
  AddLancamento(Lancamento);
  AddLancamento(Lancamento);
  AddLancamento(Lancamento);
  AddLancamento(Lancamento);
  AddLancamento(Lancamento);
  AddLancamento(Lancamento);
  AddLancamento(Lancamento);
  AddLancamento(Lancamento);
  AddLancamento(Lancamento);
  AddLancamento(Lancamento);
  AddLancamento(Lancamento);
  AddLancamento(Lancamento);
  AddLancamento(Lancamento);
  AddLancamento(Lancamento);
  AddLancamento(Lancamento);
  AddLancamento(Lancamento);
  AddLancamento(Lancamento);
  AddLancamento(Lancamento);
end;

procedure TFrmLancamentos.Image1Click(Sender: TObject);
begin
  Close;
end;

procedure TFrmLancamentos.ListViewScrollViewChange(Sender: TObject);
begin
  if ListView.GetItemRect(0).Bottom > 0 then
    lytAbas.Margins.Top := ListView.GetItemRect(0).Top
  else
    lytAbas.Margins.Top := -199;

  TabControl1.Opacity := ListView.GetItemRect(0).Bottom /2 /100;
end;

procedure TFrmLancamentos.ListViewUpdateObjects(const Sender: TObject;
  const AItem: TListViewItem);
var
  img : TListItemImage;
  txt : TListItemtext;
begin
  with AItem do
  begin
    if tag < 0 then
      exit;
    img := TListItemImage(Objects.FindDrawable('Image6'));
    img.PlaceOffset.x := 15;
    img.PlaceOffset.y := 12;
    img.Width := 30;
    img.Height := 30;

    img := TListItemImage(Objects.FindDrawable('Image5'));

    if AItem.Index > 1 then
    begin
      img.ScalingMode := TImageScalingMode.Stretch;
      img.Bitmap := imgBarra.Bitmap;
      img.PlaceOffset.x := 30;
      img.PlaceOffset.y := 1;
      img.Width := 1;
      img.Height := 8;
    end;

    img := TListItemImage(Objects.FindDrawable('Image4'));
    if AItem.Index <> ListView.items.Count - 1 then
    begin
      img.ScalingMode := TImageScalingMode.Stretch;
      img.Bitmap := imgBarra.Bitmap;
      img.PlaceOffset.x := 30;
      img.PlaceOffset.y := 43;
      img.Width := 1;
      img.Height := AItem.Height - 42;
    end
    else
      img.Visible := False;


    txt := TListItemText(Objects.FindDrawable('Text1'));
    txt.Font.Size := 12;
    txt.Font.Style := [TFontStyle.fsBold];
    txt.PlaceOffset.X := 53;
    txt.PlaceOffset.Y := 8;
    txt.WordWrap := false;

    txt := TListItemText(Objects.FindDrawable('Text2'));
    txt.Font.Size := 12;
    txt.Width := 200;
    txt.Height := AItem.Height - 17;
    txt.PlaceOffset.X := 53;
    txt.PlaceOffset.Y := 14;
    txt.WordWrap := True;

    txt := TListItemText(Objects.FindDrawable('Text3'));
    txt.Font.Size := 10;
    txt.Width := 35;
    txt.Height := 25;
    txt.PlaceOffset.Y := 8;
    txt.WordWrap := True;
  end;

end;

end.
