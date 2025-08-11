# Standard Simple IVR Flow - No Code

## Table of Contents
- [Overview](#overview)
- [Flow Description](#flow-description)
- [How to Download and Import](#how-to-download-and-import)
- [Configuration After Import](#configuration-after-import)
- [Node Descriptions](#node-descriptions)
  - [Incoming Node](#incoming-node)
  - [Say: Welcome Node](#say-welcome-node)
  - [Ask&Wait: Press 1 Node](#askwait-press-1-node)
  - [Switch Node](#switch-node)
  - [Say Skill Nodes](#say-skill-nodes)
  - [Enqueue Nodes](#enqueue-nodes)
  - [Say: We Did Not Node](#say-we-did-not-node)
  - [Disconnect Node](#disconnect-node)

## Overview
This is a standard 'Press 1 for...' IVR flow designed for AnywhereNow Dialogue Studio. It includes three skill choices: Sales, Support, and Other. The menu automatically repeats after an 8-second pause. If no response is received within 60 seconds, the caller hears a goodbye message, and the call is disconnected.

This flow is ideal as a first test to verify the installation and environment setup.

![Standard Simple IVR Flow](https://github.com/Anywhere365/DialogueStudioFlows/blob/master/DefaultUCCsimple_solution/resource/a365-ds-standard-ivr-flow.png?raw=true)

## Flow Description
- **Skill Choices**: Sales, Support, and Other.
- **Menu Repeat**: Automatically repeats after 8 seconds.
- **Timeout**: If no response is received within 60 seconds, the caller hears a goodbye message and the call is disconnected.
- **Press 9**: Allows the caller to manually repeat the menu.

## How to Download and Import
1. Use the green **Download [Code]** button at the top right of the [repository home](https://github.com/Anywhere365/DialogueStudioFlows).
2. Alternatively, click on the `.json` file, then click **[Raw]** at the top right, and copy the content using `Ctrl+A` and `Ctrl+C`.
3. Open Dialogue Studio and click the hamburger menu at the top right.
4. Choose **Import**, then paste the copied content or select the downloaded file.

## Configuration After Import
1. Update the **Server Name** and **UCC Name** in the Incoming node.
2. Ensure the same skills (Sales, Support, Other) are configured in your UCC (SharePoint).
3. Optionally, customize the Say and Ask&Wait messages or skill names.
4. Configure Agents, Agent Skills, and Business Hours in SharePoint.

## Node Descriptions

### Incoming Node
- Accepts incoming voice calls.
- Configure the AnywhereNow Server and UCC Name properties (double-click the node).

### Say: Welcome Node
- Announces the welcome message to the caller.

### Ask&Wait: Press 1 Node
- Provides the following options to the caller:
  - Press 1 for Sales.
  - Press 2 for Support.
  - Press 3 for Other.
  - Press 9 to manually repeat the menu.
- Automatically repeats the menu after an 8-second pause.
- Times out after 60 seconds with a goodbye message and disconnects the call.

### Switch Node
- Routes the caller's choice to the appropriate skill.
- Confirms the skill choice.
- Redirects to the Ask&Wait node if the caller presses 9 or makes an invalid choice.

### Say Skill Nodes
- Confirms the caller's choice (e.g., "You have chosen Sales").

### Enqueue Nodes
- Routes the call to the appropriate skill queue (Sales, Support, or Other).

### Say: We Did Not Node
- Plays a message: "We did not get your choice, please call back later, bye."

### Disconnect Node
- Disconnects the call with a goodbye message.
