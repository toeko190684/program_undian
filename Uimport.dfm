object frm_import: Tfrm_import
  Left = 407
  Top = 197
  Width = 594
  Height = 460
  Caption = 'Form Import Data XLS'
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
  object GroupBox1: TGroupBox
    Left = 8
    Top = 8
    Width = 553
    Height = 81
    Caption = 'Pilih Data XLS'
    TabOrder = 0
    object Label2: TLabel
      Left = 16
      Top = 27
      Width = 44
      Height = 13
      Caption = 'Path File '
    end
    object Label4: TLabel
      Left = 16
      Top = 54
      Width = 54
      Height = 13
      Caption = 'Pilih $sheet'
    end
    object Edit1: TEdit
      Left = 96
      Top = 24
      Width = 289
      Height = 21
      TabOrder = 0
    end
    object Button1: TButton
      Left = 389
      Top = 21
      Width = 25
      Height = 25
      Caption = ':::'
      TabOrder = 1
      OnClick = Button1Click
    end
    object Button3: TButton
      Left = 224
      Top = 49
      Width = 75
      Height = 25
      Caption = 'Load XLS'
      TabOrder = 2
      OnClick = Button3Click
    end
    object ComboBox1: TComboBox
      Left = 96
      Top = 50
      Width = 113
      Height = 21
      ItemHeight = 13
      TabOrder = 3
      Items.Strings = (
        'hadiah$'
        'nomor$')
    end
    object Button2: TButton
      Left = 454
      Top = 24
      Width = 75
      Height = 25
      Caption = 'Import >>'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 4
      OnClick = Button2Click
    end
  end
  object GroupBox2: TGroupBox
    Left = 8
    Top = 129
    Width = 553
    Height = 286
    Caption = 'Source Table'
    TabOrder = 1
    object Label1: TLabel
      Left = 17
      Top = 248
      Width = 68
      Height = 13
      Caption = 'Total Record :'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label3: TLabel
      Left = 328
      Top = 248
      Width = 62
      Height = 13
      Caption = 'Total Import :'
    end
    object DBGrid1: TDBGrid
      Left = 16
      Top = 24
      Width = 521
      Height = 209
      DataSource = DataSource1
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
    end
  end
  object ProgressBar1: TProgressBar
    Left = 8
    Top = 100
    Width = 553
    Height = 18
    Smooth = True
    TabOrder = 2
  end
  object OpenDialog1: TOpenDialog
    Filter = '*.xls|*.xls'
    Left = 400
    Top = 192
  end
  object ADOConnection1: TADOConnection
    ConnectionString = 
      'Provider=Microsoft.Jet.OLEDB.4.0;Data Source=.;Persist Security ' +
      'Info=False'
    LoginPrompt = False
    Mode = cmShareDenyNone
    Provider = 'Microsoft.Jet.OLEDB.4.0'
    Left = 280
    Top = 193
  end
  object ADOTable1: TADOTable
    Connection = ADOConnection1
    CursorType = ctStatic
    TableDirect = True
    TableName = 'hadiah$'
    Left = 320
    Top = 193
  end
  object DataSource1: TDataSource
    DataSet = ADOTable1
    Left = 360
    Top = 193
  end
end
