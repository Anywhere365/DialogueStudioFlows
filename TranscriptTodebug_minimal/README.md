## Minimal Transcript bot or flow for Teams and Skype
### Anywhere365 Dialogue Studio
## Flow description
Easiest minimal example for transcript bot or flow (Speech to Text). After the welcome announcement and prompt you speak in English language (configurable). Close with a keypress. The text from the callers speaking is written to the Dialogue Studio debug area for your examination. Click on the bug icon, top right side of the Dialogue Studio screen. This minimal example uses Anywhere365 Dialogue Studio transcriptor node for Google.

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