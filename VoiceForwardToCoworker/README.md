# Voice forward to Coworker
### Anywhere365 Dialogue Studio
## Flow description
Demonstrate the use of Transcription node, Speech to Text. Implements a personal flow where you can call the Anywhere365 contact center, get a personal greeting and then speak the first name of the co worker your want to be connected to. May be handy from the car. Person names are hardest to get correct with any Speech to text solution. Depending on the specific name your milage may vary. For Google to recognise a word as a persons name, and capitalise, the context matters. So speaking 'can i speak to Tom please' is better than 'Tom' or 'Tom please'. 

![transcript flow minimal](https://github.com/Anywhere365/DialogueStudioFlows/blob/master/VoiceForwardToCoworker/resources/a365-ds-voice-forwardto-coworker.png)


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

## How to download and import in Anywhere365 Dialogue Studio
- use green download [Code] button, top right from [repository home](https://github.com/Anywhere365/DialogueStudioFlows) or
- click on the .json file, click [raw] on top right, then ctl-A, ctl-C
- Goto hamburger menu, top right, in Dialogue Studio
- Choose Import, then ctl-V or select local file


## Requirements
- Google cloud subscription
- Configure Transcription Google credentials in UCC Sharepoint, see [Golive](https://golive.anywhere365.io/platform_elements/core/scenarios/how_to_configure_transcript.html)

## Todo before Import
- see requirements

## Todo after Import
- Change Server name and ucc name in Incoming node
- Make sure the configured skills in Dialogue Studio also exist in Sharepoint and Agents assigned
- Change Switch node values and Say confirmation node texts
- Change Delay timeout and following Say bye node text, default set to 30 sec

## Next steps
Sample flow only checks for uppercase names. Maybe better to lowercase the msg.payload.transcriptor.transcript in a Function- or Change- node before the Switch node. Extend with more names. Now the names are hardcoded may want to read from a Sharepoint list or database and put in flow.set variables.