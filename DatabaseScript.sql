USE [iTEC Hackathon]
GO
/****** Object:  Table [dbo].[ApplicationDevelopers]    Script Date: 5/25/2024 6:37:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ApplicationDevelopers](
	[IdApplicationDeveloper] [int] IDENTITY(1,1) NOT NULL,
	[IdApplication] [int] NULL,
	[IdDeveloper] [int] NULL,
	[DateAttributed] [datetime] NULL,
 CONSTRAINT [PK_ApplicationDevelopers] PRIMARY KEY CLUSTERED 
(
	[IdApplicationDeveloper] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ApplicationReports]    Script Date: 5/25/2024 6:37:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ApplicationReports](
	[IdApplicationReport] [int] IDENTITY(1,1) NOT NULL,
	[IdApplication] [int] NULL,
	[IdEndpoint] [int] NULL,
	[DateCreated] [datetime] NULL,
	[IdUser] [int] NULL,
	[Mentions] [nvarchar](512) NULL,
	[MarkedAsSolved] [int] NULL,
 CONSTRAINT [PK_ApplicationReports] PRIMARY KEY CLUSTERED 
(
	[IdApplicationReport] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Applications]    Script Date: 5/25/2024 6:37:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Applications](
	[IdApplication] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](128) NULL,
	[Description] [nvarchar](512) NULL,
	[IdUserAuthor] [int] NULL,
	[IdApplicationState] [int] NULL,
	[DateCreated] [datetime] NULL,
	[Image] [nvarchar](512) NULL,
 CONSTRAINT [PK_Applications] PRIMARY KEY CLUSTERED 
(
	[IdApplication] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ApplicationStates]    Script Date: 5/25/2024 6:37:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ApplicationStates](
	[IdApplicationState] [int] IDENTITY(1,1) NOT NULL,
	[State] [nvarchar](128) NULL,
 CONSTRAINT [PK_ApplicationStates] PRIMARY KEY CLUSTERED 
(
	[IdApplicationState] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Comments]    Script Date: 5/25/2024 6:37:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Comments](
	[IdComment] [int] IDENTITY(1,1) NOT NULL,
	[IdApplication] [int] NULL,
	[IdUser] [int] NULL,
	[Comment] [varchar](max) NULL,
	[DateComented] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[IdComment] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EndpointHistory]    Script Date: 5/25/2024 6:37:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EndpointHistory](
	[IdEndpointHistory] [int] IDENTITY(1,1) NOT NULL,
	[DateCreated] [datetime] NULL,
	[Mentions] [nvarchar](512) NULL,
	[IdEndpoint] [int] NULL,
	[IdUser] [int] NULL,
	[Code] [int] NULL,
 CONSTRAINT [PK_EndpointHistory] PRIMARY KEY CLUSTERED 
(
	[IdEndpointHistory] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Endpoints]    Script Date: 5/25/2024 6:37:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Endpoints](
	[IdEndpoint] [int] IDENTITY(1,1) NOT NULL,
	[URL] [nvarchar](512) NULL,
	[IdType] [int] NULL,
	[DateCreated] [datetime] NULL,
	[IdApplication] [int] NULL,
 CONSTRAINT [PK_Endpoints] PRIMARY KEY CLUSTERED 
(
	[IdEndpoint] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Notifications]    Script Date: 5/25/2024 6:37:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Notifications](
	[IdNotification] [int] IDENTITY(1,1) NOT NULL,
	[IdReceiver] [int] NULL,
	[IdSender] [int] NULL,
	[Text] [nvarchar](max) NULL,
	[DateCreated] [datetime] NULL,
	[IdApplication] [int] NULL,
	[IdEndpoint] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[IdNotification] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Types]    Script Date: 5/25/2024 6:37:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Types](
	[IdType] [int] IDENTITY(1,1) NOT NULL,
	[Type] [nvarchar](128) NULL,
 CONSTRAINT [PK_Types] PRIMARY KEY CLUSTERED 
(
	[IdType] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 5/25/2024 6:37:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[IdUser] [int] IDENTITY(1,1) NOT NULL,
	[Email] [nvarchar](128) NULL,
	[Password] [nvarchar](128) NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[IdUser] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ApplicationDevelopers]  WITH CHECK ADD FOREIGN KEY([IdApplication])
REFERENCES [dbo].[Applications] ([IdApplication])
GO
ALTER TABLE [dbo].[ApplicationReports]  WITH CHECK ADD  CONSTRAINT [FK_ApplicationReports_Applications] FOREIGN KEY([IdApplication])
REFERENCES [dbo].[Applications] ([IdApplication])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ApplicationReports] CHECK CONSTRAINT [FK_ApplicationReports_Applications]
GO
ALTER TABLE [dbo].[ApplicationReports]  WITH CHECK ADD  CONSTRAINT [FK_ApplicationReports_Endpoints] FOREIGN KEY([IdEndpoint])
REFERENCES [dbo].[Endpoints] ([IdEndpoint])
GO
ALTER TABLE [dbo].[ApplicationReports] CHECK CONSTRAINT [FK_ApplicationReports_Endpoints]
GO
ALTER TABLE [dbo].[ApplicationReports]  WITH CHECK ADD  CONSTRAINT [FK_ApplicationReports_Users] FOREIGN KEY([IdUser])
REFERENCES [dbo].[Users] ([IdUser])
GO
ALTER TABLE [dbo].[ApplicationReports] CHECK CONSTRAINT [FK_ApplicationReports_Users]
GO
ALTER TABLE [dbo].[Applications]  WITH CHECK ADD  CONSTRAINT [FK_Applications_ApplicationStates] FOREIGN KEY([IdApplicationState])
REFERENCES [dbo].[ApplicationStates] ([IdApplicationState])
GO
ALTER TABLE [dbo].[Applications] CHECK CONSTRAINT [FK_Applications_ApplicationStates]
GO
ALTER TABLE [dbo].[Applications]  WITH CHECK ADD  CONSTRAINT [FK_Applications_Users] FOREIGN KEY([IdUserAuthor])
REFERENCES [dbo].[Users] ([IdUser])
GO
ALTER TABLE [dbo].[Applications] CHECK CONSTRAINT [FK_Applications_Users]
GO
ALTER TABLE [dbo].[Applications]  WITH CHECK ADD  CONSTRAINT [FK_UserAuthor_User] FOREIGN KEY([IdUserAuthor])
REFERENCES [dbo].[Users] ([IdUser])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Applications] CHECK CONSTRAINT [FK_UserAuthor_User]
GO
ALTER TABLE [dbo].[Comments]  WITH CHECK ADD  CONSTRAINT [FK_Comments_Applications] FOREIGN KEY([IdApplication])
REFERENCES [dbo].[Applications] ([IdApplication])
GO
ALTER TABLE [dbo].[Comments] CHECK CONSTRAINT [FK_Comments_Applications]
GO
ALTER TABLE [dbo].[Comments]  WITH CHECK ADD  CONSTRAINT [FK_Comments_Users] FOREIGN KEY([IdUser])
REFERENCES [dbo].[Users] ([IdUser])
GO
ALTER TABLE [dbo].[Comments] CHECK CONSTRAINT [FK_Comments_Users]
GO
ALTER TABLE [dbo].[EndpointHistory]  WITH CHECK ADD  CONSTRAINT [FK_EndpointHistory_Endpoints] FOREIGN KEY([IdEndpoint])
REFERENCES [dbo].[Endpoints] ([IdEndpoint])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[EndpointHistory] CHECK CONSTRAINT [FK_EndpointHistory_Endpoints]
GO
ALTER TABLE [dbo].[EndpointHistory]  WITH CHECK ADD  CONSTRAINT [FK_EndpointHistory_Users] FOREIGN KEY([IdUser])
REFERENCES [dbo].[Users] ([IdUser])
GO
ALTER TABLE [dbo].[EndpointHistory] CHECK CONSTRAINT [FK_EndpointHistory_Users]
GO
ALTER TABLE [dbo].[Endpoints]  WITH CHECK ADD  CONSTRAINT [FK_Endpoints_Applications] FOREIGN KEY([IdApplication])
REFERENCES [dbo].[Applications] ([IdApplication])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Endpoints] CHECK CONSTRAINT [FK_Endpoints_Applications]
GO
ALTER TABLE [dbo].[Endpoints]  WITH CHECK ADD  CONSTRAINT [FK_Endpoints_Types] FOREIGN KEY([IdType])
REFERENCES [dbo].[Types] ([IdType])
GO
ALTER TABLE [dbo].[Endpoints] CHECK CONSTRAINT [FK_Endpoints_Types]
GO
ALTER TABLE [dbo].[Notifications]  WITH CHECK ADD  CONSTRAINT [FK_Notification_Application] FOREIGN KEY([IdApplication])
REFERENCES [dbo].[Applications] ([IdApplication])
GO
ALTER TABLE [dbo].[Notifications] CHECK CONSTRAINT [FK_Notification_Application]
GO
ALTER TABLE [dbo].[Notifications]  WITH CHECK ADD  CONSTRAINT [FK_Notification_Endpoint] FOREIGN KEY([IdEndpoint])
REFERENCES [dbo].[Endpoints] ([IdEndpoint])
GO
ALTER TABLE [dbo].[Notifications] CHECK CONSTRAINT [FK_Notification_Endpoint]
GO
ALTER TABLE [dbo].[Notifications]  WITH CHECK ADD  CONSTRAINT [FK_Notification_Receiver] FOREIGN KEY([IdReceiver])
REFERENCES [dbo].[Users] ([IdUser])
GO
ALTER TABLE [dbo].[Notifications] CHECK CONSTRAINT [FK_Notification_Receiver]
GO
ALTER TABLE [dbo].[Notifications]  WITH CHECK ADD  CONSTRAINT [FK_Notification_Sender] FOREIGN KEY([IdSender])
REFERENCES [dbo].[Users] ([IdUser])
GO
ALTER TABLE [dbo].[Notifications] CHECK CONSTRAINT [FK_Notification_Sender]
GO
/****** Object:  StoredProcedure [dbo].[AddComment]    Script Date: 5/25/2024 6:37:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[AddComment]
    @IdApplication INT,
    @IdUser INT,
    @Comment VARCHAR(MAX),
    @DateComented DATETIME
AS
BEGIN
    SET NOCOUNT ON;
    
    INSERT INTO Comments (IdApplication, IdUser, Comment, DateComented)
    VALUES (@IdApplication, @IdUser, @Comment, @DateComented);
END;
GO
/****** Object:  StoredProcedure [dbo].[CallEndpoints]    Script Date: 5/25/2024 6:37:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[CallEndpoints]
AS
BEGIN
    DECLARE @random_num INT;
	DECLARE @endpoint_id INT;

    -- Loop through each record in Endpoints table
    DECLARE endpoint_cursor CURSOR FOR
    SELECT IdEndpoint
    FROM Endpoints;

    OPEN endpoint_cursor;
    FETCH NEXT FROM endpoint_cursor INTO @endpoint_id;

    WHILE @@FETCH_STATUS = 0
    BEGIN
        -- Generate a random number between 1 and 100
        SET @random_num = ROUND(RAND() * 100, 0);

        IF @random_num = 10 OR @random_num = 90
        BEGIN
            INSERT INTO EndpointHistory (IdEndpoint, DateCreated, Code)
			VALUES (@endpoint_id, GETDATE(), 400);
        END
        ELSE
        BEGIN
            INSERT INTO EndpointHistory (IdEndpoint, DateCreated, Code)
			VALUES (@endpoint_id, GETDATE(), 200);
        END

        FETCH NEXT FROM endpoint_cursor INTO @endpoint_id;
    END

    CLOSE endpoint_cursor;
    DEALLOCATE endpoint_cursor;
END;
GO
/****** Object:  StoredProcedure [dbo].[DeleteApplication]    Script Date: 5/25/2024 6:37:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[DeleteApplication]
    @IdApplication INT,
    @Success BIT OUTPUT
AS
BEGIN
    SET NOCOUNT ON;

    IF EXISTS (SELECT 1 FROM [iTEC Hackathon].[dbo].[Applications] WHERE [IdApplication] = @IdApplication)
    BEGIN
        DELETE FROM [iTEC Hackathon].[dbo].[Applications] WHERE [IdApplication] = @IdApplication;
        SET @Success = 1; -- Deletion succeeded
    END
    ELSE
    BEGIN
        SET @Success = 0; -- Deletion failed (no row found with the given IdApplication)
    END
END;
GO
/****** Object:  StoredProcedure [dbo].[DeleteEndpoint]    Script Date: 5/25/2024 6:37:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[DeleteEndpoint]
    @IdEndpoint INT,
    @Success BIT OUTPUT
AS
BEGIN
    SET NOCOUNT ON;

    BEGIN TRY
        -- Start a transaction
        BEGIN TRANSACTION;

        -- Delete from ApplicationReports
        DELETE FROM [iTEC Hackathon].[dbo].[ApplicationReports]
        WHERE [IdEndpoint] = @IdEndpoint;

        -- Delete from EndpointHistory
        DELETE FROM [iTEC Hackathon].[dbo].[EndpointHistory]
        WHERE [IdEndpoint] = @IdEndpoint;

        -- Delete from Notifications
        DELETE FROM [iTEC Hackathon].[dbo].[Notifications]
        WHERE [IdEndpoint] = @IdEndpoint;

        -- Delete from Endpoints
        DELETE FROM [iTEC Hackathon].[dbo].[Endpoints]
        WHERE [IdEndpoint] = @IdEndpoint;

        -- Commit the transaction
        COMMIT TRANSACTION;

        SET @Success = 1; -- Set Success variable to 1 if the deletion succeeded
    END TRY
    BEGIN CATCH
        -- Rollback the transaction in case of error
        ROLLBACK TRANSACTION;

        SET @Success = 0; -- Set Success variable to 0 if an error occurred
    END CATCH;
END;
GO
/****** Object:  StoredProcedure [dbo].[DeleteNotificationById]    Script Date: 5/25/2024 6:37:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
  CREATE PROCEDURE [dbo].[DeleteNotificationById]
    @IdNotification INT
AS
BEGIN
    DELETE FROM [iTEC Hackathon].[dbo].[Notifications]
    WHERE IdNotification = @IdNotification
END
GO
/****** Object:  StoredProcedure [dbo].[DeleteReport]    Script Date: 5/25/2024 6:37:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[DeleteReport]
    @IdApplicationReport INT,
    @Success BIT OUTPUT
AS
BEGIN
    SET NOCOUNT ON;

    BEGIN TRY
        DELETE FROM [iTEC Hackathon].[dbo].[ApplicationReports]
        WHERE [IdApplicationReport] = @IdApplicationReport;

        SET @Success = 1; -- Deletion succeeded
    END TRY
    BEGIN CATCH
        SET @Success = 0; -- Deletion failed
    END CATCH;
END;
GO
/****** Object:  StoredProcedure [dbo].[GetApplicationById]    Script Date: 5/25/2024 6:37:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetApplicationById]
    @IdApplication INT
AS
BEGIN
    SET NOCOUNT ON;

	EXEC [dbo].[UpdateApplicationStateForAllApplications];

    SELECT A.[Name],
           A.[Description],
		   U.IdUser,
           U.[Email] AS [UserEmail],
           AS1.[State] AS [ApplicationState],
           A.[Image],
           A.[DateCreated]
    FROM [iTEC Hackathon].[dbo].[Applications] A
    LEFT JOIN [iTEC Hackathon].[dbo].[Users] U ON A.[IdUserAuthor] = U.[IdUser]
    LEFT JOIN [iTEC Hackathon].[dbo].[ApplicationStates] AS1 ON A.[IdApplicationState] = AS1.[IdApplicationState]
    WHERE A.[IdApplication] = @IdApplication;
END;
GO
/****** Object:  StoredProcedure [dbo].[GetApplications]    Script Date: 5/25/2024 6:37:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[GetApplications]
    @IdUserAuthor INT
AS
BEGIN
    SET NOCOUNT ON;
	EXEC [dbo].[UpdateApplicationStateForAllApplications];

    SELECT A.[IdApplication],
           A.[Name],
           A.[Description],
           A.[Image], -- Include the Image column
           U.[Email] AS [UserEmail],
           AS1.[State] AS [ApplicationState],
           A.[DateCreated]
    FROM [iTEC Hackathon].[dbo].[Applications] A
    LEFT JOIN [iTEC Hackathon].[dbo].[ApplicationStates] AS1 ON A.[IdApplicationState] = AS1.[IdApplicationState]
    LEFT JOIN [iTEC Hackathon].[dbo].[Users] U ON A.[IdUserAuthor] = U.[IdUser]
    WHERE @IdUserAuthor = 0 OR A.[IdUserAuthor] = @IdUserAuthor;
END;
GO
/****** Object:  StoredProcedure [dbo].[GetApplicationsByAuthor]    Script Date: 5/25/2024 6:37:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[GetApplicationsByAuthor]
    @IdUserAuthor INT
AS
BEGIN
	EXEC [dbo].[UpdateApplicationStateForAllApplications];
    SET NOCOUNT ON;

    SELECT A.[IdApplication],
           A.[Name],
           A.[Description],
           A.[Image], -- Include the Image column
           U.[Email] AS [UserEmail],
           AS1.[State] AS [ApplicationState],
           A.[DateCreated]
    FROM [iTEC Hackathon].[dbo].[Applications] A
    LEFT JOIN [iTEC Hackathon].[dbo].[ApplicationStates] AS1 ON A.[IdApplicationState] = AS1.[IdApplicationState]
    LEFT JOIN [iTEC Hackathon].[dbo].[Users] U ON A.[IdUserAuthor] = U.[IdUser]
    WHERE @IdUserAuthor = 0 OR A.[IdUserAuthor] = @IdUserAuthor;
END;
GO
/****** Object:  StoredProcedure [dbo].[GetCommentsByApplicationId]    Script Date: 5/25/2024 6:37:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetCommentsByApplicationId]
    @IdApplication INT
AS
BEGIN
    SET NOCOUNT ON;
    
    SELECT IdComment, IdApplication, c.IdUser, u.Email, Comment, DateComented
    FROM Comments as c
	inner join Users as u on c.IdUser = u.IdUser
    WHERE IdApplication = @IdApplication
    ORDER BY DateComented DESC;
END;
GO
/****** Object:  StoredProcedure [dbo].[GetEmailByUserId]    Script Date: 5/25/2024 6:37:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetEmailByUserId]
    @ApplicationId INT
AS
BEGIN
    -- Select the Email from the Users table by joining with the Applications table based on the ApplicationId
    SELECT U.Email
    FROM [iTEC Hackathon].[dbo].[Applications] A
    JOIN [iTEC Hackathon].[dbo].[Users] U
    ON A.IdUserAuthor = U.IdUser
    WHERE A.IdApplication = @ApplicationId;
END
GO
/****** Object:  StoredProcedure [dbo].[GetEndpointHistoryByHours]    Script Date: 5/25/2024 6:37:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetEndpointHistoryByHours]
    @IdEndpoint INT,
    @Hours INT,
    @TimeNow DATETIME
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @StartTime DATETIME;
    DECLARE @EndTime DATETIME;

    -- Calculate start time and end time based on the provided hours and current time
    SET @StartTime = DATEADD(HOUR, -@Hours, @TimeNow);
    SET @EndTime = @TimeNow;

    -- Select data from EndpointHistory table based on the given parameters
    SELECT [IdEndpoint],
           [IdUser],
           [DateCreated],
           [Mentions],
           [Code]
    FROM [iTEC Hackathon].[dbo].[EndpointHistory]
    WHERE [IdEndpoint] = @IdEndpoint
      AND [DateCreated] BETWEEN @StartTime AND @EndTime;
END;
GO
/****** Object:  StoredProcedure [dbo].[GetEndpointHistoryById]    Script Date: 5/25/2024 6:37:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetEndpointHistoryById]
    @IdEndpoint INT
AS
BEGIN
    SET NOCOUNT ON;

    SELECT 
        [Code],
        [DateCreated]
    FROM 
        [dbo].[EndpointHistory]
    WHERE 
        [IdEndpoint] = @IdEndpoint;
END
GO
/****** Object:  StoredProcedure [dbo].[GetEndpointsByApplicationId]    Script Date: 5/25/2024 6:37:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetEndpointsByApplicationId]
    @IdApplication INT
AS
BEGIN
    SET NOCOUNT ON;

    CREATE TABLE #TempEndpoints (
        IdEndpoint INT,
        URL NVARCHAR(MAX),
        Type NVARCHAR(MAX),
        DateCreated DATETIME,
        IdApplication INT
    );

    INSERT INTO #TempEndpoints (IdEndpoint, URL, Type, DateCreated, IdApplication)
    SELECT e.IdEndpoint, e.URL, t.Type, e.DateCreated, e.IdApplication
    FROM [iTEC Hackathon].[dbo].[Endpoints] e
    INNER JOIN [iTEC Hackathon].[dbo].[Types] t ON e.IdType = t.IdType
    WHERE e.IdApplication = @IdApplication;

    DECLARE @IdEndpoint INT;
    DECLARE @EndpointState NVARCHAR(50);

    DECLARE endpoint_cursor CURSOR FOR
        SELECT IdEndpoint FROM #TempEndpoints;
    OPEN endpoint_cursor;
    FETCH NEXT FROM endpoint_cursor INTO @IdEndpoint;

    CREATE TABLE #EndpointStateResults (
        IdEndpoint INT,
        URL NVARCHAR(MAX),
        EndpointState NVARCHAR(50),
        Type NVARCHAR(MAX),
        DateCreated DATETIME
    );

    WHILE @@FETCH_STATUS = 0
    BEGIN
        CREATE TABLE #RecentEndpointHistoryCodes (
            Code INT
        );

        INSERT INTO #RecentEndpointHistoryCodes (Code)
        SELECT TOP 10 Code
        FROM [iTEC Hackathon].[dbo].[EndpointHistory]
        WHERE IdEndpoint = @IdEndpoint
        ORDER BY DateCreated DESC;

        IF (SELECT COUNT(*) FROM #RecentEndpointHistoryCodes WHERE Code NOT IN (200, 302)) = 0
            SET @EndpointState = 'Stable';
        ELSE IF (SELECT COUNT(*) FROM #RecentEndpointHistoryCodes WHERE Code NOT IN (200, 302)) = 10
            SET @EndpointState = 'Down';
        ELSE
            SET @EndpointState = 'Unstable';

        IF @EndpointState = 'Stable'
        BEGIN
            DECLARE @IsUnsolved BIT;

            SELECT @IsUnsolved = CASE WHEN EXISTS (
                SELECT 1 
                FROM [iTEC Hackathon].[dbo].[ApplicationReports] 
                WHERE IdEndpoint = @IdEndpoint AND MarkedAsSolved = 0
            ) THEN 1 ELSE 0 END;

            IF @IsUnsolved = 1
                SET @EndpointState = 'Unstable';
        END;

        INSERT INTO #EndpointStateResults (IdEndpoint, URL, EndpointState, Type, DateCreated)
        SELECT IdEndpoint, URL, @EndpointState, Type, DateCreated
        FROM #TempEndpoints
        WHERE IdEndpoint = @IdEndpoint;

        DROP TABLE #RecentEndpointHistoryCodes;

        FETCH NEXT FROM endpoint_cursor INTO @IdEndpoint;
    END;

    CLOSE endpoint_cursor;
    DEALLOCATE endpoint_cursor;

    SELECT * FROM #EndpointStateResults;

    DROP TABLE #TempEndpoints;
    DROP TABLE #EndpointStateResults;
END;
GO
/****** Object:  StoredProcedure [dbo].[GetEndpointStatusForApplication]    Script Date: 5/25/2024 6:37:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetEndpointStatusForApplication]
    @IdApplication INT
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @StableCount INT = 0;
    DECLARE @UnstableCount INT = 0;
    DECLARE @DownCount INT = 0;
    DECLARE @ApplicationState NVARCHAR(50);

    CREATE TABLE #EndpointStates (
        IdEndpoint INT,
        URL NVARCHAR(MAX),
        EndpointState NVARCHAR(50),
        Type NVARCHAR(MAX),
        DateCreated DATETIME
    );

    INSERT INTO #EndpointStates (IdEndpoint, URL, EndpointState, Type, DateCreated)
    EXEC [dbo].[GetEndpointsByApplicationId] @IdApplication = @IdApplication;

    SELECT 
        @StableCount = SUM(CASE WHEN EndpointState = 'Stable' THEN 1 ELSE 0 END),
        @UnstableCount = SUM(CASE WHEN EndpointState = 'Unstable' THEN 1 ELSE 0 END),
        @DownCount = SUM(CASE WHEN EndpointState = 'Down' THEN 1 ELSE 0 END)
    FROM #EndpointStates;

    IF @StableCount = (SELECT COUNT(*) FROM #EndpointStates)
        SET @ApplicationState = 'Stable';
    ELSE IF @StableCount >= 1 AND @StableCount <= 9
        SET @ApplicationState = 'Unstable';
    ELSE
        SET @ApplicationState = 'Down';

    SELECT 
        @ApplicationState AS ApplicationState;

    DROP TABLE IF EXISTS #EndpointStates;
END;
GO
/****** Object:  StoredProcedure [dbo].[GetIsUserAuthor]    Script Date: 5/25/2024 6:37:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[GetIsUserAuthor]
    @IdUser INT,
    @IdApplication INT
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @IsUserAuthor BIT;

    -- Check if the IdUserAuthor of the application matches the provided IdUser
    IF EXISTS (
        SELECT 1
        FROM [iTEC Hackathon].[dbo].[Applications]
        WHERE IdApplication = @IdApplication
        AND IdUserAuthor = @IdUser
    )
    BEGIN
        SET @IsUserAuthor = 1;
    END
    ELSE
    BEGIN
        SET @IsUserAuthor = 0;
    END

    -- Return 1 if the user is the author of the application, otherwise return 0
    SELECT @IsUserAuthor AS isAuthor;
END;
GO
/****** Object:  StoredProcedure [dbo].[GetNotificationsByReceiver]    Script Date: 5/25/2024 6:37:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetNotificationsByReceiver]
    @IdReceiver INT
AS
BEGIN
    SELECT 
        N.IdNotification, 
        N.IdReceiver,
		E.IdEndpoint,
        N.IdSender, 
        U_sender.Email AS SenderEmail, 
        N.Text, 
        N.DateCreated,
        A.Name AS ApplicationName, 
        E.URL AS EndpointURL, 
        ET.Type AS EndpointType,
        AR.IdApplicationReport AS ReportId

    FROM 
        [iTEC Hackathon].[dbo].[Notifications] N
    INNER JOIN 
        [iTEC Hackathon].[dbo].[Users] U_sender ON N.IdSender = U_sender.IdUser
    INNER JOIN 
        [iTEC Hackathon].[dbo].[Applications] A ON N.IdApplication = A.IdApplication
    INNER JOIN 
        [iTEC Hackathon].[dbo].[Endpoints] E ON N.IdEndpoint = E.IdEndpoint
    INNER JOIN 
        [iTEC Hackathon].[dbo].[Types] ET ON E.IdType = ET.IdType
    LEFT JOIN 
        [iTEC Hackathon].[dbo].[ApplicationReports] AR ON N.IdSender = AR.IdUser 
            AND N.IdApplication = AR.IdApplication 
            AND N.IdEndpoint = AR.IdEndpoint 
            AND N.Text = AR.Mentions
    WHERE 
        N.IdReceiver = @IdReceiver
        AND N.Text = AR.Mentions
END
GO
/****** Object:  StoredProcedure [dbo].[GetReportsByApplicationId]    Script Date: 5/25/2024 6:37:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetReportsByApplicationId]
    @IdApplication INT
AS
BEGIN
    SET NOCOUNT ON;

    SELECT AR.[IdApplicationReport],
           AR.[IdEndpoint],
           AR.[IdUser],
           AR.[DateCreated] AS [ReportDateCreated],
           AR.[Mentions],
           AR.[MarkedAsSolved],
           A.[IdUserAuthor],
           A.[Name],
           A.[Description],
           A.[Image],
           A.[DateCreated] AS [ApplicationDateCreated],
           AS1.[State] AS [State],
           E.[URL],
           T.[Type],
           E.[DateCreated] AS [EndpointDateCreated]
    FROM [iTEC Hackathon].[dbo].[ApplicationReports] AR
    INNER JOIN [iTEC Hackathon].[dbo].[Applications] A ON AR.[IdApplication] = A.[IdApplication]
    LEFT JOIN [iTEC Hackathon].[dbo].[ApplicationStates] AS1 ON A.[IdApplicationState] = AS1.[IdApplicationState]
    INNER JOIN [iTEC Hackathon].[dbo].[Endpoints] E ON AR.[IdEndpoint] = E.[IdEndpoint]
    INNER JOIN [iTEC Hackathon].[dbo].[Types] T ON E.[IdType] = T.[IdType]
    WHERE AR.[IdApplication] = @IdApplication;
END;
GO
/****** Object:  StoredProcedure [dbo].[GetReportsUnsolvedByIdUser]    Script Date: 5/25/2024 6:37:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[GetReportsUnsolvedByIdUser]
    @IdUser INT
AS
BEGIN
    SET NOCOUNT ON;

    -- Selecting the desired columns from joined tables
    SELECT AR.IdApplicationReport,
           E.URL,
		   U.IdUser,
           U.Email,
           A.Name,
           T.Type,
           AR.DateCreated,
           AR.Mentions
    FROM [iTEC Hackathon].[dbo].[ApplicationReports] AR
    INNER JOIN [iTEC Hackathon].[dbo].[Endpoints] E ON AR.IdEndpoint = E.IdEndpoint
    INNER JOIN [iTEC Hackathon].[dbo].[Applications] A ON E.IdApplication = A.IdApplication
    INNER JOIN [iTEC Hackathon].[dbo].[Users] U ON A.IdUserAuthor = U.IdUser
    INNER JOIN [iTEC Hackathon].[dbo].[Types] T ON E.IdType = T.IdType
    WHERE AR.IdUser = @IdUser
      AND AR.MarkedAsSolved = 0;
END;
GO
/****** Object:  StoredProcedure [dbo].[GetTotalNumberOfEndpointsByState]    Script Date: 5/25/2024 6:37:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[GetTotalNumberOfEndpointsByState]
AS
BEGIN
    SET NOCOUNT ON;

    -- Declare variables
    DECLARE @TotalStableEndpoints INT = 0;
    DECLARE @TotalUnstableEndpoints INT = 0;
    DECLARE @TotalDownEndpoints INT = 0;

    -- Cursor for iterating through endpoints
    DECLARE endpoint_cursor CURSOR FOR
        SELECT IdEndpoint FROM [iTEC Hackathon].[dbo].[Endpoints];
    OPEN endpoint_cursor;

    -- Loop through each endpoint
    DECLARE @EndpointId INT; -- Declare @EndpointId here

    FETCH NEXT FROM endpoint_cursor INTO @EndpointId;

    WHILE @@FETCH_STATUS = 0
    BEGIN
        DECLARE @StableCount INT;
        DECLARE @UnstableCount INT;
        DECLARE @DownCount INT;

        -- Count the number of stable, unstable, and down states for the current endpoint
        SELECT @StableCount = COUNT(*) FROM (
            SELECT TOP 10 Code
            FROM [iTEC Hackathon].[dbo].[EndpointHistory]
            WHERE IdEndpoint = @EndpointId
            ORDER BY DateCreated DESC
        ) AS T
        WHERE Code = 200 OR Code = 302;

        SELECT @UnstableCount = COUNT(*) FROM (
            SELECT TOP 10 Code
            FROM [iTEC Hackathon].[dbo].[EndpointHistory]
            WHERE IdEndpoint = @EndpointId
            ORDER BY DateCreated DESC
        ) AS T
        WHERE Code != 200 AND Code != 302;

        SET @DownCount = (SELECT COUNT(*) FROM (
            SELECT TOP 10 Code
            FROM [iTEC Hackathon].[dbo].[EndpointHistory]
            WHERE IdEndpoint = @EndpointId
            ORDER BY DateCreated DESC
        ) AS T
        WHERE Code NOT IN (200, 302));

        -- Determine the state for the current endpoint
        IF @DownCount = 10
            SET @TotalDownEndpoints += 1;
        ELSE IF @UnstableCount > 0
            SET @TotalUnstableEndpoints += 1;
        ELSE
        BEGIN
            -- Check if the endpoint is present in ApplicationReports with MarkedAsSolved = 0
            IF EXISTS (
                SELECT 1
                FROM [iTEC Hackathon].[dbo].[ApplicationReports]
                WHERE IdEndpoint = @EndpointId AND MarkedAsSolved = 0
            )
            BEGIN
                -- Increment @TotalUnstableEndpoints if IdEndpoint is present in ApplicationReports with MarkedAsSolved = 0
                SET @TotalUnstableEndpoints += 1;
            END
            ELSE
            BEGIN
                -- Increment @TotalStableEndpoints if IdEndpoint is not present in ApplicationReports with MarkedAsSolved = 0
                SET @TotalStableEndpoints += 1;
            END;
        END;

        FETCH NEXT FROM endpoint_cursor INTO @EndpointId;
    END;

    CLOSE endpoint_cursor;
    DEALLOCATE endpoint_cursor;

    -- Return the total numbers of endpoints by state
    SELECT @TotalStableEndpoints AS TotalStableEndpoints,
           @TotalUnstableEndpoints AS TotalUnstableEndpoints,
           @TotalDownEndpoints AS TotalDownEndpoints;
END;
GO
/****** Object:  StoredProcedure [dbo].[GetTotalNumberOfReportsBySolved]    Script Date: 5/25/2024 6:37:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[GetTotalNumberOfReportsBySolved]
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @TotalSolvedReports INT;
    DECLARE @TotalUnsolvedReports INT;

    -- Calculate total number of reports marked as solved
    SELECT @TotalSolvedReports = COUNT(*)
    FROM [iTEC Hackathon].[dbo].[ApplicationReports]
    WHERE MarkedAsSolved = 1;

    -- Calculate total number of reports marked as unsolved
    SELECT @TotalUnsolvedReports = COUNT(*)
    FROM [iTEC Hackathon].[dbo].[ApplicationReports]
    WHERE MarkedAsSolved = 0;

    -- Return the results
    SELECT @TotalSolvedReports AS TotalSolvedReports, @TotalUnsolvedReports AS TotalUnsolvedReports;
END;
GO
/****** Object:  StoredProcedure [dbo].[GetTotalNumbersOfRecords]    Script Date: 5/25/2024 6:37:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[GetTotalNumbersOfRecords]
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @TotalApplications INT;
    DECLARE @TotalEndpoints INT;
    DECLARE @TotalUsers INT;
    DECLARE @TotalEndpointHistoryRecords INT;

    -- Get total number of records in Applications table
    SELECT @TotalApplications = COUNT(*)
    FROM [iTEC Hackathon].[dbo].[Applications];

    -- Get total number of records in Endpoints table
    SELECT @TotalEndpoints = COUNT(*)
    FROM [iTEC Hackathon].[dbo].[Endpoints];

    -- Get total number of records in Users table
    SELECT @TotalUsers = COUNT(*)
    FROM [iTEC Hackathon].[dbo].[Users];

    -- Get total number of records in EndpointHistory table
    SELECT @TotalEndpointHistoryRecords = COUNT(*)
    FROM [iTEC Hackathon].[dbo].[EndpointHistory];

    -- Return the total numbers of records
    SELECT @TotalApplications AS TotalApplications,
           @TotalEndpoints AS TotalEndpoints,
           @TotalUsers AS TotalUsers,
           @TotalEndpointHistoryRecords AS TotalEndpointHistoryRecords;
END;
GO
/****** Object:  StoredProcedure [dbo].[GetUserApplicationInfo]    Script Date: 5/25/2024 6:37:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetUserApplicationInfo]
    @IdUser INT
AS
BEGIN
    SET NOCOUNT ON;

    -- Temporary table to store application information
    CREATE TABLE #TempApplications (
        IdApplication INT,
        Name NVARCHAR(255),
        Description NVARCHAR(MAX),
        IdUserAuthor INT,
        IdApplicationState INT,
        DateCreated DATETIME,
        Image NVARCHAR(255)
    );

    -- Temporary table to store endpoint information
    CREATE TABLE #TempEndpoints (
        IdEndpoint INT,
        URL NVARCHAR(MAX),
        IdType INT,
        DateCreated DATETIME,
        IdApplication INT
    );

    -- Inserting application information
    INSERT INTO #TempApplications (IdApplication, Name, Description, IdUserAuthor, IdApplicationState, DateCreated, Image)
    SELECT IdApplication, Name, Description, IdUserAuthor, IdApplicationState, DateCreated, Image
    FROM [iTEC Hackathon].[dbo].[Applications]
    WHERE IdUserAuthor = @IdUser;

    -- Inserting endpoint information
    INSERT INTO #TempEndpoints (IdEndpoint, URL, IdType, DateCreated, IdApplication)
    SELECT IdEndpoint, URL, IdType, DateCreated, IdApplication
    FROM [iTEC Hackathon].[dbo].[Endpoints]
    WHERE IdApplication IN (SELECT IdApplication FROM #TempApplications);

    -- Getting counts
    DECLARE @NrOfApplications INT;
    DECLARE @NrOfEndpoints INT;
    DECLARE @NrOfEndpointsStable INT = 0;
    DECLARE @NrOfEndpointsUnstable INT = 0;
    DECLARE @NrOfEndpointsDown INT = 0;

    SELECT @NrOfApplications = COUNT(*) FROM #TempApplications;
    SELECT @NrOfEndpoints = COUNT(*) FROM #TempEndpoints;

    -- Getting user email
    DECLARE @UserEmail NVARCHAR(255);
    SELECT @UserEmail = Email FROM [iTEC Hackathon].[dbo].[Users] WHERE IdUser = @IdUser;

    -- Calculating endpoint statuses
    DECLARE @EndpointId INT;
    DECLARE @Code INT;

    DECLARE endpoint_cursor CURSOR FOR
        SELECT IdEndpoint FROM #TempEndpoints;
    OPEN endpoint_cursor;
    FETCH NEXT FROM endpoint_cursor INTO @EndpointId;
    WHILE @@FETCH_STATUS = 0
    BEGIN
        DECLARE @StableCount INT;
        DECLARE @UnstableCount INT;
        DECLARE @DownCount INT;
        
        SELECT @StableCount = COUNT(*) FROM (
            SELECT TOP 10 Code
            FROM [iTEC Hackathon].[dbo].[EndpointHistory]
            WHERE IdEndpoint = @EndpointId
            ORDER BY DateCreated DESC
        ) AS T
        WHERE Code = 200 OR Code = 302;
        
        SELECT @UnstableCount = COUNT(*) FROM (
            SELECT TOP 10 Code
            FROM [iTEC Hackathon].[dbo].[EndpointHistory]
            WHERE IdEndpoint = @EndpointId
            ORDER BY DateCreated DESC
        ) AS T
        WHERE Code != 200 AND Code != 302;

        -- Inside the cursor loop for calculating endpoint statuses
        SET @DownCount = (SELECT COUNT(*) FROM (
            SELECT TOP 10 Code
            FROM [iTEC Hackathon].[dbo].[EndpointHistory]
            WHERE IdEndpoint = @EndpointId
            ORDER BY DateCreated DESC
        ) AS T
        WHERE Code NOT IN (200, 302));

        IF @DownCount = 10
            SET @NrOfEndpointsDown += 1;
        ELSE IF @UnstableCount > 0
            SET @NrOfEndpointsUnstable += 1;
        ELSE
        BEGIN
            -- Check if the endpoint is present in ApplicationReports with MarkedAsSolved = 0
            IF EXISTS (
                SELECT 1
                FROM [iTEC Hackathon].[dbo].[ApplicationReports]
                WHERE IdEndpoint = @EndpointId AND MarkedAsSolved = 0
            )
            BEGIN
                -- Increment NrOfEndpointsUnstable if IdEndpoint is present in ApplicationReports with MarkedAsSolved = 0
                SET @NrOfEndpointsUnstable += 1;
            END
            ELSE
            BEGIN
                -- Increment NrOfEndpointsStable if IdEndpoint is not present in ApplicationReports with MarkedAsSolved = 0
                SET @NrOfEndpointsStable += 1;
            END;
        END;

        FETCH NEXT FROM endpoint_cursor INTO @EndpointId;
    END;

    CLOSE endpoint_cursor;
    DEALLOCATE endpoint_cursor;

    -- Returning application, endpoint counts, and user email
    SELECT @NrOfApplications AS NrOfApplications, @NrOfEndpoints AS NrOfEndpoints, @NrOfEndpointsStable AS NrOfEndpointsStable, @NrOfEndpointsUnstable AS NrOfEndpointsUnstable, @NrOfEndpointsDown AS NrOfEndpointsDown, @UserEmail AS Email;

    -- Dropping temporary tables
    DROP TABLE #TempApplications;
    DROP TABLE #TempEndpoints;
END;
GO
/****** Object:  StoredProcedure [dbo].[InsertApplication]    Script Date: 5/25/2024 6:37:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[InsertApplication]
    @Name NVARCHAR(255),
    @Description NVARCHAR(MAX),
    @IdUserAuthor INT,
    @IdApplicationState INT,
    @DateCreated DATETIME,
    @Image NVARCHAR(MAX), -- Add parameter for the Image column
    @IdApplication INT OUTPUT
AS
BEGIN
    SET NOCOUNT ON;
    
    INSERT INTO [iTEC Hackathon].[dbo].[Applications] ([Name], [Description], [IdUserAuthor], [IdApplicationState], [DateCreated], [Image])
    VALUES (@Name, @Description, @IdUserAuthor, @IdApplicationState, @DateCreated, @Image);

    SET @IdApplication = SCOPE_IDENTITY();
END;
GO
/****** Object:  StoredProcedure [dbo].[InsertEndpoint]    Script Date: 5/25/2024 6:37:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[InsertEndpoint]
    @URL NVARCHAR(MAX),
    @IdType INT,
    @DateCreated DATETIME,
    @IdApplication INT,
    @IdEndpoint INT OUTPUT
AS
BEGIN
    SET NOCOUNT ON;

    BEGIN TRY
        INSERT INTO [iTEC Hackathon].[dbo].[Endpoints] ([URL], [IdType], [DateCreated], [IdApplication])
        VALUES (@URL, @IdType, @DateCreated, @IdApplication);

        SET @IdEndpoint = SCOPE_IDENTITY();
    END TRY
    BEGIN CATCH
        SET @IdEndpoint = 0;
    END CATCH;
END;
GO
/****** Object:  StoredProcedure [dbo].[InsertEndpointHistory]    Script Date: 5/25/2024 6:37:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[InsertEndpointHistory]
    @DateCreated DATETIME,
    @Mentions NVARCHAR(MAX),
    @IdEndpoint INT,
    @IdUser INT,
    @Code INT,
    @Success BIT OUTPUT
AS
BEGIN
    SET NOCOUNT ON;

    BEGIN TRY
        -- Attempt to insert into EndpointHistory
        INSERT INTO [iTEC Hackathon].[dbo].[EndpointHistory] ([DateCreated], [Mentions], [IdEndpoint], [IdUser], [Code])
        VALUES (@DateCreated, @Mentions, @IdEndpoint, @IdUser, @Code);

        -- If successful, set @Success to 1
        SET @Success = 1;
    END TRY
    BEGIN CATCH
        -- If an error occurs, set @Success to 0
        SET @Success = 0;

        -- Log the error message
        DECLARE @ErrorMessage NVARCHAR(4000);
        DECLARE @ErrorSeverity INT;
        DECLARE @ErrorState INT;

        SELECT 
            @ErrorMessage = ERROR_MESSAGE(),
            @ErrorSeverity = ERROR_SEVERITY(),
            @ErrorState = ERROR_STATE();

        RAISERROR (@ErrorMessage, @ErrorSeverity, @ErrorState);
    END CATCH;
END;
GO
/****** Object:  StoredProcedure [dbo].[InsertNotification]    Script Date: 5/25/2024 6:37:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
  CREATE PROCEDURE [dbo].[InsertNotification]
    @IdReceiver INT,
    @IdSender INT,
    @Text NVARCHAR(MAX),
    @DateCreated DATETIME,
    @IdApplication INT,
    @IdEndpoint INT
AS
BEGIN
    INSERT INTO [iTEC Hackathon].[dbo].[Notifications] (IdReceiver, IdSender, Text, DateCreated, IdApplication, IdEndpoint)
    VALUES (@IdReceiver, @IdSender, @Text, @DateCreated, @IdApplication, @IdEndpoint)
END
GO
/****** Object:  StoredProcedure [dbo].[InsertReport]    Script Date: 5/25/2024 6:37:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[InsertReport]
    @IdApplication INT,
    @IdEndpoint INT,
    @DateCreated DATETIME,
    @IdUser INT,
	@MarkedAsSolved INT,
    @Mentions NVARCHAR(MAX),
    @IdApplicationReport INT OUTPUT
AS
BEGIN
    SET NOCOUNT ON;

    BEGIN TRY
        INSERT INTO [iTEC Hackathon].[dbo].[ApplicationReports] ([IdApplication], [IdEndpoint], [DateCreated], [IdUser], [MarkedAsSolved], [Mentions])
        VALUES (@IdApplication, @IdEndpoint, @DateCreated, @IdUser, @MarkedAsSolved, @Mentions);

        SET @IdApplicationReport = SCOPE_IDENTITY();
    END TRY
    BEGIN CATCH
        SET @IdApplicationReport = 0;
    END CATCH;
END;
GO
/****** Object:  StoredProcedure [dbo].[LoginUser]    Script Date: 5/25/2024 6:37:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[LoginUser]
    @Email NVARCHAR(255),
    @Password NVARCHAR(255),
    @UserID INT OUTPUT
AS
BEGIN
    SET NOCOUNT ON;
    
    SELECT @UserID = IdUser
    FROM [iTEC Hackathon].[dbo].[Users]
    WHERE Email = @Email
    AND Password = @Password;

	IF @UserID IS NULL
    BEGIN
        SET @UserID = -1 
    END

END;
GO
/****** Object:  StoredProcedure [dbo].[RegisterUser]    Script Date: 5/25/2024 6:37:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[RegisterUser]
    @Email NVARCHAR(255),
    @Password NVARCHAR(255),
    @UserID INT OUTPUT
AS
BEGIN
    SET NOCOUNT ON;
    
    INSERT INTO [iTEC Hackathon].[dbo].[Users] ([Email], [Password])
    VALUES (@Email, @Password);

    SET @UserID = SCOPE_IDENTITY();
END;
GO
/****** Object:  StoredProcedure [dbo].[UpdateApplication]    Script Date: 5/25/2024 6:37:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[UpdateApplication]
    @IdApplication INT,
    @IdState INT,
    @Success BIT OUTPUT
AS
BEGIN
    SET NOCOUNT ON;

    -- Check if the application with the specified IdApplication exists
    IF EXISTS (SELECT 1 FROM [iTEC Hackathon].[dbo].[Applications] WHERE [IdApplication] = @IdApplication)
    BEGIN
        -- Update the IdApplicationState
        UPDATE [iTEC Hackathon].[dbo].[Applications]
        SET [IdApplicationState] = @IdState
        WHERE [IdApplication] = @IdApplication;

        SET @Success = 1; -- Update successful
    END
    ELSE
    BEGIN
        SET @Success = 0; -- Application not found, update failed
    END
END;
GO
/****** Object:  StoredProcedure [dbo].[UpdateApplicationStateForAllApplications]    Script Date: 5/25/2024 6:37:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UpdateApplicationStateForAllApplications]
AS
BEGIN
    SET NOCOUNT ON;

    UPDATE A
    SET A.[IdApplicationState] = CASE
                                     WHEN NOT EXISTS (
                                         SELECT 1
                                         FROM [dbo].[Endpoints] E
                                         INNER JOIN [dbo].[EndpointHistory] EH ON E.[IdEndpoint] = EH.[IdEndpoint]
                                         WHERE E.[IdApplication] = A.[IdApplication]
                                           AND EH.[DateCreated] = (
                                               SELECT MAX(EH2.[DateCreated])
                                               FROM [dbo].[EndpointHistory] EH2
                                               WHERE EH2.[IdEndpoint] = EH.[IdEndpoint]
                                           )
                                           AND EH.[Code] <> 200
                                     )
                                         THEN 1 
                                     WHEN EXISTS (
                                         SELECT 1
                                         FROM [dbo].[Endpoints] E
                                         INNER JOIN [dbo].[EndpointHistory] EH ON E.[IdEndpoint] = EH.[IdEndpoint]
                                         WHERE E.[IdApplication] = A.[IdApplication]
                                           AND EH.[DateCreated] = (
                                               SELECT MAX(EH2.[DateCreated])
                                               FROM [dbo].[EndpointHistory] EH2
                                               WHERE EH2.[IdEndpoint] = EH.[IdEndpoint]
                                           )
                                           AND EH.[Code] <> 200
                                           AND EH.[Code] <= 3
                                     )
                                         THEN 2 
                                     WHEN NOT EXISTS (
                                         SELECT 1
                                         FROM [dbo].[Endpoints] E
                                         INNER JOIN [dbo].[EndpointHistory] EH ON E.[IdEndpoint] = EH.[IdEndpoint]
                                         WHERE E.[IdApplication] = A.[IdApplication]
                                           AND EH.[DateCreated] = (
                                               SELECT MAX(EH2.[DateCreated])
                                               FROM [dbo].[EndpointHistory] EH2
                                               WHERE EH2.[IdEndpoint] = EH.[IdEndpoint]
                                           )
                                           AND EH.[Code] = 200
                                     )
                                         THEN 3 
                                     ELSE 3 
                                 END
    FROM [dbo].[Applications] A;
END;
GO
/****** Object:  StoredProcedure [dbo].[UpdateReportAsSolved]    Script Date: 5/25/2024 6:37:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UpdateReportAsSolved]
    @IdApplicationReport INT,
    @MarkedAsSolved INT,
    @Success BIT OUTPUT
AS
BEGIN
    SET NOCOUNT ON;

    BEGIN TRY
        -- Update the MarkedAsSolved column
        UPDATE [iTEC Hackathon].[dbo].[ApplicationReports]
        SET MarkedAsSolved = @MarkedAsSolved
        WHERE IdApplicationReport = @IdApplicationReport;

        -- Set Success variable to 1 indicating success
        SET @Success = 1;
    END TRY
    BEGIN CATCH
        -- If an error occurs, set Success variable to 0 indicating failure
        SET @Success = 0;
    END CATCH;
END;
GO
