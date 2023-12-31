USE [master]
GO
/****** Object:  Database [QLDienThoai]    Script Date: 11/1/2023 4:13:32 PM ******/
CREATE DATABASE [QLDienThoai]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'QLDienThoai', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\QLDienThoai.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'QLDienThoai_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\QLDienThoai_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [QLDienThoai] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [QLDienThoai].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [QLDienThoai] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [QLDienThoai] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [QLDienThoai] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [QLDienThoai] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [QLDienThoai] SET ARITHABORT OFF 
GO
ALTER DATABASE [QLDienThoai] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [QLDienThoai] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [QLDienThoai] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [QLDienThoai] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [QLDienThoai] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [QLDienThoai] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [QLDienThoai] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [QLDienThoai] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [QLDienThoai] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [QLDienThoai] SET  ENABLE_BROKER 
GO
ALTER DATABASE [QLDienThoai] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [QLDienThoai] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [QLDienThoai] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [QLDienThoai] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [QLDienThoai] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [QLDienThoai] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [QLDienThoai] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [QLDienThoai] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [QLDienThoai] SET  MULTI_USER 
GO
ALTER DATABASE [QLDienThoai] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [QLDienThoai] SET DB_CHAINING OFF 
GO
ALTER DATABASE [QLDienThoai] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [QLDienThoai] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [QLDienThoai] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [QLDienThoai] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [QLDienThoai] SET QUERY_STORE = ON
GO
ALTER DATABASE [QLDienThoai] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [QLDienThoai]
GO
/****** Object:  Table [dbo].[tAnhSP]    Script Date: 11/1/2023 4:13:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tAnhSP](
	[MaSP] [char](50) NOT NULL,
	[TenFileAnh] [char](100) NOT NULL,
	[ViTri] [smallint] NULL,
 CONSTRAINT [PK_tAnhSP] PRIMARY KEY CLUSTERED 
(
	[MaSP] ASC,
	[TenFileAnh] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tChatLieu]    Script Date: 11/1/2023 4:13:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tChatLieu](
	[MaChatLieu] [char](25) NOT NULL,
	[ChatLieu] [nvarchar](150) NULL,
 CONSTRAINT [PK_tChatLieu] PRIMARY KEY CLUSTERED 
(
	[MaChatLieu] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tChiTietHDB]    Script Date: 11/1/2023 4:13:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tChiTietHDB](
	[ID] [int] NOT NULL,
	[MaHoaDon] [int] NOT NULL,
	[MaSP] [char](50) NOT NULL,
	[SoLuongBan] [int] NULL,
	[DonGiaBan] [money] NULL,
	[GiamGia] [float] NULL,
	[GhiChu] [nvarchar](100) NULL,
 CONSTRAINT [PK_tChiTietHDB] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tDanhMucSP]    Script Date: 11/1/2023 4:13:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tDanhMucSP](
	[MaSP] [char](50) NOT NULL,
	[TenSP] [nvarchar](150) NULL,
	[MaChatLieu] [char](25) NULL,
	[Model] [nvarchar](55) NULL,
	[MaHangSX] [char](25) NULL,
	[MaNuocSX] [char](25) NULL,
	[MaDacTinh] [char](25) NULL,
	[Website] [char](155) NULL,
	[ThoiGianBaoHanh] [float] NULL,
	[GioiThieuSP] [text] NULL,
	[ChietKhau] [float] NULL,
	[MaLoai] [char](25) NULL,
	[MaDT] [char](25) NULL,
	[AnhDaiDien] [char](100) NULL,
	[GiaNhoNhat] [money] NULL,
	[GiaLonNhat] [money] NULL,
 CONSTRAINT [PK_tDanhMucSP] PRIMARY KEY CLUSTERED 
(
	[MaSP] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tHangSX]    Script Date: 11/1/2023 4:13:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tHangSX](
	[MaHangSX] [char](25) NOT NULL,
	[HangSX] [nvarchar](100) NULL,
	[MaNuocThuongHieu] [char](25) NULL,
 CONSTRAINT [PK_tHangSX] PRIMARY KEY CLUSTERED 
(
	[MaHangSX] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tHoaDonBan]    Script Date: 11/1/2023 4:13:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tHoaDonBan](
	[MaHoaDon] [int] NOT NULL,
	[NgayHoaDon] [char](255) NULL,
	[MaKhachHang] [char](25) NULL,
	[TongTienHD] [money] NULL,
	[GiamGiaHD] [float] NULL,
	[PhuongThucThanhToan] [tinyint] NULL,
	[MaSoThue] [char](100) NULL,
	[ThongTinThue] [nvarchar](250) NULL,
	[GhiChu] [nvarchar](100) NULL,
	[Status] [int] NULL,
 CONSTRAINT [PK_tHoaDonBan] PRIMARY KEY CLUSTERED 
(
	[MaHoaDon] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tKhachHang]    Script Date: 11/1/2023 4:13:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tKhachHang](
	[MaKhanhHang] [char](25) NOT NULL,
	[username] [char](100) NULL,
	[TenKhachHang] [nvarchar](100) NULL,
	[NgaySinh] [date] NULL,
	[SoDienThoai] [char](15) NULL,
	[DiaChi] [nvarchar](150) NULL,
	[LoaiKhachHang] [tinyint] NULL,
	[AnhDaiDien] [char](100) NULL,
	[GhiChu] [nvarchar](100) NULL,
 CONSTRAINT [PK_tKhachHang] PRIMARY KEY CLUSTERED 
(
	[MaKhanhHang] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tLoaiDT]    Script Date: 11/1/2023 4:13:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tLoaiDT](
	[MaDT] [char](25) NOT NULL,
	[TenLoai] [nvarchar](100) NULL,
 CONSTRAINT [PK_tLoaiDT] PRIMARY KEY CLUSTERED 
(
	[MaDT] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tLoaiSP]    Script Date: 11/1/2023 4:13:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tLoaiSP](
	[MaLoai] [char](25) NOT NULL,
	[Loai] [nvarchar](100) NULL,
 CONSTRAINT [PK_tLoaiSP] PRIMARY KEY CLUSTERED 
(
	[MaLoai] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tQuocGia]    Script Date: 11/1/2023 4:13:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tQuocGia](
	[MaNuoc] [char](25) NOT NULL,
	[TenNuoc] [nvarchar](100) NULL,
 CONSTRAINT [PK_tQuocGia] PRIMARY KEY CLUSTERED 
(
	[MaNuoc] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tUser]    Script Date: 11/1/2023 4:13:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tUser](
	[username] [char](100) NOT NULL,
	[password] [char](256) NOT NULL,
	[LoaiUser] [tinyint] NULL,
 CONSTRAINT [PK_tUser] PRIMARY KEY CLUSTERED 
(
	[username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[tAnhSP] ([MaSP], [TenFileAnh], [ViTri]) VALUES (N'f2                                                ', N'f2.jpg                                                                                              ', NULL)
INSERT [dbo].[tAnhSP] ([MaSP], [TenFileAnh], [ViTri]) VALUES (N'f3                                                ', N'f3.jpg                                                                                              ', NULL)
INSERT [dbo].[tAnhSP] ([MaSP], [TenFileAnh], [ViTri]) VALUES (N'f4                                                ', N'f4.jpg                                                                                              ', NULL)
INSERT [dbo].[tAnhSP] ([MaSP], [TenFileAnh], [ViTri]) VALUES (N'f5                                                ', N'f5.jpg                                                                                              ', NULL)
INSERT [dbo].[tAnhSP] ([MaSP], [TenFileAnh], [ViTri]) VALUES (N'f6                                                ', N'f6.jpg                                                                                              ', NULL)
INSERT [dbo].[tAnhSP] ([MaSP], [TenFileAnh], [ViTri]) VALUES (N'f7                                                ', N'f7.jpg                                                                                              ', NULL)
INSERT [dbo].[tAnhSP] ([MaSP], [TenFileAnh], [ViTri]) VALUES (N'f8                                                ', N'f8.jpg                                                                                              ', NULL)
INSERT [dbo].[tAnhSP] ([MaSP], [TenFileAnh], [ViTri]) VALUES (N'f9                                                ', N'f9.jpg                                                                                              ', NULL)
INSERT [dbo].[tAnhSP] ([MaSP], [TenFileAnh], [ViTri]) VALUES (N'IPhone1                                           ', N'f1.jpg                                                                                              ', NULL)
INSERT [dbo].[tAnhSP] ([MaSP], [TenFileAnh], [ViTri]) VALUES (N'n1                                                ', N'n1.jpg                                                                                              ', NULL)
INSERT [dbo].[tAnhSP] ([MaSP], [TenFileAnh], [ViTri]) VALUES (N'n2                                                ', N'n2.jpg                                                                                              ', NULL)
INSERT [dbo].[tAnhSP] ([MaSP], [TenFileAnh], [ViTri]) VALUES (N'n3                                                ', N'n3.jpg                                                                                              ', NULL)
INSERT [dbo].[tAnhSP] ([MaSP], [TenFileAnh], [ViTri]) VALUES (N'n4                                                ', N'n4.jpg                                                                                              ', NULL)
INSERT [dbo].[tAnhSP] ([MaSP], [TenFileAnh], [ViTri]) VALUES (N'n5                                                ', N'n5.jpg                                                                                              ', NULL)
INSERT [dbo].[tAnhSP] ([MaSP], [TenFileAnh], [ViTri]) VALUES (N'n6                                                ', N'n6.jpg                                                                                              ', NULL)
INSERT [dbo].[tAnhSP] ([MaSP], [TenFileAnh], [ViTri]) VALUES (N'n7                                                ', N'n7.png                                                                                              ', NULL)
INSERT [dbo].[tAnhSP] ([MaSP], [TenFileAnh], [ViTri]) VALUES (N'n8                                                ', N'n8.png                                                                                              ', NULL)
GO
INSERT [dbo].[tChatLieu] ([MaChatLieu], [ChatLieu]) VALUES (N'al                       ', N'Nhôm')
INSERT [dbo].[tChatLieu] ([MaChatLieu], [ChatLieu]) VALUES (N'n                        ', N'Nhựa cứng')
INSERT [dbo].[tChatLieu] ([MaChatLieu], [ChatLieu]) VALUES (N't                        ', N'Titan')
GO
INSERT [dbo].[tDanhMucSP] ([MaSP], [TenSP], [MaChatLieu], [Model], [MaHangSX], [MaNuocSX], [MaDacTinh], [Website], [ThoiGianBaoHanh], [GioiThieuSP], [ChietKhau], [MaLoai], [MaDT], [AnhDaiDien], [GiaNhoNhat], [GiaLonNhat]) VALUES (N'f1                                                ', N'Iphone 10', N't                        ', NULL, N'ap                       ', N'my                       ', NULL, NULL, 1, N'iPhone X (tên g?i thu?ng du?c d?c là "iPhone Ten") là m?t s?n ph?m c?a Apple và là m?t trong nh?ng phiên b?n iPhone dáng chú ý. Nó du?c công b? vào tháng 9 nam 2017 và dã chính th?c ra m?t vào tháng 11 cùng nam.', NULL, N'sp                       ', N'nd                       ', N'f1.jpg                                                                                              ', NULL, 22000000.0000)
INSERT [dbo].[tDanhMucSP] ([MaSP], [TenSP], [MaChatLieu], [Model], [MaHangSX], [MaNuocSX], [MaDacTinh], [Website], [ThoiGianBaoHanh], [GioiThieuSP], [ChietKhau], [MaLoai], [MaDT], [AnhDaiDien], [GiaNhoNhat], [GiaLonNhat]) VALUES (N'f2                                                ', N'Iphone 10', N'al                       ', NULL, N'ap                       ', N'my                       ', NULL, NULL, 1, N'iPhone X (tên g?i thu?ng du?c d?c là "iPhone Ten") là m?t s?n ph?m c?a Apple và là m?t trong nh?ng phiên b?n iPhone dáng chú ý. Nó du?c công b? vào tháng 9 nam 2017 và dã chính th?c ra m?t vào tháng 11 cùng nam.', NULL, N'sp                       ', N'nd                       ', N'f2.jpg                                                                                              ', NULL, 23000000.0000)
INSERT [dbo].[tDanhMucSP] ([MaSP], [TenSP], [MaChatLieu], [Model], [MaHangSX], [MaNuocSX], [MaDacTinh], [Website], [ThoiGianBaoHanh], [GioiThieuSP], [ChietKhau], [MaLoai], [MaDT], [AnhDaiDien], [GiaNhoNhat], [GiaLonNhat]) VALUES (N'f3                                                ', N'Iphone 11', N'n                        ', NULL, N'ap                       ', N'my                       ', NULL, NULL, 1, N'iPhone X (tên g?i thu?ng du?c d?c là "iPhone Ten") là m?t s?n ph?m c?a Apple và là m?t trong nh?ng phiên b?n iPhone dáng chú ý. Nó du?c công b? vào tháng 9 nam 2017 và dã chính th?c ra m?t vào tháng 11 cùng nam.', NULL, N'gp                       ', N'ls                       ', N'f3.jpg                                                                                              ', NULL, 24000000.0000)
INSERT [dbo].[tDanhMucSP] ([MaSP], [TenSP], [MaChatLieu], [Model], [MaHangSX], [MaNuocSX], [MaDacTinh], [Website], [ThoiGianBaoHanh], [GioiThieuSP], [ChietKhau], [MaLoai], [MaDT], [AnhDaiDien], [GiaNhoNhat], [GiaLonNhat]) VALUES (N'f4                                                ', N'Iphone 12', N'al                       ', NULL, N'ap                       ', N'my                       ', NULL, NULL, 1, N'iPhone X (tên g?i thu?ng du?c d?c là "iPhone Ten") là m?t s?n ph?m c?a Apple và là m?t trong nh?ng phiên b?n iPhone dáng chú ý. Nó du?c công b? vào tháng 9 nam 2017 và dã chính th?c ra m?t vào tháng 11 cùng nam.', NULL, N'gp                       ', N'dn                       ', N'f4.jpg                                                                                              ', NULL, 25000000.0000)
INSERT [dbo].[tDanhMucSP] ([MaSP], [TenSP], [MaChatLieu], [Model], [MaHangSX], [MaNuocSX], [MaDacTinh], [Website], [ThoiGianBaoHanh], [GioiThieuSP], [ChietKhau], [MaLoai], [MaDT], [AnhDaiDien], [GiaNhoNhat], [GiaLonNhat]) VALUES (N'f5                                                ', N'Iphone 13', N'al                       ', NULL, N'ap                       ', N'my                       ', NULL, NULL, 1, N'iPhone X (tên g?i thu?ng du?c d?c là "iPhone Ten") là m?t s?n ph?m c?a Apple và là m?t trong nh?ng phiên b?n iPhone dáng chú ý. Nó du?c công b? vào tháng 9 nam 2017 và dã chính th?c ra m?t vào tháng 11 cùng nam.', NULL, N'sp                       ', N'nd                       ', N'f5.jpg                                                                                              ', NULL, 26000000.0000)
INSERT [dbo].[tDanhMucSP] ([MaSP], [TenSP], [MaChatLieu], [Model], [MaHangSX], [MaNuocSX], [MaDacTinh], [Website], [ThoiGianBaoHanh], [GioiThieuSP], [ChietKhau], [MaLoai], [MaDT], [AnhDaiDien], [GiaNhoNhat], [GiaLonNhat]) VALUES (N'f6                                                ', N'Iphone 14', N'n                        ', NULL, N'ap                       ', N'my                       ', NULL, NULL, 1, N'iPhone X (tên g?i thu?ng du?c d?c là "iPhone Ten") là m?t s?n ph?m c?a Apple và là m?t trong nh?ng phiên b?n iPhone dáng chú ý. Nó du?c công b? vào tháng 9 nam 2017 và dã chính th?c ra m?t vào tháng 11 cùng nam.', NULL, N'gp                       ', N'nd                       ', N'f6.jpg                                                                                              ', NULL, 27000000.0000)
INSERT [dbo].[tDanhMucSP] ([MaSP], [TenSP], [MaChatLieu], [Model], [MaHangSX], [MaNuocSX], [MaDacTinh], [Website], [ThoiGianBaoHanh], [GioiThieuSP], [ChietKhau], [MaLoai], [MaDT], [AnhDaiDien], [GiaNhoNhat], [GiaLonNhat]) VALUES (N'f7                                                ', N'Iphone 15', N't                        ', NULL, N'vf                       ', N'my                       ', NULL, NULL, 1, N'iPhone X (tên g?i thu?ng du?c d?c là "iPhone Ten") là m?t s?n ph?m c?a Apple và là m?t trong nh?ng phiên b?n iPhone dáng chú ý. Nó du?c công b? vào tháng 9 nam 2017 và dã chính th?c ra m?t vào tháng 11 cùng nam.', NULL, N'sp                       ', N'nd                       ', N'f7.jpg                                                                                              ', NULL, 28000000.0000)
INSERT [dbo].[tDanhMucSP] ([MaSP], [TenSP], [MaChatLieu], [Model], [MaHangSX], [MaNuocSX], [MaDacTinh], [Website], [ThoiGianBaoHanh], [GioiThieuSP], [ChietKhau], [MaLoai], [MaDT], [AnhDaiDien], [GiaNhoNhat], [GiaLonNhat]) VALUES (N'f8                                                ', N'Vinfon 1', N't                        ', NULL, N'ap                       ', N'my                       ', NULL, NULL, 1, N'iPhone X (tên g?i thu?ng du?c d?c là "iPhone Ten") là m?t s?n ph?m c?a Apple và là m?t trong nh?ng phiên b?n iPhone dáng chú ý. Nó du?c công b? vào tháng 9 nam 2017 và dã chính th?c ra m?t vào tháng 11 cùng nam.', NULL, N'sp                       ', N'nd                       ', N'f8.jpg                                                                                              ', NULL, 28000000.0000)
INSERT [dbo].[tDanhMucSP] ([MaSP], [TenSP], [MaChatLieu], [Model], [MaHangSX], [MaNuocSX], [MaDacTinh], [Website], [ThoiGianBaoHanh], [GioiThieuSP], [ChietKhau], [MaLoai], [MaDT], [AnhDaiDien], [GiaNhoNhat], [GiaLonNhat]) VALUES (N'n3                                                ', N'SamSung 2', N'al                       ', NULL, N'ss                       ', N'vn                       ', NULL, NULL, 1, N'iPhone X (tên g?i thu?ng du?c d?c là "iPhone Ten") là m?t s?n ph?m c?a Apple và là m?t trong nh?ng phiên b?n iPhone dáng chú ý. Nó du?c công b? vào tháng 9 nam 2017 và dã chính th?c ra m?t vào tháng 11 cùng nam.', NULL, N'sp                       ', N'nd                       ', N'n3.jpg                                                                                              ', NULL, 16000000.0000)
INSERT [dbo].[tDanhMucSP] ([MaSP], [TenSP], [MaChatLieu], [Model], [MaHangSX], [MaNuocSX], [MaDacTinh], [Website], [ThoiGianBaoHanh], [GioiThieuSP], [ChietKhau], [MaLoai], [MaDT], [AnhDaiDien], [GiaNhoNhat], [GiaLonNhat]) VALUES (N'n4                                                ', N'SamSung 3', N'n                        ', NULL, N'nk                       ', N'my                       ', NULL, NULL, 1, N'iPhone X (tên g?i thu?ng du?c d?c là "iPhone Ten") là m?t s?n ph?m c?a Apple và là m?t trong nh?ng phiên b?n iPhone dáng chú ý. Nó du?c công b? vào tháng 9 nam 2017 và dã chính th?c ra m?t vào tháng 11 cùng nam.', NULL, N'gp                       ', N'nd                       ', N'n4.jpg                                                                                              ', NULL, 17000000.0000)
INSERT [dbo].[tDanhMucSP] ([MaSP], [TenSP], [MaChatLieu], [Model], [MaHangSX], [MaNuocSX], [MaDacTinh], [Website], [ThoiGianBaoHanh], [GioiThieuSP], [ChietKhau], [MaLoai], [MaDT], [AnhDaiDien], [GiaNhoNhat], [GiaLonNhat]) VALUES (N'n5                                                ', N'SamSung 4', N't                        ', NULL, N'so                       ', N'my                       ', NULL, NULL, 1, N'iPhone X (tên g?i thu?ng du?c d?c là "iPhone Ten") là m?t s?n ph?m c?a Apple và là m?t trong nh?ng phiên b?n iPhone dáng chú ý. Nó du?c công b? vào tháng 9 nam 2017 và dã chính th?c ra m?t vào tháng 11 cùng nam.', NULL, N'gp                       ', N'nd                       ', N'n5.jpg                                                                                              ', NULL, 18000000.0000)
INSERT [dbo].[tDanhMucSP] ([MaSP], [TenSP], [MaChatLieu], [Model], [MaHangSX], [MaNuocSX], [MaDacTinh], [Website], [ThoiGianBaoHanh], [GioiThieuSP], [ChietKhau], [MaLoai], [MaDT], [AnhDaiDien], [GiaNhoNhat], [GiaLonNhat]) VALUES (N'n6                                                ', N'SamSung 5', N't                        ', NULL, N'ap                       ', N'vn                       ', NULL, NULL, 1, N'iPhone X (tên g?i thu?ng du?c d?c là "iPhone Ten") là m?t s?n ph?m c?a Apple và là m?t trong nh?ng phiên b?n iPhone dáng chú ý. Nó du?c công b? vào tháng 9 nam 2017 và dã chính th?c ra m?t vào tháng 11 cùng nam.', NULL, N'gp                       ', N'nd                       ', N'n6.jpg                                                                                              ', NULL, 19000000.0000)
INSERT [dbo].[tDanhMucSP] ([MaSP], [TenSP], [MaChatLieu], [Model], [MaHangSX], [MaNuocSX], [MaDacTinh], [Website], [ThoiGianBaoHanh], [GioiThieuSP], [ChietKhau], [MaLoai], [MaDT], [AnhDaiDien], [GiaNhoNhat], [GiaLonNhat]) VALUES (N'n7                                                ', N'SamSung 5', N'n                        ', NULL, N'ap                       ', N'my                       ', NULL, NULL, 1, N'iPhone X (tên g?i thu?ng du?c d?c là "iPhone Ten") là m?t s?n ph?m c?a Apple và là m?t trong nh?ng phiên b?n iPhone dáng chú ý. Nó du?c công b? vào tháng 9 nam 2017 và dã chính th?c ra m?t vào tháng 11 cùng nam.', NULL, N'sp                       ', N'nd                       ', N'n7.jpg                                                                                              ', NULL, 19000000.0000)
INSERT [dbo].[tDanhMucSP] ([MaSP], [TenSP], [MaChatLieu], [Model], [MaHangSX], [MaNuocSX], [MaDacTinh], [Website], [ThoiGianBaoHanh], [GioiThieuSP], [ChietKhau], [MaLoai], [MaDT], [AnhDaiDien], [GiaNhoNhat], [GiaLonNhat]) VALUES (N'n8                                                ', N'SamSung 5', N't                        ', NULL, N'ap                       ', N'vn                       ', NULL, NULL, 1, N'iPhone X (tên g?i thu?ng du?c d?c là "iPhone Ten") là m?t s?n ph?m c?a Apple và là m?t trong nh?ng phiên b?n iPhone dáng chú ý. Nó du?c công b? vào tháng 9 nam 2017 và dã chính th?c ra m?t vào tháng 11 cùng nam.', NULL, N'sp                       ', N'nd                       ', N'n8.jpg                                                                                              ', NULL, 19000000.0000)
INSERT [dbo].[tDanhMucSP] ([MaSP], [TenSP], [MaChatLieu], [Model], [MaHangSX], [MaNuocSX], [MaDacTinh], [Website], [ThoiGianBaoHanh], [GioiThieuSP], [ChietKhau], [MaLoai], [MaDT], [AnhDaiDien], [GiaNhoNhat], [GiaLonNhat]) VALUES (N'NG1243                                            ', N'XiaoMi 13', N'al                       ', N'vip', N'ap                       ', N'my                       ', N'Mtre5432                 ', NULL, 2, N'ngon 43', 1, N'gp                       ', N'dl                       ', N'n5.jpg                                                                                              ', 13000000.0000, 15000000.0000)
INSERT [dbo].[tDanhMucSP] ([MaSP], [TenSP], [MaChatLieu], [Model], [MaHangSX], [MaNuocSX], [MaDacTinh], [Website], [ThoiGianBaoHanh], [GioiThieuSP], [ChietKhau], [MaLoai], [MaDT], [AnhDaiDien], [GiaNhoNhat], [GiaLonNhat]) VALUES (N'NG1265                                            ', N'XiaoMi 87', N'al                       ', N'Base', N'ap                       ', N'my                       ', NULL, NULL, NULL, NULL, NULL, N'gp                       ', N'dl                       ', N'f8.jpg                                                                                              ', 16000000.0000, 20000000.0000)
GO
INSERT [dbo].[tHangSX] ([MaHangSX], [HangSX], [MaNuocThuongHieu]) VALUES (N'ap                       ', N'Apple', N'my                       ')
INSERT [dbo].[tHangSX] ([MaHangSX], [HangSX], [MaNuocThuongHieu]) VALUES (N'nk                       ', N'Nokia', N'vn                       ')
INSERT [dbo].[tHangSX] ([MaHangSX], [HangSX], [MaNuocThuongHieu]) VALUES (N'so                       ', N'Sony', N'my                       ')
INSERT [dbo].[tHangSX] ([MaHangSX], [HangSX], [MaNuocThuongHieu]) VALUES (N'ss                       ', N'samsung', N'my                       ')
INSERT [dbo].[tHangSX] ([MaHangSX], [HangSX], [MaNuocThuongHieu]) VALUES (N'vf                       ', N'Vinfon', N'vn                       ')
GO
INSERT [dbo].[tKhachHang] ([MaKhanhHang], [username], [TenKhachHang], [NgaySinh], [SoDienThoai], [DiaChi], [LoaiKhachHang], [AnhDaiDien], [GhiChu]) VALUES (N'linh324                  ', N'linhca                                                                                              ', N'Nguyễn Tiến Hoàng', CAST(N'2003-08-27' AS Date), N'0987234523     ', N'Hà Nội                                                                                ', 2, NULL, NULL)
INSERT [dbo].[tKhachHang] ([MaKhanhHang], [username], [TenKhachHang], [NgaySinh], [SoDienThoai], [DiaChi], [LoaiKhachHang], [AnhDaiDien], [GhiChu]) VALUES (N'linh32443                ', N'linhadmin                                                                                           ', N'Phạm Văn Linh', CAST(N'2003-06-29' AS Date), N'0999999999     ', N'Bắc Giang                                                                                          ', 9, NULL, NULL)
INSERT [dbo].[tKhachHang] ([MaKhanhHang], [username], [TenKhachHang], [NgaySinh], [SoDienThoai], [DiaChi], [LoaiKhachHang], [AnhDaiDien], [GhiChu]) VALUES (N'linh3265                 ', N'linhca                                                                                              ', N'Nguyễn Văn Chiến', CAST(N'2002-06-01' AS Date), N'0123456987     ', N'Nghệ An', 3, NULL, NULL)
INSERT [dbo].[tKhachHang] ([MaKhanhHang], [username], [TenKhachHang], [NgaySinh], [SoDienThoai], [DiaChi], [LoaiKhachHang], [AnhDaiDien], [GhiChu]) VALUES (N'linh32rw                 ', N'linhca                                                                                              ', N'Chu Văn Dũng', CAST(N'2004-06-30' AS Date), N'023456789      ', N'Hà Nội                                                                                     ', 2, NULL, NULL)
INSERT [dbo].[tKhachHang] ([MaKhanhHang], [username], [TenKhachHang], [NgaySinh], [SoDienThoai], [DiaChi], [LoaiKhachHang], [AnhDaiDien], [GhiChu]) VALUES (N'linhca123                ', N'linhca                                                                                              ', N'Hoàng Văn Phương', CAST(N'2004-05-12' AS Date), N'0123456789     ', N'Thanh Hóa                                                                                    ', 8, NULL, NULL)
GO
INSERT [dbo].[tLoaiDT] ([MaDT], [TenLoai]) VALUES (N'dl                       ', N'Du lịch')
INSERT [dbo].[tLoaiDT] ([MaDT], [TenLoai]) VALUES (N'dn                       ', N'Doanh nhân')
INSERT [dbo].[tLoaiDT] ([MaDT], [TenLoai]) VALUES (N'ls                       ', N'Lịch sự')
INSERT [dbo].[tLoaiDT] ([MaDT], [TenLoai]) VALUES (N'nd                       ', N'Năng động')
GO
INSERT [dbo].[tLoaiSP] ([MaLoai], [Loai]) VALUES (N'gp                       ', N'Gaming phone')
INSERT [dbo].[tLoaiSP] ([MaLoai], [Loai]) VALUES (N'sp                       ', N'SmartPhone')
GO
INSERT [dbo].[tQuocGia] ([MaNuoc], [TenNuoc]) VALUES (N'my                       ', N'Mỹ')
INSERT [dbo].[tQuocGia] ([MaNuoc], [TenNuoc]) VALUES (N'vn                       ', N'Việt Nam')
GO
INSERT [dbo].[tUser] ([username], [password], [LoaiUser]) VALUES (N'linhadmin                                                                                           ', N'123                                                                                                                                                                                                                                                             ', 0)
INSERT [dbo].[tUser] ([username], [password], [LoaiUser]) VALUES (N'linhca                                                                                              ', N'123                                                                                                                                                                                                                                                             ', 1)
GO
ALTER TABLE [dbo].[tChiTietHDB]  WITH CHECK ADD  CONSTRAINT [FK_tChiTietHDB_tDanhMucSP] FOREIGN KEY([MaSP])
REFERENCES [dbo].[tDanhMucSP] ([MaSP])
GO
ALTER TABLE [dbo].[tChiTietHDB] CHECK CONSTRAINT [FK_tChiTietHDB_tDanhMucSP]
GO
ALTER TABLE [dbo].[tChiTietHDB]  WITH CHECK ADD  CONSTRAINT [FK_tChiTietHDB_tHoaDonBan] FOREIGN KEY([MaHoaDon])
REFERENCES [dbo].[tHoaDonBan] ([MaHoaDon])
GO
ALTER TABLE [dbo].[tChiTietHDB] CHECK CONSTRAINT [FK_tChiTietHDB_tHoaDonBan]
GO
ALTER TABLE [dbo].[tDanhMucSP]  WITH CHECK ADD  CONSTRAINT [FK_tDanhMucSP_tChatLieu] FOREIGN KEY([MaChatLieu])
REFERENCES [dbo].[tChatLieu] ([MaChatLieu])
GO
ALTER TABLE [dbo].[tDanhMucSP] CHECK CONSTRAINT [FK_tDanhMucSP_tChatLieu]
GO
ALTER TABLE [dbo].[tDanhMucSP]  WITH CHECK ADD  CONSTRAINT [FK_tDanhMucSP_tHangSX] FOREIGN KEY([MaHangSX])
REFERENCES [dbo].[tHangSX] ([MaHangSX])
GO
ALTER TABLE [dbo].[tDanhMucSP] CHECK CONSTRAINT [FK_tDanhMucSP_tHangSX]
GO
ALTER TABLE [dbo].[tDanhMucSP]  WITH CHECK ADD  CONSTRAINT [FK_tDanhMucSP_tLoaiDT] FOREIGN KEY([MaDT])
REFERENCES [dbo].[tLoaiDT] ([MaDT])
GO
ALTER TABLE [dbo].[tDanhMucSP] CHECK CONSTRAINT [FK_tDanhMucSP_tLoaiDT]
GO
ALTER TABLE [dbo].[tDanhMucSP]  WITH CHECK ADD  CONSTRAINT [FK_tDanhMucSP_tLoaiSP] FOREIGN KEY([MaLoai])
REFERENCES [dbo].[tLoaiSP] ([MaLoai])
GO
ALTER TABLE [dbo].[tDanhMucSP] CHECK CONSTRAINT [FK_tDanhMucSP_tLoaiSP]
GO
ALTER TABLE [dbo].[tDanhMucSP]  WITH CHECK ADD  CONSTRAINT [FK_tDanhMucSP_tQuocGia] FOREIGN KEY([MaNuocSX])
REFERENCES [dbo].[tQuocGia] ([MaNuoc])
GO
ALTER TABLE [dbo].[tDanhMucSP] CHECK CONSTRAINT [FK_tDanhMucSP_tQuocGia]
GO
ALTER TABLE [dbo].[tHoaDonBan]  WITH CHECK ADD  CONSTRAINT [FK_tHoaDonBan_tKhachHang] FOREIGN KEY([MaKhachHang])
REFERENCES [dbo].[tKhachHang] ([MaKhanhHang])
GO
ALTER TABLE [dbo].[tHoaDonBan] CHECK CONSTRAINT [FK_tHoaDonBan_tKhachHang]
GO
ALTER TABLE [dbo].[tKhachHang]  WITH CHECK ADD  CONSTRAINT [FK_tKhachHang_tUser] FOREIGN KEY([username])
REFERENCES [dbo].[tUser] ([username])
GO
ALTER TABLE [dbo].[tKhachHang] CHECK CONSTRAINT [FK_tKhachHang_tUser]
GO
USE [master]
GO
ALTER DATABASE [QLDienThoai] SET  READ_WRITE 
GO
