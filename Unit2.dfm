object Form2: TForm2
  Left = 326
  Top = 151
  BorderStyle = bsDialog
  Caption = #1082#1086#1085#1089#1090#1088#1091#1082#1090#1086#1088
  ClientHeight = 419
  ClientWidth = 315
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  OnShow = zapoln
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 8
    Width = 103
    Height = 13
    Caption = #1053#1072#1079#1074#1072#1085#1080#1077'  '#1095#1077#1082#1073#1086#1082#1089#1072
  end
  object Label2: TLabel
    Left = 8
    Top = 48
    Width = 81
    Height = 13
    Caption = #1056#1072#1079#1076#1077#1083' '#1088#1077#1077#1089#1090#1088#1072
  end
  object Label3: TLabel
    Left = 8
    Top = 88
    Width = 97
    Height = 13
    Caption = #1055#1091#1090#1100' '#1076#1086' '#1087#1072#1088#1072#1084#1077#1090#1088#1072
  end
  object Label4: TLabel
    Left = 8
    Top = 128
    Width = 77
    Height = 13
    Caption = #1058#1080#1087' '#1087#1072#1088#1072#1084#1077#1090#1088#1072
  end
  object Label5: TLabel
    Left = 8
    Top = 168
    Width = 54
    Height = 13
    Caption = #1055#1072#1088#1072#1084#1077#1090#1088' '
  end
  object Label6: TLabel
    Left = 8
    Top = 208
    Width = 57
    Height = 13
    Caption = #1047#1085#1072#1095#1077#1085#1080#1077' 1'
  end
  object Label7: TLabel
    Left = 8
    Top = 248
    Width = 57
    Height = 13
    Caption = #1047#1085#1072#1095#1077#1085#1080#1077' 2'
  end
  object Label8: TLabel
    Left = 8
    Top = 296
    Width = 53
    Height = 13
    Caption = #1054#1087#1080#1089#1072#1085#1080#1077' '
  end
  object Button1: TButton
    Left = 208
    Top = 376
    Width = 89
    Height = 25
    Caption = #1055#1088#1080#1084#1077#1085#1080#1090#1100
    TabOrder = 0
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 16
    Top = 376
    Width = 81
    Height = 25
    Caption = #1054#1090#1084#1077#1085#1072
    TabOrder = 1
    OnClick = Button2Click
  end
  object Edit1: TEdit
    Left = 8
    Top = 24
    Width = 297
    Height = 21
    TabOrder = 2
    Text = 'Edit1'
  end
  object Edit3: TEdit
    Left = 8
    Top = 104
    Width = 297
    Height = 21
    TabOrder = 3
    Text = 'Edit3'
  end
  object ComboBox1: TComboBox
    Left = 8
    Top = 144
    Width = 161
    Height = 21
    ItemHeight = 13
    TabOrder = 4
    Text = 'ComboBox1'
    Items.Strings = (
      'DWORD'
      'STRING')
  end
  object Edit4: TEdit
    Left = 8
    Top = 184
    Width = 297
    Height = 21
    TabOrder = 5
    Text = 'Edit4'
  end
  object Edit5: TEdit
    Left = 8
    Top = 224
    Width = 297
    Height = 21
    TabOrder = 6
    Text = 'Edit5'
  end
  object Edit6: TEdit
    Left = 8
    Top = 264
    Width = 297
    Height = 21
    TabOrder = 7
    Text = 'Edit6'
  end
  object Edit7: TEdit
    Left = 8
    Top = 312
    Width = 297
    Height = 49
    AutoSize = False
    TabOrder = 8
    Text = 'Edit7'
  end
  object ComboBox2: TComboBox
    Left = 8
    Top = 64
    Width = 297
    Height = 21
    ItemHeight = 13
    TabOrder = 9
    Text = 'ComboBox2'
    Items.Strings = (
      'HKEY_CURRENT_USER'
      'HKEY_LOCAL_MACHINE'
      'HKEY_CLASSES_ROOT'
      'HKEY_USERS'
      'HKEY_CURRENT_CONFIG')
  end
end
