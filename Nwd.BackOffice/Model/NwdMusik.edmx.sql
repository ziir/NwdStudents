
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, 2012 and Azure
-- --------------------------------------------------
-- Date Created: 05/16/2014 10:10:01
-- Generated from EDMX file: E:\Repositories\IN'TECH C#\NwdStudents\Nwd.BackOffice\Model\NwdMusik.edmx
-- --------------------------------------------------

SET QUOTED_IDENTIFIER OFF;
GO
USE [NwdMusik];
GO
IF SCHEMA_ID(N'dbo') IS NULL EXECUTE(N'CREATE SCHEMA [dbo]');
GO

-- --------------------------------------------------
-- Dropping existing FOREIGN KEY constraints
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[FK_dbo_Albums_dbo_Artists_Artist_Id]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Albums] DROP CONSTRAINT [FK_dbo_Albums_dbo_Artists_Artist_Id];
GO
IF OBJECT_ID(N'[dbo].[FK_dbo_Artists_dbo_Songs_Song_Id]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Artists] DROP CONSTRAINT [FK_dbo_Artists_dbo_Songs_Song_Id];
GO
IF OBJECT_ID(N'[dbo].[FK_dbo_Tracks_dbo_Albums_AlbumId]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Tracks] DROP CONSTRAINT [FK_dbo_Tracks_dbo_Albums_AlbumId];
GO
IF OBJECT_ID(N'[dbo].[FK_dbo_Tracks_dbo_Songs_Song_Id]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Tracks] DROP CONSTRAINT [FK_dbo_Tracks_dbo_Songs_Song_Id];
GO

-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[Albums]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Albums];
GO
IF OBJECT_ID(N'[dbo].[Artists]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Artists];
GO
IF OBJECT_ID(N'[dbo].[Songs]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Songs];
GO
IF OBJECT_ID(N'[dbo].[Tracks]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Tracks];
GO

-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'Albums'
CREATE TABLE [dbo].[Albums] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Title] nvarchar(max)  NULL,
    [Duration] time  NOT NULL,
    [ReleaseDate] datetime  NOT NULL,
    [Type] nvarchar(max)  NULL,
    [CoverImagePath] nvarchar(max)  NULL,
    [Artist_Id] int  NULL
);
GO

-- Creating table 'Artists'
CREATE TABLE [dbo].[Artists] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Name] nvarchar(max)  NULL,
    [Biography] nvarchar(max)  NULL,
    [Song_Id] int  NULL
);
GO

-- Creating table 'Songs'
CREATE TABLE [dbo].[Songs] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Name] nvarchar(max)  NULL,
    [Composed] datetime  NULL
);
GO

-- Creating table 'Tracks'
CREATE TABLE [dbo].[Tracks] (
    [AlbumId] int  NOT NULL,
    [Number] int  NOT NULL,
    [Duration] time  NOT NULL,
    [FileRelativePath] nvarchar(max)  NULL,
    [Song_Id] int  NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [Id] in table 'Albums'
ALTER TABLE [dbo].[Albums]
ADD CONSTRAINT [PK_Albums]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Artists'
ALTER TABLE [dbo].[Artists]
ADD CONSTRAINT [PK_Artists]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Songs'
ALTER TABLE [dbo].[Songs]
ADD CONSTRAINT [PK_Songs]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [AlbumId], [Number] in table 'Tracks'
ALTER TABLE [dbo].[Tracks]
ADD CONSTRAINT [PK_Tracks]
    PRIMARY KEY CLUSTERED ([AlbumId], [Number] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [Artist_Id] in table 'Albums'
ALTER TABLE [dbo].[Albums]
ADD CONSTRAINT [FK_dbo_Albums_dbo_Artists_Artist_Id]
    FOREIGN KEY ([Artist_Id])
    REFERENCES [dbo].[Artists]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_dbo_Albums_dbo_Artists_Artist_Id'
CREATE INDEX [IX_FK_dbo_Albums_dbo_Artists_Artist_Id]
ON [dbo].[Albums]
    ([Artist_Id]);
GO

-- Creating foreign key on [AlbumId] in table 'Tracks'
ALTER TABLE [dbo].[Tracks]
ADD CONSTRAINT [FK_dbo_Tracks_dbo_Albums_AlbumId]
    FOREIGN KEY ([AlbumId])
    REFERENCES [dbo].[Albums]
        ([Id])
    ON DELETE CASCADE ON UPDATE NO ACTION;
GO

-- Creating foreign key on [Song_Id] in table 'Artists'
ALTER TABLE [dbo].[Artists]
ADD CONSTRAINT [FK_dbo_Artists_dbo_Songs_Song_Id]
    FOREIGN KEY ([Song_Id])
    REFERENCES [dbo].[Songs]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_dbo_Artists_dbo_Songs_Song_Id'
CREATE INDEX [IX_FK_dbo_Artists_dbo_Songs_Song_Id]
ON [dbo].[Artists]
    ([Song_Id]);
GO

-- Creating foreign key on [Song_Id] in table 'Tracks'
ALTER TABLE [dbo].[Tracks]
ADD CONSTRAINT [FK_dbo_Tracks_dbo_Songs_Song_Id]
    FOREIGN KEY ([Song_Id])
    REFERENCES [dbo].[Songs]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_dbo_Tracks_dbo_Songs_Song_Id'
CREATE INDEX [IX_FK_dbo_Tracks_dbo_Songs_Song_Id]
ON [dbo].[Tracks]
    ([Song_Id]);
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------