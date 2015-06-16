program Prj_undian;

uses
  Forms,
  Uundian in 'Uundian.pas' {frm_undian},
  Uhadiah in 'Uhadiah.pas' {frm_hadiah},
  Unomor_undian in 'Unomor_undian.pas' {frm_nomorundian},
  Ureport in 'Ureport.pas' {frm_report},
  Uimport in 'Uimport.pas' {frm_import},
  Uqrtreport in 'Uqrtreport.pas' {qrt_pemenang: TQuickRep};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(Tfrm_undian, frm_undian);
  Application.CreateForm(Tfrm_hadiah, frm_hadiah);
  Application.CreateForm(Tfrm_nomorundian, frm_nomorundian);
  Application.CreateForm(Tfrm_report, frm_report);
  Application.CreateForm(Tfrm_import, frm_import);
  Application.CreateForm(Tqrt_pemenang, qrt_pemenang);
  Application.Run;
end.
