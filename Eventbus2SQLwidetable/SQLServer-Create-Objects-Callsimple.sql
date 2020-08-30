-- Anywhere365 Dialogue Studio - Event bus to SQL wide table
-- https://github.com/Anywhere365/DialogueStudioFlows/tree/master/Eventbus2SQLwidetable
--
DROP TABLE callsimple
CREATE TABLE callsimple (
    dialogueid      uniqueidentifier not null,
    starttime       datetime2 not null,
    callername      varchar(128) null,
    skill           varchar(32) null,
    skillstarttime   datetime2 null,
    agentname       varchar(64) null,
    agentstarttime   datetime2 null,
    agentstoptime   datetime2 null,
    stoptime        datetime2 null
)
GO
-- for testing and debugging
-- DELETE FROM callsimple
-- INSERT INTO callsimple VALUES ('6c0494e1-aa8d-49fa-8de5-1f4a231ae895','2020-07-21 09:00:00.123','tel:+31881122123','Sales','2020-07-21 09:00:05.123','sip:hermione@wsp.com','2020-07-21 09:02:00.123','2020-07-21 09:08:00.123','2020-07-21 09:09:00.123')
-- SELECT * FROM callsimple
GO
CREATE OR ALTER VIEW callsimple_vw AS
    SELECT dialogueid,
        starttime,
        callername,
        skill,
        skillstarttime,
        agentname,
        agentstarttime,
        agentstoptime,
        stoptime,
        DATEDIFF(second,skillstarttime, agentstarttime) as waitduration,
        DATEDIFF(second,agentstarttime, agentstoptime) as talkduration,
        DATEDIFF(second,starttime, stoptime) as callduration
    FROM callsimple
GO
SELECT * FROM callsimple_vw order by starttime desc
