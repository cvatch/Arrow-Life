# Arrow-Life

Backup of the current Rogue Wave / Arrow Life prototype.

The playable HTML is stored as Base64 chunks under `backup/rogue-wave-html/parts/`.

## Restore

From the repository root, run PowerShell:

```powershell
./backup/rogue-wave-html/restore.ps1
```

That rebuilds `rogue-wave.html` from the chunk files.

Expected restored file:

- File: `rogue-wave.html`
- Size: `73605` bytes
- SHA-256: `3B379D08D6EBEE5DDCD010CB1556421C0B65BA81AEA03F2FB4AD36AA6B844FFB`
