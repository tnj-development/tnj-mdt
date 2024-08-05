import { writable } from "svelte/store";

export const SEARCH = writable("");

export const SELECTED_VEHICLE= writable<VEHICLE_DATA>();
export const VEHICLES = writable<VEHICLE_DATA[]>([]);

interface VEHICLE_DATA {
    label: string,
    model: string,
    plate: string,
    image: string,
}