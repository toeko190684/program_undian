object frm_report: Tfrm_report
  Left = 466
  Top = 375
  Width = 328
  Height = 139
  Caption = 'Report'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox1: TGroupBox
    Left = 6
    Top = 8
    Width = 297
    Height = 81
    Caption = 'Cetak Pemenang'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    object ComboBox1: TComboBox
      Left = 20
      Top = 35
      Width = 169
      Height = 26
      ItemHeight = 18
      TabOrder = 0
      Text = 'All'
    end
    object Button1: TButton
      Left = 204
      Top = 35
      Width = 75
      Height = 25
      Caption = '&Print'
      TabOrder = 1
      OnClick = Button1Click
    end
  end
  object ADOConnection1: TADOConnection
    Connected = True
    ConnectionString = 
      'Provider=Microsoft.Jet.OLEDB.4.0;User ID=Admin;Data Source=.\dbu' +
      'ndian.mdb;Mode=Share Deny None;Persist Security Info=False;Jet O' +
      'LEDB:System database="";Jet OLEDB:Registry Path="";Jet OLEDB:Dat' +
      'abase Password="";Jet OLEDB:Engine Type=5;Jet OLEDB:Database Loc' +
      'king Mode=1;Jet OLEDB:Global Partial Bulk Ops=2;Jet OLEDB:Global' +
      ' Bulk Transactions=1;Jet OLEDB:New Database Password="";Jet OLED' +
      'B:Create System Database=False;Jet OLEDB:Encrypt Database=False;' +
      'Jet OLEDB:Don'#39't Copy Locale on Compact=False;Jet OLEDB:Compact W' +
      'ithout Replica Repair=False;Jet OLEDB:SFP=False'
    LoginPrompt = False
    Mode = cmShareDenyNone
    Provider = 'Microsoft.Jet.OLEDB.4.0'
    Left = 158
    Top = 8
  end
  object ADOQuery1: TADOQuery
    Connection = ADOConnection1
    Parameters = <>
    Left = 190
    Top = 8
  end
  object ADOQuery2: TADOQuery
    Connection = ADOConnection1
    Parameters = <>
    Left = 222
    Top = 8
  end
end
