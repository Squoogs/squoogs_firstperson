# squoogs_firstperson

This project is a **lightly modified fork** of the <a href="https://github.com/vipexv/Forced-First-Person">original Forced First Person script</a> by <a href="https://github.com/vipexv">vipexv</a> which has since been archived.
All credit for the original concept and implementation goes to vipexv and contributors, as their work laid the foundation for this updated version.
This fork includes updates to integrate and leverage <a href="https://github.com/CommunityOx/ox_lib">ox_lib</a> for improved and code cleanliness.

## Changes
### Refactored threads
- Uses ox_lib's onCache module to conditionally start threads when a player:
  - enters or exits a vehicle
  - equips or holsters a weapon <br/>
  
- Exit the thread early if the vehicle is not the right class.

### Config
- Utilise ox_lib's require module to load the config file instead of using a global config table.

### Misc
- Added and altered inline comments for clarity.

## Dependencies
- [ox_lib](https://github.com/CommunityOx/ox_lib/releases/latest)

## Installation
1. Download the <a href="https://github.com/squoogs/squoogs_firstperson/releases/latest"> latest release</a>
2. Place the folder in your resources directory.
3. In your server.cfg, add `ensure squoogs_firstperson` and save the file. Make sure it starts after ox_lib in your .cfg!

## Features:
✅ Force first person when aiming/shooting inside a vehicle

✅ Force first person when aiming on foot

✅ Force first person for drivers only

✅ Force first person when aiming/shooting on bikes



