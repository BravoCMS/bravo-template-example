
# Incuding npm modules

You are allowed to use npm modules in /assets folder

You should set the npm update/install method in template `settings.json`:

```json
{
    "npm": "install"
}
```

Available options:

- `install` - recommended, modules will be installed once as git updates from package-lock.json
- `update` - modules will be updated regularly with `npm update` from package.json
- If not ser, npm will not be run

## Important!

Very recommended include `package.json` and `package-lock.json` files to git, and regularly update them

Also exclude in `.gitignore` filders `node_modules` and `etc` as set below

```
# npm temporary files
etc

# npm modules will be installed by server
node_modules
```


[Settings](settings.md)
[Home](../index.md)
