unit Unomor_undian;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, Menus, StdCtrls, Mask, Grids, DBGrids;

type
  Tfrm_nomorundian = class(TForm)
    DBGrid1: TDBGrid;
    DataSource1: TDataSource;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    msknoundian: TMaskEdit;
    Button1: TButton;
    PopupMenu1: TPopupMenu;
    Edit1: TMenuItem;
    Delete1: TMenuItem;
    ADOConnection1: TADOConnection;
    ADOTable1: TADOTable;
    ADOTable2: TADOTable;
    edtsubdist: TEdit;
    edtnamatoko: TEdit;
    cmbgroup: TComboBox;
    edthadiah: TEdit;
    procedure refresh(Sender: TObject);
    procedure kosong(Sender: TObject);
    procedure Edit1Click(Sender: TObject);
    procedure Delete1Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_nomorundian: Tfrm_nomorundian;

implementation

{$R *.dfm}

procedure Tfrm_nomorundian.refresh(Sender: TObject);
begin
    ADOTable1.Active := false;
    ADOTable1.TableName:= 'tbl_nomor';
    ADOTable1.Active := True;
    DataSource1.DataSet := ADOTable1;
    DBGrid1.DataSource:= DataSource1;
    DBGrid1.Refresh;
end;

procedure Tfrm_nomorundian.kosong(Sender: TObject);
begin
    msknoundian.Text := '0';
    edtsubdist.Text := '';
    edtnamatoko.Text := '';
    cmbgroup.Text := '';
    edthadiah.Text := '';
end;

procedure Tfrm_nomorundian.Edit1Click(Sender: TObject);
begin
    Button1.Caption := '&Update';
    msknoundian.Text := DBGrid1.Fields[0].AsString;
    edtsubdist.Text := DBGrid1.Fields[1].AsString;
    edtnamatoko.Text := DBGrid1.Fields[2].AsString;
    cmbgroup.Text := DBGrid1.Fields[3].AsString;
    edthadiah.Text := DBGrid1.Fields[4].AsString;
end;

procedure Tfrm_nomorundian.Delete1Click(Sender: TObject);
begin
try
begin
  ADOTable2.TableName := 'tbl_nomor';
  ADOTable2.Active := true;
  while ADOTable2.Locate('no_undian',DBGrid1.Fields[0].AsString,[]) do
  ADOTable2.Delete;

  refresh(sender);

end;
except
  on E : Exception do
  ShowMessage(E.ClassName+' error raised, with message : '+E.Message);
end;
end;

procedure Tfrm_nomorundian.Button1Click(Sender: TObject);
begin
if(Button1.Caption = '&Save')then
  begin
    Button1.Caption := '&Update';
    ADOTable2.Open;
    ADOTable2.Append;
    ADOTable2['no_undian'] := msknoundian.Text;
    ADOTable2['Sub Dist'] := edtsubdist.Text;
    ADOTable2['nama_toko'] := edtnamatoko.Text;
    ADOTable2['group'] := cmbgroup.Text;
    ADOTable2['hadiah'] := edthadiah.Text;
    ADOTable2.Post;
  end
else
  begin
    Button1.Caption := '&Update';
    ADOTable2.Open;
    ADOTable2.Edit;
    ADOTable2['Sub Dist'] := edtsubdist.Text;
    ADOTable2['nama_toko'] := edtnamatoko.Text;
    ADOTable2['group'] := cmbgroup.Text;
    ADOTable2['hadiah'] := edthadiah.Text;
    ADOTable2.Post;
  end;

refresh(sender);
kosong(sender);
Button1.Caption := '&Save';
end;

end.
