# CBAS - Switching to SMTP from SendGrid

## Architecture

### IDJC.Api

#### Startup.cs

```
IDJC.Api
    Startup.cs
        Inject IEmailSender <-- EmailSender (Old)
        SendEmailAsync(MimeMessage.To.Address, subject, message)
```

#### appsettings.json

`appsettings.json` --> `AppSettings`

```json
{
  "SendGrid:ApiKey"    : "--> SendGridClient",
  "SendGrid:FromEmail" : "Email.FromEmail (Below)",
  "SendGrid:FromName"  : "Email.FromName  (Below)",

  "AppSettings": {
    "WebsiteUrl"       : "AppSettings.WebsiteUrl",
    "IdjcSupportEmail" : "AppSettings.IdjcSupportEmail"
  },

  "Email": {
    "Provider"         : "SendGrid",
    "FromName"         : "MimeMessage.From.Name",
    "FromEmail"        : "MimeMessage.From.Address",
    "ToEmailOverride"  : "MimeMessage.To.Address",
    "SmtpHost"         : "??",
    "SmtpPort"         : "??",
    "SmtpUser"         : "NOT USED",
    "SmtpPassword"     : "NOT USED"
  },
}

```


- [ ] Find all references to `IEmailSender` and `EmailSender`
  - `EmailSender` (3) — Only in `EmailSender.cs`
  - `IEmailSender` (13)
    1. `AuthorizationExtensionsController` (`_emailSender`)
    2. `AuthorizationRequestsController` (`_emailSender`)
    3. 
- [ ] Find all references to `appsettings.json`