### Write Anywhere365 UCC call events to SQL Server
## Anywhere365 Dialogue Studio
## Flow description
Dialogue Studio includes the Event Bus node. This node gives detail events that happen in a UCC flow. Examples are like CallStart, SkillChosen, AgentJoined, etc. This flow writes all the events for a single call to a single wide row in SQL Server. The CallStart does an sql INSERT, subsequent events do sql UPDATE's. Multiple green Debug nodes allow you to show optional proces information in the Dialogue Studio debug area. The callsimple table in SQL has columns for a simple call scenario. The callsimple view adds calculated columns for wait-, talk- and call- duration.

![transcript flow minimal](https://github.com/Anywhere365/DialogueStudioFlows/blob/master/TranscriptTodebug_minimal/resources/a365-ds-transcript-flow-minimal.png?raw=true)

![transcript debug minimal](https://github.com/Anywhere365/DialogueStudioFlows/blob/master/TranscriptTodebug_minimal/resources/a365-ds-transcript-debug-minimal.png?raw=true)

## How to import in Anywhere365 Dialogue Studio
- Goto hamburger menu, top right, in Dialogue Studio
- Choose Import
- Select the .json file downloaded from github  or
- Paste the content from the .json file on github

## Requirements
- Configure Anywhere365 Transcription for Google, see [Golive](https://golive.anywhere365.io/platform_elements/core/scenarios/how_to_configure_transcript.html)

## Todo after Import
- Change Server name and ucc name in Incoming node

## Next steps
- import a database node from the Manage Palette menu (SQL Server, Postgres, MySQL, etc)
- write the dialogueid, receivedat (datetime), sipuri and transcript to SQL

## Google Transcription
- Google speech to text, see [Google Cloud](https://cloud.google.com/speech-to-text)