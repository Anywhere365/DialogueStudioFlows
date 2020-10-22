# Voice forward to Coworker
### Anywhere365 Dialogue Studio
## Flow description
Demonstrate the use of Transcription node, Speech to Text. Implements a personal flow where you can call the Anywhere365 contact center, get a personal greeting and then Say to whom of your 3 co worker your want to be connected. May be handy from the car. Person names are hardest to get correct with any Speech to text solution. Depending on the specific name your milage may vary. For Google to recognise a word as a persons name, and capitalise, the context matters. So 'can i speak to Tom please' is better than 'Tom' or 'Tom please'. 

![transcript flow minimal](https://github.com/Anywhere365/DialogueStudioFlows/blob/master/Eventbus2SQLwidetable/resources/a365-ds-event2sql-flow.png)


With the debug node on in Dialogue Studio you can nicely read the spoken text. You can keep speaking sentences until one the the configured words is found, then the call is queueed for skill. Small pause in speaking will enable the speech to text output.
``` debug
10/22/2020, 9:20:31 AMnode: 2b8d174d.68ec58
msg.payload.transcriptor.transcript : string[28]
     " I'd like to speak to Kevin."
```
or get an error
``` debug
10/22/2020, 9:20:33 AMnode: ActionNodemsg : string[123]
     "Exception: Session: 97045369-dbc6-4fc0-bf8e-76e097812cf6 - Skill: "KevinSkill" is not found for ucc. Session is not queued."
```

## How to import in Anywhere365 Dialogue Studio
- Goto hamburger menu, top right, in Dialogue Studio
- Choose Import
- Select the .json file downloaded from github  or
- Paste the content from the .json file on github

## Requirements
- Google cloud subscription
- Configure Transcription Google credentials in Sharepoint

## Todo before Import
- see requirements

## Todo after Import
- Change Server name and ucc name in Incoming node
- Make sure the configured skills in Dialogue Studio also exist in Sharepoint and Agents assigned
- Change Switch node values and Say confirmation node texts
- Change Delay timeout and following Say bye node text, default set to 30 sec

## Next steps
Sample flow only checks for uppercase names. Maybe better to lowercase the msg.payload.transcriptor.transcript in a Function- or Change- node before the Switch node. Extend with more names.