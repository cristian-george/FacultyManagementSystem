USE [master]
GO
/****** Object:  Database [dbStudent]    Script Date: 15.01.2023 15:33:06 ******/
CREATE DATABASE [dbStudent]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'dbStudent', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\dbStudent.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'dbStudent_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\dbStudent_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [dbStudent] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [dbStudent].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [dbStudent] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [dbStudent] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [dbStudent] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [dbStudent] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [dbStudent] SET ARITHABORT OFF 
GO
ALTER DATABASE [dbStudent] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [dbStudent] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [dbStudent] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [dbStudent] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [dbStudent] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [dbStudent] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [dbStudent] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [dbStudent] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [dbStudent] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [dbStudent] SET  DISABLE_BROKER 
GO
ALTER DATABASE [dbStudent] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [dbStudent] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [dbStudent] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [dbStudent] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [dbStudent] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [dbStudent] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [dbStudent] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [dbStudent] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [dbStudent] SET  MULTI_USER 
GO
ALTER DATABASE [dbStudent] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [dbStudent] SET DB_CHAINING OFF 
GO
ALTER DATABASE [dbStudent] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [dbStudent] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [dbStudent] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [dbStudent] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [dbStudent] SET QUERY_STORE = ON
GO
ALTER DATABASE [dbStudent] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [dbStudent]
GO
/****** Object:  Table [dbo].[Groupe]    Script Date: 15.01.2023 15:33:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Groupe](
	[GroupeId] [int] IDENTITY(1,1) NOT NULL,
	[GroupeTypeId] [int] NOT NULL,
	[FullName] [nvarchar](10) NOT NULL,
	[Active] [bit] NOT NULL,
 CONSTRAINT [PK_Groupe] PRIMARY KEY CLUSTERED 
(
	[GroupeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GroupeType]    Script Date: 15.01.2023 15:33:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GroupeType](
	[GroupeTypeId] [int] IDENTITY(1,1) NOT NULL,
	[FullName] [nvarchar](50) NOT NULL,
	[ShortName] [nvarchar](10) NULL,
	[Active] [bit] NOT NULL,
 CONSTRAINT [PK_GroupeType] PRIMARY KEY CLUSTERED 
(
	[GroupeTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Note]    Script Date: 15.01.2023 15:33:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Note](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ProfessorId] [int] NOT NULL,
	[StudentId] [int] NOT NULL,
	[SubjectId] [int] NOT NULL,
	[ExamDate] [datetime] NOT NULL,
	[Grade] [smallint] NOT NULL,
	[Active] [bit] NOT NULL,
 CONSTRAINT [PK_Note] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Professor]    Script Date: 15.01.2023 15:33:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Professor](
	[ProfessorId] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](50) NOT NULL,
	[LastName] [nvarchar](50) NOT NULL,
	[Cnp] [varchar](13) NOT NULL,
	[Phone] [nvarchar](15) NULL,
	[Email] [nvarchar](255) NULL,
	[Active] [bit] NOT NULL,
 CONSTRAINT [PK_Professor] PRIMARY KEY CLUSTERED 
(
	[ProfessorId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProfessorSubject]    Script Date: 15.01.2023 15:33:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProfessorSubject](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ProfessorId] [int] NOT NULL,
	[SubjectId] [int] NOT NULL,
 CONSTRAINT [PK_Professor_Subject] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Student]    Script Date: 15.01.2023 15:33:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Student](
	[StudentId] [int] IDENTITY(1,1) NOT NULL,
	[GroupeId] [int] NOT NULL,
	[FirstName] [nvarchar](50) NOT NULL,
	[LastName] [nvarchar](50) NOT NULL,
	[Cnp] [varchar](13) NOT NULL,
	[Email] [nvarchar](255) NULL,
	[Active] [bit] NOT NULL,
 CONSTRAINT [PK_Student] PRIMARY KEY CLUSTERED 
(
	[StudentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Subject]    Script Date: 15.01.2023 15:33:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Subject](
	[SubjectId] [int] IDENTITY(1,1) NOT NULL,
	[SubjectTypeId] [int] NOT NULL,
	[FullName] [nvarchar](50) NOT NULL,
	[ShortName] [nvarchar](10) NULL,
	[Active] [bit] NOT NULL,
 CONSTRAINT [PK_Subject] PRIMARY KEY CLUSTERED 
(
	[SubjectId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SubjectType]    Script Date: 15.01.2023 15:33:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SubjectType](
	[SubjectTypeId] [int] IDENTITY(1,1) NOT NULL,
	[FullName] [nvarchar](50) NOT NULL,
	[ShortName] [nvarchar](10) NULL,
	[Active] [bit] NOT NULL,
 CONSTRAINT [PK_SubjectType] PRIMARY KEY CLUSTERED 
(
	[SubjectTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Groupe] ADD  CONSTRAINT [DF_Groupe_Activ]  DEFAULT ((1)) FOR [Active]
GO
ALTER TABLE [dbo].[GroupeType] ADD  CONSTRAINT [DF_GroupeType_Active]  DEFAULT ((1)) FOR [Active]
GO
ALTER TABLE [dbo].[Note] ADD  CONSTRAINT [DF_Note_Active]  DEFAULT ((1)) FOR [Active]
GO
ALTER TABLE [dbo].[Professor] ADD  CONSTRAINT [DF_Professor_Activ]  DEFAULT ((1)) FOR [Active]
GO
ALTER TABLE [dbo].[Student] ADD  CONSTRAINT [DF_Student_Activ]  DEFAULT ((1)) FOR [Active]
GO
ALTER TABLE [dbo].[Subject] ADD  CONSTRAINT [DF_Subject_Active]  DEFAULT ((1)) FOR [Active]
GO
ALTER TABLE [dbo].[SubjectType] ADD  CONSTRAINT [DF_SubjectType_Active]  DEFAULT ((1)) FOR [Active]
GO
ALTER TABLE [dbo].[Groupe]  WITH CHECK ADD  CONSTRAINT [FK_Groupe_GroupeType] FOREIGN KEY([GroupeTypeId])
REFERENCES [dbo].[GroupeType] ([GroupeTypeId])
GO
ALTER TABLE [dbo].[Groupe] CHECK CONSTRAINT [FK_Groupe_GroupeType]
GO
ALTER TABLE [dbo].[Note]  WITH CHECK ADD  CONSTRAINT [FK_Note_Professor] FOREIGN KEY([ProfessorId])
REFERENCES [dbo].[Professor] ([ProfessorId])
GO
ALTER TABLE [dbo].[Note] CHECK CONSTRAINT [FK_Note_Professor]
GO
ALTER TABLE [dbo].[Note]  WITH CHECK ADD  CONSTRAINT [FK_Note_Student] FOREIGN KEY([StudentId])
REFERENCES [dbo].[Student] ([StudentId])
GO
ALTER TABLE [dbo].[Note] CHECK CONSTRAINT [FK_Note_Student]
GO
ALTER TABLE [dbo].[Note]  WITH CHECK ADD  CONSTRAINT [FK_Note_Subject] FOREIGN KEY([SubjectId])
REFERENCES [dbo].[Subject] ([SubjectId])
GO
ALTER TABLE [dbo].[Note] CHECK CONSTRAINT [FK_Note_Subject]
GO
ALTER TABLE [dbo].[ProfessorSubject]  WITH CHECK ADD  CONSTRAINT [FK_ProfessorSubject_Professor] FOREIGN KEY([ProfessorId])
REFERENCES [dbo].[Professor] ([ProfessorId])
GO
ALTER TABLE [dbo].[ProfessorSubject] CHECK CONSTRAINT [FK_ProfessorSubject_Professor]
GO
ALTER TABLE [dbo].[ProfessorSubject]  WITH CHECK ADD  CONSTRAINT [FK_ProfessorSubject_Subject] FOREIGN KEY([SubjectId])
REFERENCES [dbo].[Subject] ([SubjectId])
GO
ALTER TABLE [dbo].[ProfessorSubject] CHECK CONSTRAINT [FK_ProfessorSubject_Subject]
GO
ALTER TABLE [dbo].[Student]  WITH CHECK ADD  CONSTRAINT [FK_Student_Groupe] FOREIGN KEY([GroupeId])
REFERENCES [dbo].[Groupe] ([GroupeId])
GO
ALTER TABLE [dbo].[Student] CHECK CONSTRAINT [FK_Student_Groupe]
GO
ALTER TABLE [dbo].[Subject]  WITH CHECK ADD  CONSTRAINT [FK_Subject_SubjectType] FOREIGN KEY([SubjectTypeId])
REFERENCES [dbo].[SubjectType] ([SubjectTypeId])
GO
ALTER TABLE [dbo].[Subject] CHECK CONSTRAINT [FK_Subject_SubjectType]
GO
/****** Object:  StoredProcedure [dbo].[spGetStudentNotes]    Script Date: 15.01.2023 15:33:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[spGetStudentNotes]
	-- Add the parameters for the stored procedure here
	@StudentId int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT [Note].* FROM Note
	INNER JOIN [Student] ON [Student].StudentId = [Note].StudentId
	WHERE [Student].StudentId = @StudentId
END
GO
/****** Object:  StoredProcedure [dbo].[spGroupeDelete]    Script Date: 15.01.2023 15:33:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spGroupeDelete] 
	-- Add the parameters for the stored procedure here
	@GroupeId int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	UPDATE [dbo].[Groupe]
	SET Active = 0
	WHERE GroupeId=@GroupeId
END
GO
/****** Object:  StoredProcedure [dbo].[spGroupeInsert]    Script Date: 15.01.2023 15:33:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spGroupeInsert] 
	-- Add the parameters for the stored procedure here
	@GroupeTypeId int,
	@FullName nvarchar(20)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	INSERT INTO [dbo].[Groupe]
	( [GroupeTypeId]
	, [FullName]
	, [Active]
	)
	VALUES 
	( @GroupeTypeId
	, @FullName
	, 1
	)
END
GO
/****** Object:  StoredProcedure [dbo].[spGroupeSelect]    Script Date: 15.01.2023 15:33:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spGroupeSelect]
	@GroupeId int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT [GroupeId]
	,[GroupeId]
	,[GroupeTypeId]
	,[FullName]
	FROM dbo.Groupe
	Where Active = 1 and GroupeId=@GroupeId
END
GO
/****** Object:  StoredProcedure [dbo].[spGroupeSelectAll]    Script Date: 15.01.2023 15:33:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spGroupeSelectAll] 
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT [GroupeId]
	,[GroupeTypeId]
	,[FullName]
	FROM dbo.Groupe
	Where Active = 1
END
GO
/****** Object:  StoredProcedure [dbo].[spGroupeTypeDelete]    Script Date: 15.01.2023 15:33:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spGroupeTypeDelete] 
	-- Add the parameters for the stored procedure here
	@GroupeTypeId int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	UPDATE [dbo].[GroupeType]
	SET Active = 0
	WHERE GroupeTypeId=@GroupeTypeId
END
GO
/****** Object:  StoredProcedure [dbo].[spGroupeTypeInsert]    Script Date: 15.01.2023 15:33:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spGroupeTypeInsert] 
	-- Add the parameters for the stored procedure here
	@FullName nvarchar(20),
	@ShortName nvarchar(20)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	INSERT INTO [dbo].[GroupeType]
	( [FullName]
	, [ShortName]
	, [Active]
	)
	VALUES 
	( @FullName
	, @ShortName
	, 1
	)
END
GO
/****** Object:  StoredProcedure [dbo].[spGroupeTypeSelect]    Script Date: 15.01.2023 15:33:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spGroupeTypeSelect]
	@GroupeTypeId int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT [GroupeTypeId]
	,[FullName]
	,[ShortName]
	FROM dbo.GroupeType
	Where Active = 1 and GroupeTypeId=@GroupeTypeId
END
GO
/****** Object:  StoredProcedure [dbo].[spGroupeTypeSelectAll]    Script Date: 15.01.2023 15:33:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spGroupeTypeSelectAll] 
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT [GroupeTypeId]
	,[FullName]
	,[ShortName]
	FROM dbo.GroupeType
	Where Active = 1
END
GO
/****** Object:  StoredProcedure [dbo].[spGroupeTypeUpdate]    Script Date: 15.01.2023 15:33:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spGroupeTypeUpdate]
	@GroupeTypeId int,
	@FullName nvarchar(50),
	@ShortName nvarchar(20),
	@Active bit
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	Update dbo.GroupeType
	Set FullName = @FullName,
	ShortName = @ShortName,
	Active = @Active
	Where Active = 1 and GroupeTypeId=@GroupeTypeId
END
GO
/****** Object:  StoredProcedure [dbo].[spGroupeUpdate]    Script Date: 15.01.2023 15:33:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spGroupeUpdate]
	@GroupeId int,
	@GroupeTypeId int,
	@FullName nvarchar(20),
	@Active bit
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	Update dbo.Groupe
	Set GroupeTypeId = @GroupeTypeId,
	FullName = @FullName,
	Active = @Active
	Where Active = 1 and GroupeId=@GroupeId
END
GO
/****** Object:  StoredProcedure [dbo].[spNoteDelete]    Script Date: 15.01.2023 15:33:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spNoteDelete] 
	-- Add the parameters for the stored procedure here
	@NoteId int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	UPDATE [dbo].[Note]
	SET Active = 0
	WHERE Id=@NoteId
END
GO
/****** Object:  StoredProcedure [dbo].[spNoteInsert]    Script Date: 15.01.2023 15:33:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spNoteInsert] 
	-- Add the parameters for the stored procedure here
	@ProfessorId int,
	@SubjectId int,
	@StudentId int,
	@Grade smallint,
	@ExamDate date
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	INSERT INTO [dbo].[Note]
	( [ProfessorId]
	, [SubjectId]
	, [StudentId]
	, [Grade]
	, [ExamDate]
	, [Active]
	)
	VALUES 
	( @ProfessorId
	, @SubjectId
	, @StudentId
	, @Grade
	, @ExamDate
	, 1
	)
END
GO
/****** Object:  StoredProcedure [dbo].[spNoteSelect]    Script Date: 15.01.2023 15:33:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spNoteSelect]
	@NoteId int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT [Id]
	,[ProfessorId]
	,[SubjectId]
	,[StudentId]
	,[Grade]
	,[ExamDate]
	FROM dbo.Note
	Where Active = 1 and Id=@NoteId
END
GO
/****** Object:  StoredProcedure [dbo].[spNoteSelectAll]    Script Date: 15.01.2023 15:33:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spNoteSelectAll] 
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT [Id]
	,[ProfessorId]
	,[SubjectId]
	,[StudentId]
	,[Grade]
	,[ExamDate]
	FROM dbo.Note
	Where Active = 1
END
GO
/****** Object:  StoredProcedure [dbo].[spNoteUpdate]    Script Date: 15.01.2023 15:33:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spNoteUpdate]
	@NoteId int,
	@ProfessorId int,
	@SubjectId int,
	@StudentId int,
	@Grade smallint,
	@ExamDate date,
	@Active bit
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	Update dbo.Note
	Set ProfessorId = @ProfessorId
	, SubjectId = @SubjectId
	, StudentId = @StudentId
	, Grade = @Grade
	, ExamDate = @ExamDate
	, Active = @Active
	Where Active = 1 and Id=@NoteId
END
GO
/****** Object:  StoredProcedure [dbo].[spProfessorDelete]    Script Date: 15.01.2023 15:33:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spProfessorDelete] 
	-- Add the parameters for the stored procedure here
	@ProfessorId int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	UPDATE [dbo].[Professor]
	SET Active = 0
	WHERE ProfessorId=@ProfessorId
END
GO
/****** Object:  StoredProcedure [dbo].[spProfessorInsert]    Script Date: 15.01.2023 15:33:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spProfessorInsert] 
	-- Add the parameters for the stored procedure here
	@Phone nvarchar(15),
	@Firstname nvarchar(50),
	@LastName nvarchar(50),
	@Cnp nvarchar(13),
	@Email nvarchar(255),
	@Active bit
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	INSERT INTO [dbo].[Professor]
	( [Phone]
	, [Firstname]
	, [Lastname]
	, [Cnp]
	, [Email]
	, [Active]
	)
	VALUES 
	( @Phone
	, @FirstName
	, @LastName
	, @Cnp
	, @Email
	, 1
	)
END
GO
/****** Object:  StoredProcedure [dbo].[spProfessorSelect]    Script Date: 15.01.2023 15:33:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spProfessorSelect]
	@ProfessorId int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT [ProfessorId]
	,[Phone]
	,[FirstName]
	,[LastName]
	,[Cnp]
	,[Email]
	FROM dbo.Professor
	Where Active = 1 and ProfessorId=@ProfessorId
END
GO
/****** Object:  StoredProcedure [dbo].[spProfessorSelectAll]    Script Date: 15.01.2023 15:33:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spProfessorSelectAll] 
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT [ProfessorId]
	,[Phone]
	,[FirstName]
	,[LastName]
	,[Cnp]
	,[Email]
	FROM dbo.Professor
	Where Active = 1
END
GO
/****** Object:  StoredProcedure [dbo].[spProfessorSubjectDelete]    Script Date: 15.01.2023 15:33:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spProfessorSubjectDelete] 
	-- Add the parameters for the stored procedure here
	@ProfessorSubjectId int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	DELETE FROM [dbo].[ProfessorSubject]
	WHERE Id=@ProfessorSubjectId
END
GO
/****** Object:  StoredProcedure [dbo].[spProfessorSubjectInsert]    Script Date: 15.01.2023 15:33:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spProfessorSubjectInsert] 
	-- Add the parameters for the stored procedure here
	@ProfessorId int,
	@SubjectId int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	INSERT INTO [dbo].[ProfessorSubject]
	( [ProfessorId]
	, [SubjectId]
	)
	VALUES 
	( @ProfessorId
	, @SubjectId
	)
END
GO
/****** Object:  StoredProcedure [dbo].[spProfessorSubjectSelect]    Script Date: 15.01.2023 15:33:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spProfessorSubjectSelect]
	@ProfessorSubjectId int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT [Id]
	,[ProfessorId]
	,[SubjectId]
	FROM dbo.ProfessorSubject
	Where Id=@ProfessorSubjectId
END
GO
/****** Object:  StoredProcedure [dbo].[spProfessorSubjectSelectAll]    Script Date: 15.01.2023 15:33:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spProfessorSubjectSelectAll] 
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT [Id]
	,[ProfessorId]
	,[SubjectId]
	FROM dbo.ProfessorSubject
END
GO
/****** Object:  StoredProcedure [dbo].[spProfessorSubjectUpdate]    Script Date: 15.01.2023 15:33:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spProfessorSubjectUpdate]
	@ProfessorSubjectId int,
	@ProfessorId int,
	@SubjectId int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	Update dbo.ProfessorSubject
	Set ProfessorId = @ProfessorId
	, SubjectId = @SubjectId
	Where Id=@ProfessorSubjectId
END
GO
/****** Object:  StoredProcedure [dbo].[spProfessorUpdate]    Script Date: 15.01.2023 15:33:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spProfessorUpdate]
	@ProfessorId int,
	@Phone nvarchar(10),
	@Firstname nvarchar(50),
	@LastName nvarchar(50),
	@Cnp nvarchar(13),
	@Email nvarchar(255),
	@Active bit
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	Update dbo.Professor
	Set Phone = @Phone
	, FirstName = @Firstname
	, LastName = @LastName
	, Cnp = @Cnp
	, Email = @Email
	, Active = @Active
	Where Active = 1 and ProfessorId=@ProfessorId
END
GO
/****** Object:  StoredProcedure [dbo].[spStudentDelete]    Script Date: 15.01.2023 15:33:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spStudentDelete] 
	-- Add the parameters for the stored procedure here
	@StudentId int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	UPDATE [dbo].[Student]
	SET Active = 0
	WHERE StudentId=@StudentId
END
GO
/****** Object:  StoredProcedure [dbo].[spStudentInsert]    Script Date: 15.01.2023 15:33:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spStudentInsert] 
	-- Add the parameters for the stored procedure here
	@GroupeId int,
	@FirstName nchar(50),
	@LastName nchar(50),
	@Cnp varchar(13),
	@Email nchar(255)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	INSERT INTO [dbo].[Student]
	( [GroupeId]
	, [FirstName]
	, [LastName]
	, [Cnp]
	, [Email]
	, [Active]
	)
	VALUES 
	( @GroupeId
	, @FirstName
	, @LastName
	, @Cnp
	, @Email
	, 1
	)
END
GO
/****** Object:  StoredProcedure [dbo].[spStudentSelect]    Script Date: 15.01.2023 15:33:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spStudentSelect]
	@StudentId int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT [StudentId]
	,[GroupeId]
	,[FirstName]
	,[LastName]
	,[Cnp]
	,[Email]
	FROM dbo.Student
	Where Active = 1 and StudentId=@StudentId
END
GO
/****** Object:  StoredProcedure [dbo].[spStudentSelectAll]    Script Date: 15.01.2023 15:33:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spStudentSelectAll] 
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT [StudentId]
	,[GroupeId]
	,[FirstName]
	,[LastName]
	,[Cnp]
	,[Email]
	FROM dbo.Student
	Where Active = 1
END
GO
/****** Object:  StoredProcedure [dbo].[spStudentUpdate]    Script Date: 15.01.2023 15:33:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spStudentUpdate]
	@StudentId int,
	@GroupeId int,
	@FirstName nvarchar(50),
	@LastName nvarchar(50),
	@Cnp nvarchar(13),
	@Email nvarchar(255),
	@Active bit
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	Update dbo.Student
	Set GroupeId = @GroupeId,
	FirstName = @FirstName,
	LastName = @LastName,
	Cnp = @Cnp,
	Email = @Email,
	Active = @Active
	Where Active = 1 and StudentId=@StudentId
END
GO
/****** Object:  StoredProcedure [dbo].[spSubjectDelete]    Script Date: 15.01.2023 15:33:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spSubjectDelete] 
	-- Add the parameters for the stored procedure here
	@SubjectId int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	UPDATE [dbo].[Subject]
	SET Active = 0
	WHERE SubjectId=@SubjectId
END
GO
/****** Object:  StoredProcedure [dbo].[spSubjectInsert]    Script Date: 15.01.2023 15:33:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spSubjectInsert] 
	-- Add the parameters for the stored procedure here
	@SubjectTypeId int,
	@FullName nvarchar(50),
	@ShortName nvarchar(20)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	INSERT INTO [dbo].[Subject]
	( [SubjectTypeId]
	, [FullName]
	, [ShortName]
	, [Active]
	)
	VALUES 
	( @SubjectTypeId
	, @FullName
	, @ShortName
	, 1
	)
END
GO
/****** Object:  StoredProcedure [dbo].[spSubjectSelect]    Script Date: 15.01.2023 15:33:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spSubjectSelect]
	@SubjectId int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT [SubjectId]
	,[SubjectTypeId]
	,[FullName]
	,[ShortName]
	FROM dbo.Subject
	Where SubjectId=@SubjectId
END
GO
/****** Object:  StoredProcedure [dbo].[spSubjectSelectAll]    Script Date: 15.01.2023 15:33:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spSubjectSelectAll] 
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT [SubjectId]
	,[SubjectTypeId]
	,[FullName]
	,[ShortName]
	FROM dbo.Subject
END
GO
/****** Object:  StoredProcedure [dbo].[spSubjectTypeDelete]    Script Date: 15.01.2023 15:33:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spSubjectTypeDelete] 
	-- Add the parameters for the stored procedure here
	@SubjectTypeId int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	UPDATE [dbo].[SubjectType]
	SET Active = 0
	WHERE SubjectTypeId=@SubjectTypeId
END
GO
/****** Object:  StoredProcedure [dbo].[spSubjectTypeInsert]    Script Date: 15.01.2023 15:33:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spSubjectTypeInsert] 
	-- Add the parameters for the stored procedure here
	@SubjectTypeTypeId int,
	@FullName nvarchar(50),
	@ShortName nvarchar(20)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	INSERT INTO [dbo].[SubjectType]
	( [FullName]
	, [ShortName]
	, [Active]
	)
	VALUES 
	( @FullName
	, @ShortName
	, 1
	)
END
GO
/****** Object:  StoredProcedure [dbo].[spSubjectTypeSelect]    Script Date: 15.01.2023 15:33:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spSubjectTypeSelect]
	@SubjectTypeId int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT [SubjectTypeId]
	,[FullName]
	,[ShortName]
	FROM dbo.SubjectType
	Where SubjectTypeId=@SubjectTypeId
END
GO
/****** Object:  StoredProcedure [dbo].[spSubjectTypeSelectAll]    Script Date: 15.01.2023 15:33:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spSubjectTypeSelectAll] 
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT [SubjectTypeId]
	,[FullName]
	,[ShortName]
	FROM dbo.SubjectType
END
GO
/****** Object:  StoredProcedure [dbo].[spSubjectTypeUpdate]    Script Date: 15.01.2023 15:33:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spSubjectTypeUpdate]
	@SubjectTypeId int,
	@FullName nvarchar(50),
	@ShortName nvarchar(20)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	Update dbo.SubjectType
	Set FullName = @FullName,
	ShortName = @ShortName
	Where SubjectTypeId=@SubjectTypeId
END
GO
/****** Object:  StoredProcedure [dbo].[spSubjectUpdate]    Script Date: 15.01.2023 15:33:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spSubjectUpdate]
	@SubjectId int,
	@SubjectTypeId int,
	@FullName nvarchar(50),
	@ShortName nvarchar(20)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	Update dbo.Subject
	Set SubjectTypeId = @SubjectTypeId,
	FullName = @FullName,
	ShortName = @ShortName
	Where SubjectId=@SubjectId
END
GO
USE [master]
GO
ALTER DATABASE [dbStudent] SET  READ_WRITE 
GO
