object frm_nomorundian: Tfrm_nomorundian
  Left = 409
  Top = 235
  Width = 567
  Height = 389
  BorderIcons = [biSystemMenu]
  Caption = 'Form Undian'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  PixelsPerInch = 96
  TextHeight = 13
  object DBGrid1: TDBGrid
    Left = 8
    Top = 200
    Width = 529
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
        FieldName = 'no_undian'
        Title.Alignment = taCenter
        Title.Caption = 'No Undian'
        Width = 60
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Sub Dist'
        Width = 150
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'nama_toko'
        Title.Caption = 'Nama Toko'
        Width = 150
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'group'
        Title.Caption = 'No. Urut'
        Width = 50
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'hadiah'
        Title.Caption = 'Hadiah'
        Width = 80
        Visible = True
      end>
  end
  object GroupBox1: TGroupBox
    Left = 8
    Top = 16
    Width = 529
    Height = 177
    Caption = 'Form Nomor Undian'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 1
    object Label1: TLabel
      Left = 22
      Top = 34
      Width = 61
      Height = 13
      Caption = 'No Undian'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label2: TLabel
      Left = 22
      Top = 58
      Width = 49
      Height = 13
      Caption = 'Sub Dist'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label3: TLabel
      Left = 22
      Top = 82
      Width = 66
      Height = 13
      Caption = 'Nama Toko'
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
      Width = 39
      Height = 13
      Caption = 'Group '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label5: TLabel
      Left = 22
      Top = 130
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
    object msknoundian: TMaskEdit
      Left = 95
      Top = 31
      Width = 121
      Height = 21
      TabOrder = 0
      Text = '0'
    end
    object Button1: TButton
      Left = 440
      Top = 144
      Width = 75
      Height = 25
      Caption = '&Save'
      TabOrder = 1
      OnClick = Button1Click
    end
    object edtsubdist: TEdit
      Left = 96
      Top = 56
      Width = 201
      Height = 21
      TabOrder = 2
    end
    object edtnamatoko: TEdit
      Left = 96
      Top = 80
      Width = 201
      Height = 21
      TabOrder = 3
    end
    object cmbgroup: TComboBox
      Left = 96
      Top = 104
      Width = 57
      Height = 21
      ItemHeight = 13
      TabOrder = 4
      Items.Strings = (
        '1'
        '2')
    end
    object edthadiah: TEdit
      Left = 96
      Top = 128
      Width = 121
      Height = 21
      TabOrder = 5
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
    TableName = 'tbl_nomor'
    Left = 352
    Top = 104
  end
  object ADOTable2: TADOTable
    Active = True
    Connection = ADOConnection1
    CursorType = ctStatic
    TableName = 'tbl_nomor'
    Left = 384
    Top = 104
  end
end
