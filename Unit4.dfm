object Form4: TForm4
  Left = 457
  Top = 270
  BorderStyle = bsToolWindow
  Caption = #1054#1087#1090#1080#1084#1080#1079#1072#1090#1086#1088' '#1088#1077#1077#1089#1090#1088#1072
  ClientHeight = 132
  ClientWidth = 213
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Button1: TButton
    Left = 112
    Top = 0
    Width = 97
    Height = 33
    Hint = #1055#1088#1080#1089#1090#1091#1087#1080#1090#1100' '#1082' '#1072#1074#1090#1086#1084#1072#1090#1080#1095#1077#1089#1082#1086#1081' '#1086#1087#1090#1080#1084#1080#1079#1072#1094#1080#1080
    Caption = #1054#1087#1090#1080#1084#1080#1079#1080#1088#1086#1074#1072#1090#1100
    ParentShowHint = False
    ShowHint = True
    TabOrder = 0
    OnClick = Button1Click
  end
  object CheckBox1: TCheckBox
    Left = 8
    Top = 96
    Width = 113
    Height = 17
    Hint = #1042#1099#1074#1077#1089#1090#1080' '#1086#1090#1095#1077#1090' '#1087#1086' '#1080#1079#1084#1077#1085#1077#1085#1080#1103#1084
    Caption = #1074#1099#1074#1086#1076#1080#1090#1100' '#1086#1090#1095#1077#1090
    ParentShowHint = False
    ShowHint = True
    TabOrder = 1
  end
  object Button2: TButton
    Left = 112
    Top = 40
    Width = 97
    Height = 33
    Hint = #1055#1077#1088#1077#1093#1086#1076' '#1085#1072' '#1088#1072#1089#1096#1080#1088#1077#1085#1085#1099#1081' '#1080#1085#1090#1077#1088#1092#1077#1081#1089' '#1087#1086#1083#1100#1079#1086#1074#1072#1090#1077#1083#1103
    Caption = #1056#1072#1089#1096#1080#1088#1080#1090#1100
    ParentShowHint = False
    ShowHint = True
    TabOrder = 2
    OnClick = Button2Click
  end
  object TrackBar1: TTrackBar
    Left = 16
    Top = 8
    Width = 41
    Height = 81
    Hint = #1042#1099#1073#1086#1088' '#1075#1083#1091#1073#1080#1085#1099' '#1086#1087#1090#1080#1084#1080#1079#1072#1094#1080#1080
    Max = 2
    Orientation = trVertical
    ParentShowHint = False
    ShowHint = True
    TabOrder = 3
    OnChange = TrackBar1Change
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 115
    Width = 213
    Height = 17
    Panels = <
      item
        Text = #1048#1079#1084#1077#1085#1077#1085#1080#1103
        Width = 100
      end
      item
        Text = #1052#1072#1082#1089#1080#1084#1072#1083#1100#1085#1099#1077
        Width = 100
      end>
  end
  object Button3: TButton
    Left = 112
    Top = 80
    Width = 97
    Height = 33
    Hint = #1042#1086#1089#1089#1090#1072#1085#1086#1074#1080#1090#1100' '#1080#1079' '#1088#1077#1079#1077#1088#1074#1085#1086#1081' '#1082#1086#1087#1080#1080
    Caption = #1042#1086#1089#1089#1090#1072#1085#1086#1074#1080#1090#1100
    ParentShowHint = False
    ShowHint = True
    TabOrder = 5
    OnClick = Button3Click
  end
  object XPManifest1: TXPManifest
    Left = 280
  end
end
