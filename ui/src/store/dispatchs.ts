import { writable } from "svelte/store";

export const DISPATCHS = writable<DISPATCHS_DATA[]>([]);

interface DISPATCHS_DATA {
    source: string,
    id: number,
    icon: string,
    code: string,
    codeName: string,
    message: string,
    priority: number,
    street: string,
    gender: string,
    time: number,
    weapon: string,
    color: string,
    plate: string,
    heading: string,
    model: string,
    coords: string,
    responses: string,
    automaticGunFire: boolean,
    units: DISPATCHS_UNITS_DATA[],
    jobs: string[],
}

interface DISPATCHS_UNITS_DATA {
    name: string,
    callsign: string,
    duty: boolean,
    job: string,
}