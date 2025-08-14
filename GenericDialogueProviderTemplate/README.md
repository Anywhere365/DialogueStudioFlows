# AnywhereNow Generic Dialogue Provider — Node-RED Blueprint

This flow is a **kickstart blueprint** for integrating with the AnywhereNow Generic Dialogue Provider (GDP) from Dialogue Studio. 
It wires up the essentials: obtaining an auth token, starting a dialogue, posting and linking messages, connecting/disconnecting, handling event webhooks, 
retrieving dialogue content, and uploading attachments.

---

## What you get

- **Authentication (Client Credentials)** → requests and stores a bearer token in `flow.gdp_token`.
- **Settings block** → sets `gdp_url`, `gdp_ucc`, and `ds_url` (now **env‑aware**).
- **Start new conversation** → create message → create dialogue → link message → connect dialogue (with your **UCC**).
- **Send reply** (Outbound) → create **Outbound** message → link to existing dialogue.
- **Re‑open conversation** → send another message in the same dialogue and connect.
- **Disconnect** → cleanly disconnect a dialogue.
- **Event subscription** → subscribe/unsubscribe GDP webhook → HTTP **/gdp/api/v1/eventhook** handler.
- **Attachment demo** → create a message, upload a dummy attachment, and link the message.
- **Retrieve dialogue + messages** → fetch a dialogue, split messages, and (optionally) act per message.

---

## Quick start

1. **Environment variables** (recommended)
   
   In *Settings → Projects → .env* (or your container environment), set:
   ```ini
   GDP_URL=https://<your-gdp-host>/GenericDialogueProvider
   GDP_UCC=<your-ucc-id>
   DS_PUBLIC_URL=https://<your-dialogue-studio-host>
   GDP_CUSTOMER_NAME=Customer
   GDP_CUSTOMER_URI=customer@example.com
   GDP_RECEIVER_NAME=GDP
   GDP_RECEIVER_URI=gdp@anywhere365.net
   ```

2. **Import** `GDP-template.json` into Dialogue Studio.

3. In the **Authentication** group:
   - Open the **Configure AnywhereNow Authentication request** function and fill **clientId** and **clientSecret** (and token URL if your realm differs).
   - Click **Generate new token**. The token will be stored in `flow.gdp_token`.

4. In **Configure GDP Blueprint settings**:
   - Click **Click to save settings**. The node now reads from **env vars** first, falling back to sample defaults.

5. **Subscribe to events**:
   - Click **Start Subscriber**. GDP will call back to `{DS_PUBLIC_URL}/gdp/api/v1/eventhook`.

6. **Try it**:
   - **Start new conversation**: click the **Start new conversation** inject.
   - **Send reply**: use either **Send reply** groups to post a reply (Outbound).
   - **Attachments**: click **Send reply** under *Send Attachment* to upload the demo file.
   - **Disconnect**: click **Disconnect conversation**.
   - **Re‑open**: use *Re-open conversation* to send again in the same dialogue.

---

## Flow variables at a glance

- `flow.gdp_token`: OAuth access token (set by **Store Token**).
- `flow.gdp_url`: GDP base URL (set by **Configure settings…**).
- `flow.gdp_ucc`: UCC identifier used when connecting a dialogue.
- `flow.ds_url`: public base URL of your Node‑RED (used for `callbackUrl`).
- `flow.dialogue_id`: latest created dialogue id (set when you create one).
- `msg.message_id`: latest created message id (from message creation calls).

---

## Webhook contract (event hook)

- **Path**: `POST /gdp/api/v1/eventhook`
- The flow immediately 200-OKs and then routes by `msg.payload.type`:
  - `NewMessage` → pulls the message by id and branches on `payload.direction` (Inbound/Outbound).
  - `AgentConnected` / `AgentDisconnected` / `Closed` → logs state changes.
  - If an attachment exists, the flow fetches it: `GET /api/v1/message/{{message_id}}/attachment/{{attachment_id}}`.

---

## Gotchas & tips

- When using a manual token, make sure your **token** is present before clicking the injects (non‑2xx now raises errors visibly).
- Stick to one style for IDs with slashes; the template uses trailing slashes consistently for clarity.
- When uploading files, let Node‑RED set the multipart boundary (don’t hardcode `Content-Type`).
- Don’t forget to expose your Node‑RED with a **publicly reachable** `DS_PUBLIC_URL` for webhooks.
- To change demo participants, set the `GDP_*` env vars or edit the settings function.

---

## Extending the blueprint

- **Ensure‑token node**: turn the auth block into a subflow and call it before any GDP call.
- **Retry & backoff**: wrap HTTP nodes with a `catch` + `statusCode` switch to retry 429/5xx.
- **Signature verification**: if/when GDP supplies a signing key or header, add verification in the eventhook path.
- **Mapping to your domain**: branch on `payload.direction` and call your own systems for enrichment, routing, or storage.

---
