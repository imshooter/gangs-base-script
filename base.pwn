#define MAX_PLAYERS (5)
#define MAX_GANG_ZONES (128)

#include <open.mp>
#include <streamer>
#include <map-zones>

#include <YSI_Coding\y_hooks>
#include <YSI_Data\y_iterate>

#include ".\core\faction\faction.pwn"
#include ".\core\faction\faction-areas.pwn"

main(){}

public OnGameModeInit() {
    // Test 1

    for (new i; i != MAX_DOMIN_ZONE_AREAS; ++i) {
        AddZoneToFaction(Faction:(RandomMinMax(1, _:MAX_FACTIONS)), GetDominatableZoneID(i));
    }

    // Test 2

    new
        count, zoneid, dest[MAX_DOMIN_ZONE_AREAS], name[MAX_FACTION_NAME]
    ;

    GetFactionName(FACTION_BALLA, name);
    GetFactionDominatedZones(FACTION_BALLA, dest, count);

    for (new i; i < count; ++i) {
        zoneid = dest[i];

        printf("`%s` has zone ID: %i", name, zoneid);
    }

    return 1;
}
