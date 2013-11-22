Package.describe("Yubikey package");

Package.on_use(function (api) {
  api.add_files(['yubikey.js'], 'server');
  if(api.export)
    api.export('YubiKeyAPI');
});

Npm.depends({
  "yub": "0.10.8"
});
