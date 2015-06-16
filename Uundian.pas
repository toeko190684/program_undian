unit Uundian;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, DB, ADODB, Grids, DBGrids, ComCtrls, jpeg,
  Menus;

type
  Tfrm_undian = class(TForm)
    DataSource1: TDataSource;
    Panel1: TPanel;
    RadioGroup1: TRadioGroup;
    Button1: TButton;
    Panel2: TPanel;
    Label1: TLabel;
    DBGrid1: TDBGrid;
    Panel3: TPanel;
    Panel4: TPanel;
    Panel5: TPanel;
    Panel6: TPanel;
    Panel7: TPanel;
    Panel8: TPanel;
    Panel9: TPanel;
    Timer1: TTimer;
    StatusBar1: TStatusBar;
    Timer2: TTimer;
    Panel10: TPanel;
    Image1: TImage;
    ComboBox1: TComboBox;
    ADOConnection1: TADOConnection;
    ADOQuery2: TADOQuery;
    ADOQuery1: TADOQuery;
    ADOQuery3: TADOQuery;
    Button2: TButton;
    ADOQuery4: TADOQuery;
    Label2: TLabel;
    PopupMenu1: TPopupMenu;
    Setting1: TMenuItem;
    abelUndian1: TMenuItem;
    abelHadiah1: TMenuItem;
    ImportXLS1: TMenuItem;
    Report1: TMenuItem;
    Timer3: TTimer;
    Timer4: TTimer;
    Timer5: TTimer;
    ResetAll1: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure Timer2Timer(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure abelHadiah1Click(Sender: TObject);
    procedure abelUndian1Click(Sender: TObject);
    procedure Report1Click(Sender: TObject);
    procedure ImportXLS1Click(Sender: TObject);
    procedure Timer3Timer(Sender: TObject);
    procedure ResetAll1Click(Sender: TObject);
    procedure Timer5Timer(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_undian: Tfrm_undian;
  kotak1, kotak2,kotak3,kotak4,kotak5,kotak6,kotak7 : integer;

implementation

uses Math, Uhadiah, Unomor_undian, Ureport, Uimport;

{$R *.dfm}

procedure Tfrm_undian.FormCreate(Sender: TObject);
begin
  kotak1 := 0;
  kotak2 := 2;
  kotak3 := 4;
  kotak4 := 6;
  kotak5 := 1;
  kotak6 := 3;
  kotak7 := 5;

  //tampilkan combobox
  ADOQuery2.close;
  ADOQuery2.SQL.Clear;
  ADOQuery2.SQL.add('select hadiah from tbl_hadiah order by no_urut');
  ADOQuery2.open;
  while not ADOQuery2.Eof do
  begin
      ComboBox1.Items.Add(ADOQuery2.fieldbyname('hadiah').AsString);
      ADOQuery2.Next;
  end;
end;

procedure Tfrm_undian.Button1Click(Sender: TObject);
begin
Timer5.Enabled := false;
//jika combobox belum dipilih maka munculkan pesan
if(ComboBox1.Text='')then
  MessageDlg('Anda harus memilih hadiah terlebih dahulu!!',mtWarning,[mbOK],0)
else
begin
  //lakukan pengecekan untuk hadiah tersebut apakah sudah punya pemenang semua atau tidak
  ADOQuery3.Close;
  ADOQuery3.SQL.Clear;
  ADOQuery3.SQL.Add('select * from tbl_hadiah where hadiah='+QuotedStr(ComboBox1.Text));
  ADOQuery3.Open;
  if(ADOQuery3.FieldByName('total').AsInteger = ADOQuery3.FieldByName('counter').AsInteger) then
      begin
          MessageDlg('Hadiah '+ComboBox1.Text+' sudah habis !!',mtInformation,[mbOK],0);
      end
  else
      begin
          if(Button1.Caption = 'START') then
            BEGIN
              timer1.Interval := 50;
              timer3.Interval := 50;
              Timer1.Enabled := true;
              Timer3.Enabled := true;
              Button1.Caption := 'STOP' ;
              Button1.Font.Color := clRed;
              Label2.Caption := '';
          end
        else
          begin
           Button1.Caption := 'START' ;
           Button1.Font.Color := clGreen;
           timer1.Enabled :=false;
           Button2Click(sender);
         end;
     end;
  end;
end;


procedure Tfrm_undian.Timer1Timer(Sender: TObject);
begin
  // perhitungan untuk kotak ke 1
  if(kotak1>=9)then
      kotak1 := 0
  else
      kotak1 := kotak1 +1;

  Panel3.Caption := IntToStr(kotak1);

  // perhitungan untuk kotak ke 3
  if(kotak3>=9)then
      kotak3 := 0
  else
      kotak3 := kotak3 +1;
  Panel5.Caption := IntToStr(kotak3);

  // perhitungan untuk kotak ke 4
  if(kotak4>=9)then
      kotak4 := 0
  else
      kotak4 := kotak4 +1;
  Panel6.Caption := IntToStr(kotak4);

  // perhitungan untuk kotak ke 5
  if(kotak5>=9)then
      kotak5 := 0
  else
      kotak5 := kotak5 +1;
  Panel7.Caption := IntToStr(kotak5);

  // perhitungan untuk kotak ke 6
  if(kotak6>=9)then
      kotak6 := 0
  else
      kotak6 := kotak6 +1;
  Panel8.Caption := IntToStr(kotak6);

  // perhitungan untuk kotak ke 7
  if(kotak7>=9)then
      kotak7 := 0
  else
      kotak7 := kotak7 +1;
  Panel9.Caption := IntToStr(kotak7);

end;

procedure Tfrm_undian.Timer2Timer(Sender: TObject);
begin
StatusBar1.Panels.Items[0].Text := 'Date : '+DateToStr(date)+' Jam :'+TimeToStr(date);
end;

procedure Tfrm_undian.ComboBox1Change(Sender: TObject);
begin
Timer5.Enabled := false;
Button1.SetFocus;
end;

procedure Tfrm_undian.Button2Click(Sender: TObject);
var sql,nomor : string; i : integer;
begin
//cek dulu hadiahnya masuk hadiah utama atau tidak
ADOQuery2.Close;
ADOQuery2.SQL.Clear;
ADOQuery2.SQL.Add('select no_urut from tbl_hadiah where hadiah='+QuotedStr(ComboBox1.Text));
ADOQuery2.Open;

if(ADOQuery2.FieldByName('no_urut').AsInteger = 1 ) then
    begin
        sql := 'select  top 1 *  from tbl_nomor where tbl_nomor.group=1 and tbl_nomor.hadiah is null   order by rnd(no_undian)';
    end
else
    begin
        sql := 'select top 1 * from tbl_nomor where counter<2 and tbl_nomor.hadiah is null order by rnd(no_undian)';
    end;

ADOQuery3.Close;
ADOQuery3.SQL.Clear;
ADOQuery3.SQL.Add(sql);
ADOQuery3.Open;
nomor := IntToStr(ADOQuery3.fieldbyname('no_undian').AsInteger);


Panel3.Caption := copy(nomor,1,1);
Timer1.Enabled := false;
Timer3.Enabled := false;
Panel4.Caption := copy(nomor,2,1);
Panel5.Caption := copy(nomor,3,1);
Panel6.Caption := copy(nomor,4,1);
Panel7.Caption := copy(nomor,5,1);
Panel8.Caption := copy(nomor,6,1);
Panel9.Caption := copy(nomor,7,1);   

label2.Caption := ADOQuery3.fieldbyname('nama_toko').AsString;
Timer5.Enabled := true;

//update ke table nomor  , hadiah yang didapat nomor undian
ADOQuery4.Close;
ADOQuery4.SQL.Clear;
ADOQuery4.SQL.Add('update tbl_nomor set tbl_nomor.hadiah='+QuotedStr(ComboBox1.Text)+' where tbl_nomor.no_undian='+nomor);
ADOQuery4.ExecSQL;

//update ke table nomor untuk counter pemilik toko sudah menang berapa x
ADOQuery4.Close;
ADOQuery4.SQL.Clear;
ADOQuery4.SQL.Add('update tbl_nomor set tbl_nomor.counter= counter +1  where tbl_nomor.nama_toko='+QuotedStr(ADOQuery3.fieldbyname('nama_toko').AsString));
ADOQuery4.ExecSQL;

//update juga untuk field counter di tabel hadiah
ADOQuery4.Close;
ADOQuery4.SQL.Clear;
ADOQuery4.SQL.Add('update tbl_hadiah set tbl_hadiah.counter=counter+1 where tbl_hadiah.hadiah='+QuotedStr(ComboBox1.Text));
ADOQuery4.ExecSQL;

//refresh winner list
ADOQuery2.Close;
ADOQuery2.SQL.Clear;
ADOQuery2.SQL.Add('select * from tbl_nomor where hadiah<>""');
ADOQuery2.Open;
DataSource1.DataSet := ADOQuery2;
DBGrid1.DataSource := DataSource1;
DBGrid1.Refresh;

end;

procedure Tfrm_undian.abelHadiah1Click(Sender: TObject);
begin
  frm_hadiah.ShowModal;
end;

procedure Tfrm_undian.abelUndian1Click(Sender: TObject);
begin
frm_nomorundian.ShowModal;
end;

procedure Tfrm_undian.Report1Click(Sender: TObject);
begin
  frm_report.ShowModal;
end;

procedure Tfrm_undian.ImportXLS1Click(Sender: TObject);
begin
frm_import.ShowModal;
end;

procedure Tfrm_undian.Timer3Timer(Sender: TObject);
begin
// perhitungan untuk kotak ke 2
  if(kotak2>=9)then
      kotak2 := 0
  else
      kotak2 := kotak2 +1;
  Panel4.Caption := IntToStr(kotak2);
end;

procedure Tfrm_undian.ResetAll1Click(Sender: TObject);
begin
if MessageDlg('Reset All Akan Menghapus Semua Data Pemenang!!'+#13#10+'Yakin Akan Mereset Data?',mtWarning,[mbYes,mbNo],0)= mrYes then
begin
  try
    //reset tabel tbl_nomor
    ADOQuery4.Close;
    ADOQuery4.SQL.Clear;
    ADOQuery4.SQL.Add('update tbl_nomor set tbl_nomor.hadiah=Null, tbl_nomor.counter=0');
    ADOQuery4.ExecSQL;

   //reset tabel tbl_hadiah
    ADOQuery4.Close;
    ADOQuery4.SQL.Clear;
    ADOQuery4.SQL.Add('update tbl_hadiah set tbl_hadiah.counter=0');
    ADOQuery4.ExecSQL;

    //refresh winner list
    ADOQuery2.Close;
    ADOQuery2.SQL.Clear;
    ADOQuery2.SQL.Add('select * from tbl_nomor where hadiah<>""');
    ADOQuery2.Open;
    DataSource1.DataSet := ADOQuery2;
    DBGrid1.DataSource := DataSource1;
    DBGrid1.Refresh;

    Panel3.Caption := '0';
    Panel4.Caption := '0';
    Panel5.Caption := '0';
    Panel6.Caption := '0';
    Panel7.Caption := '0';
    Panel8.Caption := '0';
    Panel9.Caption := '0';
    Label2.Caption := '';
  finally
    MessageDlg('Data Pemenang Sudah Direset!',mtInformation,[mbok],0);
  end;
end;
end;

procedure Tfrm_undian.Timer5Timer(Sender: TObject);
begin
if label2.Visible then label2.Visible := false
else Label2.Visible := true;
end;

end.
