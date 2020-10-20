# Sentiment Analysis with Azure Text Analitics basic
### Anywhere365 Dialogue Studio
## Flow description
Dialogue Studio includes an Event Bus node. This node gives detail events that happen in a UCC call flow. Examples are like CallStart, SkillChosen, AgentJoined, etc. Each event has unique properties. Most call related events have minimal an eventName, dialogueId and timestamp. Most events are not used in this example. This Eventbus2SQL flow writes selected events for a call to a single wide row in SQL Server. The CallStart does an sql INSERT, subsequent events do sql UPDATE statements. This design is optimised for easy reporting and small database size. Multiple green Debug nodes allow you to show optional proces information in the Dialogue Studio debug area. The callsimple table in SQL has columns for a simple call scenario. The callsimple view adds calculated columns for wait-, talk- and call- duration.

![transcript flow minimal](https://github.com/Anywhere365/DialogueStudioFlows/blob/master/SentimentAnalysisAzureBasic/resources/a365-ds-azure-sentiment-simple-screenshot.png)



## How to import in Anywhere365 Dialogue Studio
- Goto hamburger menu, top right, in Dialogue Studio
- Choose Import
- Select the .json file downloaded from github  or
- Paste the content from the .json file on github

## Requirements
- SQL Server database, any version, i used SQL2019 CU5 on Ubuntu 18.04 in a Windows10 WSL2 Linux container
- Add a SQL node to the Dialogue Studio palette, i used 'node-red-contrib-mssql-plus' [mssql-plus](https://flows.nodered.org/node/node-red-contrib-mssql-plus)

## Todo before Import
- Add a SQL node to the Palette using, top right, hamburger menu, Manage Palette, Install tab, type mssql, i use 'node-red-contrib-mssql-plus'
- Create the SQL callsimple table and callsimple_vw view, i use [Azure Data Studio](https://docs.microsoft.com/en-us/sql/azure-data-studio/download-azure-data-studio) 

## Todo after Import
- Change Server name and ucc name in Incoming node
- Make sure the Sales skill exists and has agents assigned, or edit
- Change SQL connection properties

## Notes
The UCC IVR call flow on top in this Dialogue Studio flow is just for generating the events. Edit to your needs. If you just want the standard Sharepoint based IVR flow you can change config.xml set identity is false for the nodered plugin. 

## Next steps
If you want to extend this example for production you may want to add columns to the sql table. e.g. for hunts, qm/agent rating, forwards etc. For inspiration you can view the [PowerBI_Dialogue table](https://golive.anywhere365.io/platform_elements/powerbi_integration/power_bi_integration_technical_overview.html). Same for the callsimple view. e.g. you can add formatted xxx-duration columns that display in min:sec format. Remember sql view columns are only executed when you reference them in a query.