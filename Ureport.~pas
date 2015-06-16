unit Ureport;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DB, ADODB;

type
  Tfrm_report = class(TForm)
    GroupBox1: TGroupBox;
    ComboBox1: TComboBox;
    Button1: TButton;
    ADOConnection1: TADOConnection;
    ADOQuery1: TADOQuery;
    ADOQuery2: TADOQuery;
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_report: Tfrm_report;

implementation

uses Uqrtreport;

{$R *.dfm}

procedure Tfrm_report.FormCreate(Sender: TObject);
begin
  ComboBox1.Items.Add('All');
  ADOQuery1.close;
  ADOQuery1.SQL.Clear;
  ADOQuery1.SQL.add('select hadiah from tbl_hadiah order by no_urut');
  ADOQuery1.open;
  while not ADOQuery1.Eof do
  begin
      ComboBox1.Items.Add(ADOQuery1.fieldbyname('hadiah').AsString);
      ADOQuery1.Next;
  end;
end;

procedure Tfrm_report.Button1Click(Sender: TObject);
var sql : string;
begin
if(ComboBox1.Text = 'All')then
  sql := 'select * from tbl_nomor where tbl_nomor.hadiah<>""'
else
  sql := 'select * from tbl_nomor where tbl_nomor.hadiah='+QuotedStr(ComboBox1.Text);
  
ADOQuery2.Close;
ADOQuery2.SQL.Clear;
ADOQuery2.SQL.Add(sql);
ADOQuery2.Open;

qrt_pemenang.DataSet := ADOQuery2;
qrt_pemenang.QRLabel1.Caption := 'Laporan Pemenang '+ComboBox1.Text;
qrt_pemenang.QRDBText1.DataSet := ADOQuery2;
qrt_pemenang.QRDBText1.DataField := 'no_undian';
qrt_pemenang.QRDBText2.DataSet := ADOQuery2;
qrt_pemenang.QRDBText2.DataField := 'Sub Dist';
qrt_pemenang.QRDBText3.DataSet := ADOQuery2;
qrt_pemenang.QRDBText3.DataField := 'nama_toko';
qrt_pemenang.QRDBText4.DataSet := ADOQuery2;
qrt_pemenang.QRDBText4.DataField := 'group';
qrt_pemenang.QRDBText5.DataSet := ADOQuery2;
qrt_pemenang.QRDBText5.DataField := 'hadiah';
qrt_pemenang.QRDBText6.DataSet := ADOQuery2;
qrt_pemenang.QRDBText6.DataField := 'counter';
qrt_pemenang.Preview;

end;

end.
