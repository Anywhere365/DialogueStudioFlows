### Event Bus to SQL Server
## Anywhere365 Dialogue Studio
## Flow description
Write Dialogue Studio events to a SQL Server table. For this example we have designed the SQL table to have a single wide row per dialogue (call). Each event updates specific fields in the table. When a new call comes in a SQL INSERT is done. All subsequent events for the same call perform SQL UPDATE's on the same row. This design is optimised for reporting. The view adds columns for callduration, talkduration  and waitduration.   

![transcript flow minimal](https://github.com/Anywhere365/DialogueStudioFlows/blob/master/TranscriptTodebug_minimal/resources/a365-ds-transcript-flow-minimal.png?raw=true)

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