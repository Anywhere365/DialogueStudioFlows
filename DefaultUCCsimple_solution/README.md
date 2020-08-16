# Standard simple IVR flow - nocode
## Anywhere365 Dialogue Studio
## Flow description
Standard 'press 1 for ..' ivr flow. With 3 skill choices: Sales, Support and Other. Menu will automatically repeat after 8 second pause. Press 9 to repeat the menu. Timeout after 60 second no caller response then bye message and disconnect action.



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

## Todo after Import
 - Change Server name and ucc name in Incoming node
 - Make sure you have configured same skills in your ucc as mentioned in Enqueue node
 - optional change Say and Ask&Wait messages or Skill names
 - Configure Agents, AgentSkills, Business hours in Sharepoint