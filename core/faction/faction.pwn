/**
 * # Header
 */

#define MAX_FACTION_NAME (22)

enum Faction {
    FACTION_NONE,
    FACTION_BALLA,
    FACTION_GROVE,
    FACTION_VAGO,
    FACTION_RIFA,
    FACTION_DANANG,
    FACTION_MAFIA,
    FACTION_TRIAD,
    FACTION_AZTECA,

    MAX_FACTIONS
};

static enum E_FACTION_DATA {
    E_FACTION_NAME[MAX_FACTION_NAME char],
    E_FACTION_COLOR
};

static stock const gFactionData[][E_FACTION_DATA] = {
    {!"", 0xFFFFFFFF},
    {!"Ballas", 0xC800C8FF}, // (LS)
    {!"Grove Street Families", 0x46C800FF}, // (LS)
    {!"Los Santos Vagos", 0xFFC800FF}, // (LS)
    {!"San Fierro Rifa", 0x0000C8FF}, // (SF)
    {!"Da Nang Boys", 0xFF8000FF}, // (SF)
    {!"Mafia", 0x000000FF}, // (LV)
    {!"Mountain Cloud Triad", 0xFF0000FF}, // (SF)
    {!"Varrio Los Aztecas", 0x00C8FFFF} // (LS)
};

static
    Faction:gInFactionID[MAX_PLAYERS char] = { FACTION_NONE, ... }
;

/**
 * # Functions
 */

stock GetFactionName(Faction:factionid, name[], size = sizeof (name)) {
    strunpack(name, gFactionData[_:factionid][E_FACTION_NAME], size);
}

stock GetFactionColor(Faction:factionid, alpha = 0xFF) {
    return (alpha | (~0xFF & gFactionData[_:factionid][E_FACTION_COLOR]));
}

stock SetPlayerFaction(playerid, Faction:factionid) {
    gInFactionID{playerid} = factionid;
}

stock GetPlayerFaction(playerid, &Faction:factionid) {
    factionid = gInFactionID{playerid};
}
