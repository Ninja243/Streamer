object DBEditor: TDBEditor
  Left = 0
  Top = 0
  Caption = 'StreamerDB Editor'
  ClientHeight = 407
  ClientWidth = 748
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnActivate = FormActivate
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Tabzz: TPageControl
    Left = 0
    Top = 0
    Width = 748
    Height = 407
    ActivePage = DBTab
    Align = alClient
    TabOrder = 0
    object Login: TTabSheet
      Caption = 'Login'
      object UsernameLabel: TLabel
        Left = 24
        Top = 147
        Width = 52
        Height = 13
        Caption = 'Username:'
      end
      object PasswordLabel: TLabel
        Left = 24
        Top = 187
        Width = 50
        Height = 13
        Caption = 'Password:'
      end
      object StreamerLogo: TImage
        Left = 540
        Top = -8
        Width = 206
        Height = 208
        Picture.Data = {
          0954506E67496D61676589504E470D0A1A0A0000000D49484452000000C80000
          00C80806000000AD58AE9E000000017352474200AECE1CE90000000467414D41
          0000B18F0BFC6105000000097048597300000EC300000EC301C76FA864000000
          1974455874536F667477617265007061696E742E6E657420342E302E31333403
          5B7A000009C74944415478DAEDDDCD8B144718C7F152160C9277140D248740E7
          963F4021C27A08087A480E8108F1E0DD60F6D0A01889100541452139780C2824
          07410F0A420E0A2E247F80B7083964212B2CD1A8040F01F3D4D674AAC7997D76
          B6ABFAADFAFB81A7975DD99A1E7B7FD3D5DDD5D59B5EBC7861004CB78980006B
          2320808280000A0202280808A02020808280000A0202280808A0202080828000
          0A0202280808A02020808280000A0202280808A02020808280000A0202280808
          A02020A84F9ECDC97297D4BCD40EA977A5768EBEDA5A1AD5F2E8EB43A9C5D53A
          F7E0DFB657DF2220882BCF5E95E501A9FD52FBA4B655686545EAB6D42DA99B12
          96676DBD1D028238F2CC06E184D411A9B9D2BF3C92DA22B5758656FE917A2EF5
          76E967F6FBCB526724282B4DBF2D02823079F68A2C8F491D957A73F4D32752AF
          4768BDDCCE63A90B52E72528CF9B7A7BDD0D4802FDD7E4E5D9E7B2BC68DC76B1
          6205E365E576EDF65E906DFC53136FB15B0149ACFF9AB43CFB56965F8FBE7B2A
          F55A03AF5A7E9DD3B26D4FD6FD82DD0848A2FDD724B90FB12B529F48D93F9E4D
          2DAC45F1BA37A40ED5F921D86E4012EFBF2627CF6C57EA67A90FA56C37762EAC
          C120C5EBDF97FA58B6EB721D2FD25E4006D07F4D8ADB73FC625C38ECDE7A96BD
          7ADD8AF5B021D95DC79EA49D800CA4FF9A943CBB6E5CB7AA2BE12814EB7343B6
          E9A7B11B6F362003EBBF26C37FA0B5DDAD5A4BB15ED13FF89A0BC800FBAF4970
          5DE11F4D7B1F68B32AD6EF60CC2E7433011968FFB5F7DC4994DF8D3F4EEC03FB
          61F77EAC93314D056490FDD7DECBB353B2FCC634779C18AA58CF93B23D4FC768
          B0FE800CB8FFDA6BEEDAD46FC69F7EEF137B5AFF8318D7BEEA0DC8C0FBAFBD96
          67F614FC57A6BED3EF7529D6F7926CCB85D0C6EA0B08FDD7FE72C78C76144317
          F7F8B3B2DB707BE8B1659D01396506DE7FED2DBFE7EFDBDEA350ACF767B22DAF
          8534544F40E8BFF65B9ED96B555FB4BD1A11FC20DBF1704803750584FE6B5FB9
          DB0CFE34D5465277CD8A6CC7ED210DC40F08FDD77ECBB38F6479CFB86DF856DB
          AB13A058FF3DB21D17AB36524740E8BFF6599ED953F2F6D47CD7AE596D54B1FE
          C7653B9EADDA481D01A1FFDA6779F69D71F7E5A4E27BD98E5F56FDE5B801A1FF
          DA7F7ED4432A824649C40E482AFD57A4E35709C8EEAABF1C3B20A9F45F918E25
          09C87B557F39764052EBBF2205E71E541EE6143B20A9F55FD17F9DDA83D87B3E
          76B5FD3F029474EA18E40FE3267503BAA25367B13A30C91630A653D74152DB83
          04F55F7B299D3391C5FA078DCEE6184417D47FEDA53C9B97E51DA9BFCCF82C95
          7D53ACFF5ED98677AB36C2592CDDF0EE554F6D348431EF844C66CE75105D50FF
          B5B7D2194F7755B6DFA19006B8923E5D94FE6B6FA533223B788E81D8019937F4
          5FFBCFDFD3B379547DD4C17BD2E9BFA6C3DF15FAB7D41B6DAFCE06747C5613FA
          AF69605E8155DC5138295AFFB5F79899A6D67BD207DF7FED3DE636AB7D569341
          F75F9330F0D93199176B12F362BD6CC0F32B33B3A2C7CC8A9A81CED0CFDCBCE3
          989B772D037DC60BB3BB3BCCEE3E8B013E258CE783F07C908D19D8732679C214
          4F98AA66204F2AE619853CA3B0BA013CEB9EA7DCF294DB30EE64CC31A9A3C69F
          D68F1594723BF6F4FB05A9F34D9E44E139E9EC39E270D7BE4E18773F50F9C3CF
          8EAAD86266EB35D8BDBAFDE32F8F04B7DF5F963AD3C6B5A96603521848FF7590
          DC87E001A9FD52FB4CB591DD3608B7A56E49DD6CF343AC9D805803E8BF0E9EBB
          FDC1CE51302FB5C3B8093DB45BB2ED87D6E26A75E43683F6026225DE7FC514DA
          D450015384D6A5DD801412EDBF620A021220B1FE2BA62020914CEFBFEE1C7DB5
          B534AAE5D1D787A663FD574C4140000501011404045010104041400005010114
          0404501010404140000501011404045010104041400005010114040450101040
          4140000501011404045010104041400005010114040450101040414000050101
          1404045010104041400005010114040450101040414000050101140404501010
          40414000050101140404501010C068CFB9DFA5FCD65ED3B1E7DC1310C49367AF
          CAF280D47EA97D52DB2AB4B222755BEA96D44D09CBB336DF120141B83CB34138
          2175446AAEF42F8FA4B6486D9DB1A5BFA4DE2E7DFF5CEAB2D41909CA4A1B6F8D
          80A0BA3C7B4596C7A48E4ABD39FAE913A9D723B45E6EE7B1D405A9F31294E74D
          BE4502826AF2EC73595E34EEB8C28A158C9795DB5D965A9090FCD4D4DB2420D8
          B83CFB56965F8FBE7B2AF55A03AF5A7E9DD31292934DBC550282D9B983F02B52
          9F48D93F9C364ECB16AF7B43EA50DD07F10404B3C933DB95FA59EA43297B1A76
          2EACC120C5EBDF97FA5842B25CD70B1110ACCFED397E312E1CFF98D9CF4AD5A9
          580F1B92DD75ED490808D69767D78DEB5675251C85627D6E48403EADE3050808
          74FE80BCED6ED55A8AF5AAE5C09D80606DEE54EE8FA6BD03F25915EB7730F629
          600282E9DC45C0DF8DBFCED107F660FDFD9817130908A6CBB353B2FCC634779D
          2354B19E272520A763354A4030C98DADFACDF8E1237D6287A57C106BEC1601C1
          A43CB34348BE32F50D1FA94BB1BE9724200B311A242018E7AE79D851B85D3C63
          352B7B0CB23DC6B511028271FECC55DFF61E8562BD3F93805C0B6D8C80605C9E
          D9B1565FB4BD1A11FC2001391CDA080181E76E93FDD354BB13B06B562420DB43
          1B2120F0F2EC2359DE33EE18E4ADB6572740B1FE7B24248B210D111078796687
          94D8A1255D1B73B551C5FA1F97809C0D698880C0CBB3EF8CBBAF3C15DF4B40BE
          0C698080C0F3A37653113CCA9780C0CB337BCFC7AEE076BAE35709C8EE900608
          08BC3CFBC3B809DE52B12401792FA40102024F9B16B4AF02A7332520F0D8834C
          2020F03806994040E071166B020181C775900904045E7A57D283EF2E2420F0F2
          6C5E9677CCE42CEB7D53ACFF5E09C8DD90860808BCD446F31AF34EE8C3780808
          C6A5733FC85509C7A1D0460808C6A57347619439B20808C6F97BD2378FAA8FB8
          271D35F2B39AFC2DF546DBABB301CC6A8206302FD6FF0808A66366C5550404D3
          3137EF2A0282B531BB3B01C13A783E0801C13A78C214A0E01985C03A78CA2DB0
          0E9E930ECCC01FB85B4D5D2729BF4E2D07E4D3101054E34E01DB2129C57592BA
          063796DBB55DA985D8A772350404D5B98B89C7A48E1A3F2C255650CAEDD8E123
          17A4CEC7BC08380B0282706EECD609E3EE672F1FBCDB51C15BCC6C67BDEC5929
          FBC75FBE93D17E7F59EA4CACB1551B4540108F3B883F20B55F6A9FA97667A20D
          C26DA95B5237EB3E085F0F01413DDCEDBB768EAD79A91DC64D48B773F4D5D6D2
          A896475F1F4A2DAE56E06DB23111104041400005010114040450101040414000
          0501011404045010104041400005010114040450101040414000050101140404
          5010104041400005010114040450101040414000050101140404501010404140
          0005010114040450101040F11F82795ECBDB37C5A40000000049454E44AE4260
          82}
        OnClick = StreamerLogoClick
      end
      object UsernameField: TEdit
        Left = 160
        Top = 144
        Width = 177
        Height = 21
        TabOrder = 0
      end
      object PasswordField: TEdit
        Left = 160
        Top = 184
        Width = 177
        Height = 21
        PasswordChar = '#'
        TabOrder = 1
      end
      object StreamerHeader: TPanel
        Left = -28
        Top = 19
        Width = 461
        Height = 54
        BevelOuter = bvNone
        Caption = 'STREAMER [BETA]'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 27612
        Font.Height = -43
        Font.Name = 'Fixedsys'
        Font.Style = []
        ParentFont = False
        TabOrder = 2
      end
      object CloseButton: TPanel
        Left = 640
        Top = 344
        Width = 97
        Height = 33
        Caption = 'Close'
        TabOrder = 3
        OnClick = CloseButtonClick
      end
      object LogInButton: TPanel
        Left = 160
        Top = 234
        Width = 97
        Height = 33
        Caption = 'Log In'
        TabOrder = 4
        OnClick = LogInButtonClick
        OnMouseEnter = LogInButtonMouseEnter
        OnMouseLeave = LogInButtonMouseLeave
      end
    end
    object DBTab: TTabSheet
      Caption = 'Streamer.mdb'
      Enabled = False
      ImageIndex = 1
      object DBGrid1: TDBGrid
        Left = 24
        Top = 73
        Width = 689
        Height = 249
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
      end
      object UsersDBButton: TPanel
        Left = 24
        Top = 15
        Width = 97
        Height = 33
        Caption = 'Users'
        TabOrder = 1
        OnClick = UsersDBButtonClick
        OnMouseEnter = LogInButtonMouseEnter
        OnMouseLeave = LogInButtonMouseLeave
      end
      object MoviesDBButton: TPanel
        Left = 127
        Top = 15
        Width = 97
        Height = 33
        Caption = 'Movies'
        TabOrder = 2
        OnClick = MoviesDBButtonClick
        OnMouseEnter = LogInButtonMouseEnter
        OnMouseLeave = LogInButtonMouseLeave
      end
      object DeleteButton: TPanel
        Left = 616
        Top = 15
        Width = 97
        Height = 33
        Caption = 'Delete'
        TabOrder = 3
        OnClick = DeleteButtonClick
        OnMouseEnter = LogInButtonMouseEnter
        OnMouseLeave = LogInButtonMouseLeave
      end
      object Navigator: TDBNavigator
        Left = 24
        Top = 344
        Width = 240
        Height = 32
        TabOrder = 4
      end
      object CloseButton2: TPanel
        Left = 640
        Top = 344
        Width = 97
        Height = 33
        Caption = 'Close'
        TabOrder = 5
        OnClick = CloseButtonClick
      end
      object RefreshButton: TPanel
        Left = 513
        Top = 15
        Width = 97
        Height = 33
        Caption = 'Refresh'
        TabOrder = 6
        OnClick = RefreshButtonClick
        OnMouseEnter = LogInButtonMouseEnter
        OnMouseLeave = LogInButtonMouseLeave
      end
      object AdminsBox: TCheckBox
        Left = 24
        Top = 328
        Width = 97
        Height = 17
        Caption = 'Admins Only'
        TabOrder = 7
        OnClick = AdminsBoxClick
      end
      object StatsButton: TPanel
        Left = 401
        Top = 15
        Width = 97
        Height = 33
        Caption = 'Stats'
        TabOrder = 8
        OnClick = StatsButtonClick
        OnMouseEnter = LogInButtonMouseEnter
        OnMouseLeave = LogInButtonMouseLeave
      end
      object GenreBox: TComboBox
        Left = 513
        Top = 328
        Width = 185
        Height = 21
        TabOrder = 9
        TextHint = 'Choose a genre to filter by here'
        OnChange = GenreBoxChange
        Items.Strings = (
          'Drama'#9#9#9
          'Romance'#9#9#9
          'Short'
          'Crime'#9#9#9
          'Thriller'#9#9
          'Action'
          'Fantasy'#9#9#9
          'Animation'#9#9
          'orror'
          'War'#9#9#9#9
          'Biography'#9#9
          'Sport'
          'Talk Show'#9#9
          'News'#9#9#9
          'Game Show'
          'Lo-Fi'#9#9#9
          'Comedy'#9#9#9
          'Mystery'
          'Family'#9#9#9
          'Adventure'#9#9
          'Sci-Fi'
          'History'#9#9#9
          'Documentary'#9#9
          'Music'
          'Musical'#9#9#9
          'Reality TV'#9#9
          'Western'
          'Noir')
      end
      object AddMoviePanel: TPanel
        Left = 270
        Top = 343
        Width = 97
        Height = 33
        Caption = 'Add Movie'
        TabOrder = 10
        OnClick = AddMoviePanelClick
        OnMouseEnter = LogInButtonMouseEnter
        OnMouseLeave = LogInButtonMouseLeave
      end
    end
  end
end
