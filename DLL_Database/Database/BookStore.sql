USE [BookStore]
GO
/****** Object:  Table [dbo].[tbl_Account]    Script Date: 8/20/2024 7:34:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_Account](
	[UserName] [varchar](30) NOT NULL,
	[UserPass] [varbinary](100) NOT NULL,
	[FullName] [nvarchar](50) NULL,
	[UserRight] [tinyint] NULL,
	[AllowInsert] [bit] NULL,
	[AllowUpdate] [bit] NULL,
	[AllowDelete] [bit] NULL,
	[UserStatus] [bit] NULL,
	[UpdateTime] [datetime] NULL,
	[LastLogin] [datetime] NULL,
 CONSTRAINT [PK__Admin__AF86462B8CE44C56] PRIMARY KEY CLUSTERED 
(
	[UserName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_ChiTietDonHang]    Script Date: 8/20/2024 7:34:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_ChiTietDonHang](
	[MaDonHang] [int] NOT NULL,
	[Masach] [int] NOT NULL,
	[Soluong] [int] NULL,
	[Dongia] [decimal](18, 0) NULL,
 CONSTRAINT [PK_CTDatHang] PRIMARY KEY CLUSTERED 
(
	[MaDonHang] ASC,
	[Masach] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_ChuDe]    Script Date: 8/20/2024 7:34:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_ChuDe](
	[MaCD] [int] IDENTITY(1,1) NOT NULL,
	[TenChuDe] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_ChuDe] PRIMARY KEY CLUSTERED 
(
	[MaCD] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_DonDatHang]    Script Date: 8/20/2024 7:34:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_DonDatHang](
	[MaDonHang] [int] IDENTITY(1,1) NOT NULL,
	[Dathanhtoan] [bit] NULL,
	[Tinhtranggiaohang] [bit] NULL,
	[Ngaydat] [datetime] NULL,
	[Ngaygiao] [datetime] NULL,
	[MaKH] [int] NULL,
 CONSTRAINT [PK_DonDatHang] PRIMARY KEY CLUSTERED 
(
	[MaDonHang] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_KhachHang]    Script Date: 8/20/2024 7:34:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_KhachHang](
	[MaKH] [int] IDENTITY(1,1) NOT NULL,
	[HoTen] [nvarchar](50) NOT NULL,
	[Taikhoan] [varchar](50) NULL,
	[Matkhau] [varchar](50) NOT NULL,
	[Email] [varchar](100) NULL,
	[DiachiKH] [nvarchar](200) NULL,
	[DienthoaiKH] [varchar](50) NULL,
	[Ngaysinh] [datetime] NULL,
 CONSTRAINT [PK_Khachhang] PRIMARY KEY CLUSTERED 
(
	[MaKH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[Taikhoan] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_NhaXuatBan]    Script Date: 8/20/2024 7:34:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_NhaXuatBan](
	[MaNXB] [int] IDENTITY(1,1) NOT NULL,
	[TenNXB] [nvarchar](50) NOT NULL,
	[Diachi] [nvarchar](200) NULL,
	[DienThoai] [varchar](50) NULL,
 CONSTRAINT [PK_NhaXuatBan] PRIMARY KEY CLUSTERED 
(
	[MaNXB] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_Sach]    Script Date: 8/20/2024 7:34:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_Sach](
	[Masach] [int] IDENTITY(1,1) NOT NULL,
	[Tensach] [nvarchar](100) NOT NULL,
	[Giaban] [decimal](18, 0) NULL,
	[Mota] [nvarchar](max) NULL,
	[Anhbia] [varchar](50) NULL,
	[Ngaycapnhat] [datetime] NULL,
	[Soluongton] [int] NULL,
	[MaCD] [int] NULL,
	[MaNXB] [int] NULL,
 CONSTRAINT [PK_Sach] PRIMARY KEY CLUSTERED 
(
	[Masach] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_TacGia]    Script Date: 8/20/2024 7:34:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_TacGia](
	[MaTG] [int] IDENTITY(1,1) NOT NULL,
	[TenTG] [nvarchar](50) NOT NULL,
	[Diachi] [nvarchar](100) NULL,
	[Tieusu] [nvarchar](max) NULL,
	[Dienthoai] [varchar](50) NULL,
 CONSTRAINT [PK_TacGia] PRIMARY KEY CLUSTERED 
(
	[MaTG] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_VietSach]    Script Date: 8/20/2024 7:34:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_VietSach](
	[MaTG] [int] NOT NULL,
	[Masach] [int] NOT NULL,
	[Vaitro] [nvarchar](50) NULL,
	[Vitri] [nvarchar](50) NULL,
 CONSTRAINT [PK_tbl_VietSach] PRIMARY KEY CLUSTERED 
(
	[MaTG] ASC,
	[Masach] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tbl_ChiTietDonHang]  WITH CHECK ADD  CONSTRAINT [FK_Donhang] FOREIGN KEY([MaDonHang])
REFERENCES [dbo].[tbl_DonDatHang] ([MaDonHang])
GO
ALTER TABLE [dbo].[tbl_ChiTietDonHang] CHECK CONSTRAINT [FK_Donhang]
GO
ALTER TABLE [dbo].[tbl_ChiTietDonHang]  WITH CHECK ADD  CONSTRAINT [FK_SachCTDH] FOREIGN KEY([Masach])
REFERENCES [dbo].[tbl_Sach] ([Masach])
GO
ALTER TABLE [dbo].[tbl_ChiTietDonHang] CHECK CONSTRAINT [FK_SachCTDH]
GO
ALTER TABLE [dbo].[tbl_DonDatHang]  WITH CHECK ADD  CONSTRAINT [FK_Khachhang] FOREIGN KEY([MaKH])
REFERENCES [dbo].[tbl_KhachHang] ([MaKH])
GO
ALTER TABLE [dbo].[tbl_DonDatHang] CHECK CONSTRAINT [FK_Khachhang]
GO
ALTER TABLE [dbo].[tbl_Sach]  WITH CHECK ADD  CONSTRAINT [FK_Chude] FOREIGN KEY([MaCD])
REFERENCES [dbo].[tbl_ChuDe] ([MaCD])
GO
ALTER TABLE [dbo].[tbl_Sach] CHECK CONSTRAINT [FK_Chude]
GO
ALTER TABLE [dbo].[tbl_Sach]  WITH CHECK ADD  CONSTRAINT [FK_NhaXB] FOREIGN KEY([MaNXB])
REFERENCES [dbo].[tbl_NhaXuatBan] ([MaNXB])
GO
ALTER TABLE [dbo].[tbl_Sach] CHECK CONSTRAINT [FK_NhaXB]
GO
ALTER TABLE [dbo].[tbl_VietSach]  WITH CHECK ADD  CONSTRAINT [FK_Sach] FOREIGN KEY([Masach])
REFERENCES [dbo].[tbl_Sach] ([Masach])
GO
ALTER TABLE [dbo].[tbl_VietSach] CHECK CONSTRAINT [FK_Sach]
GO
ALTER TABLE [dbo].[tbl_VietSach]  WITH CHECK ADD  CONSTRAINT [FK_Tacgia] FOREIGN KEY([MaTG])
REFERENCES [dbo].[tbl_TacGia] ([MaTG])
GO
ALTER TABLE [dbo].[tbl_VietSach] CHECK CONSTRAINT [FK_Tacgia]
GO
ALTER TABLE [dbo].[tbl_ChiTietDonHang]  WITH CHECK ADD CHECK  (([Dongia]>=(0)))
GO
ALTER TABLE [dbo].[tbl_ChiTietDonHang]  WITH CHECK ADD CHECK  (([Soluong]>(0)))
GO
ALTER TABLE [dbo].[tbl_Sach]  WITH CHECK ADD CHECK  (([Giaban]>=(0)))
GO
/****** Object:  StoredProcedure [dbo].[spAdmin_UserLogin]    Script Date: 8/20/2024 7:34:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[spAdmin_UserLogin]
	@UserName varchar(30),
	@PassWord varchar(50)
as
begin try
	if not exists (
		select	* 
		from	tbl_Account 
		where	UserName = @UserName and PWDCOMPARE (@PassWord, UserPass) = 1 and UserStatus = 1
	)
	begin
		raiserror (N'Tên đăng nhập hoặc mật khẩu không chính xác.', 16, 1)
		return
	end

	update	tbl_Account
	set		LastLogin = getdate()
	where	UserName = @UserName

	select	UserName, FullName, AllowInsert, AllowUpdate, AllowDelete, 
			UserRight, UserStatus, LastLogin, UpdateTime
	from	tbl_Account
	where	UserName = @UserName
end try
begin catch
	declare @err nvarchar(1000) = ERROR_MESSAGE()
	raiserror (@err, 16, 1)
end catch
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'1: Người dùng; 2 - Nhà quản trị' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tbl_Account', @level2type=N'COLUMN',@level2name=N'UserRight'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'1 - Bình thường 0: Tạm khoá' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tbl_Account', @level2type=N'COLUMN',@level2name=N'UserStatus'
GO
