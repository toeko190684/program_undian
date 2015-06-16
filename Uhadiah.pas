unit Uhadiah;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, ExtCtrls, Grids, DBGrids, Mask, StdCtrls, Menus;

type
  Tfrm_hadiah = class(TForm)
    DBGrid1: TDBGrid;
    DataSource1: TDataSource;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    edthadiah: TEdit;
    msktotal: TMaskEdit;
    mskcounter: TMaskEdit;
    msknomorurut: TMaskEdit;
    mskno: TMaskEdit;
    Button1: TButton;
    PopupMenu1: TPopupMenu;
    Edit1: TMenuItem;
    Delete1: TMenuItem;
    ADOConnection1: TADOConnection;
    ADOTable1: TADOTable;
    ADOTable2: TADOTable;
    procedure Button1Click(Sender: TObject);
    procedure Delete1Click(Sender: TObject);
    procedure refresh(Sender: TObject);
    procedure kosong(Sender: TObject);
    procedure Edit1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_hadiah: Tfrm_hadiah;

implementation

{$R *.dfm}

procedure Tfrm_hadiah.kosong(Sender: TObject);
begin
  mskno.Text := '0';
  edthadiah.Text :='';
  msktotal.Text := '0';
  mskcounter.Text := '0';
  msknomorurut.Text:= '0';
end;


procedure Tfrm_hadiah.refresh(Sender: TObject);
begin
    ADOTable1.Active := false;
    ADOTable1.TableName:= 'tbl_hadiah';
    ADOTable1.Active := True;
    DataSource1.DataSet := ADOTable1;
    DBGrid1.DataSource:= DataSource1;
    DBGrid1.Refresh;
end;


procedure Tfrm_hadiah.Button1Click(Sender: TObject);
begin
if(Button1.Caption = '&Save')then
  begin
    Button1.Caption := '&Update';
    ADOTable2.Open;
    ADOTable2.Append;
    ADOTable2['no'] := mskno.Text;
    ADOTable2['hadiah'] := edthadiah.Text;
    ADOTable2['total'] := msktotal.Text;
    ADOTable2['counter'] := mskcounter.Text;
    ADOTable2['no_urut'] := msknomorurut.Text;
    ADOTable2.Post;
  end
else
  begin
    Button1.Caption := '&Update';
    ADOTable2.Open;
    ADOTable2.Edit;
    ADOTable2['hadiah'] := edthadiah.Text;
    ADOTable2['total'] := msktotal.Text;
    ADOTable2['counter'] := mskcounter.Text;
    ADOTable2['no_urut'] := msknomorurut.Text;
    ADOTable2.Post;
  end;

refresh(sender);
kosong(sender);
Button1.Caption := '&Save';
end;

procedure Tfrm_hadiah.Delete1Click(Sender: TObject);
begin
try
begin
  ADOTable2.TableName := 'tbl_hadiah';
  ADOTable2.Active := true;
  while ADOTable2.Locate('no',DBGrid1.Fields[0].AsString,[]) do
  ADOTable2.Delete;

  refresh(sender);

end;
except
  on E : Exception do
  ShowMessage(E.ClassName+' error raised, with message : '+E.Message);
end;
end;

procedure Tfrm_hadiah.Edit1Click(Sender: TObject);
begin
Button1.Caption := '&Update';
mskno.Text := DBGrid1.Fields[0].AsString;
edthadiah.Text := DBGrid1.Fields[1].AsString;
msktotal.Text := DBGrid1.Fields[2].AsString;
mskcounter.Text := DBGrid1.Fields[3].AsString;
msknomorurut.Text := DBGrid1.Fields[4].AsString;
end;

procedure Tfrm_hadiah.FormCreate(Sender: TObject);
begin
refresh(sender);
end;

end.
