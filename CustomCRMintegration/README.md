# Custom CRM Integration Based on AnywhereNow Events

## Table of Contents
- [Overview](#overview)
- [Flow Description](#flow-description)
- [How to Download and Import](#how-to-download-and-import)
- [Requirements](#requirements)
- [Configuration After Import](#configuration-after-import)
- [Example Use Case](#example-use-case)
- [Troubleshooting](#troubleshooting)

## Overview
This project demonstrates a custom CRM integration using AnywhereNow Dialogue Studio. It leverages EventBus events to capture caller and agent information and sends this data to a CRM system via an HTTP POST request.

## Flow Description
The flow listens for specific events from the EventBus:
1. **DialogueHuntStartedEvent**: Captures the agent's information.
2. **DialogueParticipantAddedEvent**: Captures the caller's information.

The captured data is processed and sent to the CRM system in JSON format.

![Flow Diagram](https://github.com/Anywhere365/DialogueStudioFlows/blob/master/CustomCRMintegration/resources/a365-ds-customercrmintegration.png)

## How to Download and Import
1. Use the green **Download [Code]** button at the top right of the [repository home](https://github.com/Anywhere365/DialogueStudioFlows).
2. Alternatively, click on the `.json` file, then click **[Raw]** at the top right, and copy the content using `Ctrl+A` and `Ctrl+C`.
3. Open Dialogue Studio and click the hamburger menu at the top right.
4. Choose **Import**, then paste the copied content or select the downloaded file.

## Requirements
- An existing CRM system with HTML POST capability.

## Configuration After Import
- Update the **Server Name** and **UCC Name** in the EventBus node to match your environment.

## Example Use Case
Imagine a call center scenario where:
- A customer calls the support line.
- The system captures the customer's phone number and the assigned agent's details.
- This information is automatically logged into the CRM for tracking and reporting purposes.

## Troubleshooting
- **Issue**: Data not appearing in the CRM.
  - **Solution**: Verify the HTTP POST endpoint and ensure the CRM system is configured to accept the payload.
- **Issue**: EventBus nodes not triggering.
  - **Solution**: Check the server and UCC name configuration in the EventBus node.
- **Issue**: HTTP request fails.
  - **Solution**: Ensure the API keys and subscription keys are correct and the endpoint is reachable.