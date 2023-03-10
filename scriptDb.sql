USE [master]
GO
/****** Object:  Database [dbPEL]    Script Date: 19/01/2023 12:41:39 ******/
CREATE DATABASE [dbPEL]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'dbPEL', FILENAME = N'D:\UNITBV\MSSQL15.SQLEXPRESS\MSSQL\DATA\dbPEL.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'dbPEL_log', FILENAME = N'D:\UNITBV\MSSQL15.SQLEXPRESS\MSSQL\DATA\dbPEL_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [dbPEL] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [dbPEL].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [dbPEL] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [dbPEL] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [dbPEL] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [dbPEL] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [dbPEL] SET ARITHABORT OFF 
GO
ALTER DATABASE [dbPEL] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [dbPEL] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [dbPEL] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [dbPEL] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [dbPEL] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [dbPEL] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [dbPEL] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [dbPEL] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [dbPEL] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [dbPEL] SET  DISABLE_BROKER 
GO
ALTER DATABASE [dbPEL] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [dbPEL] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [dbPEL] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [dbPEL] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [dbPEL] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [dbPEL] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [dbPEL] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [dbPEL] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [dbPEL] SET  MULTI_USER 
GO
ALTER DATABASE [dbPEL] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [dbPEL] SET DB_CHAINING OFF 
GO
ALTER DATABASE [dbPEL] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [dbPEL] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [dbPEL] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [dbPEL] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [dbPEL] SET QUERY_STORE = OFF
GO
USE [dbPEL]
GO
/****** Object:  Table [dbo].[Groupe]    Script Date: 19/01/2023 12:41:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Groupe](
	[GroupeId] [int] IDENTITY(1,1) NOT NULL,
	[GroupeTypeId] [int] NOT NULL,
	[FullName] [nchar](50) NOT NULL,
	[Active] [bit] NOT NULL,
 CONSTRAINT [PK_Groupe] PRIMARY KEY CLUSTERED 
(
	[GroupeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GroupeType]    Script Date: 19/01/2023 12:41:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GroupeType](
	[GroupeTypeId] [int] IDENTITY(1,1) NOT NULL,
	[FullName] [nchar](50) NOT NULL,
	[ShortName] [nvarchar](10) NOT NULL,
	[Active] [bit] NOT NULL,
 CONSTRAINT [PK_GroupeType] PRIMARY KEY CLUSTERED 
(
	[GroupeTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Note]    Script Date: 19/01/2023 12:41:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Note](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ProfessorId] [int] NOT NULL,
	[SubjectId] [int] NOT NULL,
	[StudentId] [int] NOT NULL,
	[Grade] [smallint] NOT NULL,
	[ExamDate] [date] NULL,
 CONSTRAINT [PK_Note] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Professor]    Script Date: 19/01/2023 12:41:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Professor](
	[ProfessorId] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nchar](50) NOT NULL,
	[LastName] [nchar](50) NOT NULL,
	[Cnp] [varchar](13) NOT NULL,
	[Telephone] [nchar](10) NULL,
	[Active] [bit] NOT NULL,
 CONSTRAINT [PK_Professor] PRIMARY KEY CLUSTERED 
(
	[ProfessorId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProfessorSubject]    Script Date: 19/01/2023 12:41:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProfessorSubject](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ProfessorId] [int] NOT NULL,
	[SubjectId] [int] NOT NULL,
 CONSTRAINT [PK_ProfessorSubject] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Student]    Script Date: 19/01/2023 12:41:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Student](
	[StudentId] [int] IDENTITY(1,1) NOT NULL,
	[GroupeId] [int] NOT NULL,
	[FirstName] [nchar](50) NOT NULL,
	[LastName] [nchar](50) NOT NULL,
	[Cnp] [varchar](13) NOT NULL,
	[Email] [nchar](255) NULL,
	[Active] [bit] NOT NULL,
 CONSTRAINT [PK_Student] PRIMARY KEY CLUSTERED 
(
	[StudentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Subject]    Script Date: 19/01/2023 12:41:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Subject](
	[SubjectId] [int] IDENTITY(1,1) NOT NULL,
	[SubjectTypeId] [int] NOT NULL,
	[FullName] [nchar](50) NOT NULL,
	[Active] [bit] NOT NULL,
 CONSTRAINT [PK_Subject] PRIMARY KEY CLUSTERED 
(
	[SubjectId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SubjectType]    Script Date: 19/01/2023 12:41:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SubjectType](
	[SubjectTypeId] [int] IDENTITY(1,1) NOT NULL,
	[FullName] [nchar](50) NOT NULL,
	[ShortName] [nvarchar](10) NOT NULL,
	[Active] [bit] NOT NULL,
 CONSTRAINT [PK_SubjectType] PRIMARY KEY CLUSTERED 
(
	[SubjectTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Groupe] ADD  CONSTRAINT [DF_Groupe_GroupeTypeId]  DEFAULT ((1)) FOR [GroupeTypeId]
GO
ALTER TABLE [dbo].[Groupe] ADD  CONSTRAINT [DF_Groupe_Active]  DEFAULT ((1)) FOR [Active]
GO
ALTER TABLE [dbo].[GroupeType] ADD  CONSTRAINT [DF_GroupeType_Active]  DEFAULT ((1)) FOR [Active]
GO
ALTER TABLE [dbo].[Professor] ADD  CONSTRAINT [DF_Professor_Active]  DEFAULT ((1)) FOR [Active]
GO
ALTER TABLE [dbo].[Student] ADD  CONSTRAINT [DF_Student_Active]  DEFAULT ((1)) FOR [Active]
GO
ALTER TABLE [dbo].[Subject] ADD  CONSTRAINT [DF_Subject_SubjectTypeId]  DEFAULT ((1)) FOR [SubjectTypeId]
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
ALTER TABLE [dbo].[Note]  WITH CHECK ADD  CONSTRAINT [FK_Note_Subject1] FOREIGN KEY([SubjectId])
REFERENCES [dbo].[Subject] ([SubjectId])
GO
ALTER TABLE [dbo].[Note] CHECK CONSTRAINT [FK_Note_Subject1]
GO
ALTER TABLE [dbo].[ProfessorSubject]  WITH CHECK ADD  CONSTRAINT [FK_ProfessorSubject_Professor] FOREIGN KEY([ProfessorId])
REFERENCES [dbo].[Professor] ([ProfessorId])
GO
ALTER TABLE [dbo].[ProfessorSubject] CHECK CONSTRAINT [FK_ProfessorSubject_Professor]
GO
ALTER TABLE [dbo].[ProfessorSubject]  WITH CHECK ADD  CONSTRAINT [FK_ProfessorSubject_Subject1] FOREIGN KEY([SubjectId])
REFERENCES [dbo].[Subject] ([SubjectId])
GO
ALTER TABLE [dbo].[ProfessorSubject] CHECK CONSTRAINT [FK_ProfessorSubject_Subject1]
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
/****** Object:  StoredProcedure [dbo].[spProfessorDelete]    Script Date: 19/01/2023 12:41:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[spProfessorDelete]
	-- Add the parameters for the stored procedure here
	@ProfessorId int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
  UPDATE 
  [dbo].[Professor]
  SET Active=0
  WHERE [ProfessorId] = @ProfessorId
END
GO
/****** Object:  StoredProcedure [dbo].[spProfessorInsert]    Script Date: 19/01/2023 12:41:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[spProfessorInsert] 
	-- Add the parameters for the stored procedure here
	@FirstName nvarchar(50)
	, @LastName nvarchar(50)
	, @Cnp varchar(13)
	, @Telephone nvarchar(255)
	, @Active bit
AS
BEGIN
	INSERT INTO dbo.Professor(
		FirstName,LastName,Cnp,Telephone,Active)
		VALUES(@FirstName,@LastName,@Cnp,@Telephone,@Active)
END
GO
/****** Object:  StoredProcedure [dbo].[spProfessorSelect]    Script Date: 19/01/2023 12:41:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[spProfessorSelect]
	-- Add the parameters for the stored procedure here
	@ProfessorId int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT [ProfessorId]
      ,[FirstName]
      ,[LastName]
      ,[Cnp]
      ,[Active]
  FROM [dbo].[Professor]
  WHERE [ProfessorId] = @ProfessorId
END
GO
/****** Object:  StoredProcedure [dbo].[spProfessorUpdate]    Script Date: 19/01/2023 12:41:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[spProfessorUpdate]
	-- Add the parameters for the stored procedure here
	@ProfessorId int
    ,@FirstName nchar(50)
    ,@LastName nchar(50)
    ,@Cnp varchar(13)
    ,@Telephone nchar(255)
	,@Active bit
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	UPDATE [dbo].[Professor]
   SET [FirstName] = @FirstName
      ,[LastName] = @LastName
      ,[Cnp] = @Cnp
      ,[Telephone] = @Telephone
	  ,[Active]=@Active
 WHERE ProfessorId=@ProfessorId
END
GO
/****** Object:  StoredProcedure [dbo].[spStudentDelete]    Script Date: 19/01/2023 12:41:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[spStudentDelete]
	-- Add the parameters for the stored procedure here
	@StudentId int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
  UPDATE 
  [dbo].[Student]
  SET Active=0
  WHERE [StudentId] = @StudentId
END
GO
/****** Object:  StoredProcedure [dbo].[spStudentInsert]    Script Date: 19/01/2023 12:41:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[spStudentInsert] 
	-- Add the parameters for the stored procedure here
	@GroupeId int
	, @FirstName nvarchar(50)
	, @LastName nvarchar(50)
	,@Cnp varchar(13)
	, @Email nvarchar(255)
	, @Active bit
AS
BEGIN
	INSERT INTO dbo.Student(
		GroupeId,FirstName,LastName,Cnp,Email,Active)
		VALUES(@GroupeId,@FirstName,@LastName,@Cnp,@Email,@Active)
END
GO
/****** Object:  StoredProcedure [dbo].[spStudentSelect]    Script Date: 19/01/2023 12:41:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[spStudentSelect]
	-- Add the parameters for the stored procedure here
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
      ,[Active]
  FROM [dbo].[Student]
  WHERE [StudentId] = @StudentId
END
GO
/****** Object:  StoredProcedure [dbo].[spStudentSelectAllActive]    Script Date: 19/01/2023 12:41:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[spStudentSelectAllActive]
	-- Add the parameters for the stored procedure here
	
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
      ,[Active]
  FROM [dbo].[Student]
  WHERE Active=1
END
GO
/****** Object:  StoredProcedure [dbo].[spStudentUpdate]    Script Date: 19/01/2023 12:41:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[spStudentUpdate]
	-- Add the parameters for the stored procedure here
	@StudentId int
	,@GroupeId int
    ,@FirstName nchar(50)
    ,@LastName nchar(50)
    ,@Cnp varchar(13)
    ,@Email nchar(255)
	,@Active bit
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	UPDATE [dbo].[Student]
   SET [GroupeId] = @GroupeId
      ,[FirstName] = @FirstName
      ,[LastName] = @LastName
      ,[Cnp] = @Cnp
      ,[Email] = @Email
	  ,[Active] = @Active
 WHERE StudentId=@StudentId
END
GO
USE [master]
GO
ALTER DATABASE [dbPEL] SET  READ_WRITE 
GO
