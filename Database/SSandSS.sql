USE [master]
GO
/****** Object:  Database [SSandSS]    Script Date: 19/06/2017 2:04:22 CH ******/
CREATE DATABASE [SSandSS]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'SSandSS', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\SSandSS.mdf' , SIZE = 4160KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'SSandSS_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\SSandSS_log.ldf' , SIZE = 1040KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [SSandSS] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [SSandSS].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [SSandSS] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [SSandSS] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [SSandSS] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [SSandSS] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [SSandSS] SET ARITHABORT OFF 
GO
ALTER DATABASE [SSandSS] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [SSandSS] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [SSandSS] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [SSandSS] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [SSandSS] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [SSandSS] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [SSandSS] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [SSandSS] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [SSandSS] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [SSandSS] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [SSandSS] SET  DISABLE_BROKER 
GO
ALTER DATABASE [SSandSS] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [SSandSS] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [SSandSS] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [SSandSS] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [SSandSS] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [SSandSS] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [SSandSS] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [SSandSS] SET RECOVERY FULL 
GO
ALTER DATABASE [SSandSS] SET  MULTI_USER 
GO
ALTER DATABASE [SSandSS] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [SSandSS] SET DB_CHAINING OFF 
GO
ALTER DATABASE [SSandSS] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [SSandSS] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
EXEC sys.sp_db_vardecimal_storage_format N'SSandSS', N'ON'
GO
USE [SSandSS]
GO
/****** Object:  Table [dbo].[__MigrationHistory]    Script Date: 19/06/2017 2:04:22 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[__MigrationHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ContextKey] [nvarchar](300) NOT NULL,
	[Model] [varbinary](max) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK_dbo.__MigrationHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC,
	[ContextKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[AspNetRoles]    Script Date: 19/06/2017 2:04:22 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetRoles](
	[Id] [nvarchar](128) NOT NULL,
	[Name] [nvarchar](256) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetRoles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AspNetUserClaims]    Script Date: 19/06/2017 2:04:22 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [nvarchar](128) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_dbo.AspNetUserClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AspNetUserLogins]    Script Date: 19/06/2017 2:04:22 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserLogins](
	[LoginProvider] [nvarchar](128) NOT NULL,
	[ProviderKey] [nvarchar](128) NOT NULL,
	[UserId] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetUserLogins] PRIMARY KEY CLUSTERED 
(
	[LoginProvider] ASC,
	[ProviderKey] ASC,
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AspNetUserRoles]    Script Date: 19/06/2017 2:04:22 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserRoles](
	[UserId] [nvarchar](128) NOT NULL,
	[RoleId] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetUserRoles] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AspNetUsers]    Script Date: 19/06/2017 2:04:22 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUsers](
	[Id] [nvarchar](128) NOT NULL,
	[Email] [nvarchar](256) NULL,
	[EmailConfirmed] [bit] NOT NULL,
	[PasswordHash] [nvarchar](max) NULL,
	[SecurityStamp] [nvarchar](max) NULL,
	[PhoneNumber] [nvarchar](max) NULL,
	[PhoneNumberConfirmed] [bit] NOT NULL,
	[TwoFactorEnabled] [bit] NOT NULL,
	[LockoutEndDateUtc] [datetime] NULL,
	[LockoutEnabled] [bit] NOT NULL,
	[AccessFailedCount] [int] NOT NULL,
	[UserName] [nvarchar](256) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetUsers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[BinhLuan]    Script Date: 19/06/2017 2:04:22 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BinhLuan](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[idaccount] [nvarchar](128) NOT NULL,
	[idSP] [nchar](10) NOT NULL,
	[noidung] [nvarchar](2048) NOT NULL,
	[tinhtrang] [int] NOT NULL,
	[ngay] [datetime] NOT NULL,
 CONSTRAINT [PK_ThanhVien] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[GioHang]    Script Date: 19/06/2017 2:04:22 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GioHang](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[MaTK] [nvarchar](128) NOT NULL,
	[MaSp] [nchar](10) NOT NULL,
	[SoLuong] [int] NULL,
	[TongCong] [int] NULL,
	[NgayDat] [datetime] NULL,
	[TinhTrang] [int] NULL,
 CONSTRAINT [PK_GioHang] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[HinhAnh]    Script Date: 19/06/2017 2:04:22 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HinhAnh](
	[MaHinh] [int] IDENTITY(1,1) NOT NULL,
	[URL] [nchar](100) NULL,
	[MaSanPham] [nchar](10) NULL,
 CONSTRAINT [PK_HinhAnh] PRIMARY KEY CLUSTERED 
(
	[MaHinh] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[HoaDon]    Script Date: 19/06/2017 2:04:22 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HoaDon](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[MaKH] [nvarchar](128) NULL,
	[MaSP] [nchar](10) NULL,
	[SoLuong] [int] NULL,
	[TongTien] [int] NULL,
	[NgayThanhToan] [datetime] NULL,
 CONSTRAINT [PK_HoaDon] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[LoaiSanPham]    Script Date: 19/06/2017 2:04:22 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LoaiSanPham](
	[MaLoaiSP] [nchar](10) NOT NULL,
	[TenLoaiSanPham] [nvarchar](50) NULL,
	[TinhTrang] [int] NULL,
 CONSTRAINT [PK_LoaiSanPham] PRIMARY KEY CLUSTERED 
(
	[MaLoaiSP] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SanPham]    Script Date: 19/06/2017 2:04:22 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SanPham](
	[MaSanPham] [nchar](10) NOT NULL,
	[TenSanPham] [nvarchar](50) NULL,
	[MoTa] [nvarchar](max) NULL,
	[GiaTien] [int] NULL,
	[XuatXu] [nvarchar](50) NULL,
	[NhaSanXuat] [nvarchar](50) NULL,
	[MaLoaiSanPham] [nchar](10) NULL,
	[HinhAnh] [nchar](50) NULL,
	[TinhTrang] [int] NULL,
 CONSTRAINT [PK_SanPham] PRIMARY KEY CLUSTERED 
(
	[MaSanPham] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[UserInfo]    Script Date: 19/06/2017 2:04:22 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[UserInfo](
	[IdUser] [nvarchar](128) NOT NULL,
	[Ten] [nvarchar](70) NULL,
	[DienThoai] [varchar](11) NULL,
	[DiaChi] [nvarchar](128) NULL,
 CONSTRAINT [PK_UserInfo_1] PRIMARY KEY CLUSTERED 
(
	[IdUser] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  View [dbo].[V_Comment]    Script Date: 19/06/2017 2:04:22 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[V_Comment]
AS
SELECT       dbo.BinhLuan.noidung, dbo.BinhLuan.ngay, dbo.BinhLuan.idSP, dbo.UserInfo.Ten
FROM            dbo.AspNetUsers INNER JOIN
                         dbo.BinhLuan ON dbo.AspNetUsers.Id = dbo.BinhLuan.idaccount INNER JOIN
                         dbo.UserInfo ON dbo.AspNetUsers.Id = dbo.UserInfo.IdUser

GO
/****** Object:  View [dbo].[V_DonHang]    Script Date: 19/06/2017 2:04:22 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[V_DonHang]
AS
SELECT       dbo.GioHang.TinhTrang, dbo.GioHang.NgayDat, dbo.GioHang.TongCong, dbo.GioHang.SoLuong, dbo.SanPham.TenSanPham, dbo.GioHang.Id, dbo.UserInfo.Ten
FROM            dbo.GioHang INNER JOIN
                         dbo.SanPham ON dbo.GioHang.MaSp = dbo.SanPham.MaSanPham INNER JOIN
                         dbo.AspNetUsers ON dbo.GioHang.MaTK = dbo.AspNetUsers.Id INNER JOIN
                         dbo.UserInfo ON dbo.AspNetUsers.Id = dbo.UserInfo.IdUser

GO
/****** Object:  View [dbo].[v_GioHang]    Script Date: 19/06/2017 2:04:22 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[v_GioHang]
AS
SELECT       dbo.GioHang.*, dbo.SanPham.TenSanPham
FROM            dbo.SanPham INNER JOIN
                         dbo.GioHang ON dbo.SanPham.MaSanPham = dbo.GioHang.MaSp



GO
INSERT [dbo].[__MigrationHistory] ([MigrationId], [ContextKey], [Model], [ProductVersion]) VALUES (N'201705090638497_InitialCreate', N'DOANWEB2.Models.ApplicationDbContext', 0x1F8B0800000000000400DD5CDB6EE336107D2FD07F10F4D416A99538DDC536B05B649DA40DBAB9609D6DFBB6A025DA1156A2B412952628FA657DE827F5173A94A81B2FBAD88AED140B2C22727866381C92C3E1D0FFFEFDCFE4C747DF331E7014BB01999A47A343D3C0C40E1C97ACA6664297DFBE317FFCE1CB2F26E78EFF68FC9AD31D333A6849E2A9794F69786259B17D8F7D148F7CD78E823858D2911DF81672026B7C78F8BD75746461803001CB3026EF13425D1FA71FF0390B888D439A20EF2A70B017F372A899A7A8C635F2711C221B4FCDB39BD3EBDFCEDF8E4719A9699C7A2E0231E6D85B9A062224A0888290271F623CA7514056F3100A9077F71462A05B222FC65CF89392BC6B3F0EC7AC1F56D93087B29398067E4FC0A363AE184B6CBE967ACD4271A0BA7350317D62BD4ED537352F1D9C16BD0F3C5080C8F064E6458C786A5E152C4EE3F01AD351DE7094415E4400F747107D1A55110F8CCEED0E0A431A8F0ED9BF036396783489F094E08446C83B306E9385E7DABFE0A7BBE01326D3E3A3C5F2F8CDABD7C8397EFD1D3E7E55ED29F415E86A0550741B05218E4036BC2CFA6F1A56BD9D25362C9A55DA645A015B8239611A57E8F11D262B7A0FB365FCC6342EDC47ECE425DCB83E1017A61034A251029FD789E7A185878B7AAB9127FBBF81EBF8D5EB41B85EA30777950EBDC01F264E04F3EA3DF6D2DAF8DE0DB3E9551BEF8F9CEC220A7CF65DB7AFACF6E33C48229B7526D092DCA16885695DBA89551A6F27936650C39B758EBAFFA6CD2495CD5B49CA3AB4CE4CC8596C7B36E4F23E2FDFCE16771A863078A969318D34199CB0538D84A607464E501ACD5157A321D099FFF31A78EE23D71B6011ECC0059C8FA51BF9B8E8E5DB004C0E91DE32DFA2388635C0F919C5F70DA2C39F03883EC776128169CE29F2C367E7767B1F107C9DF80B66F1DBE335D8D0DCFD115C209B06D13961AD36C67B17D89F82849E13E70C51FC81DA3920FBBC73FDEE008388736ADB388E2FC098B1330BC0B7CE012F093D1EF78663ABD3AE9D9099875C5FED8508EBE8C79CB4F444D4149237A2215379244DA2BE0B562EE9266A4EAA1735A368159593F515958175939453EA054D095AE5CCA806F3F1D2111ADEC94B61F7DFCBDB6CF3D6AD051535CE6185C43F61822358C69C5B44298E4839025DD68D5D380BE9F031A6CFBE37A59C7E455E3234ABB56643BA080C3F1B52D8FD9F0DA99850FCE03ACC2BE970F4C98901BE13BDFA54D53EE704C9B63D1D6ADDDC36F3EDAC01BAE9721AC781EDA6B34011F4E2218BBAFCE0C319EDF18BAC37620C043A0686EEB22D0F4AA06FA6685437E40C7B9862E3D4CE82823314DBC891D5081D727A0896EFA80AC1CA58485DB86F249E60E938628D103B04C530535D42E569E112DB0D91D7AA25A165C72D8CF5BDE021D69CE11013C6B055135D98AB431F4C80828F30286D1A9A58158B6B36448DD7AA1BF33617B61C772922B1159B6CF19D3576C9FDB76731CC668D6DC1389B55D245006D186F1706CACF2A5D0D403CB8EC9B810A27268D8172976A2B065AD7D80E0CB4AE921767A0D911B5EBF80BE7D57D33CFFA4179FBDB7AA3BA76609B357DEC996966BE27B4A1D00247B2799E2D58257EA48AC319C8C9CF67317775451361E0734CEB219BD2DF55FAA156338868444D80A5A1B580F20B4009489A503D84CB63798DD2712FA2076C1E776B84E56BBF005BB10119BB7A115A21D45F978AC6D9E9F451F4ACB006C9C83B1D162A380A831017AF7AC73B284517979515D3C517EEE30D573AC607A341412D9EAB4649796706D7526E9AED5A5239647D5CB28DB424B84F1A2DE59D195C4BDC46DB95A4700A7AB8051BA9A8BE850F34D9F24847B1DB1475132B4B8EE205134B934535B94261E8925525AB8A9718F32CA56AF6EDBC7FBA919F615876ACC83A2AA42D38D120422B2CD4026B90F4C28D627A86285A2016E79939BE44A6DC5B35CB7FCEB2BA7DCA8398EF033935FB3B6B215EDBD7365AD913E10017D03D9FB933690C5D31F8EAE6064B71431E8A1461FB59E0253ED17B57FAD6D9E55DB57D5622234C2C417EC97B925425F9B875BD771A1579460C314285E7B2FE28E92174BACEFDCEAAB675BEA81E250F4D555174E1AA9D8D9ACE85E93E52A26BD87FA05A119E6746F17C942A002FEA8951496990C02A75DD51EB592755CC7A4D774421B5A40A2954F590B29A405213B25AB1169E46A36A8AEE1CE494912ABA5CDB1D59913C52855654AF81AD9059ACEB8EAAC82FA9022BAABB6397C926E20ABAC77B96F6C0B2DEA6951D6837DBB53418CFB31C0EB3E955EEEDAB4095E29E58FC665E02E3E57B694ADA53DD7AA69405313633250D867ECDA95D77D7979CC63B7A3D66ED0EBBB6AC37DDE1EBF1FA19ECB39A8574A213490AEEC5C94E38C14DF869AAFDB18C74BCCA484C2357236CE94F31C5FE88118CE69FBD99E762B680E7045788B84B1CD32C6FC31C1F1E8D852737FBF3FCC58A63C7539C46756F60EA63B685142CF28022FB1E457242C4064F444A5029D67C491CFC3835FF4C5B9DA4610BF6575A7C605CC61F88FB39818ABB28C1C65F7282E73029F3CD67AB3D7DE0D05DAB97BF7FCC9A1E183711CC9813E350D0E53A235C7FF6D04B9AACE906D2ACFD18E2E54EA8DA7B0325AA3021D67F5EB070E9204F0B7229BFF2D1E3D77D45533E1FD80851F1446028BC4154A87B02B00E9636FDDF814F9AA6FFF7EBACFA39C03AA2699F02B8A43F98F810A0FB3294B7DCE156A338106D63494AF5DC9A48BD5156E5AEF72629DF7AA3892EE754F780DB206F7A0DCB786129C783ED8E8A8CE2C1B07769DACF9E46BC2F99C3654EC76E1386B79923DC701BF4BF4A0DDE8364364572CEEE1380B76D6BBA20EE9E6751F64BF3DD3363E3295BBB4FE6DDB6B1E9C2BC7B6E6CBD5276F7CCD676B57FEED8D23A6FA13B4FC0957389349731AA58705B826D16388713FE220023C83CCAEC5DA43AA3AB291BB5856149A267AA4F2513194B1347E22B5134B3EDD757BEE1377696D334B3D5246036F1E6EB7F236F4ED3CC5B93D6B88BD4606562A12A5DBB651D6BCA7D7A49A9C0B59EB4649EB7F9AC8D37EB2F29F37710A5D4668FE68EF8E524FA0EA29221A74E8FC45EF9BA17F6CECA2F28C2FE1DBBAB1282FD9E22C1766DD72C682EC932C8376F41A29C4488D05C618A1CD8524F23EA2E914DA19AC598D387DD69DC8EDD742CB073496E121A2614BA8CFD85570B783127A0897F9ABD5C97797213A6BF51324417404C97C5E66FC8DBC4F59C42EE0B454C4803C1BC0B1ED1656349596477F554205D07A42310575FE114DD613FF4002CBE2173F480D7910DCCEF1D5E21FBA98C00EA40DA07A2AEF6C9998B5611F2638E51B6874FB061C77FFCE13F9447FAA948540000, N'6.1.3-40302')
INSERT [dbo].[AspNetRoles] ([Id], [Name]) VALUES (N'admin', N'admin')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'0565bcd3-2b71-4b45-9ba5-473285c68016', N'admin')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'0565bcd3-2b71-4b45-9ba5-473285c68016', N'demowebphp@gmail.com', 0, N'AECPDi+XDsGfEARpfqlfVIDYdEM1jDK7VXj4f0m26BL2YV08vcVrFo2r5os/2gZtcg==', N'50bc0814-85b4-435a-9c76-b7976ce33669', NULL, 0, 0, NULL, 1, 0, N'demowebphp@gmail.com')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'4b3ca48b-5931-4064-af64-97fc8276a02e', N'phanthanhsu1010@gmail.com', 0, N'ADDs6t9pYC4nFFoZYghc15ntueYeEH4Ez3wmgaqcknTFr5L77Z38uUW6HCIDW6YipA==', N'28326ac7-3d37-4f5f-b2f6-869148e77f1b', NULL, 0, 0, NULL, 1, 0, N'phanthanhsu1010@gmail.com')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'999db7c1-ad80-4ef0-abf2-18444b13e6c4', N'kyoxpro1010@gmail.com', 0, N'AH/yHRsJBUE+VTeAxbxlHv6jrzpbbCXzzB6bnI2J7MDMEcytgEnGTkxuhRhh/DnYOw==', N'67cdfe8f-9ff5-4b45-9b5e-672d6c1c66b7', NULL, 0, 0, NULL, 1, 0, N'kyoxpro1010@gmail.com')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'a0eb2e53-9d75-43d6-8f65-5f6e69572034', N'daothiloc22@gmail.com', 0, N'APJ7tV8YhcbeNzqSngdBzGupQphDihq+WPP6efj5JOl4tg59zo1JHOGGTRlc0V7/wA==', N'9aca309e-751a-4082-93e0-9c1d80808e8c', NULL, 0, 0, NULL, 1, 0, N'daothiloc22@gmail.com')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'f7cca67b-4431-4e52-8f15-46eb538069e5', N'abc123@gmail.com', 0, N'AI7ua7YvfwPRO6umyZv0q9RtpSyg5VRKuXQdVPiRfOmEaEtwt2XgSAFlAC9E8TgkCg==', N'fc9ea9db-be9c-474f-b5fd-dc3190332db2', NULL, 0, 0, NULL, 1, 0, N'abc123@gmail.com')
SET IDENTITY_INSERT [dbo].[BinhLuan] ON 

INSERT [dbo].[BinhLuan] ([id], [idaccount], [idSP], [noidung], [tinhtrang], [ngay]) VALUES (1, N'0565bcd3-2b71-4b45-9ba5-473285c68016', N'DH-CFR    ', N'Abc', 1, CAST(0x0000A79700093F30 AS DateTime))
INSERT [dbo].[BinhLuan] ([id], [idaccount], [idSP], [noidung], [tinhtrang], [ngay]) VALUES (2, N'0565bcd3-2b71-4b45-9ba5-473285c68016', N'DH-CFR    ', N'Binh Luan nè', 1, CAST(0x0000A79700098328 AS DateTime))
INSERT [dbo].[BinhLuan] ([id], [idaccount], [idSP], [noidung], [tinhtrang], [ngay]) VALUES (11, N'0565bcd3-2b71-4b45-9ba5-473285c68016', N'DH-CFR    ', N'12312321', 1, CAST(0x0000A7970009C270 AS DateTime))
SET IDENTITY_INSERT [dbo].[BinhLuan] OFF
SET IDENTITY_INSERT [dbo].[GioHang] ON 

INSERT [dbo].[GioHang] ([Id], [MaTK], [MaSp], [SoLuong], [TongCong], [NgayDat], [TinhTrang]) VALUES (8, N'0565bcd3-2b71-4b45-9ba5-473285c68016', N'DH-DWv    ', 3, 180000, CAST(0x0000A78D008E55A9 AS DateTime), 2)
INSERT [dbo].[GioHang] ([Id], [MaTK], [MaSp], [SoLuong], [TongCong], [NgayDat], [TinhTrang]) VALUES (9, N'0565bcd3-2b71-4b45-9ba5-473285c68016', N'KTT-L141  ', 2, 428000, CAST(0x0000A78D009052E6 AS DateTime), 3)
INSERT [dbo].[GioHang] ([Id], [MaTK], [MaSp], [SoLuong], [TongCong], [NgayDat], [TinhTrang]) VALUES (10, N'0565bcd3-2b71-4b45-9ba5-473285c68016', N'NHNN-A50ml', 1, 100000, CAST(0x0000A78D00B354DB AS DateTime), 1)
INSERT [dbo].[GioHang] ([Id], [MaTK], [MaSp], [SoLuong], [TongCong], [NgayDat], [TinhTrang]) VALUES (11, N'a0eb2e53-9d75-43d6-8f65-5f6e69572034', N'TBP-BT    ', 3, 135000, CAST(0x0000A78E00964BDE AS DateTime), 1)
INSERT [dbo].[GioHang] ([Id], [MaTK], [MaSp], [SoLuong], [TongCong], [NgayDat], [TinhTrang]) VALUES (12, N'0565bcd3-2b71-4b45-9ba5-473285c68016', N'KTT-RBx   ', 1, 194000, CAST(0x0000A7970015A151 AS DateTime), 4)
INSERT [dbo].[GioHang] ([Id], [MaTK], [MaSp], [SoLuong], [TongCong], [NgayDat], [TinhTrang]) VALUES (13, N'0565bcd3-2b71-4b45-9ba5-473285c68016', N'NHNN-A50ml', 1, 100000, CAST(0x0000A7970016453F AS DateTime), 0)
SET IDENTITY_INSERT [dbo].[GioHang] OFF
SET IDENTITY_INSERT [dbo].[HinhAnh] ON 

INSERT [dbo].[HinhAnh] ([MaHinh], [URL], [MaSanPham]) VALUES (1, N'DH-CFR_001.jpg                                                                                      ', N'DH-CFR    ')
INSERT [dbo].[HinhAnh] ([MaHinh], [URL], [MaSanPham]) VALUES (2, N'DH-CFR_002.jpg                                                                                      ', N'DH-CFR    ')
INSERT [dbo].[HinhAnh] ([MaHinh], [URL], [MaSanPham]) VALUES (4, N'DH-CFR_003.jpg                                                                                      ', N'DH-CFR    ')
INSERT [dbo].[HinhAnh] ([MaHinh], [URL], [MaSanPham]) VALUES (5, N'DH-TG_001.jpg                                                                                       ', N'DH-TG     ')
INSERT [dbo].[HinhAnh] ([MaHinh], [URL], [MaSanPham]) VALUES (6, N'DH-TG_002.jpg                                                                                       ', N'DH-TG     ')
INSERT [dbo].[HinhAnh] ([MaHinh], [URL], [MaSanPham]) VALUES (7, N'MLT-MR011_001.jpg                                                                                   ', N'MLT-MR011 ')
INSERT [dbo].[HinhAnh] ([MaHinh], [URL], [MaSanPham]) VALUES (8, N'MLT-MR011_002.jpg                                                                                   ', N'MLT-MR011 ')
INSERT [dbo].[HinhAnh] ([MaHinh], [URL], [MaSanPham]) VALUES (9, N'DH-DWv_001.png                                                                                      ', N'DH-DWv    ')
INSERT [dbo].[HinhAnh] ([MaHinh], [URL], [MaSanPham]) VALUES (10, N'DH-GShock_001.jpg                                                                                   ', N'DH-GShock ')
INSERT [dbo].[HinhAnh] ([MaHinh], [URL], [MaSanPham]) VALUES (13, N'DH-GShock_002.png                                                                                   ', N'DH-GShock ')
INSERT [dbo].[HinhAnh] ([MaHinh], [URL], [MaSanPham]) VALUES (14, N'DH-GShock_003.png                                                                                   ', N'DH-GShock ')
INSERT [dbo].[HinhAnh] ([MaHinh], [URL], [MaSanPham]) VALUES (19, N'DH-DWv_002.png                                                                                      ', N'DH-DWv    ')
INSERT [dbo].[HinhAnh] ([MaHinh], [URL], [MaSanPham]) VALUES (20, N'DH-DWv_003.png                                                                                      ', N'DH-DWv    ')
INSERT [dbo].[HinhAnh] ([MaHinh], [URL], [MaSanPham]) VALUES (21, N'DH-DWv_004.png                                                                                      ', N'DH-DWv    ')
INSERT [dbo].[HinhAnh] ([MaHinh], [URL], [MaSanPham]) VALUES (22, N'DH-DWv_005.png                                                                                      ', N'DH-DWv    ')
INSERT [dbo].[HinhAnh] ([MaHinh], [URL], [MaSanPham]) VALUES (23, N'TBP-KiD_001.png                                                                                     ', N'TBP-KiD   ')
INSERT [dbo].[HinhAnh] ([MaHinh], [URL], [MaSanPham]) VALUES (24, N'TBP-BT_001.png                                                                                      ', N'TBP-BT    ')
INSERT [dbo].[HinhAnh] ([MaHinh], [URL], [MaSanPham]) VALUES (25, N'NHNN-Cnn_001.png                                                                                    ', N'NHNN-Cnn  ')
INSERT [dbo].[HinhAnh] ([MaHinh], [URL], [MaSanPham]) VALUES (26, N'NHNN-Cnn_001.png                                                                                    ', N'NHNN-A50ml')
INSERT [dbo].[HinhAnh] ([MaHinh], [URL], [MaSanPham]) VALUES (27, N'MLT-SH8005_001.png                                                                                  ', N'MLT-SH8005')
INSERT [dbo].[HinhAnh] ([MaHinh], [URL], [MaSanPham]) VALUES (28, N'MLT-SH8005_002.png                                                                                  ', N'MLT-SH8005')
SET IDENTITY_INSERT [dbo].[HinhAnh] OFF
INSERT [dbo].[LoaiSanPham] ([MaLoaiSP], [TenLoaiSanPham], [TinhTrang]) VALUES (N'DH        ', N'Đồng Hồ', 1)
INSERT [dbo].[LoaiSanPham] ([MaLoaiSP], [TenLoaiSanPham], [TinhTrang]) VALUES (N'KTT       ', N'Kính Thời Trang', 1)
INSERT [dbo].[LoaiSanPham] ([MaLoaiSP], [TenLoaiSanPham], [TinhTrang]) VALUES (N'MLT       ', N'Máy Làm Tóc', 1)
INSERT [dbo].[LoaiSanPham] ([MaLoaiSP], [TenLoaiSanPham], [TinhTrang]) VALUES (N'NHNN      ', N'Nước Hoa Nam & Nữ', 1)
INSERT [dbo].[LoaiSanPham] ([MaLoaiSP], [TenLoaiSanPham], [TinhTrang]) VALUES (N'TBP       ', N'Trang Bị Đi Phượt', 1)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [MoTa], [GiaTien], [XuatXu], [NhaSanXuat], [MaLoaiSanPham], [HinhAnh], [TinhTrang]) VALUES (N'DH-CFR    ', N'ĐỒNG HỒ CAFUER', N'<p>ĐỒNG HỒ&nbsp;<strong>CAFUER</strong></p>
', 175000, N'Quảng Châu - TQ', N'CAFUER', N'DH        ', N'DH-CFR_001.jpg                                    ', 1)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [MoTa], [GiaTien], [XuatXu], [NhaSanXuat], [MaLoaiSanPham], [HinhAnh], [TinhTrang]) VALUES (N'DH-DWv    ', N'Daniel Wellington DÂY VẢI', N'<p>Nhạc thiếu nhi children&#39;s music compilation học tiếng Anh qua b&agrave;i h&aacute;t children&#39;s songs vietnam.</p>

<p>Nhạc thiếu nhi children&#39;s music compilation học tiếng Anh qua b&agrave;i h&aacute;t children&#39;s songs vietnam.</p>

<p>Nhạc thi<strong>ếu nhi children&#39;s music compilation học tiếng Anh qua b&agrave;i h&aacute;t children&#39;s songs vietnam.</strong></p>

<p><strong>Nhạc thiếu nhi children&#39;s music compilation học tiếng Anh qua b&agrave;i h&aacute;t children&#39;s songs vietnam.</strong></p>

<p><strong>Nhạc thiếu nhi children&#39;s mu</strong>sic compilation học tiếng Anh qua b&agrave;i h&aacute;t children&#39;s songs vietnam.</p>

<p>Nhạc thiếu nhi children&#39;s music compilation học tiếng Anh qua b&agrave;i h&aacute;t children&#39;s songs vietnam.</p>

<p>Nhạc thiếu nhi children&#39;s music compilation học tiếng Anh qua b&agrave;i h&aacute;t children&#39;s songs vietnam.</p>
', 60000, N'Không rõ', N'Daniel Wellington', N'DH        ', N'DH-DWv_001.png                                    ', 1)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [MoTa], [GiaTien], [XuatXu], [NhaSanXuat], [MaLoaiSanPham], [HinhAnh], [TinhTrang]) VALUES (N'DH-GShock ', N'Casio G-SHOCK', N'<p>&nbsp;</p>

<p>Casio <strong>G-SHOCK</strong></p>
', 270000, N'Trung Quốc', N'Casio', N'DH        ', N'DH-GShock_001.jpg                                 ', 1)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [MoTa], [GiaTien], [XuatXu], [NhaSanXuat], [MaLoaiSanPham], [HinhAnh], [TinhTrang]) VALUES (N'DH-TG     ', N'ĐỒNG HỒ TAM GIÁC', NULL, 130000, N'Quảng Đông - TQ', N'WiLon', N'DH        ', N'DH-TG_001.jpg                                     ', 1)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [MoTa], [GiaTien], [XuatXu], [NhaSanXuat], [MaLoaiSanPham], [HinhAnh], [TinhTrang]) VALUES (N'KTT-L141  ', N'KÍNH LACOSTE L141', NULL, 214000, N'Không rõ', N'LACOSTE', N'KTT       ', N'KTT-L141_001.png                                  ', 1)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [MoTa], [GiaTien], [XuatXu], [NhaSanXuat], [MaLoaiSanPham], [HinhAnh], [TinhTrang]) VALUES (N'KTT-RBx   ', N'KÍNH RAYBAN GẤP GỌN', NULL, 194000, N'Không rõ', N'Rayban', N'KTT       ', N'KTT-RBx_001.png                                   ', 1)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [MoTa], [GiaTien], [XuatXu], [NhaSanXuat], [MaLoaiSanPham], [HinhAnh], [TinhTrang]) VALUES (N'MLT-MR011 ', N'KẸP TÓC MERMAID 4IN1', NULL, 155000, N'Quảng Đông - TQ', N'MERMAID', N'MLT       ', N'MLT-MR011_001.jpg                                 ', 1)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [MoTa], [GiaTien], [XuatXu], [NhaSanXuat], [MaLoaiSanPham], [HinhAnh], [TinhTrang]) VALUES (N'MLT-SH8005', N'KẸP TÓC SHINON 4IN1 8005', NULL, 150000, N'Quảng Đông - TQ', N'Shinon', N'MLT       ', N'MLT-SH8005_001.png                                ', 1)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [MoTa], [GiaTien], [XuatXu], [NhaSanXuat], [MaLoaiSanPham], [HinhAnh], [TinhTrang]) VALUES (N'NHNN-A50ml', N'BLUE AVON 50ML - NAM', NULL, 100000, N'Không rõ', N'Avon', N'NHNN      ', N'NHNN-A50ml_001.png                                ', 1)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [MoTa], [GiaTien], [XuatXu], [NhaSanXuat], [MaLoaiSanPham], [HinhAnh], [TinhTrang]) VALUES (N'NHNN-Cnn  ', N'CHANEL 50ML ( NAM & NỮ)', NULL, 85000, N'Không rõ', N'Chanel', N'NHNN      ', N'NHNN-Cnn_001.png                                  ', 1)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [MoTa], [GiaTien], [XuatXu], [NhaSanXuat], [MaLoaiSanPham], [HinhAnh], [TinhTrang]) VALUES (N'TBP-BT    ', N'BAO TAY CHỐNG NẮNG', NULL, 45000, N'Không rõ', N'Không rõ', N'TBP       ', N'TBP-BT_001.png                                    ', 1)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [MoTa], [GiaTien], [XuatXu], [NhaSanXuat], [MaLoaiSanPham], [HinhAnh], [TinhTrang]) VALUES (N'TBP-KiD   ', N'MẮT KÍNH ĐI PHƯỢT', NULL, 75000, N'Không rõ', N'Không rõ', N'TBP       ', N'TBP-KiD_001.png                                   ', 1)
INSERT [dbo].[UserInfo] ([IdUser], [Ten], [DienThoai], [DiaChi]) VALUES (N'0565bcd3-2b71-4b45-9ba5-473285c68016', N'Admin', N'0900000000', N'admin')
INSERT [dbo].[UserInfo] ([IdUser], [Ten], [DienThoai], [DiaChi]) VALUES (N'a0eb2e53-9d75-43d6-8f65-5f6e69572034', N'Người dùng', N'0808082233', N'Long An')
SET ANSI_PADDING ON

GO
/****** Object:  Index [RoleNameIndex]    Script Date: 19/06/2017 2:04:22 CH ******/
CREATE UNIQUE NONCLUSTERED INDEX [RoleNameIndex] ON [dbo].[AspNetRoles]
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_UserId]    Script Date: 19/06/2017 2:04:22 CH ******/
CREATE NONCLUSTERED INDEX [IX_UserId] ON [dbo].[AspNetUserClaims]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_UserId]    Script Date: 19/06/2017 2:04:22 CH ******/
CREATE NONCLUSTERED INDEX [IX_UserId] ON [dbo].[AspNetUserLogins]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_RoleId]    Script Date: 19/06/2017 2:04:22 CH ******/
CREATE NONCLUSTERED INDEX [IX_RoleId] ON [dbo].[AspNetUserRoles]
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_UserId]    Script Date: 19/06/2017 2:04:22 CH ******/
CREATE NONCLUSTERED INDEX [IX_UserId] ON [dbo].[AspNetUserRoles]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [UserNameIndex]    Script Date: 19/06/2017 2:04:22 CH ******/
CREATE UNIQUE NONCLUSTERED INDEX [UserNameIndex] ON [dbo].[AspNetUsers]
(
	[UserName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[BinhLuan] ADD  CONSTRAINT [DF_BinhLuan_ngay]  DEFAULT (getdate()) FOR [ngay]
GO
ALTER TABLE [dbo].[AspNetUserClaims]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserClaims_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserClaims] CHECK CONSTRAINT [FK_dbo.AspNetUserClaims_dbo.AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserLogins]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserLogins] CHECK CONSTRAINT [FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[BinhLuan]  WITH CHECK ADD  CONSTRAINT [FK_BinhLuan_AspNetUsers] FOREIGN KEY([idaccount])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[BinhLuan] CHECK CONSTRAINT [FK_BinhLuan_AspNetUsers]
GO
ALTER TABLE [dbo].[BinhLuan]  WITH CHECK ADD  CONSTRAINT [FK_BinhLuan_SanPham] FOREIGN KEY([idSP])
REFERENCES [dbo].[SanPham] ([MaSanPham])
GO
ALTER TABLE [dbo].[BinhLuan] CHECK CONSTRAINT [FK_BinhLuan_SanPham]
GO
ALTER TABLE [dbo].[GioHang]  WITH CHECK ADD  CONSTRAINT [FK_GioHang_AspNetUsers] FOREIGN KEY([MaTK])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[GioHang] CHECK CONSTRAINT [FK_GioHang_AspNetUsers]
GO
ALTER TABLE [dbo].[GioHang]  WITH CHECK ADD  CONSTRAINT [FK_GioHang_SanPham] FOREIGN KEY([MaSp])
REFERENCES [dbo].[SanPham] ([MaSanPham])
GO
ALTER TABLE [dbo].[GioHang] CHECK CONSTRAINT [FK_GioHang_SanPham]
GO
ALTER TABLE [dbo].[HinhAnh]  WITH CHECK ADD  CONSTRAINT [FK_HinhAnh_SanPham] FOREIGN KEY([MaSanPham])
REFERENCES [dbo].[SanPham] ([MaSanPham])
GO
ALTER TABLE [dbo].[HinhAnh] CHECK CONSTRAINT [FK_HinhAnh_SanPham]
GO
ALTER TABLE [dbo].[HoaDon]  WITH CHECK ADD  CONSTRAINT [FK_HoaDon_AspNetUsers] FOREIGN KEY([MaKH])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[HoaDon] CHECK CONSTRAINT [FK_HoaDon_AspNetUsers]
GO
ALTER TABLE [dbo].[HoaDon]  WITH CHECK ADD  CONSTRAINT [FK_HoaDon_SanPham] FOREIGN KEY([MaSP])
REFERENCES [dbo].[SanPham] ([MaSanPham])
GO
ALTER TABLE [dbo].[HoaDon] CHECK CONSTRAINT [FK_HoaDon_SanPham]
GO
ALTER TABLE [dbo].[SanPham]  WITH CHECK ADD  CONSTRAINT [FK_SanPham_LoaiSanPham] FOREIGN KEY([MaLoaiSanPham])
REFERENCES [dbo].[LoaiSanPham] ([MaLoaiSP])
GO
ALTER TABLE [dbo].[SanPham] CHECK CONSTRAINT [FK_SanPham_LoaiSanPham]
GO
ALTER TABLE [dbo].[UserInfo]  WITH CHECK ADD  CONSTRAINT [FK_UserInfo_AspNetUsers] FOREIGN KEY([IdUser])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[UserInfo] CHECK CONSTRAINT [FK_UserInfo_AspNetUsers]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[50] 4[12] 2[21] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "AspNetUsers"
            Begin Extent = 
               Top = 36
               Left = 354
               Bottom = 166
               Right = 578
            End
            DisplayFlags = 280
            TopColumn = 2
         End
         Begin Table = "BinhLuan"
            Begin Extent = 
               Top = 24
               Left = 73
               Bottom = 154
               Right = 243
            End
            DisplayFlags = 280
            TopColumn = 2
         End
         Begin Table = "UserInfo"
            Begin Extent = 
               Top = 26
               Left = 736
               Bottom = 156
               Right = 906
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'V_Comment'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'V_Comment'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[53] 4[8] 2[21] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "GioHang"
            Begin Extent = 
               Top = 119
               Left = 357
               Bottom = 249
               Right = 527
            End
            DisplayFlags = 280
            TopColumn = 1
         End
         Begin Table = "SanPham"
            Begin Extent = 
               Top = 84
               Left = 54
               Bottom = 214
               Right = 232
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "AspNetUsers"
            Begin Extent = 
               Top = 34
               Left = 565
               Bottom = 164
               Right = 789
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "UserInfo"
            Begin Extent = 
               Top = 34
               Left = 833
               Bottom = 165
               Right = 1003
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'V_DonHang'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'V_DonHang'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "SanPham"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 216
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "GioHang"
            Begin Extent = 
               Top = 6
               Left = 254
               Bottom = 136
               Right = 424
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'v_GioHang'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'v_GioHang'
GO
USE [master]
GO
ALTER DATABASE [SSandSS] SET  READ_WRITE 
GO
