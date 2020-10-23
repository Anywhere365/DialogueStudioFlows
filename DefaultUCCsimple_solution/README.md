## Standard simple IVR flow - nocode
### Anywhere365 Dialogue Studio
## Flow description
Standard 'press 1 for ..' ivr flow. With 3 skill choices: Sales, Support and Other. Menu will automatically repeat after 8 second pause. Press 9 to repeat the menu. Timeout after 60 second no caller response then bye message and disconnect action.
This is a good myFirst flow to test the installation and environment.

![standard simple ivr flow](https://github.com/Anywhere365/DialogueStudioFlows/blob/master/DefaultUCCsimple_solution/resource/a365-ds-standard-ivr-flow.png?raw=true)

## How to download and import in Anywhere365 Dialogue Studio
- use green download [Code] button, top right from [repository home](https://github.com/Anywhere365/DialogueStudioFlows) or
- click on the .json file, click [raw] on top right, then ctl-A, ctl-C
- Goto hamburger menu, top right, in Dialogue Studio
- Choose Import, then ctl-V or select local file

## Todo after Import
 - Change Server name and ucc name in Incoming node
 - Make sure you have configured same skills in your UCC (Sharepoint) as mentioned in Enqueue node
 - optional change Say and Ask&Wait messages or Skill names
 - Configure Agents, AgentSkills, Business hours in Sharepoint

## Incoming - node
Accepts incoming voice call. Configure Anywhere365 Server and UCC name properties (double click).

## Say: Welcome - node
Announce welcome message

## Ask&Wait: Press 1 - node
 - Press 1 for Sales
 - Press 2 for Support
 - Press 3 for Other
 - Press 9 to manual repeat the menu
Automatic repeat menu after 8 second pause. Timeout after 60 seconds with message and then disconnect.

## Switch - node
Route caller choice to skill. Confirm skill choice. Flow to Ask&Wait node on choice 9 or any non 123 choice.

## Say skill - nodes
Confirm caller choice

## Enqueue - nodes
Route call to skill queue

## Say: We did not - node
We did not get your choice, please call back later, bye

## Disconnect
Disconnect, see you later.
