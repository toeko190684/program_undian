object frm_hadiah: Tfrm_hadiah
  Left = 422
  Top = 207
  Width = 444
  Height = 387
  BorderIcons = [biSystemMenu]
  Caption = 'Form Hadiah'
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
  object DBGrid1: TDBGrid
    Left = 8
    Top = 200
    Width = 409
    Height = 137
    DataSource = DataSource1
    PopupMenu = PopupMenu1
    ReadOnly = True
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'no'
        Title.Alignment = taCenter
        Title.Caption = 'NO'
        Width = 20
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'hadiah'
        Title.Caption = 'HADIAH'
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'total'
        Title.Caption = 'TOTAL'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'counter'
        Title.Caption = 'COUNTER'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'no_urut'
        Title.Caption = 'NOMOR URUT'
        Visible = True
      end>
  end
  object GroupBox1: TGroupBox
    Left = 8
    Top = 16
    Width = 409
    Height = 177
    Caption = 'Form Hadiah'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 1
    object Label1: TLabel
      Left = 22
      Top = 32
      Width = 17
      Height = 13
      Caption = 'No'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label2: TLabel
      Left = 22
      Top = 56
      Width = 41
      Height = 13
      Caption = 'Hadiah'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label3: TLabel
      Left = 22
      Top = 80
      Width = 30
      Height = 13
      Caption = 'Total'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label4: TLabel
      Left = 22
      Top = 104
      Width = 45
      Height = 13
      Caption = 'Counter'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label5: TLabel
      Left = 22
      Top = 124
      Width = 65
      Height = 13
      Caption = 'Nomor Urut'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object edthadiah: TEdit
      Left = 94
      Top = 53
      Width = 121
      Height = 21
      TabOrder = 0
    end
    object msktotal: TMaskEdit
      Left = 94
      Top = 76
      Width = 121
      Height = 21
      TabOrder = 1
      Text = '0'
    end
    object mskcounter: TMaskEdit
      Left = 94
      Top = 97
      Width = 121
      Height = 21
      TabOrder = 2
      Text = '0'
    end
    object msknomorurut: TMaskEdit
      Left = 94
      Top = 118
      Width = 121
      Height = 21
      TabOrder = 3
      Text = '0'
    end
    object mskno: TMaskEdit
      Left = 94
      Top = 31
      Width = 121
      Height = 21
      TabOrder = 4
      Text = '0'
    end
    object Button1: TButton
      Left = 320
      Top = 144
      Width = 75
      Height = 25
      Caption = '&Save'
      TabOrder = 5
      OnClick = Button1Click
    end
  end
  object DataSource1: TDataSource
    DataSet = ADOTable1
    Left = 280
    Top = 104
  end
  object PopupMenu1: TPopupMenu
    Left = 280
    Top = 160
    object Edit1: TMenuItem
      Caption = 'Edit'
      OnClick = Edit1Click
    end
    object Delete1: TMenuItem
      Caption = 'Delete'
      OnClick = Delete1Click
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
    Left = 320
    Top = 104
  end
  object ADOTable1: TADOTable
    Active = True
    Connection = ADOConnection1
    CursorType = ctStatic
    TableName = 'tbl_hadiah'
    Left = 352
    Top = 104
  end
  object ADOTable2: TADOTable
    Active = True
    Connection = ADOConnection1
    CursorType = ctStatic
    TableName = 'tbl_hadiah'
    Left = 384
    Top = 104
  end
end
