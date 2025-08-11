# Sample: Query Dataverse (Dynamics 365) from Node-RED / Dialogue Studio

This example shows how to call the **Dataverse Web API** to look up **Contacts by phone number** from Node-RED (Anywhere365 Dialogue Studio).
It uses the **Microsoft identity platform v2.0** (client credentials) and caches the access token in flow context.

> This sample talks directly to **Dataverse Web API (OData v4)** at:
> `https://<org>.crm*.dynamics.com/api/data/v9.2/...`

---

## What you import

* **Flow tab:** `Sample: Contacts by phone`
* **Subflow:** `Dataverse token (client credentials)`

  * Obtains a token with `scope={ORG_URL}/.default` (v2.0)
  * Caches `dv_at` (token), `dv_exp` (expiry ms), and `dv_org` (org URL) in **flow** context

---

## Prerequisites

1. Your Dataverse environment URL, e.g. `https://contoso.crm4.dynamics.com`.
2. An **app registration** in Entra ID (client secret or certificate).
3. An **Application user** in the **target Dataverse environment** linked to that app registration, assigned a role that can read **Contacts**.

---

## Import & configure

1. In Dialogue Studio (Node-RED): **Menu → Import** → paste the flow JSON → **Import** → **Deploy**.
2. Open the subflow instance **Ensure Dataverse token** and set:

| Name            | Example                                | Notes                                     |
| --------------- | -------------------------------------- | ----------------------------------------- |
| `TENANT_ID`     | `aaaaaaaa-bbbb-cccc-dddd-eeeeeeeeeeee` | Entra tenant GUID                         |
| `D365_ORG_URL`  | `https://contoso.crm4.dynamics.com`    | Your org base URL                         |
| `CLIENT_ID`     | `xxxxxxxx-....`                        | App registration                          |
| `CLIENT_SECRET` | `******`                               | Use the credential field (not plain text) |

The subflow requests the token from
`https://login.microsoftonline.com/{TENANT_ID}/oauth2/v2.0/token`
with body: `grant_type=client_credentials&scope={D365_ORG_URL}/.default`.

---

## Try it

1. Click the **Example: set phone** inject node (you can change its phone number).
2. The flow sends:

```
GET {ORG}/api/data/v9.2/contacts?
  $select=firstname,lastname,fullname,telephone1,mobilephone,emailaddress1&
  $filter=contains(telephone1,'{url-encoded phone}')
       or contains(mobilephone,'{url-encoded phone}')
```

**Required headers**

```
Authorization: Bearer {access_token}
Accept: application/json
OData-Version: 4.0
OData-MaxVersion: 4.0
Prefer: odata.maxpagesize=50
```

### Phone formatting tips

* The flow URL-encodes the input (so `+` becomes `%2B`).
* Because CRM data can be stored with spaces/parentheses, search with a **substring that exists in your data** (e.g., `+31 20 123` or `201234567`).

---

## Why `contains()` (and not `Microsoft.Dynamics.CRM.Contains`)

* Use **OData string functions** for Web API filters.
* The namespaced `Microsoft.Dynamics.CRM.Contains(...)` operator you may see in some examples is tied to **FetchXML** scenarios and will trigger errors like:
  `Unknown Condition Operator: Contains. FetchXml does not support it`
* For typical text fields like `telephone1`/`mobilephone`, **OData `contains()`** is the correct and portable choice.

---

## Adapting the sample

* **Accounts instead of Contacts:** `/api/data/v9.2/accounts` and update `$select`.
* **Exact match:** `$filter=telephone1 eq '{number}'`.
* **Other fields:** change the filter to `contains(<yourfield>,'…')`.
* **Related data:** add `$expand` as needed.
* **Pagination:** use `$top` + next-link (`@odata.nextLink`) for large result sets.

---

## Security & best practices

* Never hard-code secrets in Function nodes—use **credential** fields or a secrets store.
* Prefer **certificate auth** for production if your policies allow.
* Grant only the **minimum** Dataverse role to your Application user.

---

## Troubleshooting

* **401 – invalid audience**: Your token isn’t for your Dataverse resource. Ensure `scope={ORG_URL}/.default` (not Graph).
* **403 – insufficient privileges**: The Application user lacks a role with read on Contacts; assign one in the admin center.
* **404 – endpoint**: Verify the org URL and region; path must be `/api/data/v9.2/...`.
* **400 – filter errors**: Use OData `contains()` on text columns; ensure the value is **URL-encoded** (`+` → `%2B`).
* **429 – throttling**: Back off and retry using the `Retry-After` header.

---