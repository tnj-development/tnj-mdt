import { writable } from "svelte/store";

export const SEARCH = writable("");

export const SELECTED_WEAPON = writable<WEAPON_DATA>();
export const WEAPONS = writable<WEAPON_DATA[]>([]);

interface WEAPON_DATA {
    id: number;
    serial: string;
    owner: string;
    information: string;
    weapClass: string;
    weapModel: string;
    image: string;
}
