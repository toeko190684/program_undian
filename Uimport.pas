unit Uimport;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, DBGrids, ComCtrls, DB, ADODB,ComObj;

type
  Tfrm_import = class(TForm)
    GroupBox1: TGroupBox;
    Edit1: TEdit;
    Label2: TLabel;
    Button1: TButton;
    GroupBox2: TGroupBox;
    DBGrid1: TDBGrid;
    ProgressBar1: TProgressBar;
    Label1: TLabel;
    Button3: TButton;
    Label4: TLabel;
    ComboBox1: TComboBox;
    Button2: TButton;
    OpenDialog1: TOpenDialog;
    ADOConnection1: TADOConnection;
    ADOTable1: TADOTable;
    DataSource1: TDataSource;
    Label3: TLabel;
    procedure Button1Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_import: Tfrm_import;

implementation

{$R *.dfm}

procedure Tfrm_import.Button1Click(Sender: TObject);
begin
if OpenDialog1.Execute then
Edit1.Text := OpenDialog1.FileName;
end;

procedure Tfrm_import.Button3Click(Sender: TObject);
begin
if(ComboBox1.Text='') then
  MessageDlg('Pilih $Sheet yang akan diimport!',mtWarning,[mbok],0)
else
begin
  ProgressBar1.Position := 0;
  ADOConnection1.Connected := False;
  try
    ADOConnection1.ConnectionString := 'Provider=Microsoft.Jet.OLEDB.4.0;User ID=Admin;'+
                                        'Data Source='+Edit1.Text+';'+
                                      'Mode=Share Deny None;Jet OLEDB:System database="";'+
                                      'Jet OLEDB:Registry Path="";Jet OLEDB:Database Password="";'+
                                      'Jet OLEDB:Engine Type=35;Jet OLEDB:Database Locking Mode=0;'+
                                      'Jet OLEDB:Global Partial Bulk Ops=2;Jet OLEDB:Global Bulk Transactions=1;'+
                                      'Jet OLEDB:New Database Password="";'+
                                      'Jet OLEDB:Create System Database=False;'+
                                      'Jet OLEDB:Encrypt Database=False;'+
                                      'Jet OLEDB:Dont Copy Locale on Compact=False;Jet OLEDB:Compact Without Replica Repair=False;'+
                                      'Jet OLEDB:SFP=False;';
    ADOConnection1.Connected := True;
    ADOTable1.TableName := ComboBox1.Text;
    ADOTable1.TableDirect := true;
    ADOTable1.CursorType := ctStatic;
    ADOTable1.Active := true;

    Label1.Caption := 'Total Record : '+IntToStr(ADOTable1.RecordCount);
  except
    on EOleException do // perlu ditambahkan library ComObj
    ShowMessage('Proses menyambungkan ke database gagal dilakukan');
  end;
end;

end;

procedure Tfrm_import.Button2Click(Sender: TObject);
var i : integer;
begin
while not ADOTable1.Eof do
begin
    ProgressBar1.Max := ADOTable1.RecNo;
    DBGrid1.SelectedIndex := ADOTable1.RecNo;
    for i:= 0 to DBGrid1.Columns.Count-1 do
      //ShowMessage(DBGrid1.DataSource.DataSet.Fields[i].AsString);

    ADOTable1.Next;
    ProgressBar1.Position := ADOTable1.RecordCount;
end;
MessageDlg('Import data selesai!',mtInformation,[mbok],0);
Label3.Caption := 'Total Import :'+IntToStr(ADOTable1.RecordCount);
end;

end.
